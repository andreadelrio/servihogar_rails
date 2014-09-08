class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :require_current_provider, only: [:edit]
  before_action :get_ranges, only: [:edit, :new]
  before_action :require_unlogged_provider, only: [:new]


  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
      if @provider.save
        session[:provider_id] = @provider.id
        flash[:success] = "Hola #{@provider.name}, bienvenido a Servihogar."
        redirect_to root_path
      else
        render "new"
      end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Tu perfil se ha actualizado con éxito' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :last_name_1, :last_name_2, :dni, :email, :category_id, :password, :password_confirmation, locations_attributes: [:id], location_ids: [])
    end

    def get_ranges
      @letters1 = ('A'..'J').to_a
      @letters2 = ('K'..'R').to_a
      @letters3 = ('S'..'Z').to_a
    end
end
