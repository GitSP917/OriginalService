class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :thre, foreign_key: true

      t.timestamps
    end
  end
end
