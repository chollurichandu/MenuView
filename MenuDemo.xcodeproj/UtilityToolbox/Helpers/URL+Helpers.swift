//
//  URL+Helpers.swift
//  De Leukste Sint
//
//  Created by Frank Burgers on 05/12/2017.
//  Copyright © 2017 Frank Burgers. All rights reserved.
//

import Foundation

public extension URL
{
	public func readDictionaryFromJSONFile(completion: @escaping (_ result: [String: String]) -> Void)
	{
		let sharedSession = URLSession.shared
		
		let downloadTask: URLSessionDownloadTask = sharedSession.downloadTask(with: self, completionHandler: {( location: URL?, response: URLResponse?, error: Error?) -> Void in
			
			guard let loc = location, let res = response as? HTTPURLResponse else {
				return
			}
			
			if res.statusCode != Constants.httpOk {
				NSLog("Expected status code OK while reading from remote URL but received \(res.statusCode) instead.")
			}
			
			do {
				
				let urlContents = try NSString(contentsOf: loc, encoding: String.Encoding.utf8.rawValue)
				
				if let json = try JSONSerialization.jsonObject(with: urlContents.data(using: String.Encoding.utf8.rawValue)!, options: []) as? NSArray {
					
					if json.count > 0 {
						
						var uiDict = [String: String]()
						
						for item in json {
							uiDict[((item as AnyObject).object(forKey: "type") as? String)!] = (item as AnyObject).object(forKey: "text") as? String
						}
						
						completion(uiDict as Dictionary)
					}
				}
			}
			catch {
				NSLog("Unexpected error while reading from remote URL.")
			}
		})
		
		downloadTask.resume()
	}
	
	public func readArrayFromJSONFile(completion: @escaping (_ result: [String]) -> Void)
	{
		let sharedSession = URLSession.shared
		
		let downloadTask: URLSessionDownloadTask = sharedSession.downloadTask(with: self, completionHandler: {( location: URL?, response: URLResponse?, error: Error?) -> Void in
			
			guard let loc = location, let res = response as? HTTPURLResponse else {
				return
			}
			
			if res.statusCode != Constants.httpOk {
				NSLog("Expected status code OK while reading from remote URL but received \(res.statusCode) instead.")
			}
			
			do {
				
				let urlContents = try NSString(contentsOf: loc, encoding: String.Encoding.utf8.rawValue)
				
				if let json = try JSONSerialization.jsonObject(with: urlContents.data(using: String.Encoding.utf8.rawValue)!, options: []) as? NSArray {
					
					if json.count > 0 {
						
						var uiDict = [String]()
						
						for item in json {
							
							if let jsonValue = (item as AnyObject).object(forKey: "value") as? String {
								uiDict.append(jsonValue)
							}
						}
						
						completion(uiDict as Array)
					}
				}
			}
			catch {
				NSLog("Unexpected error while reading from remote URL.")
			}
		})
		
		downloadTask.resume()
	}
	
	public func readRichTextFile(completion: @escaping (_ result: NSAttributedString) -> Void)
	{
		let sharedSession = URLSession.shared
		
		let downloadTask: URLSessionDownloadTask = sharedSession.downloadTask(with: self, completionHandler: {( location: URL?, response: URLResponse?, error: Error?) -> Void in
			
			guard let loc = location, let res = response as? HTTPURLResponse else {
				return
			}
			
			if res.statusCode != Constants.httpOk {
				NSLog("Expected status code OK while reading from remote URL but received \(res.statusCode) instead.")
			}
			
			do {
				
				let attributedText = try NSAttributedString.init(url: loc, options: [.documentType : NSAttributedString.DocumentType.rtf], documentAttributes: nil)
				completion(attributedText)
			}
			catch {
				NSLog("Unexpected error while reading from remote URL.")
			}
			
		})
		
		downloadTask.resume()
	}
}
