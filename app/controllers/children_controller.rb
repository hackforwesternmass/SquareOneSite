class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  # GET /children.json
  def index
    @children = Child.order('lName').all
   # @providers = Providers.order('lName').all
  end

# Added this new controller and route showProviderChildren, URL: providers/1/children/showProviderChildren/
def showProviderChildren
   @provider = Provider.find(params[:provider_id])
   @children = @provider.children.order('lName')
   render :index
end

# Added this new controller and route for recordAttendance, URL: providers/1/children/recordAttendance
# Can this really handle GET, POST, and PATCH?
def recordAttendance
   @provider = Provider.find(params[:provider_id])
   @children = @provider.children.order('lName')
end

  # GET /children/1
  # GET /children/1.json
  def show
  end

  # GET /children/new
  def new
    @provider = Provider.find(params[:provider_id])
    @child = Child.new
   # @child.provider_id = @provider
 
  end

  # GET /children/1/edit
  def edit
    @provider = Provider.find(params[:provider_id])
 
  end

  # POST /children
  # POST /children.json
  def create
    @provider = Provider.find(params[:provider_id])
    @child = @provider.children.create(child_params)
   # @child = Child.new(child_params)

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
      params.require(:child).permit(:fName, :middle, :lName, :dob, :fundSrc, :trans, :startDate, :provider_id)
    end
end
