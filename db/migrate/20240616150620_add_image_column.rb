class AddImageColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :shoes, :image, :string
    add_column :shoes, :description, :string
  end
end
