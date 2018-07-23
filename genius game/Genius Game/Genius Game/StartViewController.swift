//
//  StartViewController.swift
//  Genius Game
//
//  Created by Sung Jun Hong on 6/24/18.
//  Copyright © 2018 Sung Jun Hong. All rights reserved.
//

import UIKit
import GameKit
import MultipeerConnectivity

class StartViewController: UIViewController, GKGameCenterControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticatePlayer()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playMulti(_ sender: Any) {
        if GKLocalPlayer.localPlayer().isAuthenticated {
            GKLocalPlayer.localPlayer().register(self as! GKLocalPlayerListener)
            let request = GKMatchRequest()
            request.minPlayers = 2;
            request.maxPlayers = 2;
            
            let vc = GKTurnBasedMatchmakerViewController(matchRequest: request)
            vc.turnBasedMatchmakerDelegate = (self as! GKTurnBasedMatchmakerViewControllerDelegate)
            present(vc, animated: true, completion: nil)
        }
    }

    @IBAction func openGC(_ sender: Any) {
        let VC = self
        let GCVC = GKGameCenterViewController()
        GCVC.gameCenterDelegate = self
        VC.present(GCVC, animated: true, completion:nil )
        
    }
    
    
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
        func saveHighScore (number: Int){
        if GKLocalPlayer.localPlayer().isAuthenticated {
            let scoreReporter = GKScore(leaderboardIdentifier: "genius_leaderboard")
            scoreReporter.value = Int64(number)
            let scoreArray: [GKScore] = [scoreReporter]
            GKScore.report(scoreArray,withCompletionHandler: nil)
        }
    }
    
    func authenticatePlayer(){
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {
            (view,error) in
            if view != nil {
                self.present(view!, animated: true, completion: nil)
            }
            else{
                print(GKLocalPlayer.localPlayer().isAuthenticated)
            }
        }
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
