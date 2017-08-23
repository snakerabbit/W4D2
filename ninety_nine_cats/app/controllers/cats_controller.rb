class CatsController < ApplicationController

  def index
    @cats = Cat.all
    if @cats
      render :index
    else
      render json: Cat.errors.full_messages, status: 404
    end
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    unless @cat
      redirect_to cats_url
    else
      render :show
    end
  end

  def new
    @cat = Cat.new(name: "", birth_date: "", sex:"", color: "", description: "")
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save!
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    unless @cat
      redirect_to cats_url
    else
      @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :birth_date, :description)
  end
end
