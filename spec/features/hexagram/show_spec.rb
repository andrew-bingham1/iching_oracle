# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Hexagram Show Page', type: :feature do
  describe 'As a visitor' do
    it 'exists' do
      visit hexagram_path(1)
      expect(current_path).to eq(hexagram_path(1))
    end

    it 'has hexagram information' do
      visit hexagram_path(1)
      expect(page).to have_content('The Creative')
      expect(page).to have_content('The Judgment')
      expect(page).to have_content('The Image')
      expect(page).to have_content('The first hexagram is made up of six unbroken lines.')
      expect(page).to have_css("img[src*='hexagram1.png']")
    end
  end
end
