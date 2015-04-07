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

  sakeNum = "24"
  sakeUrl = "http://www.sakenote.com/api/v1/sakes?token=95f9b2288f8acd7eb2cf190af7cfbc223df5823c&prefecture_code=" + sakeNum

  # URLにアクセスしてデータを取得する
  # request sakeUrl, (err, response, body) ->
  #  if err  # プログラムエラー
  #     throw err
  #         return

  #     if response.statusCode is 200
  #       try
  #         json = JSON.parse body
  #       catch e
  #         callback new Error "JSON parse error"
  #         return
  #       # sake_name = json.sakes[json.sake_name.length-2]  # 直近の予報データ
  #       callback null, json

  # 文字列helloのみで反応

  robot.respond /(\S+)$/, (msg) ->
    message = msg.match[1]
    for value, index in arraySakePrefectureCode
        if arraySakePrefectureCode[index] is message
          sakeNum = index + 1
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
          console.log '-------------------------'
          console.log sakeData.sakes[29].maker_name
          console.log '-------------------------'

          sakeItemKeyword = encodeURIComponent sakeData.sakes[29].maker_name
          sakeItemUrl = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20140222?format=json&keyword=" + sakeItemKeyword + "&imageFlag=1&applicationId=1058730448257396288"

          robot.http(sakeItemUrl)
            .header('Accept', 'application/json')
            .get() (itemErr, itemRes, itemBody) ->

              itemData = null
              try
                itemData = JSON.parse (itemBody)
              catch error
                msg.send "Ran into an error parsing itemData JSON :("
                return
        catch error
          msg.send "Ran into an error parsing JSON :("
          return

        console.log '-------------------------'
        console.log sakeData.sakes.length
        console.log '-------------------------'
        console.log sakeData.sakes[29]
        console.log '-------------------------'
        console.log sakeData.sakes[29].maker_name
        msg.send '-------------------------'
        msg.send sakeData.sakes.length + "-------------------" + itemData.Items.length #lengthはindex
        msg.send sakeData.sakes[29].sake_name
        msg.send sakeData.sakes[29].maker_name + sakeData.sakes[29].maker_url
        msg.send itemData.Items[0].Item.imageUrl
        msg.send "商品画像検索結果" + itemData.Items[0].Item.imageUrl
        msg.send '-------------------------'

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
