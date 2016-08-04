# (c) 2016 Outsouring IT - Konopnickiej.Com
# Author: Paweł 'felixd' Wojciechowski

require 'csv'

pytania=Dir['*.csv']

unless pytania.length == 0
  pytania.each do |file|

    puts "Przetwarzam: #{file}"

    begin

      md = File.open("#{file}.md", "w")

      CSV.read(file, {
                       #  :encoding => 'ISO-8859-1:UTF-8',
                       :col_sep => '@',
                       :row_sep => "\n",
                       :quote_char => '"',
                       :headers => true,
                       :header_converters => :symbol,
                   }).each do |row|
        r = row.to_h

        md.write("## Pytanie #{r[:lp]} [#{r[:numer]}]\n")
        md.write("`#{r[:pytanie]}`\n")
        md.write("* **#{r[:odp1]}**\n")
        md.write("* #{r[:odp2]}\n")
        md.write("* #{r[:odp3]}\n")
        md.write("* #{r[:odp4]}\n")
        md.write("\n")

      end

    rescue IOError => e
      puts e
    ensure
      md.close unless md.nil?
    end

  end
end
