# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md


  #
  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  #robot.hear /I like pie/i, (res) ->
  #  res.emote "makes a freshly baked pie"
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

victory = [
  "https://i.imgflip.com/1vic5.jpg",
  "http://s2.quickmeme.com/img/9c/9c973c71365035fcae728a65b287acb8feb6b9cd07e41f6cb86c046c72c8db2c.jpg",
  "https://i.imgflip.com/g3lqz.jpg",
  "http://m.memegen.com/ziwjeu.jpg",
  "http://i0.kym-cdn.com/photos/images/original/000/314/181/bf5.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJrPFBugWK2FNPtk8qV6Tc44JZc9IF-WfIdE2QKtQXAokjX1lGVg",
  "https://memegenerator.net/img/instances/36033650.jpg",
  "https://memegenerator.net/img/instances/58462151.jpg",
  "http://s.quickmeme.com/img/e1/e165f7fea3ea372cf1311282dab0addcb8d09d283a8aad76d38de13cf9ef07b5.jpg",
  "https://www.askideas.com/media/47/I-Have-So-Much-Homework-Better-Watch-Some-Youtube-Funny-Meme-Image.jpg"
]

module.exports = (robot) ->

  robot.hear /give up/i, (res) ->
    res.send "(╯'□')╯ ┻━┻ I'm done."

  robot.hear /success|Oh yeah|I did it|We did it|you did it|victory/i, (msg) ->
    msg.send msg.random victory 

  robot.respond /you(.*)slow/i, (msg) ->
    setTimeout ->
      msg.send 'Who you calling slow??'
    , 5000
  
  robot.respond /(.*)joke(.*)|(.*)funny(.*)|(.*)laugh(.*)|(.*)lulz(.*)|(.*)lols(.*)/i, (msg) ->
    msg.http("https://icanhazdadjoke.com/")
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        try
           json = JSON.parse(body)
           msg.send "#{json.joke}"
        catch error
           msg.send "Not now kid."

# Wolfram Computational Engine
# APP NAME: quick
# APPID: PGAKAJ-U75WURKQ69
  robot.respond /question (.*)/i, (msg) ->
    gemname = escape(msg.match[1]).replace /%20/g, "+"
    query1 = "http://api.wolframalpha.com/v1/result?i=#{gemname}%3F&appid=PGAKAJ-U75WURKQ69"
    query2 = "http://api.wolframalpha.com/v2/query?input=#{gemname}&format=plaintext&output=JSON&appid=PGAKAJ-U75WURKQ69"
    msg.http("#{query1}")
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        try
           #try short answer api
           msg.send "#{body}"
           match = /No short answer available/i.test("#{body}")
           if match
                #msg.send "Missing units? Will try to get a detailed answer ..."
                msg.http("#{query2}").headers(Accept: 'application/json').get() (err1, res1, body1) ->       
                    data = ''
                    res1.on 'data', (chunk) ->
                        data += chunk.toString()
                        #msg.send "#$%#$ #{data}"
                        #msg.send "--------I am in data---------"
                        
                    res1.on 'end', () ->
                        #msg.send "#$%#$ #{data}"
                        msg.send "--------I am in data---------"
                        return
                    try
                        #try detailed v2 api
                        json = JSON.parse(body1)
                        i for i in [0..json.queryresult.numpods]
                            try
                                msg.send "<--- #{json.queryresult.pods[i].title} --->"
                            j for j in [0..json.queryresult.pods[i].numsubpods]
                                try
                                    msg.send "#{json.queryresult.pods[i].subpods[j].plaintext}"
                    catch error
                        msg.send "#{error} (I got nothing)"
        catch error
           msg.send "My brain isn't functioning"

