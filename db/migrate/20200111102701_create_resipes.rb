class CreateResipes < ActiveRecord::Migration[6.0]
  def change
    create_table :resipes do |t|
      t.string :title
      t.string :making_time
      t.string :serves
      t.string :ingredients
      t.string :cost

      t.timestamps
    end
  end
end
