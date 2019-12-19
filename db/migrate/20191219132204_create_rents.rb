class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :begin, null: false
      t.datetime :end, null: false
      t.timestamps
    end
  end
end
