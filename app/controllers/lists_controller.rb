class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :edit]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'Your list was successfully created!' #do we want it to redirect to all lists or only the list we just created?
    else
      render :new
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
  end

  def destroy
    @list.destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
