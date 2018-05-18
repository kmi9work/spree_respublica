class AddFieldsToSpreeStores < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_stores, :latitude, :double
    add_column :spree_stores, :longitude, :double
    add_column :spree_stores, :address, :string
  end
end
