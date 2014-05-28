#!/usr/bin/env ruby
# coding: utf-8
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
  class Core

    def initialize(user_dictionary = nil)
      jar = File.expand_path('../../../vendor/kuromoji-0.7.7/lib/kuromoji-0.7.7.jar', __FILE__)
      Rjb.load(jar)
      if user_dictionary.nil?
        @tokenizer = Rjb.import('org.atilika.kuromoji.Tokenizer').builder.build
      else
        @tokenizer = Rjb.import('org.atilika.kuromoji.Tokenizer').builder.userDictionary(user_dictionary).build
      end
    end

    def tokenize(sentence)
      process(:all_features, sentence)
    end

    def reading(sentence)
      process(:getReading, sentence)
    end

    def tokenize_with_hash(sentence)
      result = []
      return result if sentence.nil?
      list = @tokenizer.tokenize(sentence)
      iterator = list.iterator
      while iterator.has_next
        item = iterator.next
        result << item.to_kuromoji_hash
      end
      result
    end

    def process(method, sentence)
      tokenized = {}
      return tokenized if sentence.nil?
      list = @tokenizer.tokenize(sentence)
      iterator = list.iterator
      while iterator.has_next
        item = iterator.next
        tokenized[item.surface_form] = item.send(method)
      end
      tokenized
    end
  end
end