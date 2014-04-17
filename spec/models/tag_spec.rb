require 'spec_helper'

describe Tag do
  it { should have_many :moments }
  it { should have_many :photos }

  it { should validate_uniqueness_of(:description)}
end