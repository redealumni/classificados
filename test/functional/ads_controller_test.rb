require 'test_helper'

class AdsControllerTest < ActionController::TestCase
  
  def setup
    @valid_attributes = {
        :title => "Title",
        :body => "Very alsk;d f;laksjd f;lkas dfjakls df;lasfd",
        :email => "teste@teste.com",
        :kind => "sell",
        :category_id => categories(:one).id
      }
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should destroy ad" do
    assert_difference('Ad.count', -1) do
      delete :destroy, :id => ads(:one).to_param
    end
  end
  
  test "should get edit" do
    get :edit, :id => ads(:one).to_param
    assert_response :success
  end
  
  test "should update ad" do
    put :update, :id => ads(:one).to_param, :ad => @valid_attributes
    assert_redirected_to root_path
  end
end
