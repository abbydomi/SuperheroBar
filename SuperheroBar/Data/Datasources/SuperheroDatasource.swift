//
//  SuperheroDatasource.swift
//  apptest
//
//  Created by Abby Dominguez on 1/8/25.
//

struct SuperheroDatasource {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchCharacter(id: Int) async throws -> CharacterResponse {
        let request = APIRequest(method: .GET, baseUrl: APIConstants.baseURL, endpoint: Endpoint.HarleyQuinn)
        return try await apiClient.request(request)
    }
}
