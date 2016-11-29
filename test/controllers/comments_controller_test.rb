require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    sign_in User.first
    get new_comment_url, params: { comment: { user_id: @comment.user_id, meme_id: @comment.meme_id }}
    assert_response :success
  end

  test "should create comment" do
    sign_in User.first
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { meme_id: @comment.meme_id, message: @comment.message, parent_id: @comment.parent_id, user_id: @comment.user_id } }
    end

    assert_redirected_to meme_url(Comment.last.meme)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    sign_in User.first
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    sign_in User.first
    patch comment_url(@comment), params: { comment: { meme_id: @comment.meme_id, message: @comment.message, parent_id: @comment.parent_id, user_id: @comment.user_id } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    sign_in User.first
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
