class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_stores
  def find_stores
  	@stores = Spree::Store.all
  end
end
