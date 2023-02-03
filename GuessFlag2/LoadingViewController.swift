//
//  LoadingScreenViewController.swift
//  GuessFlag2
//
//  Created by Nikita Stepanov on 21.09.2022.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { Timer in
            self.performSegue(withIdentifier: "id1", sender: .none)
        }
    }
}
