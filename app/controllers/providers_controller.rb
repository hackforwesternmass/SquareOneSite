class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  #SEARCH
  # GET /search
  def search
  
  end
  
  # GET /search_results
  def search_results 
  
   if params[:fromDate] != nil
        @fromDate = Date::strptime(params[:fromDate], "%m/%d/%Y")
        @fromDateStr = @fromDate.strftime("%m/%d/%y")
   else 
        @fromDate = Date.current
        @fromDateStr = Date.current.strftime("%m/%d/%y")
   end
   if params[:toDate] != nil
       @toDate = Date::strptime(params[:toDate], "%m/%d/%Y")
       @toDateStr = @toDate.strftime("%m/%d/%y")
   else
     @toDate = Date.current
     @toDateStr = Date.current.strftime("%m/%d/%y")
   end
   
  provider_id = params[:provider_id]
   if provider_id.present?
     @provider = Provider.find(provider_id)
     @results = [Provider.find(provider_id)]
   else # find all
     @results = Provider.order('lName').all
   end
  end
  
  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.order('lName').all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:fName, :middle, :lName, :addr1, :addr2, :city, :state, :zip, :phone, :email, :licenseCap, :sqOneCap, :licenseExpDate, :certLevel, :sqOneRepl)
    end
end
