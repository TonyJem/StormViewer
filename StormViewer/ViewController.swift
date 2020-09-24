//
//  ViewController.swift
//  StormViewer
//
//  Created by Office-iMac on 2020-09-17.
//  Copyright © 2020 Tony Jem. All rights reserved.
//

import Cocoa

class ViewController: NSSplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sharedClicked(_ sender: NSView){
        guard let detail = children[1] as? DetailViewController else { return }
        guard let image = detail.ImageView.image else { return }
        let picker = NSSharingServicePicker(items: [image])
        picker.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }

    @IBAction func plusButtonClicked(_ sender: NSView){
        runAlert()
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    func runAlert() {
        let alert = NSAlert()
        alert.messageText = "Attention!!!"
        alert.informativeText = "Plus Button was clicked :)"
        alert.runModal()
    }
}

