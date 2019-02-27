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
        let result = Guesser.shared.amIRight(guess: Int(guessNumberTF.text ?? "0")!)
        if result == Result.correct {
            gusserLBL.text = result.rawValue
            displayMessage()
        }
        else {
         gusserLBL.text = result.rawValue
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
                                      message: "You got it in \(Guesser.shared.numGuesses()) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

