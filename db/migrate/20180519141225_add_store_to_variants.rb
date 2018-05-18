class AddStoreToVariants < ActiveRecord::Migration[5.1]
  def change
    add_reference :spree_variants, :store, foreign_key: true
  end
end
