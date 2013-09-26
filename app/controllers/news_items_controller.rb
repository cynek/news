class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.all
  end

  def new
    @news_item = NewsItem.new
    @news_item.locations.build
  end

  def create
    @news_item = NewsItem.new(params[:news_item])
    if @news_item.save
      redirect_to news_items_url
    else
      flash.now[:error] = I18n.t('news_items.update.invalid')
      render :new
    end
  end

  def destroy
    flash[:error] = I18n.t('news_items.destroy.error') unless NewsItem.find(params[:id]).destroy
  end

end
