class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :name
      t.string :meaning
      t.string :example
      t.timestamps
    end
  end
end
