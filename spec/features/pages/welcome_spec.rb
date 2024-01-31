# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Landing Page', type: :feature do
  before(:each) do
    visit root_path
  end

  it 'exists' do
    expect(current_path).to eq(root_path)
  end

  it 'has a title' do
    expect(page).to have_content('I Ching Oracle')
  end

  it 'has a link to home page' do
    expect(page).to have_link('Home')
  end

  it 'can click the link to return home' do
    click_link('Home')
    expect(current_path).to eq(root_path)
  end

  it 'has a link to about page' do
    expect(page).to have_link('About')
  end

  it 'can click the link to go to about page' do
    click_link('About')
    expect(current_path).to eq(about_path)
  end

  it 'has a link to index page' do
    expect(page).to have_link('Index')
  end

  it 'can click the link to go to index page' do
    click_link('Index')
    expect(current_path).to eq(hexagrams_path)
  end

  it 'has a field to enter a question' do
    expect(page).to have_field('question')
    expect(page).to have_button('Consult the Oracle')
  end

  it 'can enter a question and click button to redirect to random show page' do
    fill_in('question', with: 'Should I buy a dog?')
    click_button('Consult the Oracle')
    expect(current_path).to match(%r{hexagrams/\d+})
  end
end
