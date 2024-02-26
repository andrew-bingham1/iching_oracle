# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hexagram, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:judgment) }
    it { should validate_presence_of(:judgment_sum) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:image_sum) }
  end
end
