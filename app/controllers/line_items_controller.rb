class LineItemsController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:create, :update] # call the set_cart method before the create() action
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  #Calls invalid_line_item if the record could not be found
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_line_item
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_index_url}
        format.js { @current_item = @line_item}
        format.json { render :show, status: :created, location: @line_item }
        session[:counter] = 0
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @line_item = @cart.decrement_line_item(@line_item)

    respond_to do |format|
      if @line_item.update(line_item_params)
        @line_item.destroy if @line_item.quantity < 1
        format.html { redirect_to store_index_url, notice: 'Line item was successfully updated.' }
        format.js
       # binding.pry
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    cart_id = session[:cart_id]
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to store_index_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end

  
  
  #Function used to log errors when you try to acces an unavailable line item
  def invalid_line_item
    logger.error "Cannot access line item with id #{params[:id]}"
    redirect_to line_items_url, notice: "Invalid line item"
  end

  
end
