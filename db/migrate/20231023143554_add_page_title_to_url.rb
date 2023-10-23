class AddPageTitleToUrl < ActiveRecord::Migration[7.1]
  def change
    add_column :urls, :page_title, :string
  end
end
