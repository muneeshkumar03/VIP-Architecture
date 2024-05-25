//
//  EmployeePresentor.swift
//  VIP-Architecture
//
//  Created by Muneesh Kumar on 24/05/24.
//

import Foundation

protocol EmployeePresenterInput {
    func successEmployeeData(employeeData: EmployeeListModel)
    func failureEmployeeData(error: VIPError)
}

typealias EmployeePresentorOutput = EmployeeViewInput

class EmployeePresentor {
    var viewController: EmployeePresentorOutput?
}

extension EmployeePresentor: EmployeePresenterInput {
    func successEmployeeData(employeeData: EmployeeListModel) {
        viewController?.successAPIResponse(empoyeeData: employeeData.data)
    }
    
    func failureEmployeeData(error: VIPError) {
        viewController?.failureAPIResponse(errorMessage: error.localizedDescription)
    }
    
    
}
