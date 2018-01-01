require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do
let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
let(:my_user) { User.create!(email: RandomData.random_email, password: "password", password_confirmation: "password") }

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end

  end

  # describe "GET #show" do
  #
  #   it "returns http success" do
  #     get :show, params: { id: my_wiki.id }
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
