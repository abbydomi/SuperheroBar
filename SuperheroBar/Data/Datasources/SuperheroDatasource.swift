//
//  SuperheroDatasource.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

struct SuperheroDatasource {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchCharacter(id: Int) async throws -> SuperheroResponse {
        print(id)
        let request = APIRequest(method: .GET, baseUrl: APIConstants.baseURL, endpoint: String(id))
        return try await apiClient.request(request)
    }
}
