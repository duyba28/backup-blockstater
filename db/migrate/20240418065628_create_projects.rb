class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :owner
      t.string :telegram
      t.string :email
      t.string :category
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end
