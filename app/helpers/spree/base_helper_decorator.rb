module Spree
  module BaseHelper
    def display_price(product_or_variant)
      if product_or_variant
        product_or_variant.
          price_in(current_currency).
          display_price_including_vat_for(current_price_options).
          to_html
      else
        "No product"
      end
    end
  end
end