class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :user
      t.text :body
      t.string :url

      t.timestamps null: false
    end
  end
end
