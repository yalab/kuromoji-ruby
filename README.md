# Kuromoji

A ruby wrapper for the Kuromoji Japanese morphological analyzer.

require JAVA

## Installation

Add this line to your application's Gemfile:

    gem 'kuromoji-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kuromoji-ruby

## Usage

You have to set JAVA_HOME

```
# .bashrc
# This is OSX example.
export JAVA_HOME=`/usr/libexec/java_home`
```

and to run.

```ruby
Kuromoji::Core.new.tokenize("あそこにいるのチャウチャウちゃうんちゃう")
#=> {"あそこ"=>"名詞,代名詞,一般,*,*,*,あそこ,アソコ,アソコ",
 "に"=>"助詞,格助詞,一般,*,*,*,に,ニ,ニ",
 "いる"=>"動詞,自立,*,*,一段,基本形,いる,イル,イル",
 "の"=>"助詞,連体化,*,*,*,*,の,ノ,ノ",
 "チャウチャウ"=>"名詞,一般,*,*,*,*,*",
 "ちゃう"=>"動詞,自立,*,*,五段・ワ行促音便,基本形,ちゃう,チャウ,チャウ",
 "ん"=>"名詞,非自立,一般,*,*,*,ん,ン,ン"}
 Kuromoji::Core.new.reading("吉田篤")
=> {"吉田"=>"ヨシダ", "篤"=>"アツシ"}
```

command line interface.

```bash
Commands:
  kuromoji all_features    # echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -a
  kuromoji help [COMMAND]  # Describe available commands or one specific command
  kuromoji reading         # echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -r
  kuromoji tokenize        # echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -t
```

## Example

output json format

```bash
$ echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -t | jq .

#[
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 0,
#    "surface_form": "関西国際空港",
#    "base_form": "関西国際空港",
#    "reading": "カンサイコクサイクウコウ",
#    "parts_of_speech": "名詞,固有名詞,組織,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 6,
#    "surface_form": "は",
#    "base_form": "は",
#    "reading": "ハ",
#    "parts_of_speech": "助詞,係助詞,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 7,
#    "surface_form": "、",
#    "base_form": "、",
#    "reading": "、",
#    "parts_of_speech": "記号,読点,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 8,
#    "surface_form": "大阪",
#    "base_form": "大阪",
#    "reading": "オオサカ",
#    "parts_of_speech": "名詞,固有名詞,地域,一般"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 10,
#    "surface_form": "府",
#    "base_form": "府",
#    "reading": "フ",
#    "parts_of_speech": "名詞,接尾,地域,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 11,
#    "surface_form": "大阪",
#    "base_form": "大阪",
#    "reading": "オオサカ",
#    "parts_of_speech": "名詞,固有名詞,地域,一般"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 13,
#    "surface_form": "市",
#    "base_form": "市",
#    "reading": "シ",
#    "parts_of_speech": "名詞,接尾,地域,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 14,
#    "surface_form": "の",
#    "base_form": "の",
#    "reading": "ノ",
#    "parts_of_speech": "助詞,連体化,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 15,
#    "surface_form": "南西",
#    "base_form": "南西",
#    "reading": "ナンセイ",
#    "parts_of_speech": "名詞,一般,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": false,
#    "position": 17,
#    "surface_form": "38",
#    "base_form": null,
#    "reading": null,
#    "parts_of_speech": "名詞,数,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": false,
#    "position": 19,
#    "surface_form": "km",
#    "base_form": null,
#    "reading": null,
#    "parts_of_speech": "名詞,一般,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 21,
#    "surface_form": "に",
#    "base_form": "に",
#    "reading": "ニ",
#    "parts_of_speech": "助詞,格助詞,一般,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 22,
#    "surface_form": "またがる",
#    "base_form": "またがる",
#    "reading": "マタガル",
#    "parts_of_speech": "動詞,自立,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 26,
#    "surface_form": "会社",
#    "base_form": "会社",
#    "reading": "カイシャ",
#    "parts_of_speech": "名詞,一般,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 28,
#    "surface_form": "管理",
#    "base_form": "管理",
#    "reading": "カンリ",
#    "parts_of_speech": "名詞,サ変接続,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 30,
#    "surface_form": "空港",
#    "base_form": "空港",
#    "reading": "クウコウ",
#    "parts_of_speech": "名詞,一般,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 32,
#    "surface_form": "で",
#    "base_form": "だ",
#    "reading": "デ",
#    "parts_of_speech": "助動詞,*,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": true,
#    "position": 33,
#    "surface_form": "ある",
#    "base_form": "ある",
#    "reading": "アル",
#    "parts_of_speech": "助動詞,*,*,*"
#  },
#  {
#    "is_user": false,
#    "is_known": false,
#    "position": 35,
#    "surface_form": "\n",
#    "base_form": null,
#    "reading": null,
#    "parts_of_speech": "記号,空白,*,*"
#  }
#]
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/kuromoji/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
