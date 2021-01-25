class FixUserCountryColumnName < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :users, :country, :country_code
  end
end
