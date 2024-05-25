//
//  EmployeeListModel.swift
//  VIP-Architecture
//
//  Created by Muneesh Kumar on 24/05/24.
//

import Foundation

// MARK: - EmployeeListModel
struct EmployeeListModel: Codable {
    let status: String
    let data: [Employee]
    let message: String
}

// MARK: - Datum
struct Employee: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}

