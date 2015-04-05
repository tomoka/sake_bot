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
          sakeNum = index
    sakeUrl = "http://www.sakenote.com/api/v1/sakes?token=95f9b2288f8acd7eb2cf190af7cfbc223df5823c&prefecture_code=" + sakeNum

    robot.http(sakeUrl)
      .header('Accept', 'application/json')
      .get() (sakes,num_pages) ->
        if response.getHeader('Content-Type') isnt 'application/json'
          msg.send "Didn't get back JSON :("
          return

      data = null
      try
        # data = JSON.parse (sakes)
        data = JSON.stringify({"sakes":[{"sake_identify_code":"P000173","sake_name":"一喜","sake_furigana":"いっき","sake_alphabet":"ikki","maker_id":6320,"maker_name":"飯沼本家","maker_postcode":"701-1462","maker_address":"千葉県印旛郡酒々井町馬橋106","maker_url":"http://www.iinumahonke.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%A3%AF%E6%B2%BC%E6%9C%AC%E5%AE%B6/%E4%B8%80%E5%96%9C","discontinued":false},{"sake_identify_code":"P002001","sake_name":"不動","sake_furigana":"ふどう","sake_alphabet":"fudou","maker_id":6231,"maker_name":"鍋店","maker_postcode":"670-0972 ","maker_address":"千葉県成田市本町３３８番地","maker_url":"http://www.nabedana.co.jp/index.html","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%8D%8B%E5%BA%97/%E4%B8%8D%E5%8B%95","discontinued":false},{"sake_identify_code":"P001999","sake_name":"二人静","sake_furigana":"ふたりしずか","sake_alphabet":"futarishizuka","maker_id":6183,"maker_name":"東薫酒造","maker_postcode":"287-0003 ","maker_address":"千葉県香取市佐原イ６２７","maker_url":"http://www.tokun.co.jp/frame.htm","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9D%B1%E8%96%AB%E9%85%92%E9%80%A0/%E4%BA%8C%E4%BA%BA%E9%9D%99","discontinued":false},{"sake_identify_code":"P000897","sake_name":"五人娘","sake_furigana":"ごにんむすめ","sake_alphabet":"goninmusume","maker_id":5572,"maker_name":"寺田本家","maker_postcode":"289-0221","maker_address":"千葉県香取郡神崎町神崎本宿1964","maker_url":"http://www.teradahonke.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AF%BA%E7%94%B0%E6%9C%AC%E5%AE%B6/%E4%BA%94%E4%BA%BA%E5%A8%98","discontinued":false},{"sake_identify_code":"P001153","sake_name":"仁勇","sake_furigana":"じんゆう","sake_alphabet":"jinyuu","maker_id":6231,"maker_name":"鍋店","maker_postcode":"670-0972 ","maker_address":"千葉県成田市本町３３８番地","maker_url":"http://www.nabedana.co.jp/index.html","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%8D%8B%E5%BA%97/%E4%BB%81%E5%8B%87","discontinued":false},{"sake_identify_code":"P000940","sake_name":"佐倉城","sake_furigana":"さくらじょう","sake_alphabet":"sakurajou","maker_id":5010,"maker_name":"旭鶴","maker_postcode":"285-0804","maker_address":"千葉県佐倉市馬渡918","maker_url":"http://www.asahiduru.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%97%AD%E9%B6%B4/%E4%BD%90%E5%80%89%E5%9F%8E","discontinued":false},{"sake_identify_code":"P002331","sake_name":"八千代桜","sake_furigana":"やちよさくら","sake_alphabet":"yachiyosakura","maker_id":6231,"maker_name":"鍋店","maker_postcode":"670-0972 ","maker_address":"千葉県成田市本町３３８番地","maker_url":"http://www.nabedana.co.jp/index.html","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%8D%8B%E5%BA%97/%E5%85%AB%E5%8D%83%E4%BB%A3%E6%A1%9C","discontinued":false},{"sake_identify_code":"P000426","sake_name":"勝鹿","sake_furigana":"かつしか","sake_alphabet":"katsushika","maker_id":5342,"maker_name":"窪田酒造","maker_postcode":"278-0022","maker_address":"千葉県野田市山崎６８５","maker_url":"http://www.chuokai-chiba.or.jp/sake/kura/kura41.html","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E7%AA%AA%E7%94%B0%E9%85%92%E9%80%A0/%E5%8B%9D%E9%B9%BF","discontinued":false},{"sake_identify_code":"P001484","sake_name":"千代娘","sake_furigana":"ちよむすめ","sake_alphabet":"chiyomusume","maker_id":5286,"maker_name":"宮崎酒造","maker_postcode":"292-0441","maker_address":"千葉県君津市戸崎１７８０","maker_url":"http://www.chuokai-chiba.or.jp/sake/kura/kura4.html","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AE%AE%E5%B4%8E%E9%85%92%E9%80%A0/%E5%8D%83%E4%BB%A3%E5%A8%98","discontinued":false},{"sake_identify_code":"P000817","sake_name":"古今","sake_furigana":"こきん","sake_alphabet":"kokin","maker_id":6512,"maker_name":"木戸泉酒造","maker_postcode":"629-3442","maker_address":"千葉県いすみ市大原7635-1","maker_url":"http://kidoizumi.jpn.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9C%A8%E6%88%B8%E6%B3%89%E9%85%92%E9%80%A0/%E5%8F%A4%E4%BB%8A","discontinued":false},{"sake_identify_code":"P000573","sake_name":"吉寿","sake_furigana":"きちじゅ","sake_alphabet":"kichiju","maker_id":5257,"maker_name":"吉崎酒造","maker_postcode":"292-0421","maker_address":"千葉県君津市久留里市場102","maker_url":"http://kichiju-gekka.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%90%89%E5%B4%8E%E9%85%92%E9%80%A0/%E5%90%89%E5%AF%BF","discontinued":false},{"sake_identify_code":"P000310","sake_name":"大多喜城","sake_furigana":"おおたきじょう","sake_alphabet":"ootakijou","maker_id":6447,"maker_name":"豊乃鶴酒造","maker_postcode":"394-0028","maker_address":"千葉県夷隅郡大多喜町新丁88","maker_url":null,"url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E8%B1%8A%E4%B9%83%E9%B6%B4%E9%85%92%E9%80%A0/%E5%A4%A7%E5%A4%9A%E5%96%9C%E5%9F%8E","discontinued":false},{"sake_identify_code":"P000317","sake_name":"大姫","sake_furigana":"おおひめ","sake_alphabet":"oohime","maker_id":6324,"maker_name":"飯田本家","maker_postcode":"849-1321","maker_address":"千葉県香取市小見川178","maker_url":null,"url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%A3%AF%E7%94%B0%E6%9C%AC%E5%AE%B6/%E5%A4%A7%E5%A7%AB","discontinued":false},{"sake_identify_code":"P000109","sake_name":"天乃原","sake_furigana":"あまのはら","sake_alphabet":"amanohara","maker_id":6648,"maker_name":"須藤本家","maker_postcode":"292-0454","maker_address":"千葉県君津市青柳16-10","maker_url":"http://www.kanko.chuo.chiba.jp/kanko/3465/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%A0%88%E8%97%A4%E6%9C%AC%E5%AE%B6/%E5%A4%A9%E4%B9%83%E5%8E%9F","discontinued":false},{"sake_identify_code":"P001553","sake_name":"天然酒","sake_furigana":"てんねん","sake_alphabet":"tennen","maker_id":5572,"maker_name":"寺田本家","maker_postcode":"289-0221","maker_address":"千葉県香取郡神崎町神崎本宿1964","maker_url":"http://www.teradahonke.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AF%BA%E7%94%B0%E6%9C%AC%E5%AE%B6/%E5%A4%A9%E7%84%B6%E9%85%92","discontinued":false},{"sake_identify_code":"P001987","sake_name":"富士乃友","sake_furigana":"ふじのとも","sake_alphabet":"fujinotomo","maker_id":5288,"maker_name":"宮崎本家","maker_postcode":null,"maker_address":"千葉県匝瑳郡野栄町野手1699","maker_url":"http://www.miyazaki-honke.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AE%AE%E5%B4%8E%E6%9C%AC%E5%AE%B6/%E5%AF%8C%E5%A3%AB%E4%B9%83%E5%8F%8B","discontinued":false},{"sake_identify_code":"P000486","sake_name":"寒菊","sake_furigana":"かんぎく","sake_alphabet":"kangiku","maker_id":5192,"maker_name":"寒菊銘醸","maker_postcode":"289-1532","maker_address":"千葉県山武市松尾町武野里11","maker_url":"http://www.kankiku.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AF%92%E8%8F%8A%E9%8A%98%E9%86%B8/%E5%AF%92%E8%8F%8A","discontinued":false},{"sake_identify_code":"P001081","sake_name":"寿萬亀","sake_furigana":"じゅまんがめ","sake_alphabet":"jumangame","maker_id":5232,"maker_name":"亀田酒造","maker_postcode":"296-0111","maker_address":"千葉県鴨川市仲329","maker_url":"http://www.awa.or.jp/home/kameda/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E4%BA%80%E7%94%B0%E9%85%92%E9%80%A0/%E5%AF%BF%E8%90%AC%E4%BA%80","discontinued":false},{"sake_identify_code":"P000217","sake_name":"岩の井","sake_furigana":"いわのい","sake_alphabet":"iwanoi","maker_id":5217,"maker_name":"岩瀬酒造","maker_postcode":"299-5102","maker_address":"千葉県夷隅郡御宿町久保1916","maker_url":"http://iwanoi.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%B2%A9%E7%80%AC%E9%85%92%E9%80%A0/%E5%B2%A9%E3%81%AE%E4%BA%95","discontinued":false},{"sake_identify_code":"P002202","sake_name":"峯の精","sake_furigana":"みねのせい","sake_alphabet":"minenosei","maker_id":5287,"maker_name":"宮崎酒造店","maker_postcode":"292-0441","maker_address":"千葉県君津市戸崎1780","maker_url":"http://www.chokusou1ban.com/minenosei/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AE%AE%E5%B4%8E%E9%85%92%E9%80%A0%E5%BA%97/%E5%B3%AF%E3%81%AE%E7%B2%BE","discontinued":false},{"sake_identify_code":"P001606","sake_name":"徳明","sake_furigana":"とくめい","sake_alphabet":"tokumei","maker_id":6323,"maker_name":"飯田酒造場","maker_postcode":"322-0604","maker_address":"千葉県銚子市清川町２丁目１−２?","maker_url":null,"url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%A3%AF%E7%94%B0%E9%85%92%E9%80%A0%E5%A0%B4/%E5%BE%B3%E6%98%8E","discontinued":false},{"sake_identify_code":"P000059","sake_name":"旭鶴","sake_furigana":"あさひづる","sake_alphabet":"asahizuru","maker_id":5010,"maker_name":"旭鶴","maker_postcode":"285-0804","maker_address":"千葉県佐倉市馬渡918","maker_url":"http://www.asahiduru.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%97%AD%E9%B6%B4/%E6%97%AD%E9%B6%B4","discontinued":false},{"sake_identify_code":"P000042","sake_name":"朝市娘","sake_furigana":"あさいちむすめ","sake_alphabet":"asaichimusume","maker_id":6187,"maker_name":"東灘醸造","maker_postcode":"299-5226","maker_address":"千葉県勝浦市串浜1033","maker_url":"http://azumanada.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9D%B1%E7%81%98%E9%86%B8%E9%80%A0/%E6%9C%9D%E5%B8%82%E5%A8%98","discontinued":false},{"sake_identify_code":"P000578","sake_name":"木戸泉","sake_furigana":"きどいずみ","sake_alphabet":"kidoizumi","maker_id":6512,"maker_name":"木戸泉酒造","maker_postcode":"629-3442","maker_address":"千葉県いすみ市大原7635-1","maker_url":"http://kidoizumi.jpn.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9C%A8%E6%88%B8%E6%B3%89%E9%85%92%E9%80%A0/%E6%9C%A8%E6%88%B8%E6%B3%89","discontinued":false},{"sake_identify_code":"P000087","sake_name":"東姫","sake_furigana":"あずまひめ","sake_alphabet":"azumahime","maker_id":6194,"maker_name":"東條酒造","maker_postcode":"289-1327","maker_address":"千葉県山武市姫島1010","maker_url":"http://www.chiba-sake.jp/kujukuri/toujou/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9D%B1%E6%A2%9D%E9%85%92%E9%80%A0/%E6%9D%B1%E5%A7%AB","discontinued":false},{"sake_identify_code":"P000084","sake_name":"東灘","sake_furigana":"あずまなだ","sake_alphabet":"azumanada","maker_id":6187,"maker_name":"東灘醸造","maker_postcode":"299-5226","maker_address":"千葉県勝浦市串浜1033","maker_url":"http://azumanada.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9D%B1%E7%81%98%E9%86%B8%E9%80%A0/%E6%9D%B1%E7%81%98","discontinued":false},{"sake_identify_code":"P001578","sake_name":"東薫","sake_furigana":"とうくん","sake_alphabet":"toukun","maker_id":6183,"maker_name":"東薫酒造","maker_postcode":"287-0003 ","maker_address":"千葉県香取市佐原イ６２７","maker_url":"http://www.tokun.co.jp/frame.htm","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9D%B1%E8%96%AB%E9%85%92%E9%80%A0/%E6%9D%B1%E8%96%AB","discontinued":false},{"sake_identify_code":"P001571","sake_name":"東魁","sake_furigana":"とうかい","sake_alphabet":"toukai","maker_id":5669,"maker_name":"小泉酒造","maker_postcode":"299-1753　","maker_address":"千葉県富津市上後423-1","maker_url":"http://www.sommelier.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%B0%8F%E6%B3%89%E9%85%92%E9%80%A0/%E6%9D%B1%E9%AD%81","discontinued":false},{"sake_identify_code":"P001572","sake_name":"東魁盛","sake_furigana":"とうかいざかり","sake_alphabet":"toukaizakari","maker_id":5669,"maker_name":"小泉酒造","maker_postcode":"299-1753　","maker_address":"千葉県富津市上後423-1","maker_url":"http://www.sommelier.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%B0%8F%E6%B3%89%E9%85%92%E9%80%A0/%E6%9D%B1%E9%AD%81%E7%9B%9B","discontinued":false},{"sake_identify_code":"P000236","sake_name":"梅一輪","sake_furigana":"うめいちりん","sake_alphabet":"umeichirin","maker_id":6257,"maker_name":"梅一輪酒造","maker_postcode":"287‐0003","maker_address":"千葉県山武市松ヶ谷イ2902","maker_url":"http://www.umeichirin.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%A2%85%E4%B8%80%E8%BC%AA%E9%85%92%E9%80%A0/%E6%A2%85%E4%B8%80%E8%BC%AA","discontinued":false},{"sake_identify_code":"P001383","sake_name":"楽實","sake_furigana":"たのしみ","sake_alphabet":"tanoshimi","maker_id":6254,"maker_name":"馬場酒造本店","maker_postcode":"731-4215","maker_address":"千葉県香取市佐原イ614‐1","maker_url":"http://www.babahonten.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%A6%AC%E5%A0%B4%E9%85%92%E9%80%A0%E6%9C%AC%E5%BA%97/%E6%A5%BD%E5%AF%A6","discontinued":false},{"sake_identify_code":"P001664","sake_name":"浪花盛","sake_furigana":"なにわざかり","sake_alphabet":"naniwazakari","maker_id":5601,"maker_name":"守屋酒造","maker_postcode":"289-1806","maker_address":"千葉県山武市蓮沼ハ2929","maker_url":"http://maizakura.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AE%88%E5%B1%8B%E9%85%92%E9%80%A0/%E6%B5%AA%E8%8A%B1%E7%9B%9B","discontinued":false},{"sake_identify_code":"P002526","sake_name":"１７８７ ～炎","sake_furigana":"いなはな ほむら","sake_alphabet":"inahana homura","maker_id":5056,"maker_name":"稲花酒造","maker_postcode":"299-4303","maker_address":"千葉県一宮町東浪見5841","maker_url":"http://www.inahana-syuzou.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E7%A8%B2%E8%8A%B1%E9%85%92%E9%80%A0/%EF%BC%91%EF%BC%97%EF%BC%98%EF%BC%97%20%EF%BD%9E%E7%82%8E","discontinued":false},{"sake_identify_code":"P000581","sake_name":"甲子正宗","sake_furigana":"きのえねまさむね","sake_alphabet":"kinoenemasamune","maker_id":6320,"maker_name":"飯沼本家","maker_postcode":"701-1462","maker_address":"千葉県印旛郡酒々井町馬橋106","maker_url":"http://www.iinumahonke.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%A3%AF%E6%B2%BC%E6%9C%AC%E5%AE%B6/%E7%94%B2%E5%AD%90%E6%AD%A3%E5%AE%97","discontinued":false},{"sake_identify_code":"P001747","sake_name":"白堤","sake_furigana":"はくてい","sake_alphabet":"hakutei","maker_id":5286,"maker_name":"宮崎酒造","maker_postcode":"292-0441","maker_address":"千葉県君津市戸崎１７８０","maker_url":"http://www.chuokai-chiba.or.jp/sake/kura/kura4.html","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AE%AE%E5%B4%8E%E9%85%92%E9%80%A0/%E7%99%BD%E5%A0%A4","discontinued":false},{"sake_identify_code":"P001152","sake_name":"神明","sake_furigana":"しんめい","sake_alphabet":"shinmei","maker_id":5754,"maker_name":"神明酒造","maker_postcode":"289-0625","maker_address":"千葉県香取郡東圧町夏目298","maker_url":null,"url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E7%A5%9E%E6%98%8E%E9%85%92%E9%80%A0/%E7%A5%9E%E6%98%8E","discontinued":false},{"sake_identify_code":"P001105","sake_name":"祥兆","sake_furigana":"しょうちょう","sake_alphabet":"shouchou","maker_id":5682,"maker_name":"小林酒造場","maker_postcode":"288-0836","maker_address":"千葉県銚子市松岸町2-78","maker_url":null,"url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%B0%8F%E6%9E%97%E9%85%92%E9%80%A0%E5%A0%B4/%E7%A5%A5%E5%85%86","discontinued":false},{"sake_identify_code":"P001933","sake_name":"福祝","sake_furigana":"ふくいわい","sake_alphabet":"fukuiwai","maker_id":6214,"maker_name":"藤平酒造","maker_postcode":"963-6131","maker_address":"千葉県君津市久留里市場147","maker_url":null,"url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E8%97%A4%E5%B9%B3%E9%85%92%E9%80%A0/%E7%A6%8F%E7%A5%9D","discontinued":false},{"sake_identify_code":"P001068","sake_name":"秀楽","sake_furigana":"しゅうらく","sake_alphabet":"shuuraku","maker_id":5618,"maker_name":"秀楽酒造","maker_postcode":"296-0004","maker_address":"千葉県鴨川市貝渚６７１","maker_url":"https://sites.google.com/site/shurakushuzo/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E7%A7%80%E6%A5%BD%E9%85%92%E9%80%A0/%E7%A7%80%E6%A5%BD","discontinued":false},{"sake_identify_code":"P000194","sake_name":"稲花","sake_furigana":"いなはな","sake_alphabet":"inahana","maker_id":5056,"maker_name":"稲花酒造","maker_postcode":"299-4303","maker_address":"千葉県一宮町東浪見5841","maker_url":"http://www.inahana-syuzou.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E7%A8%B2%E8%8A%B1%E9%85%92%E9%80%A0/%E7%A8%B2%E8%8A%B1","discontinued":false},{"sake_identify_code":"P000195","sake_name":"稲花正宗","sake_furigana":"いなはなまさむね","sake_alphabet":"inahanamasamune","maker_id":5056,"maker_name":"稲花酒造","maker_postcode":"299-4303","maker_address":"千葉県一宮町東浪見5841","maker_url":"http://www.inahana-syuzou.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E7%A8%B2%E8%8A%B1%E9%85%92%E9%80%A0/%E7%A8%B2%E8%8A%B1%E6%AD%A3%E5%AE%97","discontinued":false},{"sake_identify_code":"P000829","sake_name":"腰古井","sake_furigana":"こしごい","sake_alphabet":"koshigoi","maker_id":5273,"maker_name":"吉野酒造","maker_postcode":"299-5265","maker_address":"千葉県勝浦市植野571","maker_url":"http://koshigoi.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%90%89%E9%87%8E%E9%85%92%E9%80%A0/%E8%85%B0%E5%8F%A4%E4%BA%95","discontinued":false},{"sake_identify_code":"P002099","sake_name":"舞桜","sake_furigana":"まいざくら","sake_alphabet":"maizakura","maker_id":5601,"maker_name":"守屋酒造","maker_postcode":"289-1806","maker_address":"千葉県山武市蓮沼ハ2929","maker_url":"http://maizakura.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AE%88%E5%B1%8B%E9%85%92%E9%80%A0/%E8%88%9E%E6%A1%9C","discontinued":false},{"sake_identify_code":"P002745","sake_name":"花いちもんめ","sake_furigana":"はないちもんめ","sake_alphabet":"hanaichimonme","maker_id":5164,"maker_name":"花の友","maker_postcode":"289-1527","maker_address":"千葉県山武市松尾町大堤438","maker_url":"http://hananotomo.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E8%8A%B1%E3%81%AE%E5%8F%8B/%E8%8A%B1%E3%81%84%E3%81%A1%E3%82%82%E3%82%93%E3%82%81","discontinued":false},{"sake_identify_code":"P001803","sake_name":"花の友","sake_furigana":"はなのとも","sake_alphabet":"hananotomo","maker_id":5164,"maker_name":"花の友","maker_postcode":"289-1527","maker_address":"千葉県山武市松尾町大堤438","maker_url":"http://hananotomo.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E8%8A%B1%E3%81%AE%E5%8F%8B/%E8%8A%B1%E3%81%AE%E5%8F%8B","discontinued":false},{"sake_identify_code":"P002501","sake_name":"若緑","sake_furigana":"わかみどり","sake_alphabet":"wakamidori","maker_id":6257,"maker_name":"梅一輪酒造","maker_postcode":"287‐0003","maker_address":"千葉県山武市松ヶ谷イ2902","maker_url":"http://www.umeichirin.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%A2%85%E4%B8%80%E8%BC%AA%E9%85%92%E9%80%A0/%E8%8B%A5%E7%B7%91","discontinued":false},{"sake_identify_code":"P001144","sake_name":"蜃気楼","sake_furigana":"しんきろう","sake_alphabet":"shinkirou","maker_id":5286,"maker_name":"宮崎酒造","maker_postcode":"292-0441","maker_address":"千葉県君津市戸崎１７８０","maker_url":"http://www.chuokai-chiba.or.jp/sake/kura/kura4.html","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AE%AE%E5%B4%8E%E9%85%92%E9%80%A0/%E8%9C%83%E6%B0%97%E6%A5%BC","discontinued":false},{"sake_identify_code":"P001636","sake_name":"豊乃鶴","sake_furigana":"とよのつる","sake_alphabet":"toyonotsuru","maker_id":6447,"maker_name":"豊乃鶴酒造","maker_postcode":"394-0028","maker_address":"千葉県夷隅郡大多喜町新丁88","maker_url":null,"url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E8%B1%8A%E4%B9%83%E9%B6%B4%E9%85%92%E9%80%A0/%E8%B1%8A%E4%B9%83%E9%B6%B4","discontinued":false},{"sake_identify_code":"P000692","sake_name":"金紋旭鶴","sake_furigana":"きんもんあさひつる","sake_alphabet":"kinmonasahitsuru","maker_id":5011,"maker_name":"旭鶴酒造","maker_postcode":"285-0804","maker_address":"千葉県佐倉市馬渡918","maker_url":"http://www.asahiduru.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%97%AD%E9%B6%B4%E9%85%92%E9%80%A0/%E9%87%91%E7%B4%8B%E6%97%AD%E9%B6%B4","discontinued":false},{"sake_identify_code":"P001451","sake_name":"銚子の誉","sake_furigana":"ちょうしのほまれ","sake_alphabet":"choushinohomare","maker_id":5843,"maker_name":"石上酒造","maker_postcode":"288-0065","maker_address":"千葉県銚子市田中町7-1","maker_url":"http://www.isbc.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E7%9F%B3%E4%B8%8A%E9%85%92%E9%80%A0/%E9%8A%9A%E5%AD%90%E3%81%AE%E8%AA%89","discontinued":false},{"sake_identify_code":"P001460","sake_name":"長命泉","sake_furigana":"ちょうめいせん","sake_alphabet":"choumeisen","maker_id":6006,"maker_name":"滝沢本店","maker_postcode":"286-0032","maker_address":"千葉県成田市上町513","maker_url":"http://www.nctv.co.jp/~takizawa/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%BB%9D%E6%B2%A2%E6%9C%AC%E5%BA%97/%E9%95%B7%E5%91%BD%E6%B3%89","discontinued":false},{"sake_identify_code":"P000225","sake_name":"雨城","sake_furigana":"うじょう","sake_alphabet":"ujou","maker_id":5257,"maker_name":"吉崎酒造","maker_postcode":"292-0421","maker_address":"千葉県君津市久留里市場102","maker_url":"http://kichiju-gekka.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%90%89%E5%B4%8E%E9%85%92%E9%80%A0/%E9%9B%A8%E5%9F%8E","discontinued":false},{"sake_identify_code":"P001231","sake_name":"雪山","sake_furigana":"せつざん","sake_alphabet":"setsuzan","maker_id":6255,"maker_name":"馬場本店","maker_postcode":"849-1315","maker_address":"千葉県香取市佐原イ614‐1","maker_url":"http://www.babahonten.com/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E9%A6%AC%E5%A0%B4%E6%9C%AC%E5%BA%97/%E9%9B%AA%E5%B1%B1","discontinued":false},{"sake_identify_code":"P001615","sake_name":"飛鶴","sake_furigana":"とびつる","sake_alphabet":"tobitsuru","maker_id":5734,"maker_name":"森酒造店","maker_postcode":"292-0445","maker_address":"千葉県君津市愛宕202","maker_url":"http://www7b.biglobe.ne.jp/~tobitsuru/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%A3%AE%E9%85%92%E9%80%A0%E5%BA%97/%E9%A3%9B%E9%B6%B4","discontinued":false},{"sake_identify_code":"P000433","sake_name":"香取","sake_furigana":"かとり","sake_alphabet":"katori","maker_id":5572,"maker_name":"寺田本家","maker_postcode":"289-0221","maker_address":"千葉県香取郡神崎町神崎本宿1964","maker_url":"http://www.teradahonke.co.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%AF%BA%E7%94%B0%E6%9C%AC%E5%AE%B6/%E9%A6%99%E5%8F%96","discontinued":false},{"sake_identify_code":"P001674","sake_name":"鳴海","sake_furigana":"なるか","sake_alphabet":"naruka","maker_id":6187,"maker_name":"東灘醸造","maker_postcode":"299-5226","maker_address":"千葉県勝浦市串浜1033","maker_url":"http://azumanada.jp/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E6%9D%B1%E7%81%98%E9%86%B8%E9%80%A0/%E9%B3%B4%E6%B5%B7","discontinued":false},{"sake_identify_code":"P000437","sake_name":"鹿野山","sake_furigana":"かのうざん","sake_alphabet":"kanouzan","maker_id":5375,"maker_name":"原本家","maker_postcode":"299-1131","maker_address":"千葉県君津市下湯江２４０","maker_url":"http://www1.ocn.ne.jp/~kanouzan/","url":"http://www.sakenote.com/d/%E5%8D%83%E8%91%89%E7%9C%8C/%E5%8E%9F%E6%9C%AC%E5%AE%B6/%E9%B9%BF%E9%87%8E%E5%B1%B1","discontinued":false}],"num_pages":1})
      catch error
        msg.send "Ran into an error parsing JSON :("
        return
      msg.send "#{data.sakes} taking midnight train going #{data.sakes}"

    msg.send sakeUrl

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
