class UserachievmentsController < ApplicationController
  before_action :set_userachievment, only: %i[ show edit update destroy ]

  # GET /userachievments or /userachievments.json
  def index
    @userachievments = Userachievment.all
  end

  # GET /userachievments/1 or /userachievments/1.json
  def show
  end

  # GET /userachievments/new
  def new
    @userachievment = Userachievment.new
  end

  # GET /userachievments/1/edit
  def edit
  end

  # POST /userachievments or /userachievments.json
  def create
    @userachievment = Userachievment.new(userachievment_params)

    respond_to do |format|
      if @userachievment.save
        format.html { redirect_to userachievment_url(@userachievment), notice: "Userachievment was successfully created." }
        format.json { render :show, status: :created, location: @userachievment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userachievment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userachievments/1 or /userachievments/1.json
  def update
    respond_to do |format|
      if @userachievment.update(userachievment_params)
        format.html { redirect_to userachievment_url(@userachievment), notice: "Userachievment was successfully updated." }
        format.json { render :show, status: :ok, location: @userachievment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userachievment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userachievments/1 or /userachievments/1.json
  def destroy
    @userachievment.destroy

    respond_to do |format|
      format.html { redirect_to userachievments_url, notice: "Userachievment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userachievment
      @userachievment = Userachievment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userachievment_params
      params.fetch(:userachievment, {})
    end
end
