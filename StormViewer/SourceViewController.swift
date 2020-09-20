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
    
    //    MARK: Start here:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    //    MARK: Methods:
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = "Hello World!"
        return vw
    }
}
