//
//  LinesManager.swift
//  Memento
//
//  Created by Владимир Киселев on 02.02.2022.
//

import UIKit


class LinesManager{
    static let shared = LinesManager() //Singleton link to one object always
    
    var linesArray = [LineModel]()
    
    func save() -> StateLinesMemento {
        return StateLinesMemento(lines: self.linesArray)
    }
    
    func load(state: StateLinesMemento){
        self.linesArray = state.linesArray
    }
    
    func printLines(in view: UIView){
        for v in view.layer.sublayers!{
            v.removeFromSuperlayer()
        }
        
        for line in linesArray {
            let path = UIBezierPath()
            path.move(to: line.start)
            path.addLine(to: line.end)
            drawShapeLayer(path, line.color, view)
        }
    }
    
    
    private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView){ // symbol '_' - means internal variable
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
        //Redraw view
        view.setNeedsDisplay()
        
    }
}
