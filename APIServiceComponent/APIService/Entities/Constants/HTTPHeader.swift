//
//  HTTPHeader.swift
//  NetworkLayer
//
//  Created by Abdelrhman Eliwa on 20/06/2022.
//

/// Enumeration that represents types of Network Headers
public typealias HTTPHeaders = [String: String]
public enum HTTPHeader {
    static let contentType = "Content-Type"
    static let authentication = "Authorization"
}
