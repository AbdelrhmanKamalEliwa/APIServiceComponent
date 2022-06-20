//
//  APIError.swift
//  NetworkLayer
//
//  Created by Abdelrhman Eliwa on 20/06/2022.
//

import Foundation

public enum APIError: Error {
    case decodingFailure(_: String? = nil)
    case requestTimeOut(_: String? = nil)
    case requestError(_: String? = nil)
    case notFound(_: String? = nil)
    case unexpected(code: Int)
}

extension APIError {
    var isFatal: Bool {
        if case APIError.unexpected = self { return true }
        else { return false }
    }
}


extension APIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .decodingFailure(let errorMsg):
            return errorMsg ?? "Invalid decoding data"
        case .requestTimeOut(let errorMsg):
            return errorMsg ?? "Request time out"
        case .requestError(let errorMsg):
            return errorMsg ?? "Can't make request"
        case .notFound(let errorMsg):
            return errorMsg ?? "Not found"
        case .unexpected:
            return "An unexpected error occurred."
        }
    }
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingFailure(let errorMsg):
            return errorMsg ?? "Invalid decoding data"
        case .requestTimeOut(let errorMsg):
            return errorMsg ?? "Request time out"
        case .requestError(let errorMsg):
            return errorMsg ?? "Can't make request"
        case .notFound(let errorMsg):
            return errorMsg ?? "Not found"
        case .unexpected:
            return "An unexpected error occurred."
        }
    }
}
