class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.binary :phone_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
