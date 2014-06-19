//
//  ListVC.swift
//  Parser_Swift
//
//  Created by Anton Golub on 6/13/14.
//  Copyright (c) 2014 Anton Golub. All rights reserved.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, WebServiceUtilDelegate {
    
    @IBOutlet var tableViewRepos : UITableView
    var reposList: Array<GHRepo>?
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var util = WebServiceUtil()
        util.delegate = self
        util.downloadRepositorieList()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // #pragma mark - UITableView data source and delegate methods
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.reposList ? self.reposList!.count : 0
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as? UITableViewCell
        
        if !cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCell");
        }
        
        var repo = self.reposList![indexPath.row]
        cell!.textLabel.text = repo.name
        cell!.detailTextLabel.text = repo.url?.absoluteString
        
        return cell
    }
    
    
    // #pragma mark - UWebServiceUtilDelegate methods
    func webUtil(webUtil: WebServiceUtil!, didDownloadRepositories reposisotries: Array<GHRepo>!) {
        self.reposList = reposisotries
        self.tableViewRepos.reloadData()
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
