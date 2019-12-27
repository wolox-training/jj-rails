class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.datetime :begin_date, null: false
      t.datetime :end_date, null: false
      t.timestamps
    end
  end
end
