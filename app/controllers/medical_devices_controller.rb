class MedicalDevicesController < ApplicationController
  before_action :set_medical_device, only: [:show, :edit, :update, :destroy]

  # GET /medical_devices
  # GET /medical_devices.json
  def index
    @medical_devices = MedicalDevice.all
  end

  # GET /medical_devices/1
  # GET /medical_devices/1.json
  def show
  end

  # GET /medical_devices/new
  def new
    @medical_device = MedicalDevice.new
  end

  # GET /medical_devices/1/edit
  def edit
  end

  # POST /medical_devices
  # POST /medical_devices.json
  def create
    @medical_device = MedicalDevice.new(medical_device_params)

    respond_to do |format|
      if @medical_device.save
        format.html { redirect_to @medical_device, notice: 'Medical device was successfully created.' }
        format.json { render :show, status: :created, location: @medical_device }
      else
        format.html { render :new }
        format.json { render json: @medical_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_devices/1
  # PATCH/PUT /medical_devices/1.json
  def update
    respond_to do |format|
      if @medical_device.update(medical_device_params)
        format.html { redirect_to @medical_device, notice: 'Medical device was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_device }
      else
        format.html { render :edit }
        format.json { render json: @medical_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_devices/1
  # DELETE /medical_devices/1.json
  def destroy
    @medical_device.destroy
    respond_to do |format|
      format.html { redirect_to medical_devices_url, notice: 'Medical device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_device
      @medical_device = MedicalDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_device_params
      params.require(:medical_device).permit(:name, :brand, :specialty, :manufacturer, :category_id)
    end
end
