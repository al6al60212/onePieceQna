//
//  ViewController.swift
//  onePieceQna
//
//  Created by 董禾翊 on 2022/10/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfQuestionLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var luffyMessageLable: UILabel!
    var questions = [Question]()
    var messages = ["要上囉～", "我要成為海賊王～", "成為我的夥伴吧～", "一起去冒險吧～"]
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let question1 = Question(description: "偉大航道的起點是？", ans: "顛倒山")
        questions.append(question1)
        let question2 = Question(description: "空島人稱陸地上的人叫什麼？", ans: "藍海人")
        questions.append(question2)
        let question3 = Question(description: "是開始也是結束的地方是指？", ans: "羅格鎮")
        questions.append(question3)
        let question4 = Question(description: "CP9卡古的能力為何(果實全名)？", ans: "牛牛果實長頸鹿形態")
        questions.append(question4)
        let question5 = Question(description: "威霸上裝的是什麼貝？", ans: "噴風貝")
        questions.append(question5)
        let question6 = Question(description: "在小花園決鬥的兩個巨人族叫？", ans: "布洛基、東利")
        questions.append(question6)
        let question7 = Question(description: "卡雷拉公司的社長叫什麼？", ans: "艾斯巴古")
        questions.append(question7)
        let question8 = Question(description: "海軍上將黃猿的名字是？", ans: "波爾薩利諾")
        questions.append(question8)
        let question9 = Question(description: "世界貴族的聖地為何？", ans: "瑪麗喬亞")
        questions.append(question9)
        let question10 = Question(description: "航海士娜美最喜歡的水果是什麼？", ans: "橘子")
        questions.append(question10)
        numberOfQuestionLable.text = "\(i + 1)/10"
        luffyMessageLable.text = messages.randomElement()
        questions.shuffle()
        questionLable.text = questions[i].description
    }

    
    @IBAction func next(_ sender: Any) {
        i = (i + 1) % questions.count
        numberOfQuestionLable.text = "\(i + 1)/10"
        questionLable.text = questions[i].description
        answerLable.text = ""
        luffyMessageLable.text = messages.randomElement()
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLable.text = questions[i].ans
    }
    
}

