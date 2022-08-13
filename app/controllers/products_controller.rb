# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /products or /products.json
  def index
    @products = Product.all.order('created_at desc')
    # @items = Wish.where(user_id: current_user.id)
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit; end

  def wish_list
    wish_item = params[:product_id]
    is_exist = Wish.find_by(products_id: wish_item, users_id: current_user.id)
    if is_exist
      is_exist.destroy
      redirect_to wish_list_path, notice: 'Product was successfully deleted in Favourite.'

    else
      wish_create = Wish.create(
        products_id: wish_item,
        users_id: current_user.id
      )
      if wish_create.save
        redirect_to root_path, notice: 'Product was successfully Added to Favourite.'
      else
        render plain: 'failed to store'
      end

    end

    # wish_id = params[:product_id]
    # wish_record = Wish.create!(

    # )
  end

  def search
    @products1 = Product.where('title Like ?', "%#{params[:q]}%")
  end

  def review

    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path, notice: 'Thanks for Your Review'
    else
      redirect_to product_path, notice: 'Sorry Your Review was not Created'
    end

  end

  # POST /products or /products.json
  def create
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def render_wishlist
    render 'products/wish'
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:brand, :description, :title, :price, :image)
  end

  def review_params
    params.require(:review).permit(:comment_box, :product_id, :user_id, :rating)
  end

end
