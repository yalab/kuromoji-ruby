# -*- coding: utf-8 -*-
require 'test_helper'

class KuromojiTest < Minitest::Test
  def test_reading
    readings = Kuromoji.reading("吉田篤")
    assert_equal "ヨシダ", readings["吉田"]
    assert_equal "アツシ", readings["篤"]
  end

  def test_tokenize
    tokenized = Kuromoji.tokenize("大阪府吹田市")
    assert_equal "名詞,接尾,地域,*,*,*,府,フ,フ", tokenized["府"]
  end
end
