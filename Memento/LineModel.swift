//
//  LineModel.swift
//  Memento
//
//  Created by Владимир Киселев on 02.02.2022.
//

import UIKit

struct LineModel{
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start: CGPoint, end: CGPoint, color: UIColor){
        self.start = start
        self.end = end
        self.color = color
    }
}
