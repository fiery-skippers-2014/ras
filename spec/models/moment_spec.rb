require 'spec_helper'

describe Moment do
  it { should belong_to :tag }
  it { should belong_to :photo }
end