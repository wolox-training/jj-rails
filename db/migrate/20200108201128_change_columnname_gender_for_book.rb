class ChangeColumnnameGenderForBook < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :gender, :genre
  end
end
