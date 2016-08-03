# (c) 2016 Outsouring IT - Konopnickiej.Com
# Author: Paweł 'felixd' Wojciechowski

require 'csv'

files=Dir['*.csv']
unless files.length == 0
  files.each do |file|
    p file
    CSV.read(file, {
                     #  :encoding => 'ISO-8859-1:UTF-8',
                     :col_sep => '@',
                     :row_sep => "\n",
                     :quote_char => '"',
                     :headers => true,
                     :header_converters => :symbol,
                 }).each do |row|
      r = row.to_h
      puts "## Pytanie #{r[:lp]} [#{r[:numer]}]"
      puts "`#{r[:pytanie]}`"
      puts "* **#{r[:odp1]}**"
      puts "* #{r[:odp2]}"
      puts "* #{r[:odp3]}"
      puts "* #{r[:odp4]}"
      puts ""

    end
  end
end
