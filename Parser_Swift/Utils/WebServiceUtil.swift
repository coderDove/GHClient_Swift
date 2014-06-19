//
//  WebServiceUtil.swift
//  Parser_Swift
//
//  Created by Anton Golub on 6/13/14.
//  Copyright (c) 2014 Anton Golub. All rights reserved.
//

import Foundation

protocol WebServiceUtilDelegate {
    func webUtil(webUtil: WebServiceUtil!, didDownloadRepositories reposisotries: Array<GHRepo>!)
}

class WebServiceUtil: NSObject, NSURLConnectionDataDelegate {
    
    var downloadedData: NSMutableData?
    var delegate: WebServiceUtilDelegate?
    
    func downloadRepositorieList () {
        var downloadUrl = NSURL.URLWithString("https://api.github.com/users/coderDove/repos")
        var request = NSMutableURLRequest(URL: downloadUrl)
        request.HTTPMethod = "GET"
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
    }
    
    
    // #pragma mark - NSURLConnection delegate methods
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        if !downloadedData {
            downloadedData = NSMutableData()
        } else {
            downloadedData!.length = 0
        }
    }
    
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        println(error.localizedDescription)
    }
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        downloadedData!.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var reposList = Array<GHRepo>()
        if let parsedList = NSJSONSerialization.JSONObjectWithData(downloadedData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSArray {
            for repoItem in parsedList {
                if let repoDict = repoItem as? NSDictionary {
                    var repo = GHRepo(fromDictionary: repoDict)
                    reposList.append(repo)
                }
            }
        }

        self.delegate?.webUtil(self, didDownloadRepositories:reposList)
    }
}