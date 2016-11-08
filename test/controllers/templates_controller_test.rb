require 'test_helper'
class TemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @template = templates(:one)
  end

  test "should get index" do
    get templates_url
    assert_response :success
  end

  test "should get new" do
    sign_in User.first
    get new_template_url
    assert_response :success
  end

  test "should create template" do
    sign_in User.first
    assert_difference('Template.count') do
      post templates_url, params: { template: { name: @template.name + "_",
                                                url: "http://i.imgur.com/bCBt6ga.jpg" } }
    end

    assert_redirected_to template_url(Template.last)
  end

  test "should show template" do
    get template_url(@template)
    assert_response :success
  end

end
