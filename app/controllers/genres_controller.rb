class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
    # 投稿成功した場合
    flash[:notice]="作成完了しました！"
    redirect_to genres_path
    else
    # 投稿が失敗した場合
    @genres = Genre.all
    render :index
    end
  end
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    # 更新に成功したときの処理
      flash[:notice]="更新完了しました！"
      redirect_to genres_path
    else
      render :edit
    end
  end
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
