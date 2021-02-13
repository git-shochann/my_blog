class UsersController < ApplicationController

  ## 大前提にビューに何を持っていきたいかをまず第一に考える。 ## 今回の場合 = ①マイページに必要なのはユーザー情報 + ②そのユーザーが投稿した情報 ##

  def show
    @user = User.find(params[:id]) # ①リクエストに含まれているパラメーターのuserのidを元にuserテーブルを取得。
    @posts = @user.posts # ②アソシエーションでテーブル間が繋がっているので、userのpostsテーブルを取得。
  end

end