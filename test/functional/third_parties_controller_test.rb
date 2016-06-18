require 'test_helper'

class ThirdPartiesControllerTest < ActionController::TestCase
  setup do
    @third_party = third_parties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:third_parties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create third_party" do
    assert_difference('ThirdParty.count') do
      post :create, third_party: { account: @third_party.account, account_line: @third_party.account_line, import: @third_party.import, import_line: @third_party.import_line }
    end

    assert_redirected_to third_party_path(assigns(:third_party))
  end

  test "should show third_party" do
    get :show, id: @third_party
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @third_party
    assert_response :success
  end

  test "should update third_party" do
    put :update, id: @third_party, third_party: { account: @third_party.account, account_line: @third_party.account_line, import: @third_party.import, import_line: @third_party.import_line }
    assert_redirected_to third_party_path(assigns(:third_party))
  end

  test "should destroy third_party" do
    assert_difference('ThirdParty.count', -1) do
      delete :destroy, id: @third_party
    end

    assert_redirected_to third_parties_path
  end
end
