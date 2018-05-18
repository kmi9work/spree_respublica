Spree::Product.class_eval do
  def store_variant (store_id)
    variants.where(store_id: store_id).first
  end
end
