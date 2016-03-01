require 'spec_helper'
require 'rails_helper'


describe MoviesController, :type => :controller do
  describe 'add director' do
  # describe 'PUT update' do
    
    before do
      movie.stub(:id).and_return(id) # just to illustrate, not necessary if stubbing the find class method
      Movie.stub(:find).and_return(user)
    end
    
    # before :each do
    #   # @contact = Factory(:contact, firstname: "Lawrence", lastname: "Smith")
    #   @movie = FactoryGirl.build(:movie, title: "Harry Potter", rating: "PG")
    # end
    
    # context "valid attributes" do
      # it "located the requested @contact" do
      # it "located the edit link" do
        # put :update, id: @contact, contact: Factory.attributes_for(:contact)
        # put :update, id: movie.id, movie: 'title' => 'Harry Potter', 'rating' => 'PG'
        # assigns(:movie).should eq(movie)      
      # end
    # end
  end
end






# it { expect(user.id).to eq(id) } # just to illustrate
# it { expect(response).to be_success }
# it { expect(assigns(:user)).to eq(user) }
    #   it "changes @contact's attributes" do
    #     put :update, id: @contact, 
    #       contact: Factory.attributes_for(:contact, firstname: "Larry", lastname: "Smith")
    #     @contact.reload
    #     @contact.firstname.should eq("Larry")
    #     @contact.lastname.should eq("Smith")
    #   end
    
    #   it "redirects to the updated contact" do
    #     put :update, id: @contact, contact: Factory.attributes_for(:contact)
    #     response.should redirect_to @contact
    #   end
    # end
    
    # context "invalid attributes" do
    #   it "locates the requested @contact" do
    #     put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
    #     assigns(:contact).should eq(@contact)      
    #   end
      
    #   it "does not change @contact's attributes" do
    #     put :update, id: @contact, 
    #       contact: Factory.attributes_for(:contact, firstname: "Larry", lastname: nil)
    #     @contact.reload
    #     @contact.firstname.should_not eq("Larry")
    #     @contact.lastname.should eq("Smith")
    #   end
      
    #   it "re-renders the edit method" do
    #     put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
    #     response.should render_template :edit
    #   end
