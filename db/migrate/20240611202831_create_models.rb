class CreateModels < ActiveRecord::Migration[7.1]
  def change
    create_table :shoes do |t|
      t.string  :brand_name
      t.string  :color
      t.string  :category
      t.string  :model
      t.string :size
      t.integer :amount
      t.integer :price

      t.timestamps
    end

    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :shoe
      t.string     :status
      t.string     :state
      t.string     :city
      t.string     :zip_code
      t.string     :address

      t.timestamps
    end
  end
end
