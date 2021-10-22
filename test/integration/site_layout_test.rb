require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def verify_navbar_links(template)
    assert_template template
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test "non logged in users do not see users link" do
    get root_path
    assert_template('static_pages/home')
    assert_select "a[href=?]", users_path, count: 0
  end

  test "logged in users see users link" do
    user = users(:michael)
    log_in_as(user)
    get root_path
    assert_template('static_pages/home')
    assert_select "a[href=?]", users_path, count: 1
  end

  test "root navbar links" do
    get root_path
    verify_navbar_links('static_pages/home')
    assert_select "a[href=?]", signup_path
  end

  test "about navbar links" do
    get about_path
    verify_navbar_links('static_pages/about')
  end

  test "contact navbar links" do
    get contact_path
    verify_navbar_links('static_pages/contact')
  end

  test "help navbar links" do
    get help_path
    verify_navbar_links('static_pages/help')
  end

  test "signup navbar links" do
    get signup_path
    verify_navbar_links('users/new')
  end
end
