require "kuromoji/version"
require 'kuromoji/commands'
require 'rjb'

class Rjb::Rjb_JavaProxy
  def to_kuromoji_hash
    result = {}
    result['parts_of_speech'] = part_of_speech
    result['reading'] = getReading
    result['base_form'] = base_form
    result['surface_form'] = surface_form
    result['position'] = position
    result['is_known'] = isKnown
    result['is_user'] = isUser
    result
  end
end

module Kuromoji
  jar = File.expand_path("../../vendor/kuromoji-0.7.7/lib/kuromoji-0.7.7.jar", __FILE__)
  Rjb::load(jar)
  Tokenizer = Rjb::import('org.atilika.kuromoji.Tokenizer').builder.build

  def self.tokenize_with_hash(sentence)
    list = Tokenizer.tokenize(sentence)
    iterator = list.iterator
    result = []
    while iterator.has_next
      item = iterator.next
      result << item.to_kuromoji_hash
    end
    result
  end

  def self.tokenize(sentence)
    process(:all_features, sentence)
  end

  def self.reading(sentence)
    process(:getReading, sentence)
  end

  def self.process(method, sentence)
    list = Tokenizer.tokenize(sentence)
    iterator = list.iterator
    tokenized = {}
    while iterator.has_next
      item = iterator.next
      tokenized[item.surface_form] = item.send(method)
    end
    tokenized
  end
end
