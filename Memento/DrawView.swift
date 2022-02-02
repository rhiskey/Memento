//
//  DrawView.swift
//  Memento
//
//  Created by Владимир Киселев on 02.02.2022.
//

import UIKit

class DrawView: UIView{
    var carrierState: CarrierState!
    
    var lineWidth: CGFloat!
    var lineColor: UIColor!
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var path: UIBezierPath!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        lineWidth = 10.0
        let lines = LinesManager.shared
        carrierState = CarrierState(linesManager: lines)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        endPoint = touch?.location(in: self)
        carrierState.linesManager.linesArray.append(LineModel(start: startPoint, end: endPoint, color: lineColor))
        
        path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        startPoint = endPoint
        
    }
    
    private func drawShapeLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        //Redraw view
        self.setNeedsDisplay()
        
    }
}
