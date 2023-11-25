# frozen_string_literal: true

class DeviseCreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      
      t.integer :shipping_address_form_id, null: false
      t.string :shipping_city, null: false
      t.string :shipping_street, null: false 
      t.string :shipping_building      
      t.string :shipping_phone, null: false
      t.string :shipping_postal_code, null: false
      t.references :buyer,  null: false, foreign_key:true
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    # add_index :shippings, :confirmation_token,   unique: true
    # add_index :shippings, :unlock_token,         unique: true
  end
end
