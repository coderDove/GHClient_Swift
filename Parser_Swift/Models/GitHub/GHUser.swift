//
//  GHOwner.swift
//  Parser_Swift
//
//  Created by Anton Golub on 6/14/14.
//  Copyright (c) 2014 Anton Golub. All rights reserved.
//

import Foundation

class GHUser {
    
    var login: String?
    var id: Int?
    var avatarUrl: NSURL?
    var gravatarId: String?
    var url: NSURL?
    var htmlUrl: NSURL?
    var followersUrl: NSURL?
    var followingUrl: NSURL?
    var gistsUrl: NSURL?
    var starredUrl: NSURL?
    var subscriptionsUrl: NSURL?
    var organizationsUrl: NSURL?
    var reposUrl: NSURL?
    var eventsUrl: NSURL?
    var receivedEventsUrl: NSURL?
    var type: String?
    var siteAdmin: Bool?
    
    init(fromDictionary dictionary: NSDictionary) {
        self.login = dictionary.valueForKey("login") as? String
        self.id = dictionary.valueForKey("id") as? Int
        self.avatarUrl = dictionary.valueForKey("avatar_url") as? String ? NSURL(string: dictionary.valueForKey("avatar_url") as String) : nil
        self.gravatarId = dictionary.valueForKey("gravatar_id") as? String
        self.url = dictionary.valueForKey("url") as? String ? NSURL(string: dictionary.valueForKey("url") as String) : nil
        self.htmlUrl = dictionary.valueForKey("html_url") as? String ? NSURL(string: dictionary.valueForKey("html_url") as String) : nil
        self.followersUrl = dictionary.valueForKey("followers_url") as? String ? NSURL(string: dictionary.valueForKey("followers_url") as String) : nil
        self.followingUrl = dictionary.valueForKey("following_url") as? String ? NSURL(string: dictionary.valueForKey("following_url") as String) : nil
        self.gistsUrl = dictionary.valueForKey("gists_url") as? String ? NSURL(string: dictionary.valueForKey("gists_url") as String) : nil
        self.starredUrl = dictionary.valueForKey("starred_url") as? String ? NSURL(string: dictionary.valueForKey("starred_url") as String) : nil
        self.subscriptionsUrl = dictionary.valueForKey("subscriptions_url") as? String ? NSURL(string: dictionary.valueForKey("subscriptions_url") as String) : nil
        self.organizationsUrl = dictionary.valueForKey("organizations_url") as? String ? NSURL(string: dictionary.valueForKey("organizations_url") as String) : nil
        self.reposUrl = dictionary.valueForKey("repos_url") as? String ? NSURL(string: dictionary.valueForKey("repos_url") as String) : nil
        self.eventsUrl = dictionary.valueForKey("events_url") as? String ? NSURL(string: dictionary.valueForKey("events_url") as String) : nil
        self.receivedEventsUrl = dictionary.valueForKey("received_events_url") as? String ? NSURL(string: dictionary.valueForKey("received_events_url") as String) : nil
        self.type = dictionary.valueForKey("type") as? String
        self.siteAdmin = dictionary.valueForKey("site_admin") as? Bool
    }
    
}