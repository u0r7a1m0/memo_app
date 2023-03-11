class MemosController < ApplicationController
  def index
    @memo = Memo.new
    @memos = Memo.all.order(created_at: "DESC")
    @genres = Genre.all
    # @genre = Genre.find([params[:id]])
  end
  
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
    # 投稿成功した場合
    flash[:notice]="作成完了しました！"
    redirect_to memos_path
    else
    # 投稿が失敗した場合
    @memos = Memo.all
    render :index
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
  end
  
  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
    # 更新に成功したときの処理
      flash[:notice]="更新完了しました！"
      redirect_to memo_path(@memo.id)
    else
      render :edit
    end
  end
  
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    #ログアウトさせる
    flash[:notice] = "メモの削除が完了いたしました。"
    redirect_to root_path
  end
  
  private
  def memo_params
    params.require(:memo).permit(:title, :body, :genre_id)
  end
end
