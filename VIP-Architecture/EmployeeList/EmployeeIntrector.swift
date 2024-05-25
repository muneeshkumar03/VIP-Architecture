//
//  EmployeeIntrector.swift
//  VIP-Architecture
//
//  Created by Muneesh Kumar on 24/05/24.
//

import Foundation

class EmployeeIntrector {
    var presenter: EmployeePresenterInput?
    var worker = EmployeeWorker()
    
    func getEmployeeData() {
        worker.getEmployeeData(modelType: EmployeeListModel.self, urlStr: "https://dummy.restapiexample.com/api/v1/employees", completion: {[weak self] result in
            switch result {
            case .success(let success):
                self?.presenter?.successEmployeeData(employeeData: success)
            case .failure(let failure):
                self?.presenter?.failureEmployeeData(error: failure)
            }
        })
    }
}
