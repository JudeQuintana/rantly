class ChangeColumnBodyInRants < ActiveRecord::Migration
  def change
    change_column :rants, :body, :text
  end
end
