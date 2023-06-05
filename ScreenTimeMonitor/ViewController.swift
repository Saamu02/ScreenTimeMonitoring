//
//  ViewController.swift
//  ScreenTimeMonitor
//
//  Created by Apple on 27/05/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swiftUIView = ContentView_Previews.previews
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

    }
}

