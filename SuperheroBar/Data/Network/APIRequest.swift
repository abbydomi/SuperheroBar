//
//  APIRequest.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//


import Foundation

struct APIRequest<Body: Encodable> {
    let method: RequestMethod
    let baseUrl: String
    let endpoint: String
    let queryParams: [String: String]?
    let body: Body

    let bearerToken: String?

    init(method: RequestMethod,
         baseUrl: String,
         endpoint: String,
         queryParams: [String: String]? = nil,
         body: Body = EmptyBody(),
         bearerToken: String? = nil) {
        self.method = method
        self.baseUrl = baseUrl
        self.endpoint = endpoint
        self.queryParams = queryParams
        self.body = body
        self.bearerToken = bearerToken
    }
}

enum RequestMethod: String {
    case GET
    case DELETE
    case POST
    case PUT
    case PATCH
}
