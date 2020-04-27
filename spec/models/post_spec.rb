require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "データ" do
    it("テストデータは有効"){ expect(build(:post)).to be_valid }
  end

  describe "CRUD機能" do
    describe "ポスト作成" do
      let(:post) { build(:post) }
      it { expect{post.save}.to change { Post.count }.by(1)}
    end

    describe "ポスト削除" do
      let!(:post) { create(:post) }
      it { expect{post.destroy}.to change { Post.count }.by(-1) }
    end

    describe "ポスト更新" do
      let(:post) { Post.new(title: "test", content: "test") }
      it "更新に成功する" do
        post.update(title: "updated")
        expect(post.title).to eq "updated"
      end
    end
  end
end
