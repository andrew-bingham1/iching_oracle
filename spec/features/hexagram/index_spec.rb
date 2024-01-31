# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Hexagram Index Page', type: :feature do
  before(:each) do
    visit hexagrams_path
  end
  describe 'Hexagram Index Page' do
    it 'exists' do
      expect(current_path).to eq(hexagrams_path)
    end

    it 'has a title' do
      expect(page).to have_content('Hexagram Index')
    end

    it 'has a link to home and about' do
      expect(page).to have_link('Home')
      expect(page).to have_link('About')
    end

    it 'has a list of the first ten hexagrams' do
      expect(page).to have_content(Hexagram.first.title)
      expect(page).to have_content(Hexagram.last.title)
    end

    it 'has a link to each hexagram' do
      expect(page).to have_link(Hexagram.first.title)
      expect(page).to have_link(Hexagram.last.title)
    end

    it 'can click the link to a hexagram and go to its show page' do
      click_link(Hexagram.first.title)
      expect(current_path).to eq(hexagram_path(Hexagram.first))
    end
  end
end
