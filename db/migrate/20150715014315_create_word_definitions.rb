class CreateWordDefinitions < ActiveRecord::Migration
  def change
    create_table :word_definitions do |t|

      t.belongs_to :unique_word, null: false
      t.integer :word_type, null: false
      t.string :meaning, null: false
      t.string :example, null: true

      # t.timestamps null: false
    end

    add_index :word_definitions, :unique_word_id
  end
end
