//
//  DebugViewController.swift
//  emo - Debug/scratch pad controller for exploratory development
//
//  Created by Jason Steele on 1/21/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import CocoaLumberjack
import UIKit

class DebugViewController: UIViewController {
    @IBAction func onRequestButton(_: UIButton) {
        let apiClient = EveAPIClient()

        apiClient.send(CharacterResource(2_113_645_220)) { response in
            switch response {
            case let .success(dataContainer):
                DDLogInfo("SUCCESS: Character \(dataContainer.data.name) cached "
                    + "until \(String(describing: dataContainer.expires))")
            case let .failure(error):
                DDLogError("\(error)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
