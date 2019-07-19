//
//  ViewController.swift
//  XYZ-Accelerometer
//
//  Created by MISHAL ALHAJRI on 16/11/1440 AH.
//  Copyright © 1440 MISHAL ALHAJRI. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {

    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    var motionManager : CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateAxisLabel)
        
        
    }
    
    func updateAxisLabel(data: CMAccelerometerData?, err : Error?) {
        
        guard let axisData = data else {
            return
        }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        xLabel.text = "X : " + formatter.string(for: axisData.acceleration.x)!
        yLabel.text = "Y : " + formatter.string(for: axisData.acceleration.y)!
        zLabel.text = "Z : " + formatter.string(for: axisData.acceleration.z)!
    }

}

