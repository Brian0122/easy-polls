# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = Question.create([{title: '您認為陳偉殷本季會拿幾勝？'}, 
                            {title: '您認為王建民本季能回到大聯盟嗎？'},
                            {title: '您認為火箭在季後賽能打到哪裏？'},
                            {title: '你支持簽署兩岸服務貿易協議嗎？'},
                            {title: '連柯pk戰，你認為誰會當選下屆台北市長？'}])
# answer for Q1
Answer.create(answer: '6勝以下', question: questions[0], check_count: 0)
Answer.create(answer: '7到9勝', question: questions[0], check_count: 0)
Answer.create(answer: '10到12勝', question: questions[0], check_count: 0)
Answer.create(answer: '13到15勝', question: questions[0], check_count: 0)
Answer.create(answer: '16到18勝', question: questions[0], check_count: 0)
Answer.create(answer: '19勝以上', question: questions[0], check_count: 0)

#answer for Q2
Answer.create(answer: '一定可以', question: questions[1], check_count: 0)
Answer.create(answer: '沒希望了', question: questions[1], check_count: 0)

#answer for Q3
Answer.create(answer: '第一輪就止步', question: questions[2], check_count: 0)
Answer.create(answer: '第二輪才敗北', question: questions[2], check_count: 0)
Answer.create(answer: '西區冠軍賽淘賽', question: questions[2], check_count: 0)
Answer.create(answer: '總冠軍賽落敗', question: questions[2], check_count: 0)
Answer.create(answer: '贏得總冠軍', question: questions[2], check_count: 0)

#answer for Q4
Answer.create(answer: '支持', question: questions[3], check_count: 0)
Answer.create(answer: '反對', question: questions[3], check_count: 0)

#answer for Q5
Answer.create(answer: '柯文哲', question: questions[4], check_count: 0)
Answer.create(answer: '連勝文', question: questions[4], check_count: 0)
Answer.create(answer: '其他人', question: questions[4], check_count: 0)
Answer.create(answer: '投廢票', question: questions[4], check_count: 0)