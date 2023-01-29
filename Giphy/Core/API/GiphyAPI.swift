//
//  GiphyAPI.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import Alamofire
import Foundation

class GiphyAPI {

    func gifs(offset: Int = 0) async throws -> GiphyData {
        // TODO: - Alex add custom error
        guard let url = URL(string: "https://api.giphy.com/v1/gifs/trending") else {
            throw NSError()
        }
        debugPrint("[a]: offset \(offset)")
        let parameters: Parameters = ["api_key": GiphyInfo.Key.appKey,
                                      "limit": 50,
                                      "offset": offset,
                                      "rating": Rating.g.rawValue]
        let dataTask = AF.request(url, parameters: parameters).serializingDecodable(GiphyData.self)

        do {
            let value = try await dataTask.value
            return value
        } catch {
            debugPrint("file \(#file), function \(#function)")
            throw error
        }
    }
}
