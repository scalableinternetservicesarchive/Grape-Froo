require 'test_helper'
class MemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meme = memes(:one)
  end

  test "should get index" do
    get memes_url
    assert_response :success
  end

  test "should get new" do
    sign_in User.first
    get new_meme_url
    assert_response :success
  end

  # needs fixing
  # test "should create meme" do
  #   sign_in User.first
  #   assert_difference('Meme.count') do
  #     post memes_url, params: { meme: { bottom_caption: @meme.bottom_caption, template_id: @meme.template_id, top_caption: @meme.top_caption,  user_id: @meme.user_id } }
  #   end

  #   assert_redirected_to meme_url(Meme.last)
  # end

  test "should show meme" do
    get meme_url(@meme)
    assert_response :success
  end

end
