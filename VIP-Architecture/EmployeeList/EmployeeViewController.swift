//
//  ViewController.swift
//  VIP-Architecture
//
//  Created by Muneesh Kumar on 24/05/24.
//

import UIKit

protocol EmployeeViewInput {
    func successAPIResponse(empoyeeData: [Employee])
    func failureAPIResponse(errorMessage: String)
}
protocol EmployeeViewOutput {
    func getEmployeeData()
}

class EmployeeViewController: UIViewController {
    var interector = EmployeeIntrector()
    let presenter = EmployeePresentor()
    let worker = EmployeeWorker()
    var router = EmployeeRouter()
    override func viewDidLoad() {
        super.viewDidLoad()
        interector.getEmployeeData()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        let viewController = self
        viewController.interector = interector
        viewController.router = router
        interector.presenter = presenter
        presenter.viewController = viewController
    }
}

extension EmployeeViewController: EmployeeViewInput {
    func successAPIResponse(empoyeeData: [Employee]) {
        print("Employee data \(empoyeeData)")
    }
    func failureAPIResponse(errorMessage: String) {
        print("Error Message \(errorMessage)")
        router.displayErrorScreen(errorMessage: errorMessage)
    }
}
