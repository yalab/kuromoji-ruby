#!/usr/bin/env ruby
# coding: utf-8
require 'thor'
require 'yajl'

module Kuromoji
  class Commands < Thor
    map '-a' => :all_features
    map '-r' => :reading
    map '-t' => :tokenize

    class_option :user_dictionary, type: :string, aliases: '-d', default: nil, desc: 'disp downcase'
    def initialize(args = [], options = {}, config = {})
      super(args, options, config)
      @global_options = config[:shell].base.options
      @core = Kuromoji::Core.new(@global_options[:user_dictionary])
    end

    desc 'tokenize', "echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -t"
    def tokenize
      sentence = STDIN.read
      puts Yajl::Encoder.encode(@core.tokenize_with_hash(sentence))
    end

    desc 'all_features', "echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -a"
    def all_features
      sentence = STDIN.read
      puts Yajl::Encoder.encode(@core.tokenize(sentence))
    end

    desc 'reading', "echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -r "
    def reading
      sentence = STDIN.read
      puts Yajl::Encoder.encode(@core.reading(sentence))
    end
  end
end


