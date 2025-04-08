//
//  ConnectingViewController.swift
//  Assignmentkaro
//
//  Created by Sambhav Singh on 08/04/25.
//

import UIKit

class ConnectingViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var connectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startConnectingProcess()
    }
    
    private func startConnectingProcess() {
            progressView.progress = 0.0
            connectionLabel.isHidden = true

            let statusMessages = [
                "Ryn is finding the fastest server....",
                "Rhino hunting down the server...",
                "Server hunted down Successfully"
            ]

            var progress: Float = 0.0
            var index = 0

            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
                if index < statusMessages.count {
                    self.statusLabel.text = statusMessages[index]
                    progress += 0.5
                    self.progressView.setProgress(progress, animated: true)
                    index += 1
                } else {
                    timer.invalidate()
                    self.showConnectionSuccess()
                }
            }
        }

    private func showConnectionSuccess() {
            self.progressView.isHidden = true
            self.connectionLabel.isHidden = false
            self.connectionLabel.text = "CONNECTED SUCCESSFULLY"
            self.connectionLabel.textColor = .green
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let connectedVC = storyboard.instantiateViewController(withIdentifier: "ConnectedViewController") as? ConnectedViewController {
                connectedVC.modalPresentationStyle = .fullScreen
                self.present(connectedVC, animated: true)
            }
        }
}
