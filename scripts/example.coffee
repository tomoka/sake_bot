# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  # 0 = 北海道。後は1づつたす。
  arraySakePrefectureCode = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
  arraySakePrefectureCode = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
  arraySakePrefectureCodeMin = ["北海","青森","岩手","宮城","秋田","山形","福島","茨城","栃木","群馬","埼玉","千葉","東京","神奈川","新潟","富山","石川","福井","山梨","長野","岐阜","静岡","愛知","三重","滋賀","京都","大阪","兵庫","奈良","和歌山","鳥取","島根","岡山","広島","山口","徳島","香川","愛媛","高知","福岡","佐賀","長崎","熊本","大分","宮崎","鹿児島","沖縄"]
  arraySakePrefectureCodeKana = ["ほっかいどう","あおもりけん","いわてけん","みやぎけん","あきたけん","やまがたけん","ふくしまけん","いばらぎけん","とちぎけん","ぐんまけん","さいたまけん","ちばけん","とうきょうと","かながわけん","にいがたけん","とやまけん","いしかわけん","ふくいけん","やまなしけん","ながのけん","ぎふけん","しずおかけん","あいちけん","みえけん","しがけん","きょうとふ","おおさかふ","ひょうご","ならけん","わかやまけん","とっとりけん","しまねけん","おかやまけん","ひろしまけん","やまぐちけん","とくしまけん","かがわけん","えひめけん","こうちけん","ふくおかけん","さがけん","ながさきけん","くまもとけん","おおいたけん","みやぎけん","かごしまけん","おきなわけん"]
  arraySakePrefectureCodeKanaMin = ["ほっかい","あおもり","いわて","みやぎ","あきた","やまがた","ふくしま","いばらぎ","とちぎ","ぐんま","さいたま","ちば","とうきょう","かながわ","にいがた","とやま","いしかわ","ふくい","やまなし","ながの","ぎふ","しずおか","あいち","みえ","しが","きょうと","おおさか","ひょう","なら","わかやま","とっとり","しまね","おかやま","ひろしま","やまぐち","とくしま","かがわ","えひめ","こうち","ふくおか","さが","ながさき","くまもと","おおいた","みやぎ","かごしま","おきなわ"]
  arraySakePrefectureCodeRoma = ["hokkaido","aomoriken","iwateken","miyagiken","akitaken","yamagataken","hukushimaken","ibaragiken","tochigiken","gunmaken","saitamaken","tibaken","tokyoto","kanagawaken","niigataken","toyamaken","ishikawaken","hukuiken","yamanashiken","naganoken","gihuken","shizuokaken","aichiken","mieken","shigaken","kyotohu","oosakahu","hyogoken","naraken","wakayamaken","tottoriken","shimaneken","okayamaken","hirosshimaken","yamaguchiken","tokushimaken","kagawaken","ehimeken","kouchiken","hukuokaken","sagaken","nagasakiken","kumamotoken","ooitaken","miyagiken","kagoshimaken","okinawaken"]
  arraySakePrefectureCodeRomaMin = ["hokkai","aomori","iwate","miyagi","akita","yamagata","hukushima","ibaragi","tochigi","gunma","saitama","tiba","tokyo","kanagawa","niigata","toyama","ishikawa","hukui","yamanashi","nagano","gihu","shizuoka","aichi","mie","shiga","kyoto","oosaka","hyogo","nara","wakayama","tottori","shimane","okayama","hirosshima","yamaguchi","tokushima","kagawa","ehime","kouchi","hukuoka","saga","nagasaki","kumamoto","ooita","miyagi","kagoshima","okinawa"]

  robot.respond /(\S+)$/, (msg) ->
    message = msg.match[1]
    for value, index in arraySakePrefectureCode
        if arraySakePrefectureCode[index] is message
          sakeNum = index + 1
          sakeIndex = index
        else if arraySakePrefectureCodeMin[index] is message
          sakeNum = index + 1
          sakeIndex = index
        else if "おすすめ" is message or "日本酒" is message
          sakeNum = Math.floor(Math.random() * 47) + 1
          osusumeFlag = true
          sakeIndex = index
    sakeUrl = "http://www.sakenote.com/api/v1/sakes?token=95f9b2288f8acd7eb2cf190af7cfbc223df5823c&prefecture_code=" + sakeNum
    robot.http(sakeUrl)
      .header('Accept', 'application/json')
      .get() (sakeErr, sakeRes, sakeBody) ->
        console.log sakeRes
        sakeData = null
        try
          sakeData = JSON.parse (sakeBody)
          sakeRandom = Math.floor(Math.random() * sakeData.sakes.length) + 1

          sakeItemKeyword = encodeURIComponent "日本酒　#{sakeData.sakes[sakeRandom].sake_name}"
          sakeMakerAddress = encodeURIComponent "#{arraySakePrefectureCode[sakeIndex]}"
          console.log sakeMakerAddress
          console.log sakeItemKeyword
          sakeItemUrl = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?format=json&keyword=" + sakeItemKeyword + "&maker_address=#{sakeMakerAddress}&imageFlag=1&genreId=100337&applicationId=1058730448257396288"

          robot.http(sakeItemUrl)
            .header('Accept', 'application/json')
            .get() (itemErr, itemRes, itemBody) ->

              itemData = null
              try
                itemData = JSON.parse (itemBody)
                console.log sakeData.sakes[sakeRandom].sake_name
                if osusumeFlag is yes
                  msg.send message + "をランダムに紹介します！\n"+ arraySakePrefectureCode[sakeIndex] + "のお酒"
                else
                  msg.send message + "の日本酒をランダムに紹介します！"

                if ! sakeData.sakes[sakeRandom].maker_url is undefined or null
                  msg.send sakeData.sakes[sakeRandom].sake_name + "(#{sakeData.sakes[sakeRandom].sake_furigana})\n" + sakeData.sakes[sakeRandom].maker_name + "(#{sakeData.sakes[sakeRandom].maker_url})"
                else 
                  msg.send sakeData.sakes[sakeRandom].sake_name + "(#{sakeData.sakes[sakeRandom].sake_furigana})\n" + sakeData.sakes[sakeRandom].maker_name
                
                if ! itemData.Items[0] is undefined
                  msg.send sakeData.sakes[sakeRandom].url
                else 
                  msg.send itemData.Items[0].Item.mediumImageUrls[0].imageUrl

              catch err
                msg.send sakeData.sakes[sakeRandom].url
                return
        catch error
          if ! message is "説明"
            msg.send message
          else
            msg.send "このボットは、都道府県名を投げかけると投げかけた都道府県の日本酒をランダムに紹介してくれます。\nまた、「日本酒」「おすすめ」で投げかけると日本全国の日本酒からランダムで１品紹介します。\n【注意】都道府県名は漢字で呼びかけてください。”道” ”県” ”府”　は付けなくても回答は戻ってきます。"
          return