class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    @book_comment = BookComment.new
    #redirect_back fallback_location: root_path
  end

  def destroy
    @bookcomment = BookComment.find(params[:id])
    @bookcomment.destroy
    @book = Book.find(params[:book_id])
    #redirect_back fallback_location: root_path
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
