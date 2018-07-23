//
//  EndViewController.swift
//  Genius Game
//
//  Created by Sung Jun Hong on 7/23/18.
//  Copyright © 2018 Sung Jun Hong. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    var score = -1
    
    @IBOutlet weak var scoreLabel: UILabel!
    func updateScore(){
        scoreLabel.text = "You scored \(self.score) points"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScore()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
