class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :checkout_session_id
      t.string :status
      t.string :email
      t.string :error_message

      t.timestamps
    end
  end
end
