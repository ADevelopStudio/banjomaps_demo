//
//  ConnectionManager.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

struct ConnectionManager {
    static let getColorUrl = "http://www.colourlovers.com/api/colors/random?format=json"
    static let getImageUrl = "http://www.colourlovers.com/api/patterns/random?format=json"
    
    static func downloadSampleImage(completion: @escaping (UIImage?)->()) {
        self.getImageUrl { (url) in
            guard let url = url else {
                completion(nil)
                return
            }
            self.downloadImageFrom(url: url, completion: completion)
        }
    }
    
    private static func downloadImageFrom(url: URL, completion: @escaping (UIImage?)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {completion(nil)}
                return
            }
            DispatchQueue.main.async {completion(UIImage(data: data))}
            }.resume()
    }
    
    
    private static func getImageUrl(completion: @escaping (_ url: URL?)->()) {
        guard let url = URL(string: self.getImageUrl) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            do {
                guard let data = data else {throw JSONError.NoData}
                let decoder = JSONDecoder()
                guard let links  = try? decoder.decode([ImageLink].self, from: data) else {throw JSONError.ConversionFailed}
                DispatchQueue.main.async {completion(links.first?.url)}
            } catch let error as JSONError {
                print(error)
                DispatchQueue.main.async {completion(nil)}
            } catch let error as NSError {
                print(error.localizedDescription)
                DispatchQueue.main.async {completion(nil)}
            }
            }.resume()
    }
    
    static func getColor(completion: @escaping (_ color: UIColor?)->()) {
        guard let url = URL(string: self.getColorUrl) else {
            completion(Constants.colors.randomItem())
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            do {
                guard let data = data else {throw JSONError.NoData}
                let decoder = JSONDecoder()
                guard let colors  = try? decoder.decode([LoadedColor].self, from: data) else {throw JSONError.ConversionFailed}
                DispatchQueue.main.async {completion(colors.first?.toColor())}
            } catch let error as JSONError {
                print(error)
                DispatchQueue.main.async {completion(Constants.colors.randomItem())}
            } catch let error as NSError {
                print(error.localizedDescription)
                DispatchQueue.main.async {completion(Constants.colors.randomItem())}
            }
            }.resume()
    }
    
}
