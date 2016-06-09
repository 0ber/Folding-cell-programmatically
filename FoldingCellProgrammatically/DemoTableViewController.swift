//
//  DemoTableViewController.swift
//  FoldingCellProgrammatically
//
//  Created by Alex K. on 09/06/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit
import FoldingCell

class DemoTableViewController: UITableViewController {
  
  let closeHeight: CGFloat = 91
  let openHeight: CGFloat = 166
  var itemHeight = [CGFloat](count: 100, repeatedValue: 91.0)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerCell()
  }
}

// MARK: Helpers

extension DemoTableViewController {
  
  private func registerCell() {
    tableView.registerClass(DemoFoldingCell.self, forCellReuseIdentifier: String(DemoFoldingCell))
  }
  
}

// MARK: - Table view data source

extension DemoTableViewController {
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemHeight.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(String(DemoFoldingCell), forIndexPath: indexPath)
    
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
   return itemHeight[indexPath.row]
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
    
    var duration = 0.0
    if itemHeight[indexPath.row] == closeHeight { // open cell
      itemHeight[indexPath.row] = openHeight
      cell.selectedAnimation(true, animated: true, completion: nil)
      duration = 0.5
    } else {// close cell
      itemHeight[indexPath.row] = closeHeight
      cell.selectedAnimation(false, animated: true, completion: nil)
      duration = 1.1
    }
    
    UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
      tableView.beginUpdates()
      tableView.endUpdates()
      }, completion: nil)
    
  }
}