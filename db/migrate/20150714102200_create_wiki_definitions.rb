class CreateWikiDefinitions < ActiveRecord::Migration
  def change
    create_table :wiki_definitions do |t|

      t.belongs_to :wiki_unique_word, null: false
      t.integer :word_type, null: false
      t.string :meaning, null: false
      t.string :example, null: true

      # t.timestamps null: false
    end

    add_index :wiki_definitions, :wiki_unique_word_id
  end
end
