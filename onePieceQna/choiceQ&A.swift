//
//  choiceQ&A.swift
//  onePieceQna
//
//  Created by 董禾翊 on 2022/10/8.
//

import UIKit

class choiceQ_A: UIViewController {

    @IBOutlet weak var numberOfQuestionLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet var optionBtns: [UIButton]!
    
    @IBOutlet weak var questionLable: UILabel!
    var questions = [ChoiceQA]()
    var i = 0
    var score = 0
    var rightCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let question1 = ChoiceQA(description: "偉大航道的起點是？", ans: "顛倒山", options: ["紅土大陸", "顛倒山", "魚人島", "羅格鎮"])
        questions.append(question1)
        let question2 = ChoiceQA(description: "空島人稱陸地上的人叫什麼？", ans: "藍海人", options: ["藍海人", "地上人", "天龍人", "下界人"])
        questions.append(question2)
        let question3 = ChoiceQA(description: "是開始也是結束的地方是指？", ans: "羅格鎮", options: ["加雅島", "磁鼓島", "羅格鎮", "拉乎德爾"])
        questions.append(question3)
        let question4 = ChoiceQA(description: "CP9卡古的能力為何(果實全名)？", ans: "牛牛果實長頸鹿形態", options: ["牛牛果實長頸鹿形態", "貓貓果實豹形態", "犬犬果實狼形態", "牛牛果實野牛形態"])
        questions.append(question4)
        let question5 = ChoiceQA(description: "威霸上裝的是什麼貝？", ans: "噴風貝", options: ["風貝", "噴風貝", "衝擊貝", "燃燒貝"])
        questions.append(question5)
        let question6 = ChoiceQA(description: "在小花園決鬥的兩個巨人族叫？", ans: "布洛基、東利", options: ["布洛基、東利", "洛基、泰森", "歐伊摩、卡西", "蕾貝卡、露西"])
        questions.append(question6)
        let question7 = ChoiceQA(description: "卡雷拉公司的社長叫什麼？", ans: "艾斯巴古", options: ["艾斯巴古", "卡莉法", "包利", "湯姆"])
        questions.append(question7)
        let question8 = ChoiceQA(description: "海軍上將黃猿的名字是？", ans: "波爾薩利諾", options: ["薩卡斯基", "波爾薩利諾", "庫山", "荒牧"])
        questions.append(question8)
        let question9 = ChoiceQA(description: "世界貴族的聖地為何？", ans: "瑪麗喬亞", options: ["瑪麗喬亞", "馬林梵多", "魚人島", "推進城"])
        questions.append(question9)
        let question10 = ChoiceQA(description: "航海士娜美最喜歡的水果是什麼？", ans: "橘子", options: ["蘋果", "西瓜", "橘子", "香蕉"])
        questions.append(question10)
        let question11 = ChoiceQA(description: "船醫喬巴最喜歡的食物是什麼？", ans: "棉花糖", options: ["棉花糖", "棒棒糖", "巧克力", "水水糖"])
        questions.append(question11)
        let question12 = ChoiceQA(description: "佛朗基用寶樹亞當建造的船叫什麼？", ans: "千陽號", options: ["黃金梅利號", "千陽號", "亞當號", "前進魯夫號"])
        questions.append(question12)
        
        /*questions.shuffle()
        numberOfQuestionLable.text = "\(i + 1)/10"
        
        scoreLable.text = "總分：\(score)"
        questionLable.text = questions[i].description
        questions[i].options.shuffle()
        for j in 0...3{
            optionBtns[j].setTitle(questions[i].options[j], for: .normal)*/
        replay()
        
        
    }
    
    func nextQuestion(){
        if i + 1 < 10 {
            i = i + 1
            questionLable.text = questions[i].description
            questions[i].options.shuffle()
            for j in 0...3{
                optionBtns[j].setTitle(questions[i].options[j], for: .normal)
            }
            numberOfQuestionLable.text = "\(i + 1)/10"
            scoreLable.text = "總分：\(score)"
        }else{
            scoreLable.text = "總分：\(score)"
            let alert = UIAlertController(title: "猜題結束", message: "你得到\(score)/240分", preferredStyle: .alert)
            let replayAction = UIAlertAction(title: "重新開始", style: .default){_ in
                self.replay()
            }
            alert.addAction(replayAction)
            present(alert, animated: true)
        }
    }
    
        
    @IBAction func option(_ sender: UIButton) {
        if sender.currentTitle == questions[i].ans{
            rightCount += 1
            if rightCount < 4 {
                score += 10
            }else{
                score += 30
            }
        }else{
            rightCount = 0
        }
        nextQuestion()
    }
    
    func replay() {
        score = 0
        rightCount = 0
        i = 0
        questions.shuffle()
        numberOfQuestionLable.text = "\(i + 1)/10"
        scoreLable.text = "總分：\(score)"
        questionLable.text = questions[i].description
        questions[i].options.shuffle()
        for j in 0...3{
            optionBtns[j].setTitle(questions[i].options[j], for: .normal)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
