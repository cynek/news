module ApplicationHelper
  def title
    @title || I18n.t('news.index.title')
  end
end
