//
//  ViewController.swift
//  NewsFeed
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/15/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate {

    @IBOutlet weak var tableNewsFeed: UITableView!
    
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var link:String = ""
    let url:String = "http://m.app.uol.com.br/aplicativo/uol/noticias/ultimas-noticias/noticias/?plataforma=android"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Noticias"
        beginParser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITAbleViewDelegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("title") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
           return posts.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(posts[indexPath.row])
        self.performSegueWithIdentifier("SegueToDetails", sender: self)
    }
    
    // MARK: - Data
    
    func loadData(url:NSURL) -> Void {
        let session:NSURLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        session.dataTaskWithURL(url) { (let data:NSData?, let response:NSURLResponse?, let error:NSError?) -> Void in
            print(data)
        }.resume()
    }
    
    // MARK: - Parser delegate

    func beginParser() -> Void {
        posts = []
        parser = NSXMLParser(contentsOfURL:(NSURL(string:url))!)!
        parser.delegate = self
        parser.parse()
        tableNewsFeed!.reloadData()
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName
        if (elementName as NSString).isEqualToString("title")
        {
            elements = NSMutableDictionary()
            elements = [:]
            title1 = NSMutableString()
            title1 = ""
            link = ""
        }else if (element as NSString).isEqualToString("link") &&  attributeDict["rel"] != nil && (attributeDict["rel"]! as NSString).isEqualToString("alternate"){
            if let href = attributeDict["href"]{
                link = href
            }else{
                print("Sem link!")
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String)
    {
        if element.isEqualToString("title") {
            title1.appendString(string)
        }
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("entry") {
            if !title1.isEqual(nil) {
                elements.setObject(title1, forKey: "title")
            }
            if !link.isEqual(nil) {
                elements.setObject(link, forKey: "link")
            }
            posts.addObject(elements)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableNewsFeed.indexPathForSelectedRow
        if segue.identifier == "SegueToDetails" {
            let viewController:DetailsViewController = segue.destinationViewController as! DetailsViewController
            viewController.news = posts[(indexPath?.row)!] as! NSMutableDictionary
            tableNewsFeed.deselectRowAtIndexPath(indexPath!, animated: true)
        }
        
    }
}

