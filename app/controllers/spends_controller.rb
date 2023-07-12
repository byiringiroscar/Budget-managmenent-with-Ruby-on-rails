include CanCan::Ability

class SpendsController < ApplicationController
  before_action :set_spend, only: %i[show edit update destroy]

  # GET /spends or /spends.json
  def index
    @category = Category.find(params[:category_id])
    @spends = @category.spends.all.accessible_by(current_ability)
  end

  # GET /spends/1 or /spends/1.json
  def show
    @category = Category.find(params[:category_id])
    @spend = @category.spends.find(params[:id])
    authorize! :read, @spend
    rescue CanCan::AccessDenied
      redirect_to categories_url, notice: 'You can only see your spend'
    rescue ActiveRecord::RecordNotFound
  redirect_to categories_url, notice: 'Category or spend not found'
  end

  # GET /spends/new
  def new
    @category = Category.find(params[:category_id])
    @spend = @category.spends.build
  end

  # GET /spends/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @spend = @category.spends.find(params[:id])
    authorize! :update, @spend
  rescue CanCan::AccessDenied
    redirect_to categories_url, notice: 'You can only edit your spend'
  rescue ActiveRecord::RecordNotFound
    redirect_to categories_url, notice: 'Category or spend not found'
  end
  

  # POST /spends or /spends.json
  def create
    @category = Category.find(params[:category_id])
    @spend = @category.spends.build(spend_params)
    @spend.author_id = current_user.id

    respond_to do |format|
      if @spend.save
        format.html { redirect_to category_url(@category), notice: 'spend was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_spend }
        format.json { render json: @spend.errors, status: :unprocessable_spend }
      end
    end
  end

  # PATCH/PUT /spends/1 or /spends/1.json
  def update
    @category = Category.find(params[:category_id])
    @spend = @category.spends.build(spend_params)
    @spend.author_id = current_user.id
    respond_to do |format|
      if @spend.update(spend_params)
        format.html { redirect_to category_url(@category), notice: 'spend was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_spend }
        format.json { render json: @category.errors, status: :unprocessable_spend }
      end
    end
  end

  # DELETE /spends/1 or /spends/1.json
  def destroy
    @category = Category.find(params[:category_id])
    @spend = @category.spends.find(params[:id])
    authorize! :destroy, @spend
    @spend.destroy

    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'spend was successfully destroyed.' }
      format.json { head :no_content }
    end
  rescue CanCan::AccessDenied
    redirect_to categories_url, notice: 'You can only delete your spend'
  rescue ActiveRecord::RecordNotFound
    redirect_to categories_url, notice: 'Category or spend not found'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spend
    @spend = Spend.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spend_params
    params.require(:spend).permit(:name, :amount, :author_id)
  end
end
