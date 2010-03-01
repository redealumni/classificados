require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    session[:admin_user] = true
    @valid_attributes = {
        :name => "Title{#{rand(10000000)}}"
      }
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, :category => @valid_attributes
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, :id => categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => categories(:one).to_param
    assert_response :success
  end

  test "should update category" do
    put :update, :id => categories(:one).to_param, :category => @valid_attributes
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, :id => categories(:one).to_param
    end

    assert_redirected_to categories_path
  end
end
