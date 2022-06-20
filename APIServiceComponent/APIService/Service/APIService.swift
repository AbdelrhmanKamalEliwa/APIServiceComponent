//
//  APIService.swift
//  NetworkLayer
//
//  Created by Abdelrhman Eliwa on 20/06/2022.
//

import Foundation

class APIService: APIServiceContract {
    static let shared = APIService()
    
    private(set) lazy var session: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = NetworkConstants.timeoutIntervalForRequest
        return URLSession(configuration: sessionConfig)
    }()
    
    private let serviceQueue: DispatchQueue
    
    private init() {
        serviceQueue = .init(
            label: NetworkConstants.serviceQueue,
            qos: .userInteractive,
            attributes: .concurrent
        )
    }
    
    func request<Entity: Decodable>(
        using request: URLRequest,
        completionHandler: @escaping(_ result: APIResult<Entity>) -> Void
    ) -> URLSessionTask {
      
        let task = session.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completionHandler(.error(.requestError(error.localizedDescription)))
                return
            }
            
            if let safeData = data {
                do {
                    
                    let stringResponse = String.init(data: safeData, encoding: .utf8)
                    guard let jsonData = stringResponse?.data(using: .utf8) else {
                        completionHandler(.error(.decodingFailure()))
                        return
                    }
                    
                    let decodedData = try JSONDecoder().decode(Entity.self, from: jsonData)
                    completionHandler(.success(decodedData))
                    
                } catch let error {
                    completionHandler(.error(.decodingFailure(error.localizedDescription)))
                }
            }
        }
        
        task.resume()
        return task
    }
}
