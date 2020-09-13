require "application_system_test_case"

class UserGamesTest < ApplicationSystemTestCase
  setup do
    @user_game = user_game(:one)
  end

  test "visiting the index" do
    visit user_game_url
    assert_selector "h1", text: "User Games"
  end

  test "creating a User game" do
    visit user_game_url
    click_on "New User Game"

    click_on "Create User game"

    assert_text "User game was successfully created"
    click_on "Back"
  end

  test "updating a User game" do
    visit user_game_url
    click_on "Edit", match: :first

    click_on "Update User game"

    assert_text "User game was successfully updated"
    click_on "Back"
  end

  test "destroying a User game" do
    visit user_game_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User game was successfully destroyed"
  end
end
