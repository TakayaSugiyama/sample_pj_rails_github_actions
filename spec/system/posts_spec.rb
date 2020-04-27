require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before { visit new_post_path }

  describe "create new post" do
    subject do
      fill_in "Title", with: "New Post"
      fill_in "Content", with: "New Post"
      click_on "Create Post"
    end

    context "正しく入力したとき" do
      it "Postの数は1つ増える" do
        expect{ subject }.to change { Post.count }.by(1)
      end
    end

    context "Postの作成に成功したとき" do
      it "詳細ページに飛んでフラッシュメッセージが表示される" do
        subject
        expect(page).to have_current_path post_path(Post.first)
        expect(page).to have_selector "#notice", text: "Post was successfully created."
      end
    end
  end
end