//
//  FirstViewController.swift
//  Guesser
//
//  Created by Jupally,Hari Priya on 2/26/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import UIKit

class GuesserViewController: UIViewController {

    
    @IBOutlet weak var guessNumberTF: UITextField!
    
    @IBOutlet weak var gusserLBL: UILabel!
    @IBAction func amIRightBTN(_ sender: Any) {
        if let value = Int(guessNumberTF.text!) {
            let result = Guesser.shared.amIRight(guess: Int(value))
            if result == Result.correct{
                gusserLBL.text = result.rawValue
                displayMessage()
                Guesser.shared.createNewProblem()
            }else{
                gusserLBL.text = result.rawValue
            }
        }else{
            invalidInput()
        }
    }
    
    
    @IBAction func createNewProblemBTN(_ sender: Any) {
        gusserLBL.text = ""
        guessNumberTF.text = ""
        Guesser.shared.createNewProblem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Guesser.shared.createNewProblem()
    }

    func displayMessage(){
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(Guesser.shared.numAttempts) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func invalidInput(){
        let alert = UIAlertController(title: "Invalid Input",
                                      message: "You have entered an invalid input. Please enter a value from range 1-10",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

