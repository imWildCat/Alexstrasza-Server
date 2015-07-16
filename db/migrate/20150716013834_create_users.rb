class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :nickname, null: false, limit: 15
      t.string :email, null: true, limit: 255
      t.string :phone, null: true, limit: 63
      t.string :password_digest

      # Failed Attempts
      t.integer :failed_attempts, default: 0, null: false
      t.string :unlock_token
      t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :nickname, unique: true
    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
  end
end
