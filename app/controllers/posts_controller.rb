class PostsController < ApplicationController

  def index
    # @posts = Post.all (N+1問題)
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  # リダイレクト先はshowアクションのviewファイルの為、showアクションのパスを選択。それぞれidが必要。
  # 31行目で削除すべきレコードを指定し、32行目で削除、33行目でトップページへリダイレクトするように設定

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  # createとupdateアクションの時に、user_idも一緒に保存したい。
  # 複数の投稿(posts)がある為、ユーザー(user)とアソシエーションを組んでいる。そのためにDBに保存するストロングパラメーター内で
  # idを取得したいので上記のような記述で、current_user.idをハッシュで書く。(mergeメソッド)

end