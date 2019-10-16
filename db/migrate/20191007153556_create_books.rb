class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :gender, null: false, default: "Thriller"
      t.string :author, null: false, default: "Stephen King"
      t.string :image, null: false, default: "No image"
      t.string :title, null: false, default: "Default Title"
      t.string :editor, null: false, default: "Default Editor"
      t.string :year, null: false, default: "9999"

      t.timestamps
    end
  end
end
