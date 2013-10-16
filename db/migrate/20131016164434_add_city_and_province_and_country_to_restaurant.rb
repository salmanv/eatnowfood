class AddCityAndProvinceAndCountryToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :province, :string
    add_column :restaurants, :country, :string

  end
end
