class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false, length: { minimum: 5 }
      t.text :body, null: false, length: { minimum: 5 }
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
