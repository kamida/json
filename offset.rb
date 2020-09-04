source_json = ''
new_json = ''

require 'json'
source = JSON.parse(File.read(source_json))
offset = 86_400_000 * (Time.now - Time.at(source.map { |h| h['time'] / 1000 }.max)).divmod(86_400)[0]
source.each do |h|
  h['time'] += offset
  h['hashes'] = %w[0x9b3f27a03bff7000 0x8c5135da6eded800 0xc84e247236129000 0x8b81105f1166b800]
end
File.write(new_json, JSON.pretty_generate(source))
