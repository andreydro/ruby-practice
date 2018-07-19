# This module is used for utility methods
module UtilityMethods
  PRONOUNS = YAML.load_file('config.yml')['PRONOUNS_ARRAY'].join('|')

  def self.count_all_duplicates(array_storage)
    array_storage.each_with_object(Hash.new(0)) { |word, counts| counts[word] += 1 }
  end

  def self.storage_for_all_text(name)
    DataStorage.show_all_data.inject('') do |string, (file_name, file_content)|
      string += file_content if file_name.match(name)
      string
    end
  end

  def self.the_most_used_words(top_words, name)
    array_storage = UtilityMethods.storage_for_all_text(name).gsub(/,|'/, ' ').split
    array_storage.delete_if { |elem| elem.downcase.match(/#{PRONOUNS}/) }.map!(&:capitalize)
    UtilityMethods.count_all_duplicates(array_storage).sort_by { |_, value| value }.reverse.to_h.first(top_words.to_i)
  end

  def self.sort_and_reverse_hash(hash_for_sorting)
    hash_for_sorting = hash_for_sorting.sort_by { |_, value| value [1] }
    hash_for_sorting.reverse!
    hash_for_sorting.map { |elem| [elem[0], elem[1]] }.to_h
  end

  def self.sort_storage
    ListOfRapers.list_all_rapers.each_with_object({}) do |raper, hash|
      hash[raper] = [
        Raper.new(raper).number_of_battles,
        Raper.new(raper).number_of_swear_words,
        Raper.new(raper).average_number_swearing_words_in_battle,
        Raper.new(raper).average_number_words_in_round
      ]
    end
  end

  def self.statistics(number_of_rapers)
    UtilityMethods.sort_and_reverse_hash(UtilityMethods.sort_storage).first(number_of_rapers.to_i)
  end
end
