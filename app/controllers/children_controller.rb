class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children or /provider/id/children
  # GET /children.json
  def index
    if params[:provider_id] != nil
      # for specific provider view
       @provider = Provider.find(params[:provider_id])
       @children = @provider.children.order('"lName"')
       @new_path = new_provider_child_path(@provider)
    else
         # for admin view, no specific provider, show all
       @children = Child.order('"lName"').all
       @new_path = new_child_path
    end
  end

  # borrowed from http://stackoverflow.com/questions/819263/get-persons-age-in-ruby
  def ageInYears(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
  helper_method :ageInYears
  
  def ageMonthRemainder(dob)
    now = Time.now.utc.to_date
    return (now.month - dob.month).abs
  end
  helper_method :ageMonthRemainder
  
  # GET /search
  def search
  
  end
  
  # GET /search_results
  def search_results 
   child_id = params[:child_id]
   if child_id.present?
       @results = [Child.find(child_id)]
       @child = Child.find(child_id)
   else # find all
       @results =  Child.all.order('"lName"')
   end
   
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
  end
  



# Added this new controller and route for recordAttendance, URL: providers/1/children/recordAttendance
# Can this really handle GET, POST, and PATCH?
def recordAttendance
   @provider = Provider.find(params[:provider_id])
   @children = @provider.children.order('"lName"')
   @date = params[:date] 
   @date = Date.parse("#{params[:date]['day']}-#{params[:date]['month']}-#{params[:date]['year']}") if params[:date]
   @date ||= Date.current
end

# GET providers/id/children/dailyAtendance
def dailyAttendance
   @provider = Provider.find(params[:provider_id])
   @children = @provider.children.order('"lName"')
   if params[:date] != nil
      @date = Date::strptime(params[:date],"%m/%d/%Y")
      @dateStr = @date.strftime("%m/%d/%y") 
   else 
        @date = Date.current
        @dateStr = Date.current.strftime("%m/%d/%y")
   end
end

  # GET /children/1
  # GET /children/1.json
  def show
  end

  # GET /children/new
  def new
    @provider = Provider.find(params[:provider_id]) if params[:provider_id]
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
    @provider = Provider.find(params[:provider_id])
 
  end

  # POST /children (after form is filled out)
  # POST /children.json
  def create
    if params[:provider_id]
       @provider = Provider.find(params[:provider_id]) 
       @child = @provider.children.create(child_params)
    else
       @child = Child.new(child_params)
    end
    
    respond_to do |format|
      if @child.save
        format.html { redirect_to :back, notice: 'Child was successfully created.' }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /children/1
  # PATCH/PUT /children/1.json
  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to :back, notice: 'Child was successfully updated.' }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Child was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:fName, :middle, :lName, :dob, :fundSrc, :trans, :startDate, :terminationDate, :provider_id)
    end
end
