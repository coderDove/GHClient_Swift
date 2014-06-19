//
//  GHRepo.swift
//  Parser_Swift
//
//  Created by Anton Golub on 6/16/14.
//  Copyright (c) 2014 Anton Golub. All rights reserved.
//

import Foundation

class GHRepo {
    
    var id: Int?
    var owner: GHUser?
    var name: String?
    var fullName: String?
    var description: String?
    var private: Bool?
    var fork: Bool?
    var url: NSURL?
    var htmlUrl: NSURL?
    var cloneUrl: NSURL?
    var gitUrl: NSURL?
    var sshUrl: NSURL?
    var svnUrl: NSURL?
    var mirrorUrl: NSURL?
    var homepage: NSURL?
    var language: String?
    var forksCount: Int?
    var stargazersCount: Int?
    var watchersCount: Int?
    var size: Int?
    var defaultBranch: String?
    var openIssuesCount: Int?
    var hasIssues: Bool?
    var hasWiki: Bool?
    var hasDownloads: Bool?
    var pushedAt: NSDate?
    var createdAt: NSDate?
    var updatedAt: NSDate?
    var permissions: (admin: Bool?, push: Bool?, pull: Bool?)
    

    init (fromDictionary dictionary: NSDictionary) {
        self.id = dictionary.valueForKey("id") as? Int
        self.owner = dictionary.valueForKey("owner") ? GHUser(fromDictionary: dictionary.valueForKey("owner") as NSDictionary) : nil
        self.name = dictionary .valueForKey("name") as? String
        self.fullName = dictionary.valueForKey("full_name") as? String
        self.description = dictionary.valueForKey("description") as? String
        self.private = dictionary.valueForKey("private") as? Bool
        self.fork = dictionary.valueForKey("fork") as? Bool
        self.url = dictionary.valueForKey("url") as? String ? NSURL(string: dictionary.valueForKey("url") as String) : nil
        self.htmlUrl = dictionary.valueForKey("html_url") as? String ? NSURL(string: dictionary.valueForKey("html_url") as String) : nil
        self.cloneUrl = dictionary.valueForKey("clone_url") as? String ? NSURL(string: dictionary.valueForKey("clone_url") as? String) : nil
        self.gitUrl = dictionary.valueForKey("git_url") as? String ? NSURL(string: dictionary.valueForKey("git_url") as String) : nil
        self.sshUrl = dictionary.valueForKey("ssh_url") as? String ? NSURL(string: dictionary.valueForKey("ssh_url") as String) : nil
        self.svnUrl = dictionary.valueForKey("svn_url") as? String ? NSURL(string: dictionary.valueForKey("svn_url") as String) : nil
        self.mirrorUrl = dictionary.valueForKey("mirror_url") as? String ? NSURL(string: dictionary.valueForKey("mirror_url") as String) : nil
        self.homepage = dictionary.valueForKey("homepage") as? String ? NSURL(string: dictionary.valueForKey("homepage") as String) : nil
        self.language = dictionary.valueForKey("language") as? String
        self.forksCount = dictionary.valueForKey("forks_count") as? Int
        self.stargazersCount = dictionary.valueForKey("stargazers_count") as? Int
        self.watchersCount = dictionary.valueForKey("watchers_count") as? Int
        self.size = dictionary.valueForKey("size") as? Int
        self.defaultBranch = dictionary.valueForKey("default_branch") as? String
        self.openIssuesCount = dictionary.valueForKey("open_issues_count") as? Int
        self.hasIssues = dictionary.valueForKey("has_issues") as? Bool
        self.hasWiki = dictionary.valueForKey("has_wiki") as? Bool
        self.hasDownloads = dictionary.valueForKey("has_downloads") as? Bool
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DDThh:mmZ"
        self.pushedAt = dictionary.valueForKey("pushed_at") as? String ? dateFormatter.dateFromString(dictionary.valueForKey("pushed_at") as String) : nil
        self.updatedAt = dictionary.valueForKey("updated_at") as? String ? dateFormatter.dateFromString(dictionary.valueForKey("updated_at") as String) : nil
        self.createdAt = dictionary.valueForKey("created_at") as? String ? dateFormatter.dateFromString(dictionary.valueForKey("created_at") as String) : nil
        
        if let permissionsDict = dictionary.valueForKey("permissions") as? NSDictionary {
            permissions.admin = permissionsDict.valueForKey("admin") as? Bool
            permissions.push = permissionsDict.valueForKey("push") as? Bool
            permissions.pull = permissionsDict.valueForKey("pull") as? Bool
        }

    }
    
}