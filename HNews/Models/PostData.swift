//
//  PostData.swift
//  HNews
//
//  Created by Donna on 2022/06/17.
//

import Foundation

struct Results:Codable{
    let hits:[Post]
}

struct Post:Codable,Identifiable{
    var id:String {
        return objectID
    }
    let title:String
    let url:String?
    let points:Int
    let objectID:String
}
