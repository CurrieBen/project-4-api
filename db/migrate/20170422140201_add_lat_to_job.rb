class AddLatToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :lat, :float
  end
end
