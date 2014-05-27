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
      @sentence = STDIN.read
    end

    desc "hello NAME", "say hello to NAME"
    def all_features
      puts Yajl::Encoder.encode(Kuromoji.tokenize(@sentence))
    end

    desc "hello NAME", "say hello to NAME"
    def reading
      puts Yajl::Encoder.encode(Kuromoji.reading(@sentence))
    end

  end
end

