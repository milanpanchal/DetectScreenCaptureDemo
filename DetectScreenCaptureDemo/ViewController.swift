//
//  ViewController.swift
//  DetectScreenCaptureDemo
//
//  Created by Milan Panchal on 19/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Subscribe to a Notification which will fire when screen shot capture
        subscribeToNotification(UIApplication.userDidTakeScreenshotNotification,
                                selector: #selector(didDetectScreenshot(notification:)))

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        //Unsubscribe from all notifications
        unsubscribeFromAllNotifications()
    }

}

extension ViewController {
    
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
    
    func unsubscribeFromAllNotifications() {
        NotificationCenter.default.removeObserver(self)
    }

}

extension ViewController {
    
    @objc func didDetectScreenshot(notification: Notification) -> Void {
        debugPrint("Screenshot Taken")
        
        let alert = UIAlertController(title: "Screenshot", message: "Screenshot taken", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

    private func isScreenRecording() -> Bool {
        
        for screen in UIScreen.screens where screen.isCaptured == true {
            debugPrint("screen is recorded")
            return true
            
        }

        return false
    }

}
