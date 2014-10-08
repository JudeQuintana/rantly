class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :title
      t.string :body
      t.integer :user_id
    end
  end
end
