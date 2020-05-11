class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location

      # crée une colonne qui va servir à stocker un integer, celui-ci sera la référence (l'id) de l'admin 
      t.references :admin, index: true

      t.timestamps
    end
  end
end
