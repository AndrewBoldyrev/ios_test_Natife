//
//  PlayerViewController.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 19.01.2023.
//

import Foundation
import UIKit
import youtube_ios_player_helper

class PlayerViewController : UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var playerView: YTPlayerView!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeRight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerView.delegate = self
        guard let key = MovieViewModel.shared.video.first?.key else { return }
        print(key)

        playerView.load(withVideoId: key, playerVars: ["playsinline": "1"])
        
    }
    @IBAction func didTapClosePlayer(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    
    }
}
