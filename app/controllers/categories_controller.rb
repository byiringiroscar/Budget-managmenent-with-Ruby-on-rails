class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to categories_url, notice: 'You can only see your category'
  end
  # GET /categories or /categories.json
  def index
    @categories = current_user.categories
    # total spends amount
    @total = current_user.spends.sum(:amount)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    authorize! :read, @category
  
    # amount for this category according to the spend
    @amount_category = current_user.spends.where(category_id: @category.id).sum(:amount)
    # @spends = current_user.spends.where(category_id: @category.id)
  end
  

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    authorize! :update, @category
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @spend }
      else
        format.html { render :edit, status: :unprocessable_spend }
        format.json { render json: @spend.errors, status: :unprocessable_spend }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    authorize! :destroy, @category
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon, :author_id)
  end
end
