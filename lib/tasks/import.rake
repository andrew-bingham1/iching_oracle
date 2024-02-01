# frozen_string_literal: true

namespace :import do
  desc 'Import Hexagrams from Excel file'
  task hexagram: :environment do
    require 'rubyxl'

    def import_hexagram_from_excel
      workbook = RubyXL::Parser.parse(Rails.root.join('db', 'seeds', 'iching_data_ten_excel.xlsx').to_s)
      worksheet = workbook[0]

      puts 'Importing Hexagrams...'

      worksheet.each_with_index do |row, index|
        next if index.zero?

        Hexagram.create!(
          title: row[0].value,
          oracle: row[1].value,
          summary: row[2].value,
          judgment: row[3].value,
          judgment_sum: row[4].value,
          image: row[5].value,
          image_sum: row[6].value
        )
      end
    end

    import_hexagram_from_excel

    puts 'Hexagrams imported!'
  end
end
