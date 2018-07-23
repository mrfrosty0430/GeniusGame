//
//  MPCHandler.swift
//  Genius Game
//
//  Created by Sung Jun Hong on 7/23/18.
//  Copyright © 2018 Sung Jun Hong. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class MPCHandler: NSObject, MCSessionDelegate {
    var peerID: MCPeerID!
    var session: MCSession!
    var browser: MCBrowserViewController!
    var advertiser: MCAdvertiserAssistant? = nil
    
    func setupPeerWithDisplayName (displayName:String){
        peerID = MCPeerID(displayName: displayName)
    }
    func setupSession(){
        session = MCSession (peer: peerID)
        session.delegate = self
    }
    func steupBrowser(){
        browser = MCBrowserViewController(serviceType: "my-game", session:session)
    }
    func advertiseSelf(advertise:Bool){
        if advertise{
            advertiser = MCAdvertiserAssistant(serviceType: "my-game", discoveryInfo: nil, session: session)
            advertiser!.start()
        }
        else{
            advertiser!.stop()
            advertiser = nil
        }
        
    }
    
    func session(_ session: MCSession!, peer peerID: MCPeerID!, didChange state: MCSessionState) {
        let userInfo = ["peerID":peerID,"state":state.toRaw()]
        dispatch_get_main
    }
    
    func session(_ session: MCSession, didReceive data: NSData, fromPeer peerID: MCPeerID) {
        <#code#>
    }
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        <#code#>
    }
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        <#code#>
    }
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        <#code#>
    }
    
}
