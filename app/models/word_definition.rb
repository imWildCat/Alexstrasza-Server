class WordDefinition < ActiveRecord::Base

  WORD_TYPE = {
      :noun => 1,
      :verb => 2,
      :linking_verb => 3,
      :auxiliary_verb => 4,
      :modal_verb => 5,
      :transitive_verb => 6,
      :intransitive_verb => 7,
      :adjective => 10,
      :adverb => 11,
      :preposition => 12,
      :conjunction => 13,
      :pronoun => 14,
      :interjection => 15,
      :article => 16,
      :number => 17,
      :abbreviation => 20,
      :prefix => 21,
      :suffix => 22,
      :phrase => 25,
  }

  belongs_to :word, class_name: 'UniqueWord', foreign_key: 'unique_word_id'

  enum word_type: WORD_TYPE

end
