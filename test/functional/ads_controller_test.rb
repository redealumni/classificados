require 'test_helper'

class AdsControllerTest < ActionController::TestCase
  
  def setup
    @valid_attributes = {
        :title => "Title#{rand(100000000)}",
        :body => "Very alsk;d f;laksjd f;lkas dfjakls df;lasfd fa;lksdj f;laksdj f;lkasd jf;lkj ;lkj ;",
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
  
  test "should create ad" do
    assert_difference('Ad.count', 1) do
      put :create, :ad => @valid_attributes
    end
    
  end

  test "should destroy ad if admin" do
    session[:admin_user] = true
    assert_difference('Ad.count', -1) do
      delete :destroy, :id => ads(:one).to_param
    end
  end
  
  test "shouldnt destroy ad if not admin" do
    assert_difference('Ad.count', 0) do
      delete :destroy, :id => ads(:one).to_param
    end
  end
  
  test "should get edit if admin" do
    session[:admin_user] = true
    get :edit, :id => ads(:one).to_param
    assert_response :success
  end
  
  test "should not get edit if admin" do
    session[:admin_user] = false
    get :edit, :id => ads(:one).to_param
    assert_response :redirect
  end
    
  test "should update ad if admin" do
    session[:admin_user] = true
    put :update, :id => ads(:one).to_param, :ad => @valid_attributes
    assert_equal @valid_attributes[:title], assigns["ad"].title
    assert assigns["ad"].valid?
    assert_equal ads(:one).id, assigns["ad"].id
    
  end
  
  test "should not update ad if admin" do
    session[:admin_user] = false
    assert_difference('Ad.count', 0) do
      put :update, :id => ads(:one).to_param, :ad => @valid_attributes
    end
  end
  

end
