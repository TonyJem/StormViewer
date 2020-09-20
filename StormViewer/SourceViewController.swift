//
//  SourceViewController.swift
//  StormViewer
//
//  Created by Office-iMac on 2020-09-17.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    //    MARK: Outlets:
    @IBOutlet var tableView: NSTableView!
    
    //    MARK: Properties:
    var pictures = [String]()
    
    //    MARK: Start here:
    override func viewDidLoad() {
        super.viewDidLoad()
        //get a list of all files in our bundles resource path
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        //loop over each file we found
        for item in items {
            //if this item starts with "nssl" add it to our array
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    //    MARK: Methods:
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = pictures[row]
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }
    }
}
