//
//  Functions.swift
//  GuessFlag2
//
//  Created by Nikita Stepanov on  17.09.2022.
//

import Foundation
import UIKit

extension MainViewController {
    // MARK: ANSWERS
    func rightAnswer() {
        print(countriesArray.current)
        var count = 0
        clickersButtons.rightAnswer = countriesArray.current[Int.random(in: 0...3)]
        // here we changing right answer if it have been already
        var tried: [String] = [] // check if all possible answers have been already
        while previousRightAnswers.contains(clickersButtons.rightAnswer) {
            count += 1
            tried.append(clickersButtons.rightAnswer)
            countryName.text = clickersButtons.rightAnswer
            clickersButtons.rightAnswer = countriesArray.current[Int.random(in: 0...3)]
            if tried.count == 4 {
                break
            }
        }
    }
    
    // MARK: BATTERIE
   func lavelIndicator() {
        switch clickersButtons.count % 10 {
        case 2: indicator.indicator4.layer.backgroundColor = UIColor.systemMint.cgColor
        case 4: indicator.indicator3.layer.backgroundColor = UIColor.green.cgColor
        case 6: indicator.indicator2.layer.backgroundColor = UIColor.yellow.cgColor
        case 8: indicator.indicator1.layer.backgroundColor = UIColor.orange.cgColor
        case 0: if clickersButtons.count == 0 {
            indicator.indicator4.layer.backgroundColor = UIColor.red.cgColor
        }
            else {
                indicator.indicator0.layer.backgroundColor = UIColor.red.cgColor
            }
        default:
            if clickersButtons.count % 10 == 1 {
                [indicator.indicator0, indicator.indicator1, indicator.indicator2, indicator.indicator3, indicator.indicator4].forEach {
                    $0.layer.backgroundColor = UIColor.white.cgColor
                    $0.layer.borderColor = UIColor.black.cgColor
                }
                score.textColor = UIColor.black
            }
        }
    }
    
    // MARK: RECORD
    func newRecord() {
        // make a key in UserDefaults
        UserDefaults.standard.integer(forKey: "score")
        // checking if the current score is the new record
        if clickersButtons.count > UserDefaults.standard.integer(forKey: "score") {
            UserDefaults.standard.set(clickersButtons.count, forKey: "score")
        }
    }
    
    func bestScore() {
        newRecord()
        bestScoreLabel.text = "Рекорд: \(Swift.max(UserDefaults.standard.integer(forKey: "score"), clickersButtons.count))"
    }
    
    // MARK: "TAPPs" LOGIC
    //checking answer, replacing arrays, changing level indicator etc
    func tapped(_ country: String){
        lavelIndicator()
        if country == countryName.text {
            previousRightAnswers.append(clickersButtons.rightAnswer) // append potential answer to all answers array
            clickersButtons.count += 1
            // here are levels changings; for example, you can use different countries arrays for different levels
            if clickersButtons.count > 10 {
                countriesArray.current = countriesArray.countries1
                indicator.circle.text = "2"
            }
            if clickersButtons.count > 20 {
                countriesArray.current = countriesArray.countries2
                indicator.circle.text = "3"
            }
            if clickersButtons.count > 30 {
                countriesArray.current = countriesArray.countries3
                indicator.circle.text = "\(Int((clickersButtons.count-1)/10)+1)"
            }
        }
        else {
            clickersButtons.count = 0
            indicator.circle.text = "1"
            countriesArray.current = countriesArray.countries0
            score.text = "Это \(country)!"
            score.textColor = UIColor.red
            indicator.indicatorFrame.layer.borderColor = UIColor.red.cgColor
            [indicator.indicator0, indicator.indicator1, indicator.indicator2, indicator.indicator3, indicator.indicator4].forEach{
                $0.layer.borderColor = UIColor.red.cgColor
            }
            [indicator.indicator0, indicator.indicator1, indicator.indicator2, indicator.indicator3].forEach{
                $0.layer.backgroundColor = UIColor.white.cgColor
            }
            indicator.circle.layer.borderColor = UIColor.red.cgColor
        }
        bestScore()
        countriesArray.current = countriesArray.current.shuffled()
        rightAnswer()
        countryName.text = clickersButtons.rightAnswer
        settingImageForClickers()
        
        // some apperance settings after wrong answer (making UI elemnts ordinary again)
        if score.textColor != UIColor.red {
            score.text = "Общий счет:" + " \(clickersButtons.count)"
        }
        indicator.indicatorFrame.layer.backgroundColor = UIColor.clear.cgColor
        indicator.indicatorFrame.layer.borderColor = UIColor.black.cgColor
        indicator.circle.layer.borderColor = UIColor.black.cgColor
        lavelIndicator()
    }
    
    @objc func shuffleAction0() {
        tapped(countriesArray.current[0])
    }
    @objc func shuffleAction1() {
        tapped(countriesArray.current[1])
    }
    @objc func shuffleAction2() {
        tapped(countriesArray.current[2])
    }
    @objc func shuffleAction3() {
        tapped(countriesArray.current[3])
    }
}
