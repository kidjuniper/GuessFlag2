//
//  Visual.swift
//  GuessFlag2
//
//  Created by Nikita Stepanov on 17.09.2022.
//

import Foundation
import UIKit

// MARK: In this file there are all functions related with constraints and UI elements initial appearance

extension MainViewController {
    // MARK: LABELS
    func labelSettings(){
        clickersButtons.rightAnswer = countriesArray.current[Int.random(in: 0...3)] // here we generate right answer!
        
        chooseFlag.text = "Выбери флаг:"
        
        countryName.textColor = .orange
        countryName.text = clickersButtons.rightAnswer
        print(clickersButtons.rightAnswer)
        
        [chooseFlag, countryName].forEach {
            $0.font = UIFont(name: "Noteworthy Bold", size: 30)
        }
        
        tag.text = "@Kodausch" // my tag; you can replace it with your own
        tag.textColor = .link
        
        score.text = "Нажми на нужную плитку!"
        score.font = UIFont(name: "Noteworthy Bold", size: 25)
        
        bestScoreLabel.font = UIFont(name: "Noteworthy Bold", size: 17)
        
        [chooseFlag, tag, countryName, score, bestScoreLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([chooseFlag.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20), chooseFlag.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     
                                     countryName.topAnchor.constraint(equalTo: chooseFlag.bottomAnchor, constant: 3), countryName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     
                                     tag.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30), tag.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     
                                     score.bottomAnchor.constraint(equalTo: tag.topAnchor, constant: -10), score.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     
                                     bestScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
    }
    
    // MARK: FLAG BUTTONS
    func settingMainButtons() {
        //MARK: clickers functions
        clickersButtons.button0.addTarget(self, action: #selector(shuffleAction0), for: .touchUpInside)
        clickersButtons.button1.addTarget(self, action: #selector(shuffleAction1), for: .touchUpInside)
        clickersButtons.button2.addTarget(self, action: #selector(shuffleAction2), for: .touchUpInside)
        clickersButtons.button3.addTarget(self, action: #selector(shuffleAction3), for: .touchUpInside)
        
        // MARK: appearance of buttons
        [clickersButtons.button0, clickersButtons.button1, clickersButtons.button2, clickersButtons.button3].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 5
            $0.layer.cornerRadius = 30
            $0.clipsToBounds = true
        }
    }
    func settingImageForClickers() {
        // MARK: images of buttons
        // countriesArrays - shuffled array; that's why we can just use 0...3 elements to receive random pictures
        clickersButtons.button0.setImage(UIImage(named: "\(countriesArray.current[0])"), for: .normal)
        clickersButtons.button1.setImage(UIImage(named: "\(countriesArray.current[1])"), for: .normal)
        clickersButtons.button2.setImage(UIImage(named: "\(countriesArray.current[2])"), for: .normal)
        clickersButtons.button3.setImage(UIImage(named: "\(countriesArray.current[3])"), for: .normal)
        
        // MARK: buttons constraints
        NSLayoutConstraint.activate([clickersButtons.button0.topAnchor.constraint(equalTo: countryName.topAnchor, constant: 90),clickersButtons.button0.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 12),clickersButtons.button0.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.39),clickersButtons.button0.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.168),
                                     
                                     clickersButtons.button1.topAnchor.constraint(equalTo: countryName.topAnchor, constant: 90) ,clickersButtons.button1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -12),clickersButtons.button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.39),clickersButtons.button1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.168),
                                     
                                     clickersButtons.button2.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 12),clickersButtons.button2.topAnchor.constraint(equalTo: clickersButtons.button1.bottomAnchor, constant: 24),clickersButtons.button2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.39),clickersButtons.button2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.168),
                                     
                                     clickersButtons.button3.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -12),clickersButtons.button3.topAnchor.constraint(equalTo: clickersButtons.button1.bottomAnchor, constant: 24),clickersButtons.button3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.39),clickersButtons.button3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.168)])
    }
    
    // MARK: BUTTERY
    func indicatorSeetings() {
        // adding battery elements to view
        [indicator.indicator0, indicator.indicator1, indicator.indicator2, indicator.indicator3, indicator.indicator4, indicator.indicatorFrame, indicator.circle].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        // battery cell appearance settings
        [indicator.indicator0, indicator.indicator1, indicator.indicator2, indicator.indicator3, indicator.indicator4].forEach {
            $0.layer.backgroundColor = UIColor.white.cgColor
            $0.layer.borderWidth = 3
            $0.layer.cornerRadius = 5
        }
        indicator.indicatorFrame.layer.borderWidth = 5
        indicator.indicatorFrame.layer.cornerRadius = 15
        
        // MARK: battery elements constraints
        // ! you should change constants to related with screen size variables if you want to use whis game as a project !
        NSLayoutConstraint.activate([indicator.indicatorFrame.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0), indicator.indicatorFrame.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3), indicator.indicatorFrame.bottomAnchor.constraint(equalTo: score.topAnchor, constant: -17),
                                     
                                     indicator.indicator0.topAnchor.constraint(equalTo: indicator.indicatorFrame.topAnchor, constant: 10), indicator.indicator0.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),  indicator.indicator0.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.255), indicator.indicator0.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
                                     
                                     indicator.indicator1.topAnchor.constraint(equalTo: indicator.indicator0.bottomAnchor, constant: 5),indicator.indicator1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0), indicator.indicator1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.255),indicator.indicator1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
                                     
                                     indicator.indicator2.topAnchor.constraint(equalTo: indicator.indicator1.bottomAnchor, constant: 5),indicator.indicator2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0), indicator.indicator2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.255),indicator.indicator2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
                                     
                                     indicator.indicator3.topAnchor.constraint(equalTo: indicator.indicator2.bottomAnchor, constant: 5),indicator.indicator3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0), indicator.indicator3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.255),indicator.indicator3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
                                     
                                     indicator.indicator4.topAnchor.constraint(equalTo: indicator.indicator3.bottomAnchor, constant: 5),indicator.indicator4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0), indicator.indicator4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.255), indicator.indicator4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03),
                                     
                                     indicator.indicatorFrame.bottomAnchor.constraint(equalTo: indicator.indicator4.bottomAnchor, constant: 10),
                                     
                                     indicator.circle.topAnchor.constraint(equalTo: indicator.indicator3.bottomAnchor, constant: 10),indicator.circle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 55), indicator.circle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.11),indicator.circle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
                                     
                                     bestScoreLabel.topAnchor.constraint(equalTo: indicator.indicator2.topAnchor, constant: -5)
                                    ])
        
        //indicator circle's settings
        indicator.circle.layer.borderWidth = 5
        indicator.circle.layer.borderColor = UIColor.black.cgColor
        indicator.circle.layer.cornerRadius = 20
        indicator.circle.layer.backgroundColor = UIColor.white.cgColor
        indicator.circle.text = "1"
        indicator.circle.textColor = .black
        indicator.circle.textAlignment = .center
        indicator.circle.font = .boldSystemFont(ofSize: 20)
        indicator.circle.font = UIFont(name: "Arial", size: 30)
    }
}
