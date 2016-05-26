require 'test_helper'

class MedicalDevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_device = medical_devices(:one)
  end

  test "should get index" do
    get medical_devices_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_device_url
    assert_response :success
  end

  test "should create medical_device" do
    assert_difference('MedicalDevice.count') do
      post medical_devices_url, params: { medical_device: { brand: @medical_device.brand, category_id: @medical_device.category_id, manufacturer: @medical_device.manufacturer, name: @medical_device.name, specialty: @medical_device.specialty } }
    end

    assert_redirected_to medical_device_path(MedicalDevice.last)
  end

  test "should show medical_device" do
    get medical_device_url(@medical_device)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_device_url(@medical_device)
    assert_response :success
  end

  test "should update medical_device" do
    patch medical_device_url(@medical_device), params: { medical_device: { brand: @medical_device.brand, category_id: @medical_device.category_id, manufacturer: @medical_device.manufacturer, name: @medical_device.name, specialty: @medical_device.specialty } }
    assert_redirected_to medical_device_path(@medical_device)
  end

  test "should destroy medical_device" do
    assert_difference('MedicalDevice.count', -1) do
      delete medical_device_url(@medical_device)
    end

    assert_redirected_to medical_devices_path
  end
end
