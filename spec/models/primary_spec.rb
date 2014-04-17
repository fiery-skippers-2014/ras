require 'spec_helper'

describe Primary do
  it { should validate_uniqueness_of(:title) }
end