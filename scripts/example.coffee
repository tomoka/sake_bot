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
        # console.log err
        # console.log res
        # console.log body
        # if ! res.headers['content-type'].match /^application¥/json/
        #  msg.send "Didn't get back JSON :("
        #  return

        sakeData = null
        try
          sakeData = JSON.parse (sakeBody)
          sakeRandom = Math.floor(Math.random() * sakeData.sakes.length) + 1

          sakeItemKeyword = encodeURIComponent "日本酒　#{sakeData.sakes[sakeRandom].sake_name}"
          sakeMakerAddress = encodeURIComponent "#{arraySakePrefectureCode[sakeIndex]}"
          console.log sakeMakerAddress
          console.log sakeItemKeyword
          sakeItemUrl = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?format=json&keyword=" + sakeItemKeyword + "&maker_address=#{sakeMakerAddress}&imageFlag=1&applicationId=1058730448257396288"

          robot.http(sakeItemUrl)
            .header('Accept', 'application/json')
            .get() (itemErr, itemRes, itemBody) ->

              itemData = null
              try
                itemData = JSON.parse (itemBody)
                console.log sakeData.sakes[sakeRandom].sake_name
                if osusumeFlag is yes
                  msg.send message + "をランダムに紹介します！"
                else
                  msg.send message + "の日本酒をランダムに紹介します！"

                if ! sakeData.sakes[sakeRandom].maker_url is undefined or null
                  msg.send sakeData.sakes[sakeRandom].sake_name + "(#{sakeData.sakes[sakeRandom].sake_furigana})\n" + sakeData.sakes[sakeRandom].maker_name + "(#{sakeData.sakes[sakeRandom].maker_url})"
                else 
                  msg.send sakeData.sakes[sakeRandom].sake_name + "(#{sakeData.sakes[sakeRandom].sake_furigana})" + sakeData.sakes[sakeRandom].maker_name
                
                if ! itemData.Items[0] is undefined
                  msg.send sakeData.sakes[sakeRandom].url
                else 
                  msg.send itemData.Items[0].Item.mediumImageUrls[0].imageUrl

              catch err
                msg.send sakeData.sakes[sakeRandom].url
                # msg.send "Ran into an error parsing item JSON :("
                return
        catch error
          msg.send message
          # msg.send "Ran into an error parsing sake JSON :("
          return


  # @で呼びかけてhogeで反応
  # robot.respond /hoge/i, (msg) -> msg.send "fuga"

  # robot.hear /badger/i, (res) ->
  #   res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  #
  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
