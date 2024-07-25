//
//  NetworkRequest.swift
//  Polaroid
//
//  Created by 홍정민 on 7/24/24.
//

import Foundation
import Alamofire

enum NetworkRequest {
    case photoSearch(_ reqest: PhotoSearchRequest)
    case topicPhoto(_ request: TopicPhotoRequest)

    private enum RequestCondition: String {
        case query
        case page
        case pageCount = "per_page"
        case orderBy = "order_by"
        case color
        case topicID
        case clientId = "client_id"
    }
    
    var baseURL: String {
        return APIURL.unsplash
    }
    
    var endPoint: String {
        switch self {
        case .photoSearch:
            return baseURL + "/search/photos"
        case .topicPhoto(let request):
            return baseURL + "/topics/\(request.topicID)/photos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .photoSearch, .topicPhoto:
            return .get
        }
    }
    
    var param: [String: String] {
        switch self {
        case .photoSearch(let request):
            return [
                RequestCondition.query.rawValue: request.query,
                RequestCondition.page.rawValue: "\(request.page)",
                RequestCondition.pageCount.rawValue: "\(request.per_page)",
                RequestCondition.orderBy.rawValue: request.order_by,
                RequestCondition.clientId.rawValue: APIKey.unsplash
            ]
        case .topicPhoto(let request):
            return [
                RequestCondition.page.rawValue: "\(request.page)",
                RequestCondition.clientId.rawValue: APIKey.unsplash
            ]
        }
    }
    
}

