class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :author, index: true, foreign_key: true
      t.string :title, null: false
      t.text :summary

      t.timestamps null: false
    end
  end
end
