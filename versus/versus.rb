require 'terminal-table'
require 'fuzzy_match'
require 'optparse'

SWEAR_WORDS_ARRAY = [
  "блять","блядь","бляди","ебать","ёб","бля","блядина","блядский","блядистость","блядогон","блядословник",
  "блядский","блядство","въебаться","взбляд","впиздячил","выблядовал","выблядок","выебон","выёбывается",
  "глупизди","доебался","ебанёшься","ебанул","ебашит","ёбнул","ебало","ебанулся","ебнул","жидоёб","жидоёбский",
  "заёб","изъебнулся","заебал","заебись","козлоёб","козлоёбище","хуй","пизда","пиздец",'\*',"сука"
]

SWEAR_WORDS = SWEAR_WORDS_ARRAY.join('|')

def find_all_rapers
  raper_storage = []
  Dir.glob("rap-battles/*") do |file_name|
    first_filter = file_name.sub(/ротив_/, '')
    second = first_filter.sub(/_\(.*/, '')
    third = second.sub(/^rap-battles\/_/, '')
    fourth = third.sub(/_$/,'')
    fourth2 = fourth.sub(/VS_/, 'п')
    fourth3 = fourth2.sub(/vs_/, 'п')
    fifth = fourth3.split('_п')
    raper_storage << fifth
    raper_storage.flatten!
    raper_storage.uniq!
  end
  raper_storage
end

def number_of_battles(name)
  battles_storage = []

  Dir.glob("rap-battles/*") do |file_name|
    battle = file_name.match(name)
    battles_storage << battle
    battles_storage.reject! { |c| c.nil? }
  end
  battles_storage.size
end

def number_of_swear_words(name)
  swear_words_storage = []

  Dir.glob("rap-battles/*") do |file_name|
    if file_name.match(name)
      text = File.read(file_name)
      find_swear_words = text.scan(/#{SWEAR_WORDS}/)
      swear_words_storage << find_swear_words
      swear_words_storage.flatten!
    end
  end
  swear_words_storage.size
end

#print number_of_swear_words(ATL)

def average_number_of_swearing_words_in_battle(name)
  average = number_of_swear_words(name).fdiv(number_of_battles(name))
  average.round(2)
end

def average_number_words_in_round(name)
  round_words = []
  number_of_rounds = 0
  number_of_words_in_rounds = 0

  Dir.glob("rap-battles/*") do |file_name|
    if file_name.match(name)
      text = File.read(file_name)
      number_of_words_in_rounds += text.split(' ').length
      find_round_words = text.match(/Раунд/)
      round_words << find_round_words
      round_words.reject! { |c| c.nil? }
    end
  end
  number_of_rounds = round_words.size
  if number_of_rounds == 0
    number_of_rounds = 1
  end

  number_of_words_in_rounds / number_of_rounds
end

def statistics(number)
  all_rapers = find_all_rapers
  storage_hash = {}
  final_storage = {}
  all_rapers.each do |raper|
    storage_for_each_raper = []
    storage_for_each_raper << number_of_battles(raper)
    storage_for_each_raper << number_of_swear_words(raper)
    storage_for_each_raper << average_number_of_swearing_words_in_battle(raper)
    storage_for_each_raper << average_number_words_in_round(raper)
    storage_hash[raper] = storage_for_each_raper
  end
  storage_hash = storage_hash.sort_by { |key, value| value[1] }
  storage_hash.reverse!
  storage_hash.each do |elem|
    final_storage[elem[0]] = elem[1]
  end
  final_storage.first(number.to_i)
end

#print statistics.first(3)

def make_table(number)
  all_data = statistics(number)
  filtered_data = {}
  all_data.each do |elem|
    filtered_data[elem[0]] = elem[1]
  end
  rows = []
  filtered_data.each do |key, value|
    rows << [key.to_s, value[0].to_s + ' батлов', value[1].to_s + ' нецензурных слов', value[2].to_s + ' слова на батл', value[3].to_s + ' слова в раунде']
  end
  table = Terminal::Table.new :rows => rows
  table
end

#print make_table(10)

options = {"top-bad-words" => nil}

parser = OptionParser.new do|opts|
  opts.banner = "Info for all options"
  opts.on('-bad-words', '--top-bad-words=number', 'Yeap, test passed') do |number|
    options["top-bad-words"] = number;
  end
end

parser.parse!

if options["top-bad-words"] == nil
  print 'You should enter number of rapers you want to see: '
    options["top-bad-words"] = gets.chomp
end

print make_table(options["top-bad-words"])