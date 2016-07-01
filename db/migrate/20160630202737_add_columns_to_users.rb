class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slack_id, :string
    add_column :users, :slack_data, :text
  end
end
