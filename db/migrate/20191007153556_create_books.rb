class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :gender, null: false, default: ""
      t.string :author, null: false, default: ""
      t.string :image, null: false, default: ""
      t.string :title, null: false, default: ""
      t.string :editor, null: false, default: ""
      t.string :year, null: false, default: ""

      t.timestamps
    end
  end
end
