require 'rails_helper'

describe Book do
  let(:book) { build(:book) }

  context 'When creates a book' do
    it 'validates presence of :gender' do
      is_expected.to validate_presence_of(:gender)
    end

    it 'validates presence of :gender' do
      is_expected.to validate_presence_of(:gender)
    end

    it 'validates presence of :author' do
      is_expected.to validate_presence_of(:author)
    end

    it 'validates presence of :image' do
      is_expected.to validate_presence_of(:image)
    end

    it 'validates presence of :title' do
      is_expected.to validate_presence_of(:title)
    end

    it 'validates presence of :editor' do
      is_expected.to validate_presence_of(:editor)
    end

    it 'validates presence of :year' do
      is_expected.to validate_presence_of(:year)
    end
  end
end
