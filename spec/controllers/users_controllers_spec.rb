require "rails_helper"

describe UsersController do
  let!(:user) { User.create(first_name: "Joe", last_name: "Smith", email: "test@yahoo.com", password: "password")}

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'when valid params are passed' do

      it "assigns the newly created user as @user" do
        post :create, { user: {first_name: "Joe", last_name: "Smith", password: "password", email: "jack1@email.com"} }
        new_user = User.last

        expect(assigns(:user)).to eq new_user
      end

      it "redirects to the users show page" do
        post :create, { user: {first_name: "Joe", last_name: "Smith", password: "password", email: "jack2@email.com"} }
        new_user = User.last

        expect(response).to redirect_to "/users/#{new_user.id}"
      end
    end
  end

  # describe "GET #show" do
  #   context "when a contributor" do
  #     user1 = User.new(first_name: "Joe", last_name: "Smith", email: "test1@yahoo.com", password: "password")
  #     # user.id = session[:user_id]
  #     user1.save
  #     p user1.id
  #     it "assigns the correct user as @user" do
  #       get :show, { id: user1.id }
  #       expect(assigns(:user)).to eq(user1)
  #     end

  #     it "renders the :show template" do
  #       get :show, { id: user.id }
  #       expect(response).to render_template(:show)
  #     end

    # end
  # end
end
