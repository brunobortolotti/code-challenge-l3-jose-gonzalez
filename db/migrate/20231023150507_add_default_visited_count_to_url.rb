class AddDefaultVisitedCountToUrl < ActiveRecord::Migration[7.1]
  def change
    change_column :urls, :visited_count, :integer, default: 0
  end
end
