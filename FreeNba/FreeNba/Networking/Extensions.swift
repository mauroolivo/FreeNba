import Foundation
import Combine

extension URLSession {
    typealias ErasedDataTaskPublisher = AnyPublisher<(data: Data, response: URLResponse), Error>
    
    func erasedDataTaskPublisher(
        for request: URLRequest
    ) -> ErasedDataTaskPublisher {
        dataTaskPublisher(for: request)
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}

extension URLRequest {
    
    func acceptingJSON() -> URLRequest {
        var request = self
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    func sendingJSON() -> URLRequest {
        var request = self
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    func apiKey() -> URLRequest {
        var request = self
        request.setValue(ApiConfig.APIKEY, forHTTPHeaderField: "x-rapidapi-key")
        return request
    }
}

extension URL {
    
    mutating func addQueryItems(_ urlParams: Parameters?) {
        if let urlParams = urlParams {
            if var urlComponents = URLComponents(url: self,
                                                 resolvingAgainstBaseURL: false) {

                urlComponents.queryItems = [URLQueryItem]()

                for (key, value) in urlParams {
                    let queryItem = URLQueryItem(name: key,
                                                 value: "\(value)")
                    urlComponents.queryItems?.append(queryItem)
                }
                self = urlComponents.url!
            }
        }

    }

}

extension URLRequest {

    mutating func setHeaders(_ headers: HTTPHeaders?) {
        if let headers = headers {
            for (key, value) in headers {
                self.setValue(value, forHTTPHeaderField: key)
            }
        }
    }
    
    mutating func setUrlParams(_ urlParams: Parameters?) {
        guard let params = urlParams else { return }
        if var urlComponents = URLComponents(url: self.url!,
                                             resolvingAgainstBaseURL: false), !params.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in params {
                let queryItem = URLQueryItem(name: key,
                                             value: "\(value)")
                urlComponents.queryItems?.append(queryItem)
            }
            self.url = urlComponents.url
        }
    }

    
}

