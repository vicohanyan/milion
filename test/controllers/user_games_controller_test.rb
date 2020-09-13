require 'test_helper'

class UserGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_game = user_game(:one)
  end

  test "should get index" do
    get user_game_url
    assert_response :success
  end

  test "should get new" do
    get new_user_game_url
    assert_response :success
  end

  test "should create user_game" do
    assert_difference('UserGame.count') do
      post user_game_url, params: { user_game: {  } }
    end

    assert_redirected_to user_game_url(UserGame.last)
  end

  test "should show user_game" do
    get user_game_url(@user_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_game_url(@user_game)
    assert_response :success
  end

  test "should update user_game" do
    patch user_game_url(@user_game), params: { user_game: {  } }
    assert_redirected_to user_game_url(@user_game)
  end

  test "should destroy user_game" do
    assert_difference('UserGame.count', -1) do
      delete user_game_url(@user_game)
    end

    assert_redirected_to user_game_url
  end
end
