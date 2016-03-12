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
        tmpArray.append(["ふなっしーの誕生日は？","138年7月4日","2年7月4日","2012年7月4日",1])
        tmpArray.append(["何年に一度現れる奇跡の梨の妖精？","700年","2000年","40000万",2])
        tmpArray.append(["ふなっしーの本名は？","ふなふなし","フナディウス4世","船田慎吾",2])
        tmpArray.append(["ふなっしーの好物は？","梨","ぶどう","桃",3])
        tmpArray.append(["ふなっしーの中の人は？","美しいお姉さん","よぼよぼなおじいさん","中の人なんていない！",3])
        tmpArray.append(["ふなっしーの目はなぜ灰色？","汚れた人間界をみてきたから","カラコンにはまっているから","ハーフだから",1])
        tmpArray.append(["ふなっしーが一番仲がいい兄弟は？","ふなたろー","ふなしろー","ふなごろー",3])
        tmpArray.append(["ふなっしーはどのように作られた？","紙で１５分","パワポで３０分","イラレで４５分",2])
        tmpArray.append(["ふなっしーが車の中でよく聴く音楽は？","エアロスミス","ジャスティンビーバー","ワンダイレクション",1])
        tmpArray.append(["ふなっしーの両親は？","普通の妖精","普通の梨の木","普通の人間",2])
        tmpArray.append(["ふなっしーの性別は？","男","女","無し",3])
        tmpArray.append(["ふなっしーの身長は？","90cm","180","274cm",1])
        tmpArray.append(["ふなっしーの体重は？","35kg","90kg","274kg",1])
            
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


