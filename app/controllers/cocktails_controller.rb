class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: "cocktail was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to root_path, notice: "cocktail was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path, notice: "cocktail was successfully destroyed."
  end

  private

    def cocktail_params
      params.require(:cocktail).permit(:name)
    end

end
