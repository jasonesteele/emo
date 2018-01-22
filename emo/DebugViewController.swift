//
//  DebugViewController.swift
//  emo - Debug/scratch pad controller for exploratory development
//
//  Created by Jason Steele on 1/21/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let apiClient = EveAPIClient()

        apiClient.send(CharacterResource(2_113_645_220)) { response in
            switch response {
            case let .success(dataContainer):
                print("SUCCESS: Character \(dataContainer.data.name) cached "
                    + "until \(String(describing: dataContainer.expires))")
            case let .failure(error):
                print("ERROR: \(error)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
