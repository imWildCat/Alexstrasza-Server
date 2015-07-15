class CreateUniqueWords < ActiveRecord::Migration
  def change
    create_table :unique_words do |t|

      t.string :word, null: false, limit: 255

      # t.timestamps null: false
    end

    add_index :unique_words, :word, unique: true
  end
end
