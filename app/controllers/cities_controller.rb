class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params[:city])
    if @city.save
      redirect_to :index
    else
      flash.now[:error] = I18n.t('cities.update.invalid')
      render :new
    end
  end

  def destroy
    flash[:error] = I18n.t('cities.destroy.error') unless City.find(params[:id]).destroy
  end
end
