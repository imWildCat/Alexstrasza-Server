class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens, id: false do |t|

      t.primary_key :token, :string
      # t.string :token, null: false
      t.belongs_to :user, null: false
      t.string :device, null: false
      t.datetime :expires_at, null: false

      t.timestamps null: false
    end

    add_index :user_tokens, :user_id
    # add_index :user_tokens, :token, unique: true
  end
end
