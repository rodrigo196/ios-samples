//
//  ViewController.swift
//  NewsFeed
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/15/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableNewsFeed: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Noticias"
        self.loadData(NSURL(string: "http://www.raywenderlich.com/51127/nsurlsession-tutorial")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "Olá"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return 3
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("SegueToDetails", sender: self)
    }
    
    func loadData(url:NSURL) -> Void {
        let session:NSURLSession = NSURLSession()
        session.dataTaskWithURL(url) { (let data:NSData?, let response:NSURLResponse?, let error:NSError?) -> Void in
            print(data)
        }
    }
}

