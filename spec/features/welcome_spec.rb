require 'rails_helper'

RSpec.feature "Landing Page", type: :feature do
  before(:each) do
    visit root_path
  end
  it "exists" do
      expect(current_path).to eq(root_path)
  end

  it "has a title" do
      expect(page).to have_content("I Ching Oracle")
  end

  it 'has a link to about page' do
    expect(page).to have_link('About')
  end

  it 'has a link to index' do
    expect(page).to have_link('Index')
  end

  it 'has a link to history' do
    expect(page).to have_link('History')
  end

  it 'has a field to enter a question' do
    expect(page).to have_field('question')
    expect(page).to have_button('Consult the Oracle')
  end
end