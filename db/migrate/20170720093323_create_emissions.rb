class CreateEmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :emissions do |t|
      t.string :title
      t.string :link
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
