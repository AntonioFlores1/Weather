//
//  AppError.swift
//  Weather
//
//  Created by Antonio Flores on 6/12/21.
//

import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode(statusCode:Int)
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
