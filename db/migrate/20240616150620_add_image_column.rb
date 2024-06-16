class AddImageColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :shoes, :images, :string, array: true, default: []
  end
end
