//
//  APIError.swift
//  Data
//
//  Created by Abby Dominguez on 25/11/24.
//

struct APIError: Error {
    let error: String
    let message: String
    let statusCode: StatusCode
}

enum StatusCode: Int {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case requestTimeout = 408
    case internalServerError = 500
}
