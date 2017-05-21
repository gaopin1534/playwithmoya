//
//  HackersNewsAPI.swift
//  playWithMoya
//
//  Created by 高松幸平 on 2017/05/21.
//  Copyright © 2017年 gaopin. All rights reserved.
//

import Foundation
import Moya

enum HackersNewsAPI {
    case item(id: String)
    case user(id: String)
    case maxItem
    case topStories
    case newStories
}

extension HackersNewsAPI: TargetType {
    // ベースURL
    var baseURL: URL {
        return URL(string: "https://hacker-news.firebaseio.com/v0")!
    }
    
    // それぞれのターゲットごとのpath
    var path: String {
        switch self {
        case .item(let id), .user(let id):
            return "/\(id).json"
        case .maxItem:
            return "/maxitem.json"
        case .newStories:
            return "/newstories.json"
        case .topStories:
            return "/topstories.json"
        }
    }
    
    // それぞれのターゲットごとのhttpメソッド
    // 今回はgetしかないが、postなどある場合はswitch selfなどで適切な値を返す
    var method: Moya.Method {
        switch  self {
        case .item, .user, .maxItem, .newStories, .topStories:
            return .get
        }
    }

    // 今回はパラメーターとして渡さないのですべてnil
    var parameters: [String: Any]? {
        return nil
    }
    
    // パラメーターのエンコーディング指定
    // リクエストボデイにjsonとしてセットすることもできる
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    // テスト時に使われる(なんでマストなのかわからない)
    // めんどくさかったので今回はずるします
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch  self {
        case .item, .user, .maxItem, .newStories, .topStories:
            return .request
        }
    }
}
