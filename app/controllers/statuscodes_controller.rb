class StatuscodesController < ApplicationController
  before_action :set_statuscode, only: [:show, :edit, :update, :destroy]

  # GET /statuscodes
  # GET /statuscodes.json
  def index
    @statuscodes = Statuscode.all
  end

  # GET /statuscodes/1
  # GET /statuscodes/1.json
  def show
  end

  # GET /statuscodes/new
  def new
    @statuscode = Statuscode.new
  end

  # GET /statuscodes/1/edit
  def edit
  end

  # POST /statuscodes
  # POST /statuscodes.json
  def create
    @statuscode = Statuscode.new(statuscode_params)

    respond_to do |format|
      if @statuscode.save
        format.html { redirect_to @statuscode, notice: 'Statuscodes was successfully created.' }
        format.json { render :show, statuscodes: :created, location: @statuscode }
      else
        format.html { render :new }
        format.json { render json: @statuscode.errors, statuscodes: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuscodes/1
  # PATCH/PUT /statuscodes/1.json
  def update
    respond_to do |format|
      if @statuscode.update(statuscode_params)
        format.html { redirect_to @statuscode, notice: 'Statuscodes was successfully updated.' }
        format.json { render :show, statuscodes: :ok, location: @statuscode }
      else
        format.html { render :edit }
        format.json { render json: @statuscode.errors, statuscodes: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuscodes/1
  # DELETE /statuscodes/1.json
  def destroy
    @statuscode.destroy
    respond_to do |format|
      format.html { redirect_to statuscodes_url, notice: 'Statuscodes was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statuscode
      @statuscode = Statuscode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statuscode_params
      params.require(:statuscode).permit(:name)
    end
end
