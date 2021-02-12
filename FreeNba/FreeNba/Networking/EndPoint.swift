import Foundation

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String: Any]

protocol EndPoint {
    var url: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get } 
    var headers: HTTPHeaders? { get }
    var body: Data? { get }
    var urlParams: Parameters? { get }
}

extension EndPoint {
    
    func request()-> URLRequest {
        
            var request = URLRequest(url: url.appendingPathComponent(path))
            
            request.httpMethod = httpMethod.rawValue
            request.setHeaders(headers)
            request.setUrlParams(urlParams)
            request.httpBody = body
        
            return request
        
    }

}

struct TeamsEndPoint: EndPoint {
    let url = URL(string: ApiConfig.DOMAIN)!
    var path = "/teams"
    let httpMethod = HTTPMethod.get
    var body: Data?
    var headers: HTTPHeaders?
    var urlParams: Parameters?

    init() {}
    
}

struct PlayersEndPoint: EndPoint {
    let url = URL(string: ApiConfig.DOMAIN)!
    var path = "/players"
    let httpMethod = HTTPMethod.get
    var body: Data?
    var headers: HTTPHeaders?
    var urlParams: Parameters?

    init() {}
    
}

struct PlayerEndPoint: EndPoint {
    let url = URL(string: ApiConfig.DOMAIN)!
    var path = "/players"
    let httpMethod = HTTPMethod.get
    var body: Data?
    var headers: HTTPHeaders?
    var urlParams: Parameters?

    init(_ id: String) {
        self.path = "\(path)/\(id)"
    }
    
}
