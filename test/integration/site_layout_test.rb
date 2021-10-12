require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def verify_navbar_links(path, template)
    get path
    assert_template template
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test "root navbar links" do
    verify_navbar_links(root_path, 'static_pages/home')
  end

  test "about navbar links" do
    verify_navbar_links(about_path, 'static_pages/about')
  end

  test "contact navbar links" do
    verify_navbar_links(contact_path, 'static_pages/contact')
  end

  test "help navbar links" do
    verify_navbar_links(help_path, 'static_pages/help')
  end
end
