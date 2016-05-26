require 'test_helper'

class DrugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drug = drugs(:one)
  end

  test "should get index" do
    get drugs_url
    assert_response :success
  end

  test "should get new" do
    get new_drug_url
    assert_response :success
  end

  test "should create drug" do
    assert_difference('Drug.count') do
      post drugs_url, params: { drug: { active_substance_name: @drug.active_substance_name, brand_name: @drug.brand_name, category_id: @drug.category_id, generic_name: @drug.generic_name, indication: @drug.indication, manufacturer: @drug.manufacturer, name: @drug.name, substance_name: @drug.substance_name } }
    end

    assert_redirected_to drug_path(Drug.last)
  end

  test "should show drug" do
    get drug_url(@drug)
    assert_response :success
  end

  test "should get edit" do
    get edit_drug_url(@drug)
    assert_response :success
  end

  test "should update drug" do
    patch drug_url(@drug), params: { drug: { active_substance_name: @drug.active_substance_name, brand_name: @drug.brand_name, category_id: @drug.category_id, generic_name: @drug.generic_name, indication: @drug.indication, manufacturer: @drug.manufacturer, name: @drug.name, substance_name: @drug.substance_name } }
    assert_redirected_to drug_path(@drug)
  end

  test "should destroy drug" do
    assert_difference('Drug.count', -1) do
      delete drug_url(@drug)
    end

    assert_redirected_to drugs_path
  end
end
