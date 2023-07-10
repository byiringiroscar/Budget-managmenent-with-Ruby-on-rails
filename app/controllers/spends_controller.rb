class spendsController < ApplicationController
  before_action :set_spend, only: %i[ show edit update destroy ]

  # GET /spends or /spends.json
  def index
    @spends = spend.all
  end

  # GET /spends/1 or /spends/1.json
  def show
  end

  # GET /spends/new
  def new
    @spend = spend.new
  end

  # GET /spends/1/edit
  def edit
  end

  # POST /spends or /spends.json
  def create
    @spend = spend.new(spend_params)

    respond_to do |format|
      if @spend.save
        format.html { redirect_to spend_url(@spend), notice: "spend was successfully created." }
        format.json { render :show, status: :created, location: @spend }
      else
        format.html { render :new, status: :unprocessable_spend }
        format.json { render json: @spend.errors, status: :unprocessable_spend }
      end
    end
  end

  # PATCH/PUT /spends/1 or /spends/1.json
  def update
    respond_to do |format|
      if @spend.update(spend_params)
        format.html { redirect_to spend_url(@spend), notice: "spend was successfully updated." }
        format.json { render :show, status: :ok, location: @spend }
      else
        format.html { render :edit, status: :unprocessable_spend }
        format.json { render json: @spend.errors, status: :unprocessable_spend }
      end
    end
  end

  # DELETE /spends/1 or /spends/1.json
  def destroy
    @spend.destroy

    respond_to do |format|
      format.html { redirect_to spends_url, notice: "spend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spend
      @spend = spend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spend_params
      params.require(:spend).permit(:name, :amount, :author_id)
    end
end
