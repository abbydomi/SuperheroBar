//
//  APIClient.swift
//  apptest
//
//  Created by Abby Dominguez on 1/8/25.
//

import Foundation

struct APIClient {
    private let apikey: String
    private let session: URLSession
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    init(apiKey: String) {
        self.apikey = apiKey
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json; charset=UTF-8"]
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        let session = URLSession(configuration: config)
        self.session = session
    }

    func request<Request: Encodable, Response: Decodable>(_ request: APIRequest<Request>) async throws -> Response {
        let data = try await sendRequest(request)
        return try decoder.decode(Response.self, from: data)
    }

    func request<Request: Encodable>(_ request: APIRequest<Request>) async throws {
        try await sendRequest(request)
    }
}

// MARK: - Private
private extension APIClient {
    @discardableResult
    private func sendRequest<Request: Encodable>(_ request: APIRequest<Request>) async throws -> Data {
        guard let urlRequest = try buildUrlRequest(with: request) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let errorResponse = try decoder.decode(ErrorResponse.self, from: data)
            throw APIError(error: String(errorResponse.response ?? "Unknown error"),
                           message: errorResponse.error ?? "Unknown error",
                           statusCode: .badRequest)
        }

        return data
    }

    private func buildUrlRequest<Body: Encodable>(with apiRequest: APIRequest<Body>) throws -> URLRequest? {
        let urlString: String = "\(apiRequest.baseUrl)/\(apikey)/\(apiRequest.endpoint)"
        var request: URLRequest

        guard let url = URL(string: urlString) else { return nil }
        let data = try encoder.encode(apiRequest.body)
        request = URLRequest(url: url)
        request.httpBody = data
        guard let url = buildQueryParams(url: urlString, params: apiRequest.queryParams) else { return nil }
        request = URLRequest(url: url)

        request.httpMethod = apiRequest.method.rawValue
        request.cachePolicy = .reloadIgnoringCacheData

        print(request)
        return request
    }

    private func buildQueryParams(url: String, params: [String: String]?) -> URL? {
        guard var components = URLComponents(string: url) else { return nil }
        components.queryItems = params?.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

        return components.url
    }
}

