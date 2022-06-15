class UsergnomesController < ApplicationController
  before_action :set_usergnome, only: %i[ show edit update destroy ]

  # GET /usergnomes or /usergnomes.json
  def index
    @usergnomes = Usergnome.all
  end

  # GET /usergnomes/1 or /usergnomes/1.json
  def show
  end

  # GET /usergnomes/new
  def new
    @usergnome = Usergnome.new
  end

  # GET /usergnomes/1/edit
  def edit
  end

  # POST /usergnomes or /usergnomes.json
  def create
    @usergnome = Usergnome.new(usergnome_params)

    respond_to do |format|
      if @usergnome.save
        format.html { redirect_to usergnome_url(@usergnome), notice: "Usergnome was successfully created." }
        format.json { render :show, status: :created, location: @usergnome }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usergnome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usergnomes/1 or /usergnomes/1.json
  def update
    respond_to do |format|
      if @usergnome.update(usergnome_params)
        format.html { redirect_to usergnome_url(@usergnome), notice: "Usergnome was successfully updated." }
        format.json { render :show, status: :ok, location: @usergnome }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usergnome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usergnomes/1 or /usergnomes/1.json
  def destroy
    @usergnome.destroy

    respond_to do |format|
      format.html { redirect_to usergnomes_url, notice: "Usergnome was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usergnome
      @usergnome = Usergnome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usergnome_params
      params.fetch(:usergnome, {})
    end
end
