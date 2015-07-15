class CreateWikiUniqueWords < ActiveRecord::Migration
  def change
    create_table :wiki_unique_words do |t|

      t.string :word, null: false, limit: 255

      # t.timestamps null: false
    end

    add_index :wiki_unique_words, :word, unique: true
  end
end
