//
//  ViewController.swift
//  Memento
//
//  Created by Владимир Киселев on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBoard: DrawView!
    
    var carrierState: CarrierState!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBoard.lineColor = UIColor.black
        
        let lines = LinesManager.shared
        carrierState = CarrierState(linesManager: lines)
    }

    @IBAction func saveAction(_ sender: Any) {
        carrierState.saveLine()
    }
    @IBAction func loadAction(_ sender: Any) {
        carrierState.loadLine()
        carrierState.linesManager.printLines(in: viewBoard)
    }
    
    @IBAction func blueAction(_ sender: Any) {
        // #colorLiteral()
        viewBoard.lineColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    @IBAction func yellowAction(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    }
    @IBAction func greenAction(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
    
}

