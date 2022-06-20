//
//  RequestParameters.swift
//  NetworkLayer
//
//  Created by Abdelrhman Eliwa on 20/06/2022.
//

/// Enumeration that represents type of Network Parameters
public typealias Parameters = [String: Any]
public enum RequestParameters {
    case body(_: Parameters)
    case query(_: Parameters)
}
