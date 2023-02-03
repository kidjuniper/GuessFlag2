//
//  ViewController.swift
//  флаги ремейк на сториборде
//
//  Created by Nikita Stepanov on 09.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    // simple labels
    let chooseFlag = UILabel()
    var countryName = UILabel()
    var score = UILabel()
    let tag = UILabel()
    var bestScoreLabel = UILabel()
    //records
    var record = 0
    // structs
    var clickersButtons = ClickersButtons() // main buttons and related elements
    var indicator = Indicator() // level indicators ellements (look like batterie)
    var countriesArray = CountriesArray()
    var previousRightAnswers: [String] = [] // array with all right answers
    //the best score
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.white.cgColor
        //MARK: label's settings
        labelSettings()
        
        // MARK: button's appearance settings
        settingMainButtons()
        
        //MARK: distribution of pictures
        settingImageForClickers()
        
        //MARK: indicator's settings
        indicatorSeetings()
    }
    
    //MARK: locking orientation
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
}
