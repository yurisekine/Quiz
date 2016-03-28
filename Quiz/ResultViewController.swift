//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var correctAnswer:Int = 0
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var Level: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if correctAnswer == 13 {
            resultLabel.text = "全問正解だ！"
        } else if correctAnswer == 0 {
            resultLabel.text = "全問不正解、、"
        } else {
            resultLabel.text = "13問中、\(correctAnswer)問正解！"
        }
        if correctAnswer <= 3 {
            Level.text = "もっと学んで..."
        } else if correctAnswer <= 7 {
            Level.text = "普通レベル.."
        } else if correctAnswer <= 11 {
            Level.text = "いいゆるさ！"
        } else {
            Level.text = "ゆる神レベル！"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
