class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false, length: { minimum: 5 }
      t.references :user, index: true, foreign_key: true, null: false
      t.references :article, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
