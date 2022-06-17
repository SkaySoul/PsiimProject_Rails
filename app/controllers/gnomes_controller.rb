class GnomesController < ApplicationController
  before_action :set_gnome, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  # GET /gnomes or /gnomes.json
  def index
    #@gnomes = Gnome.all
    gnomes = Gnome.order('id DESC')
    render json: { status: 'SUCCESS', message:'Loaded gnomes', data:gnomes }, status: :ok
  end

  # GET /gnomes/1 or /gnomes/1.json
  def show
    gnomes = Gnome.find(params[:id])
    render json: { status: 'SUCCESS', message:'Loaded gnomes', data:gnomes }, status: :ok
  end


  # GET /gnomes/1/edit
  def edit
  end

  def new
    @gnome = Gnome.new
  end

  def gnome_params_create
    params.require(:gnome).permit( :gnome_name, :localization, :description)
  end

  # POST /gnomes or /gnomes.json
  def create
    #@gnome = Gnome.new(gnome_params)
    gnome = Gnome.new(gnome_params_create)
    if gnome.save
      render json: { status: 'SUCCESS', message:'Created', data:gnome }, status: :ok
    else
      render json: { status: 'ERROR', message:'Cant create a gnome', data:gnome.errors }, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /gnomes/1 or /gnomes/1.json
  def update
    gnome = Gnome.find(params[:id])
    if gnome.update(gnome_params_create)
      render json: { status: 'SUCCESS', message:'Updated', data: gnome }, status: :ok
    else
      render json: { status: 'ERROR', message:'Cant updated a gnome', data: gnome.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /gnomes/1 or /gnomes/1.json
  def destroy
    gnome = Gnome.find(params[:id])
    if gnome.destroy
        render json: { status: 'SUCCESS', message:'Destroyed', data: gnome }, status: :ok
    else
        render json: { status: 'ERROR', message:'Cant destroy a gnome', data: gnome.errors}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gnome
      @gnome = Gnome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gnome_params
      params.fetch(:gnome, {})
    end
end
