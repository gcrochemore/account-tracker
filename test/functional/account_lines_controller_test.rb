require 'test_helper'

class AccountLinesControllerTest < ActionController::TestCase
  setup do
    @account_line = account_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_line" do
    assert_difference('AccountLine.count') do
      post :create, account_line: { import: @account_line.import, import_line: @account_line.import_line }
    end

    assert_redirected_to account_line_path(assigns(:account_line))
  end

  test "should show account_line" do
    get :show, id: @account_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_line
    assert_response :success
  end

  test "should update account_line" do
    put :update, id: @account_line, account_line: { import: @account_line.import, import_line: @account_line.import_line }
    assert_redirected_to account_line_path(assigns(:account_line))
  end

  test "should destroy account_line" do
    assert_difference('AccountLine.count', -1) do
      delete :destroy, id: @account_line
    end

    assert_redirected_to account_lines_path
  end
end
