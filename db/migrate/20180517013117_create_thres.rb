class CreateThres < ActiveRecord::Migration[5.0]
  def change
    create_table :thres do |t|
      t.string :title 
      t.references :user, foreign_key:{ to_table: :users }
      t.datetime :thretime
      
      t.timestamps
    end
  end
end
