# -*- coding: utf-8 -*-
require File.expand_path('../test_helper', __FILE__)  

class KuromojiTest < Minitest::Test

  def setup
    @no_dictionary = Kuromoji::Core.new
    @use_dictionary = Kuromoji::Core.new(File.expand_path('../../sample/userdict.txt', __FILE__))
  end

  def test_reading
    readings = @no_dictionary.reading("吉田篤")
    assert_equal "ヨシダ", readings["吉田"]
    assert_equal "アツシ", readings["篤"]
  end

  def test_tokenize
    tokenized = @no_dictionary.tokenize("大阪府吹田市")
    assert_equal "名詞,接尾,地域,*,*,*,府,フ,フ", tokenized["府"]
  end

  def test_tokenize_with_hash_no_dictionary
    check = ["関西国際空港", "と", "朝", "青龍", "で", "テスト"]
    tokenized = @no_dictionary.tokenize_with_hash("関西国際空港と朝青龍でテスト")
    tokenized.each_with_index do |token, i|
      assert_equal token['surface_form'], check[i]
    end
  end

  def test_tokenize_with_hash_no_dictionary
    check = ["関西", "国際", "空港", "と", "朝青龍", "で", "テスト"]
    tokenized = @use_dictionary.tokenize_with_hash("関西国際空港と朝青龍でテスト")
    tokenized.each_with_index do |token, i|
      assert_equal token['surface_form'], check[i]
    end
  end

  def test_nil
    tokenized = @no_dictionary.tokenize_with_hash(nil)
    assert_equal tokenized, []

    tokenized = @no_dictionary.reading(nil)
    assert_equal tokenized, {}
  end

  def test_empty
    tokenized = @use_dictionary.tokenize_with_hash('')
    assert_equal tokenized, []

    tokenized = @no_dictionary.reading('')
    assert_equal tokenized, {}
  end
end
