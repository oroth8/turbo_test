//
//  WebViewController.swift
//  turbo test
//
//  Created by Owen Roth on 2/7/23.
//

import UIKit
import Turbo

class WebViewController: VisitableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func visitableDidRender(){
        title = "My Application"
    }
}
