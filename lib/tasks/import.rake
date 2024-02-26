# frozen_string_literal: true

namespace :import do
  desc 'Import Hexagrams from Excel file'
  task hexagram: :environment do
    require 'rubyXL'

    def import_hexagram_from_excel
      workbook = RubyXL::Parser.parse(Rails.root.join('db', 'seeds', 'iching_data.xlsx').to_s)
      worksheet = workbook[0]

      puts 'Importing Hexagrams...'

      worksheet.each_with_index do |row, index|
        next if index.zero?

        Hexagram.create!(
          title: row[0].value,
          summary: row[1].value,
          judgment: row[2].value,
          judgment_sum: row[3].value,
          image: row[4].value,
          image_sum: row[5].value
        )
      end
    end

    import_hexagram_from_excel

    puts 'Hexagrams imported!'
  end
end
