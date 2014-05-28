# Kuromoji

A ruby wrapper for the Kuromoji Japanese morphological analyzer.

## Installation

Add this line to your application's Gemfile:

    gem 'kuromoji'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kuromoji

## Usage

You have to set JAVA_HOME

```
# .bashrc
# This is OSX example.
export JAVA_HOME=`/usr/libexec/java_home`
```

and to run.

```ruby
Kuromoji.tokenize("あそこにいるのチャウチャウちゃうんちゃう")
#=> {"あそこ"=>"名詞,代名詞,一般,*,*,*,あそこ,アソコ,アソコ",
 "に"=>"助詞,格助詞,一般,*,*,*,に,ニ,ニ",
 "いる"=>"動詞,自立,*,*,一段,基本形,いる,イル,イル",
 "の"=>"助詞,連体化,*,*,*,*,の,ノ,ノ",
 "チャウチャウ"=>"名詞,一般,*,*,*,*,*",
 "ちゃう"=>"動詞,自立,*,*,五段・ワ行促音便,基本形,ちゃう,チャウ,チャウ",
 "ん"=>"名詞,非自立,一般,*,*,*,ん,ン,ン"}
 Kuromoji.reading("吉田篤")
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

output json format

```bash
echo '関西国際空港は、大阪府大阪市の南西38kmにまたがる会社管理空港である' | kuromoji -t

[{"parts_of_speech":"名詞,固有名詞,組織,*","reading":"カンサイコクサイクウコウ","base_form":"関西国際空港","surface_form":"関西国際空港","position":0,"is_known":true,"is_user":false},{"parts_of_speech":"助詞,係助詞,*,*","reading":"ハ","base_form":"は","surface_form":"は","position":6,"is_known":true,"is_user":false},{"parts_of_speech":"記号,読点,*,*","reading":"、","base_form":"、","surface_form":"、","position":7,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,固有名詞,地域,一般","reading":"オオサカ","base_form":"大阪","surface_form":"大阪","position":8,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,接尾,地域,*","reading":"フ","base_form":"府","surface_form":"府","position":10,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,固有名詞,地域,一般","reading":"オオサカ","base_form":"大阪","surface_form":"大阪","position":11,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,接尾,地域,*","reading":"シ","base_form":"市","surface_form":"市","position":13,"is_known":true,"is_user":false},{"parts_of_speech":"助詞,連体化,*,*","reading":"ノ","base_form":"の","surface_form":"の","position":14,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,一般,*,*","reading":"ナンセイ","base_form":"南西","surface_form":"南西","position":15,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,数,*,*","reading":null,"base_form":null,"surface_form":"38","position":17,"is_known":false,"is_user":false},{"parts_of_speech":"名詞,一般,*,*","reading":null,"base_form":null,"surface_form":"km","position":19,"is_known":false,"is_user":false},{"parts_of_speech":"助詞,格助詞,一般,*","reading":"ニ","base_form":"に","surface_form":"に","position":21,"is_known":true,"is_user":false},{"parts_of_speech":"動詞,自立,*,*","reading":"マタガル","base_form":"またがる","surface_form":"またがる","position":22,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,一般,*,*","reading":"カイシャ","base_form":"会社","surface_form":"会社","position":26,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,サ変接続,*,*","reading":"カンリ","base_form":"管理","surface_form":"管理","position":28,"is_known":true,"is_user":false},{"parts_of_speech":"名詞,一般,*,*","reading":"クウコウ","base_form":"空港","surface_form":"空港","position":30,"is_known":true,"is_user":false},{"parts_of_speech":"助動詞,*,*,*","reading":"デ","base_form":"だ","surface_form":"で","position":32,"is_known":true,"is_user":false},{"parts_of_speech":"助動詞,*,*,*","reading":"アル","base_form":"ある","surface_form":"ある","position":33,"is_known":true,"is_user":false},{"parts_of_speech":"記号,空白,*,*","reading":null,"base_form":null,"surface_form":"\n","position":35,"is_known":false,"is_user":false}]
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/kuromoji/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
