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

## Contributing

1. Fork it ( http://github.com/<my-github-username>/kuromoji/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
