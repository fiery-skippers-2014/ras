require 'spec_helper'

describe Photo do
  it { should have_many :moments }
  it { should have_many :tags }

  it { should validate_uniqueness_of(:url)}
end