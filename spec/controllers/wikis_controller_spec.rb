require 'rails_helper'

RSpec.describe WikisController, type: :controller do
let(:my_wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body") }
let(:my_user) { User.create!(email: "test@gmail.com", password: "password", password_confirmation: "password") }

  describe "GET #index" do


    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do

    it "returns http success" do
      get :show, params: { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
