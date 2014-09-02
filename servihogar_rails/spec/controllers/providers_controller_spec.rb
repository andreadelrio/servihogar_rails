require "spec_helper"

describe ProvidersController do

  describe "#show" do
    let(:provider) { create(:provider) }
    let(:show_action) { get :show, id:  provider.id }

    it "assign provider" do
      show_action
      expect(assigns(:provider)).to eq(provider)
    end

  describe "#new" do
    it "assigns new" do
      get :new, locale: "es"
      expect(assigns(:provider)).to be_a_new(Provider)
    end
  end

  describe "#create" do

    context 'with valid params' do

      let(:valid_attributes) { attributes_for(:provider) }

      let(:create_action) do
        post :create,  locale: "es", provider: valid_attributes
      end

      it "creates a new provider with valid attributes" do
        expect { create_action }.to change(Provider, :count).by(1)
      end

      it "assigns provider" do
        create_action
        expect(assigns(:provider)).to be_a(Provider)
        expect(assigns(:provider)).to be_persisted
      end

      it "should set the session for provider" do
        create_action
        expect(session[:provider_id]).to eq(Provider.last.id)
      end
    end

    context 'with invalid params' do
      let(:bad_params) do
        post :create, locale: "es", provider: {first_name: ""}
      end

      it "does not create provider" do
        expect { bad_params }.to change(Provider, :count).by(0)
      end

      it "renders new" do
        bad_params
        expect(response).to render_template('new')
      end
    end
  end

  describe "#edit" do

    let(:provider) { create(:provider) }
    let(:edit_action) { get :edit, id: provider.id }

    context "logged in provider" do

      before(:each) { login(provider) }

      it "assigns provider" do
        edit_action
        expect(assigns(:provider)).to eq(provider)
      end
    end

    context "unlogged provider" do
      it "assigns provider" do
        edit_action
        expect(response).to redirect_to new_providers_session_path
      end
    end
  end

  describe "update" do

    let(:update_action) { patch :update, provider: provider.attributes, id: provider.id }

    let(:provider) { create(:provider) }

    before(:each) do
      login(provider)
      provider.dni = "8184504550"
    end

    it "should be valid" do
      update_action
      expect(response).to be_true
      expect(Provider.last.dni).to eq('8184504550')
    end

    it "should redirect to profile page" do
      update_action
      expect(response).to redirect_to provider_path(provider)
    end
  end
end
end
