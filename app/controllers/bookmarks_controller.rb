class BookmarksController < ApplicationController
  # def new
  #   @bookmark = Bookmark.new
  # #   # Find @list id as the path is for a specific list
  # #   @list = List.find(params[:list_id])
  # end

  def index
    @bookmarks = Bookmark.all
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # Need @list id as the path is for a specific list
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    end
    # if/else
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
