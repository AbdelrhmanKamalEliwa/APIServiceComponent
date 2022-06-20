//
//  APIResult.swift
//  NetworkLayer
//
//  Created by Abdelrhman Eliwa on 20/06/2022.
//

public enum APIResult<Entity: Decodable> {
    case success(Entity)
    case error(APIError)
}
