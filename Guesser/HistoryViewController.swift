//
//  SecondViewController.swift
//  Guesser
//
//  Created by Jupally,Hari Priya on 2/26/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guesser.shared.numGuesses()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city")!
        cell.textLabel?.text = "Correct Answer: " + String(Guesser.shared.guess(index: indexPath.row).correctAnswer)
        cell.detailTextLabel?.text = "# Attempts: " + String(Guesser.shared.guess(index: indexPath.row).numAttemptsRequired)
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

