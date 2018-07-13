# require 'rubygems'
# require 'commander/import'

# # :name is optional, otherwise uses the basename of this executable
# program :name, 'versus'
# program :version, '1.0.0'
# program :description, 'You will see the versus statistics'

# global_option '--top-bad-words'

# command :go do |c|
#   c.syntax = 'run the command'
#   c.description = 'lets test'
#   c.action do |args, options|
#     say "yes, you are right" if options.test
#   end
# end

#NAMES = %["(Pra(Killa'Gramm)", 'Obe_1_Kanobe', '13|47', 'Леха_Медь', '1917', 'Palmdropov', 'Abbalbisk', 'A']
DRAGO = 'Drago'

ABBA = 'Abbalbisk'

SWEAR_WORDS = 'сука|блять|блядь|ебать|бля|блядина|блядский|ебало|ебанулся|ебнул|заебал|заебись|хуй|пизда|пиздец' # дополнить

# Dir.glob("rap-battles/*") do |file_name|
#   battle = file_name.match(/Drago/)
#   battles_storage << battle
#   battles_storage.reject! { |c| c.nil? }
#   text = File.read(file_name)
#   find_name = text.match(/Drago/)
#   names_storage << find_name
#   names_storage.reject! { |c| c.nil? }
# end


# puts names_storage.size

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
      find_swear_words = text.match(SWEAR_WORDS)
      swear_words_storage << find_swear_words
      swear_words_storage.reject! { |c| c.nil? }
    end
  end
  swear_words_storage.size
end

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

def statistics
  all_rapers = find_all_rapers
  storage_hash = {}
  all_rapers.each do |raper|
    storage_for_each_raper = []
    battles = number_of_battles(raper)
    swear_words = number_of_swear_words(raper)
    avn_swear_words = average_number_of_swearing_words_in_battle(raper)
    avn_words_in_round = average_number_words_in_round(raper)
    storage_for_each_raper << battles
    storage_for_each_raper << swear_words
    storage_for_each_raper << avn_swear_words
    storage_for_each_raper << avn_words_in_round
    storage_hash[raper] = storage_for_each_raper
  end
  storage_hash
end

puts statistics

# puts "Swearing words " + number_of_swear_words(ABBA).to_s
# puts "Battles " + number_of_battles(ABBA).to_s
# puts "Average SW " + average_number_of_swearing_words_in_battle(ABBA).to_s
# puts "-----"
# puts "Swearing words " + number_of_swear_words(DRAGO).to_s
# puts "Battles " + number_of_battles(DRAGO).to_s
# puts "Average SW " + average_number_of_swearing_words_in_battle(DRAGO).
