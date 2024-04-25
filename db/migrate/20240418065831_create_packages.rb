class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
