# This class is used for printing table to the terminal
class PrintTable
  def initialize(top_bad_words)
    @top_bad_words = top_bad_words
    puts_table_to_terminal
  end

  def puts_table_to_terminal
    puts make_table
  end

  # :reek:DuplicateMethodCall # ridiculous warning
  def make_table
    collection = UtilityMethods.statistics(@top_bad_words).map { |elem| [elem[0], elem[1]] }.to_h
    rows = collection.map do |key, value|
      [key.to_s,
        "#{value[0]} #{Russian.p(value[0], 'баттл', 'баттла', 'баттлов')}",
        "#{value[1]} нецензурных слов",
        "#{value[2]} слова на баттл",
        "#{value[3]} слова в раунде"]
    end
    Terminal::Table.new(rows: rows)
  end
end
