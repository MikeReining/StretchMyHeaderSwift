//
//  MasterViewController.swift
//  StretchMyHeaderSwift
//
//  Created by Michael Reining on 2/17/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit
import Foundation

private let kTableHeaderHeight: CGFloat = 300.0
private let kTableheaderCutAway: CGFloat = 80.0
private let adjustedHeight = kTableHeaderHeight - kTableheaderCutAway / 2

class MasterViewController: UITableViewController, UIScrollViewDelegate {
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    var detailViewController: DetailViewController? = nil
    var objects = data
    var newsItems = newsFromData(data)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Custom Table Header implementation
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: adjustedHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -adjustedHeight)
        
        // Adding CALayer
        headerMaskLayer = CAShapeLayer()
        headerView.layer.mask = headerMaskLayer
        
        updateHeaderView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as Dictionary
                let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as TableViewCell

        let newsItem = newsItems[indexPath.row]
        cell.headlineLabel.text = newsItem.headline
        cell.categoryLabel.text = newsItem.category.simpleDescription().uppercaseString
        
        cell.categoryLabel.textColor = newsItem.category.setColor()
        return cell
        
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //MARK:  Custom Table Header
    func updateHeaderView() {

        var headerRect = CGRect(x: 0, y: -adjustedHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        // when we pull down beyond the top of the table view (contentOffset < -kTableHeaderHeight)
        // then we stretch the header image
        if tableView.contentOffset.y < -adjustedHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableheaderCutAway / 2
        }
        headerView.frame = headerRect
        
        // Custom Layer to cut away part of image
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: headerRect.height - kTableheaderCutAway)) // left cutoff
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height)) // bottom right
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0)) // top right
        path.addLineToPoint(CGPoint(x: 0, y: 0)) // back to start

        headerMaskLayer?.path = path.CGPath
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
}

