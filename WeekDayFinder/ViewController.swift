//
//  ViewController.swift
//  WeekDayFinder
//
//  Created by Евгений Полянский on 09.09.2019.
//  Copyright © 2019 Евгений Полянский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func findDay(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        guard let day = day.text, let month = month.text, let year = year.text else { return }
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date).capitalized
        
        resultLabel.text = weekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

