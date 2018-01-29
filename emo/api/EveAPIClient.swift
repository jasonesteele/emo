//
//  EveAPIClient.swift
//  emo
//
//  Created by Jason Steele on 1/22/18.
//  Copyright © 2018 Jason Steele. All rights reserved.
//

import Foundation

public class EveAPIClient {
    private let baseEndpoint = "https://esi.tech.ccp.is/latest"
    private let session = URLSession(configuration: URLSessionConfiguration.default)

    public func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.Response>>) {
        let endpoint = self.endpoint(for: request)
        let task = session.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                if let data = data {
                    if httpResponse.statusCode == 200 {
                        do {
                            let value = try JSONDecoder().decode(T.Response.self, from: data)

                            completion(.success(DataContainer<T.Response>(
                                lastModified:
                                    self.parse(timestampStr: httpResponse.allHeaderFields["LastModified"] as? String),
                                expires:
                                    self.parse(timestampStr: httpResponse.allHeaderFields["Expires"] as? String),
                                data: value)))
                        } catch {
                            completion(.failure(APIError.decoding))
                        }
                    } else {
                        do {
                            let errMessage = try JSONDecoder().decode(ErrorResponse.self, from: data)
                            completion(.failure(APIError.server(httpStatus: httpResponse.statusCode, errMessage.error)))
                        } catch {
                            completion(.failure(APIError.server(httpStatus: httpResponse.statusCode,
                                                                String(data: data, encoding: .utf8)!)))
                        }
                    }
                } else if let error = error {
                    completion(.failure(APIError.internalError("\(error)")))
                }
            }
        }
        task.resume()
    }

    private func endpoint<T: APIRequest>(for request: T) -> URL {
        return URL(string: "\(baseEndpoint)/\(request.resourceName)")!
    }

    private func parse(timestampStr: String?) -> Date? {
        var date: Date?
        if timestampStr != nil {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, dd LLL yyyy HH:mm:ss zzz"
            date = dateFormatter.date(from: timestampStr!)
        }
        return date
    }
}
