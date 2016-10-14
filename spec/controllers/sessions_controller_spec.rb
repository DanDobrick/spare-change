require 'rails_helper'

describe SessionsController do
  let!(:user) { User.create(first_name: "Lucas", last_name: "Wright", email: "lucas@test.com", password: "money")}
  describe "GET #new" do
    it 'responds with a status code 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

   describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 200" do
        post :create, { session: {user_id: "1"}}
        expect(response).to have_http_status 200
      end
    end
  end

end
