require 'test_helper'

class RecallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recall = recalls(:one)
  end

  test "should get index" do
    get recalls_url
    assert_response :success
  end

  test "should get new" do
    get new_recall_url
    assert_response :success
  end

  test "should create recall" do
    assert_difference('Recall.count') do
      post recalls_url, params: { recall: { consumer_contact: @recall.consumer_contact, country: @recall.country, date: @recall.date, description: @recall.description, hazards: @recall.hazards, injuries: @recall.injuries, last_publish_date: @recall.last_publish_date, number: @recall.number, number_of_units: @recall.number_of_units, recallable_id: @recall.recallable_id, recallable_type: @recall.recallable_type, remedies: @recall.remedies, retailers: @recall.retailers, title: @recall.title, url: @recall.url } }
    end

    assert_redirected_to recall_path(Recall.last)
  end

  test "should show recall" do
    get recall_url(@recall)
    assert_response :success
  end

  test "should get edit" do
    get edit_recall_url(@recall)
    assert_response :success
  end

  test "should update recall" do
    patch recall_url(@recall), params: { recall: { consumer_contact: @recall.consumer_contact, country: @recall.country, date: @recall.date, description: @recall.description, hazards: @recall.hazards, injuries: @recall.injuries, last_publish_date: @recall.last_publish_date, number: @recall.number, number_of_units: @recall.number_of_units, recallable_id: @recall.recallable_id, recallable_type: @recall.recallable_type, remedies: @recall.remedies, retailers: @recall.retailers, title: @recall.title, url: @recall.url } }
    assert_redirected_to recall_path(@recall)
  end

  test "should destroy recall" do
    assert_difference('Recall.count', -1) do
      delete recall_url(@recall)
    end

    assert_redirected_to recalls_path
  end
end
