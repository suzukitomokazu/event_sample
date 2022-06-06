class BoardsController < ApplicationController
  def index
    #Boardの一覧画面では全ての掲示板情報を一覧表示したい
    @boards = Board.all
  end

  def new
    #Boardの新規作成画面ではBoardの空のインスタンスをviewに渡したい
    @board = Board.new
  end

  def show
    #Boardの詳細画面ではURLパラメーターから取得したBoardのインスタンスが必要
    @board = Board.find(params[:id])
  end

  def edit
    #Boardの編集画面ではURLパラメーターから取得したBoardのインスタンスが必要
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to @board, notice: '投稿が正常に作成されました。'
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: '投稿が正常に編集されました。'
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_url, notice: '投稿が正常に削除されました。'
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end

end