//
//  APIClient.swift
//  ShowMeYourCode
//
//  Created by rafael on 22/8/21.
//

import Foundation

final class APIClient {
    
    private var baseURL: URL?
    
    private init(baseURL: String) {
        self.baseURL = URL(string: baseURL)
    }
    
    let session = URLSession(configuration: .default)
    
    static let shared = {
        APIClient(baseURL: APIManager.shared.URL_BASE)
    }()
    
    func send<T>(request: T, completion: @escaping(Result<T.Response, Error>) -> Void) where T: APIRequestProtocol {
        guard let endPoint = self.endPoint(for: request) else { return }
        session.dataTask(with: URLRequest(url: endPoint)) { data, response, err in
            var anyError: NetworkError?
            defer {
                if let error = anyError {
                    completion(.failure(error))
                }
            }
            guard let data = data, let response = response as? HTTPURLResponse, err == nil else {
                anyError = .connectionError
                return
            }
            guard 200..<300 ~=  response.statusCode else {
                anyError = NetworkError.checkErrorCode(response.statusCode)
                return
            }
            
            do {
                let items = try JSONDecoder().decode(T.Response.self, from: data)
                completion(.success(items))
            } catch {
                anyError = .unknownError
            }
            
        }.resume()
    }
    
    private func endPoint<T: APIRequestProtocol>(for request: T) -> URL? {
        guard let baseURL = URL(string: request.endPoint, relativeTo: self.baseURL as URL?) else { return nil }
        
        let components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        
        return components.url
    }
    
}
