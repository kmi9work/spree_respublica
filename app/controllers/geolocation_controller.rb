class GeolocationController < ApplicationController
  def get
    user_latitude = params[:latitude].to_f
    user_longitude = params[:longitude].to_f
    min_distance = nil
    min_store_id = nil

    unless session[:current_store_id]
      Spree::Store.all.each do |store|
        next unless (store.latitude and store.longitude)
        d = distance(user_latitude, user_longitude, store.latitude, store.longitude)
        min_distance ||= d 
        min_store_id ||= store.id
        if d < min_distance
          min_distance = d
          min_store_id = store.id
        end
      end
    else
      min_store_id = session[:current_store_id]
    end

    respond_to do |format|
      format.js {render html: min_store_id}
    end
  end

  def set
    session[:current_store_id] = params[:id]
  end

  private

  def distance x0, y0, x1, y1
    Math.sqrt((x1-x0)**2 + (y1-y0)**2)
  end
end
