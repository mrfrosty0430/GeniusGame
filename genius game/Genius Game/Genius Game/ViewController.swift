//
//  ViewController.swift
//  Genius Game
//
//  Created by Sung Jun Hong on 5/29/18.
//  Copyright © 2018 Sung Jun Hong. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController, GKGameCenterControllerDelegate{
    @IBOutlet weak var solutionLabel: UILabel!
    @IBOutlet weak var flashView: UIView!
    @IBOutlet var overview: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var im0: UIImageView!
    @IBOutlet weak var im1: UIImageView!
    @IBOutlet weak var im2: UIImageView!
    @IBOutlet weak var im3: UIImageView!
    @IBOutlet weak var im4: UIImageView!
    @IBOutlet weak var im5: UIImageView!
    @IBOutlet weak var im6: UIImageView!
    @IBOutlet weak var im7: UIImageView!
    @IBOutlet weak var im8: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var startTimerLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var endView: UIView!
    var imArray = [UIImageView]()
    @IBOutlet weak var resultLabel: UILabel!
    var canTouch = false
    var touched = [Int]()
    var solutions = [[Int]]()
    var curr_solutions = [[Int]]()
    var seconds = 60
    var secondsStart = 5
    var timer = Timer()
    var timerStart = Timer()
    var isTimeRunning = false
    var currScore = 0
    var color = UIColor.green
    var offset = 0.5
    let timerBasic = "Time Left: "
    let scoreBasic = "          Score: "
    let defaultSol = "__"

    
    
    
    func updateScore(score: Int){
        if GKLocalPlayer.localPlayer().isAuthenticated {
            let scoreReporter = GKScore(leaderboardIdentifier: "genius_leaderboard")
            scoreReporter.value = Int64(score)
            let scoreArray: [GKScore] = [scoreReporter]
            GKScore.report(scoreArray,withCompletionHandler: nil)
            
            if score >= 20 {
                print("doing this")
                let achievement = GKAchievement(identifier: "achievement_20")
                achievement.showsCompletionBanner = true  // use Game Center's UI
                GKAchievement.report([achievement], withCompletionHandler: nil)
            }
        }
    }
    
    @objc func updateTimer(){
        if seconds <= 0 {
            timer.invalidate()
            updateScore(score: currScore)
            self.performSegue(withIdentifier: "goToEndView", sender: self)
        }
        else{
            if (seconds <= 30){
                self.color = .orange
            }
            if (seconds <= 10){
                self.color = .red
                offset = 0.25
            }
            UIView.animate(withDuration:offset, animations:{
                self.flashView.backgroundColor = self.color
            })
            if (seconds <= 10){
                UIView.animate(withDuration:offset, animations:{
                    self.flashView.backgroundColor = .white
                })
                UIView.animate(withDuration:offset, animations:{
                    self.flashView.backgroundColor = self.color
                })
                
            }
            seconds -= 1
            timerLabel.text = "\(timerBasic)\(seconds)"
            scoreLabel.text = "\(scoreBasic)\(currScore)"
            UIView.animate(withDuration:offset, animations:{
                self.flashView.backgroundColor = .white
            })
        }
    
    }
    @objc func updateTimerStart(){
        if secondsStart == 0 {
            timerStart.invalidate()
            timerView.isHidden = true
            runTimer()
            doEverything()
            
        }
        else{
            secondsStart -= 1
            startTimerLabel.text = "\(secondsStart)"
            
            
        }
        
    }
    
    func updateSolution(){
        if (touched.count == 1){
            solutionLabel.text = "Solution: \(touched[0]+1) \(defaultSol) \(defaultSol)"
        }
        if (touched.count == 2){
            solutionLabel.text = "Solution: \(touched[0]+1) \(touched[1]+1) \(defaultSol)"
        }
        if (touched.count == 3){
            solutionLabel.text = "Solution: \(touched[0]+1) \(touched[1]+1) \(touched[2]+1)"
        }
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    func runTimerStart() {
        timerStart = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimerStart)), userInfo: nil, repeats: true)
    }
    @IBAction func touch0(_ sender: Any) {

        if canTouch{
            print("touching 0")
            if (touched.count == 2) {
                self.touched.append(0)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(0)
                updateSolution()
            }
        }
    }
    @IBAction func touch1(_ sender: Any) {
        if canTouch{
            print("touching 1")
            if (touched.count == 2) {
                self.touched.append(1)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(1)
                updateSolution()
            }
        }
    }
    @IBAction func touch2(_ sender: Any) {
        if canTouch{
            print("touching 2")
            if (touched.count == 2) {
                self.touched.append(2)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(2)
                updateSolution()
            }
        }
    }
    @IBAction func touch3(_ sender: Any) {
        if canTouch{
            print("touching 3")
            if (touched.count == 2) {
                self.touched.append(3)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(3)
                updateSolution()
            }
        }
    }
    @IBAction func touch4(_ sender: Any) {
        if canTouch{
            print("touching 4")
            if (touched.count == 2) {
                self.touched.append(4)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(4)
                updateSolution()
            }
        }
    }
    @IBAction func touch5(_ sender: Any) {
        if canTouch{
            print("touching 5")
            if (touched.count == 2) {
                self.touched.append(5)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(5)
                updateSolution()
            }
        }
    }
    @IBAction func touch6(_ sender: Any) {
        if canTouch{
            print("touching 6")
            if (touched.count == 2) {
                self.touched.append(6)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(6)
                updateSolution()
            }
        }
    }
    @IBAction func touch7(_ sender: Any) {
        if canTouch{
            print("touching 7")
            if (touched.count == 2) {
                self.touched.append(7)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(7)
                updateSolution()
            }
        }
    }
    @IBAction func touch8(_ sender: Any) {
        if canTouch{
            print("touching 8")
            if (touched.count == 2) {
                self.touched.append(8)
                updateSolution()
                checkSolution(solution: touched)
                self.canTouch = false
                touched = [Int]()
            }
            else{
                self.touched.append(8)
                updateSolution()
            }
        }
    }
    
    func checkSolution(solution: [Int]){
        let sol_sorted = solution.sorted()
        var found = false
        var foundAgain = false
        for i in 0 ..< solutions.count {
            if sol_sorted == solutions[i]{
                found = true
                for j in 0 ..< curr_solutions.count{
                    if (sol_sorted == curr_solutions[j]){
                        print("solution already found")
                        found = false
                        foundAgain = true
                    }
                }   
                curr_solutions.append(sol_sorted)
                if (found){
//                    print("correct solution")
                    resultLabel.text = "Result: Correct Solution"
                    currScore += 10
                }
            }
        }
        if (!found && !foundAgain){
            resultLabel.text = "Result: Solution Already Found"
            seconds -= 5
        }
        else if (!found && foundAgain){
            resultLabel.text = "Result: Incorrect Solution "
            seconds -= 5
        }

    }

    
    func showDeck(deck: [Int]){
        imArray.append(im0)
        imArray.append(im1)
        imArray.append(im2)
        imArray.append(im3)
        imArray.append(im4)
        imArray.append(im5)
        imArray.append(im6)
        imArray.append(im7)
        imArray.append(im8)
        
        for i in 0 ... 8 {
            let n = String(deck[i])
            imArray[i].image = UIImage(named: n)
        }
        

    }
    @IBAction func solution(_ sender: Any) {
//        print("im here")
        
        canTouch = true
        solutionLabel.text = "Solution: \(defaultSol) \(defaultSol) \(defaultSol)"
        resultLabel.text = "Result: "
    }
    func compare (a:Int, b: Int, c: Int) -> Bool {
        let bgA = a % 3
        let bgB = b % 3
        let bgC = c % 3
        if ((bgA == bgB) && (bgA == bgC) && (bgB == bgC)) || ((bgA != bgB) && (bgA != bgC) && (bgB != bgC)){
            var newA = a / 3
            var newB = b / 3
            var newC = c / 3
            let shA = newA % 3
            let shB = newB % 3
            let shC = newC % 3
            if ((shA == shB) && (shA == shC) && (shB == shC)) || ((shA != shB) && (shA != shC) && (shB != shC)){
                newA = a / 9
                newB = b / 9
                newC = c / 9
                let cA = newA % 3
                let cB = newB % 3
                let cC = newC % 3
                if ((cA == cB) && (cA == cC) && (cB == cC)) || ((cA != cB) && (cA != cC) && (cB != cC)){
                    return true
                }
            }
        }
        return false
    }
    
    func getSolutions (deck: [Int]){
        for i in  0 ..< 9 {
            for j in i+1 ..< 9{
                for k in j+1 ..< 9 {
                    if (compare(a:deck[i],b:deck[j],c:deck[k])) {
                        solutions.append([i,j,k])
                    }
                }
            }
        }
        print(solutions)
    }
    
    @IBAction func noMoreSolutions(_ sender: Any) {
        if curr_solutions.count == solutions.count{
            currScore += 3
            doEverything()
        }
        else{
            resultLabel.text = "Result: There are more solutions"
            seconds -= 10
        }
    }
    
    func doEverything (){
        solutions = [[Int]]()
        print("hitting button")
        var deck = [Int]()
        while deck.count != 9{
            var n = Int(arc4random_uniform(27))
            while deck.contains(n){
                n = Int(arc4random_uniform(27))
            }
            deck.append(n)
        }
        showDeck(deck: deck)
        getSolutions(deck:deck)
    }

    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    func start(){
        runTimerStart()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scorePass = currScore
        if let destinationViewController = segue.destination as? EndViewController {
            destinationViewController.score = scorePass
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

