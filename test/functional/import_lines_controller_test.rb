require 'test_helper'

class ImportLinesControllerTest < ActionController::TestCase
  setup do
    @import_line = import_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_line" do
    assert_difference('ImportLine.count') do
      post :create, import_line: {  }
    end

    assert_redirected_to import_line_path(assigns(:import_line))
  end

  test "should show import_line" do
    get :show, id: @import_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @import_line
    assert_response :success
  end

  test "should update import_line" do
    put :update, id: @import_line, import_line: {  }
    assert_redirected_to import_line_path(assigns(:import_line))
  end

  test "should destroy import_line" do
    assert_difference('ImportLine.count', -1) do
      delete :destroy, id: @import_line
    end

    assert_redirected_to import_lines_path
  end
end
