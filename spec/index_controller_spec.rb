require 'spec_helper'

# describe "IndexController (this is a skeleton controller test!)" do
describe 'galleries' do
  # before(:all) do 
  #   Scraper::Client.any_instance.stub(:data) {
  #     [{
  #         photographer: "Brittan McGinnis",
  #         tags: "Dog",
  #         title: "Great dog photo",
  #         url: "http://ppcdn.500px.org/67368609/4145fa1c574512093798dda08573ee3f1a7b531b/4.jpg" #.gsub("/2.jpg", "/5.jpg")
  #       }]
  #   }
  # end
  before(:each) do 
    Photo.destroy_all
    Primary.destroy_all
  end

  it 'should go to index page' do
    get "/"
    expect(last_response).to be_ok
  end


  describe 'the gallery page' do 
    context "with invalid params" do 
      it "should throw an error" do 
        expect{get "/gallery"}.to raise_error
      end
    end
    context "with valid params" do 
      it "should give a page" do 
        expect{
          get "/gallery", {tag_search: "happy"}
          expect(last_response).to be_ok
        }.not_to raise_error
      end
      it "should update the photo count" do 
        expect{
          get "/gallery", {tag_search: "dog"}
          expect(last_response).to be_ok
        }.to change(Photo ,:count)
      end
    end
  end
end




