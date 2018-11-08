
def get_gems
  list_of_gems = `bundle list --paths`
  gem_names = list_of_gems.gsub(/(\/Users.+gems.)/,'').gsub(/-\d.+/, '').split("\n")
  
  gem_names.each_with_object([]) do |elem, array|
    gem_info = `bundle info #{elem}`
    link = gem_info.match(/Homepage.+$/).to_s.match(/http.+$/).to_s
    version = gem_info.match(/\(.+\)/).to_s.chop[1..-1]
    gem_array = [elem, version, link]
    array << gem_array
  end
end

def header
  "Gem Name | Gem Version | Link to docs \n" +
  "-------- | ----------- | ------------ \n" +
  get_gems.map { |e| e.join(' | ') }.join("\n")
end

File.open("gems_info.md", "w+") { |f| f.write(header) }
puts 'File gems_info.md is created'
