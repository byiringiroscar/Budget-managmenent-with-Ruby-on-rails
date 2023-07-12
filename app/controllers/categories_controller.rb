class CategoriesController < ApplicationController
  include CanCan::Ability
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /categories or /categories.json
  def index
    @categories = Category.all.accessible_by(current_ability)
    # total spends amount
    @total = current_user.spends.sum(:amount)
  end

  # GET /categories/1 or /categories/1.json
  def show
    authorize! :read, @category
    @category = Category.find(params[:id])
    # amount for this category according to the spend
    @amount_category = current_user.spends.where(category_id: @category.id).sum(:amount)
    # @spends = current_user.spends.where(category_id: @category.id)
  rescue CanCan::AccessDenied
    redirect_to categories_url, notice: 'You can only see your category'
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    authorize! :update, @category
  rescue CanCan::AccessDenied
    redirect_to categories_url, notice: 'You can only edit your category'
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
    authorize! :destroy, @category
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  rescue CanCan::AccessDenied
    redirect_to categories_url, notice: 'You can only delete your category'
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
