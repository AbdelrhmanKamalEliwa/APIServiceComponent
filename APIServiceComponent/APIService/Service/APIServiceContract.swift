//
//  APIServiceContract.swift
//  NetworkLayer
//
//  Created by Abdelrhman Eliwa on 20/06/2022.
//

import Foundation

protocol APIServiceContract {
    func request<Entity: Decodable>(
        using request: URLRequest,
        completionHandler: @escaping(_ result: APIResult<Entity>) -> Void
    ) -> URLSessionTask
}
