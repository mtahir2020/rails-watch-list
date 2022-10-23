class BookmarksController < ApplicationController
  # def new
  #   @bookmark = Bookmark.new
  #   # Find @list id as the path is for a specific list
  #   @list = List.find(params[:list_id])
  # end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # Need @list id as the path is for a specific list
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    end
    # if/else
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
