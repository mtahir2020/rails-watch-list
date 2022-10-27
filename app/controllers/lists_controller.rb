
class ListsController < ApplicationController
  def index
    if params[:search]
      @search = params[:search]
      @lists = List.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @lists = List.all
    end
    @list = List.new
  end

  # def new
  #   @list = List.new
  # end

  def create
    # use strong params
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @reviews = Review.all
    @review = Review.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :image_url)
  end

end
