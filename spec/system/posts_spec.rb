require 'rails_helper'

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post_title = Faker::Lorem.word
    @post_country = Faker::Number.within(range: 2..199)
    @post_content = Faker::Lorem.sentence
  end

  context '投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがある
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_post_path
      # フォームに情報を入力する
      fill_in 'post-title-text', with: @post_title
      find('#post-country-select').find('option[value="2"]').select_option
      fill_in 'post-content-text', with: @post_content
      # 送信するとPostモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)
      # トップページに遷移する
      visit root_path
      # トップページに先程投稿した内容の投稿が存在する
      expect(page).to have_content(@post_title)
    end
  end

  context '投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end
