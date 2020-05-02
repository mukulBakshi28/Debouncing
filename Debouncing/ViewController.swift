//
//  ViewController.swift
//  Debouncing
//
//  Created by Mukul Bakshi on 02/05/20.
//  Copyright © 2020 Mukul Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySrchBar: UISearchBar!
   private var lastSearchTxt = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
     }
}

extension ViewController: UISearchBarDelegate {
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if lastSearchTxt.isEmpty {
            lastSearchTxt = searchText
        }
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.makeNetworkCall), object: lastSearchTxt)
        lastSearchTxt = searchText
        self.perform(#selector(self.makeNetworkCall), with: searchText, afterDelay: 0.7)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    @objc private func makeNetworkCall(sender: String) {
        print("\(sender)")
    }
}
