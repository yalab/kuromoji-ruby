#!/usr/bin/env ruby
# coding: utf-8
require 'thor'
require 'yajl'

module Kuromoji
  class Commands < Thor

    map '-a' => :all_features
    map '-r' => :reading

    def initialize(args = [], options = {}, config = {})
      super(args, options, config)
    end

    desc "all_features", "echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -a"
    def all_features
      sentence = STDIN.read
      puts Yajl::Encoder.encode(Kuromoji.tokenize(sentence))
    end

    desc "reading", "echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -r "
    def reading
      sentence = STDIN.read
      puts Yajl::Encoder.encode(Kuromoji.reading(sentence))
    end

  end
end

