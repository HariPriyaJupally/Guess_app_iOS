//
//  StatisticsViewController.swift
//  Guesser
//
//  Created by Jupally,Hari Priya on 2/26/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    @IBOutlet weak var minTF: UILabel!
    
    @IBOutlet weak var maxTF: UILabel!
    
    @IBOutlet weak var meanTF: UILabel!
    
    @IBOutlet weak var standardDeviationTF: UILabel!
    
    @IBAction func clearStatisticsBTN(_ sender: Any) {
        minTF.text = "0"
        maxTF.text = "0"
        meanTF.text = "0"
        standardDeviationTF.text = "0"
        Guesser.shared.clearStatistics()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       allFieldsFunction()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        allFieldsFunction()
    }
    
    func allFieldsFunction(){
        minTF.text = String(Guesser.shared.minimumNumAttempts())
        maxTF.text = String(Guesser.shared.maximumNumAttempts())
        if Guesser.shared.numGuesses() == 0 {
            meanTF.text = "0.0"
            standardDeviationTF.text = "0.0"
        }
        else {
        var count = 0
        for i in 0..<Guesser.shared.numGuesses(){
            count += Guesser.shared.guess(index: i).numAttemptsRequired
        }
        
        let mean = Double(count)/Double(Guesser.shared.numGuesses())
        meanTF.text = "\(mean)"
        var stdDevSum = 0.0
        for i in 0..<Guesser.shared.numGuesses(){
            stdDevSum += pow(Double(Guesser.shared.guess(index: i).numAttemptsRequired) - mean, 2)
        }
        standardDeviationTF.text = "\(stdDevSum/Double(Guesser.shared.numGuesses()))"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
