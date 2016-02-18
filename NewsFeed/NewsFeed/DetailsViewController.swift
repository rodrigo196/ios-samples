//
//  DetailsViewController.swift
//  NewsFeed
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/18/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var news = NSMutableDictionary();

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(news)
        self.navigationItem.title = news["title"] as? String
        webView.loadRequest(NSURLRequest(URL: NSURL(string: (news["link"] as? String)!)!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
