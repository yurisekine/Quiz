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
    @IBOutlet var levelImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if correctAnswer == 13 {
            resultLabel.text = "全問正解なっしー！"
        } else if correctAnswer == 0 {
            resultLabel.text = "全問不正解なっしー、、"
        } else {
            resultLabel.text = "13問中、\(correctAnswer)問正解なっしー！"
        }
        if correctAnswer <= 3 {
            Level.text = "梨以下なっしー..."
            levelImage.image = UIImage(named: "nashi0.gif")!
        } else if correctAnswer <= 7 {
            Level.text = "普通の梨レベルなしな！"
            levelImage.image = UIImage(named: "nashi.gif")!
        } else if correctAnswer <= 11 {
            Level.text = "美味しい梨レベルなっしー！"
            levelImage.image = UIImage(named: "funa0.gif")!
        } else {
            Level.text = "神梨レベルなっしー！"
            levelImage.image = UIImage(named: "funa1.gif")!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
