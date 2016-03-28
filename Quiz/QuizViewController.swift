//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [AnyObject]()
    
    //正解数
    var correctAnswer:Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [AnyObject]()
        
        //------------------------ここから下にクイズを書く------------------------//
        tmpArray.append(["徳川家康をモチーフにしたキャラクターの一人称は？","拙者","わし","わて",1])
        tmpArray.append(["小さめなおじさんのキャラクターの職業は？","公務員","社長","無職",3])
        tmpArray.append(["体全体が赤いキャラクターの横のフォルムは？","千葉県","静岡県","和歌山県",1])
        tmpArray.append(["黄色くて跳ぶキャラクターの好物は？","梨","ぶどう","桃",3])
        tmpArray.append(["キャラクターたちの中は？","美しいお姉さん","よぼよぼなおじいさん","中の人なんていない！",3])
        tmpArray.append(["縦にすごく伸びる茶色のキャラクターのモチーフは？","納豆","チョコレート","カレー",1])
        tmpArray.append(["2014にグランプリをとったキャラクターの県は？","群馬県","愛媛県","千葉県",1])
        tmpArray.append(["黄色くて跳ぶキャラクターはどのように作られた？","紙で１５分","パワポで３０分","イラレで４５分",2])
        tmpArray.append(["黒くてほっぺが赤いキャラクターのモチーフは？","ヒグマ","ツキノワグマ","ホッキョクグマ",2])
        tmpArray.append(["黄色くて跳ぶキャラクターの性別は？","男","女","無し",3])
        tmpArray.append(["黒くてほっぺが赤いキャラクターの性別は？","男","女","無し",1])
        tmpArray.append(["黒くてほっぺが赤いキャラクターの代表する県は？","石川県","熊本県","埼玉県",2])
        tmpArray.append(["黄色くて跳ぶキャラクターの代表する県は？","山梨県","千葉県","新潟県",2])
        tmpArray.append(["埼玉県深谷市のキャラクターの名前の由来は？","地名から","やわらかそうだから","響きで",1])
        tmpArray.append(["群馬県のキャラクターの歳は？","1歳","5歳","7歳",3])
        
        //------------------------ここから上にクイズを書く------------------------//
        
        // 問題をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


