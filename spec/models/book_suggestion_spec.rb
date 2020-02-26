require 'rails_helper'

describe BookSuggestion do
  subject(:book_suggestion) { build(:book_suggestion) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:editor) }
  it { is_expected.to validate_presence_of(:year) }
end
