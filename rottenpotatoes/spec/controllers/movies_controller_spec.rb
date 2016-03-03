require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  # describe 'searching TMDb' do
  #   before :each do
  #     @fake_results = [double('movie1'), double('movie2')]
  #   end
  #   # it 'should call the model method that returns rating' do
  #   #   Movie.should_receive(:find_in_tmdb).with('hardware').
  #   #     and_return(@fake_results)
  #   #   post :search_tmdb, {:search_terms => 'hardware'}
  #   # end
  #   describe 'filter the movies' do
  #     before :each do
  #       Movie.stub(:find_in_tmdb).and_return(@fake_results)
  #       post :search_tmdb, {:search_terms => 'hardware'}
  #     end
  #     it 'should select the Search Results template for rendering' do
  #       response.should render_template('search_tmdb')
  #     end
  #     it 'should make the TMDb search results available to that template' do
  #       assigns(:movies).should == @fake_results
  #     end
  #   end
  # end
  
#   describe "PUT update/:id" do
#   let(:attr) do 
#     { :title => 'new title', :rating => 'PG' }
#   end

#   before(:each) do
#     put :update, :id => @movie.id, :movie => attr
#     @movie.reload
#   end

#   it { response.should redirect_to(@movie) }
#   it { @movie.title.should eql attr[:title] }
#   it { @movie.rating.should eql attr[:rating] }
# end
end