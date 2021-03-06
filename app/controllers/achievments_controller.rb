class AchievmentsController < ApplicationController
  before_action :set_achievment, only: %i[ show edit update destroy ]

  # GET /achievments or /achievments.json
  def index
    @achievments = Achievment.all
  end

  # GET /achievments/1 or /achievments/1.json
  def show
  end

  # GET /achievments/new
  def new
    @achievment = Achievment.new
  end

  # GET /achievments/1/edit
  def edit
  end

  # POST /achievments or /achievments.json
  def create
    @achievment = Achievment.new(achievment_params)

    respond_to do |format|
      if @achievment.save
        format.html { redirect_to achievment_url(@achievment), notice: "Achievment was successfully created." }
        format.json { render :show, status: :created, location: @achievment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achievment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievments/1 or /achievments/1.json
  def update
    respond_to do |format|
      if @achievment.update(achievment_params)
        format.html { redirect_to achievment_url(@achievment), notice: "Achievment was successfully updated." }
        format.json { render :show, status: :ok, location: @achievment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievments/1 or /achievments/1.json
  def destroy
    @achievment.destroy

    respond_to do |format|
      format.html { redirect_to achievments_url, notice: "Achievment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievment
      @achievment = Achievment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def achievment_params
      params.fetch(:achievment, {})
    end
end
