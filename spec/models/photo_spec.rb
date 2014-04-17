require 'spec_helper'

describe Photo do
  it { should have_many :moments }
  it { should have_many :tags }

  it { should validate_uniqueness_of(:url)}
end

describe "Photos" do
  it "should check if a photos title is correct" do
    new_photo = Photo.new(title: "great dog photo", url: "http://ppcdn.500px.org/51177220/411bc6a3cffeca7ee6483eedd665712cf9ee17c4/2048.jpg")
    new_photo.title.should == "great dog photo"
  end

  it "should check if a url is correct" do
    new_photo = Photo.new(title: "great dog photo", url: "http://ppcdn.500px.org/51177220/411bc6a3cffeca7ee6483eedd665712cf9ee17c4/2048.jpg")
    new_photo.url.should == "http://ppcdn.500px.org/51177220/411bc6a3cffeca7ee6483eedd665712cf9ee17c4/2048.jpg"
  end
end