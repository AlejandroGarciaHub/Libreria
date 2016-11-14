class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

  def add
    id=params[:id]
    if session[:cart] then
      cart= session[:cart]
    else
      session[:cart]={}
      cart=session[:cart]
    end

    if cart[id] then
      cart[id] =cart[id]+1
    else
      cart[id]=1
    end
    redirect_to :action => :index
  end

  def clearCart
    session[:cart]=nil
    redirect_to :action => :index
  end

  def new
    @purchase = Purchase.new
    @purchase.purchase_details.build

    if session[:cart] then
      @cart=session[:cart]
  else
      @cart={}      
    end
  end
  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase_details=PurchaseDetail.where(purchase_id: params[:id])
  end

  # GET /purchases/new
 
  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    if session[:cart] then
      @cart=session[:cart]
  else
      @cart={}      
    end
    @cantidad=0
    @purchase = current_user.purchases.new(purchase_params)
    @purchase_detail=PurchaseDetail.new
    respond_to do |format|
      if @purchase.save
        @cart.each do |id,quantity|
          @purchase_detail=PurchaseDetail.new
          @purchase_detail.purchase_id= @purchase.id
          @purchase_detail.book_id= id

            @book=Book.where(id: 3).first
            @cantidad=@book.stock-quantity
            @book.update_attributes(stock: @cantidad)
          @purchase_detail.cantidad= quantity
           if @purchase_detail.save
          end  
        end
        session[:cart]={}
        @cart={}
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:fecha, :pago, purchase_details_attributes: [:purchase_id, :cantidad])
    end
end
