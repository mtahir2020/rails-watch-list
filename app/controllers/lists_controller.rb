
class ListsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:search]
      @search = params[:search]
      @lists = List.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @lists = List.all
      @markers = @lists.geocoded.map do |list|
        {
          lat: list.latitude,
          lng: list.longitude
        }
      end
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

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
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
    # no longer using :image_url now that we have cloudinary
    params.require(:list).permit(:name, :body, photos: [])
  end

end
