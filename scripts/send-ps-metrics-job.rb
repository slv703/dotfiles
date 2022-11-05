# frozen_string_literal: true

require 'rest-client'

PS_COMMAND = 'ps aux'
COMMAND = 'COMMAND'
CPU = '%CPU'
MEMORY = '%MEM'
CPU_METRIC_NAME = 'cpu_usage'
MEMORY_METRIC_NAME = 'memory_usage'
PUSHGATEWAY_URL = 'http://localhost:9091/metrics/job/top/instance/machine'
DELAY = 1

def marshal(metric_name, samples)
  samples.map do |key, value|
    "#{metric_name}{process='#{key}'} #{value}"
  end
end

loop do
  lines = %x(#{PS_COMMAND}).split("\n").map(&:split)
  headers = lines.shift.each_with_index.to_h { |name, index| [name, index] }

  cpu = Hash.new(0)
  memory = Hash.new(0)

  lines.each do |line|
    name = line[headers[COMMAND]]
    cpu_value = line[headers[CPU]].to_f
    memory_value = line[headers[MEMORY]].to_f
    cpu[name] += cpu_value
    memory[name] += memory_value
  end

  data = (marshal(CPU_METRIC_NAME, cpu) + marshal(MEMORY_METRIC_NAME, memory)).join("\n") << "\n"
  RestClient.post(PUSHGATEWAY_URL, data)

  sleep(DELAY)
end
