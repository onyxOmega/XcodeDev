//
//  ViewController.swift
//  test7
//
//  Created by William Fischer on 1/31/18.
//  Copyright © 2018 William Fischer. All rights reserved.
//

import UIKit
import Theo

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        let client = try! BoltClient(hostname: "bolt://hobby-pgjikkipbdjdgbkejddbgnal.dbs.graphenedb.com",
                                     port: 24786,
                                     username: "xcodetest",
                                     password: "b.IgGOR4248w64.eo9XziOkR198u1D9",
                                     encrypted: true)
        
        let result = client.connectSync()
        print(result)
        //makeRandomNode(client)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func makeRandomNode(_ client: BoltClient){
        print("DoingDatabaseStuff")
        // Create the node
        let node = Node(label: "blah", properties: ["name": "Thomas Anderson", "alias": "Neo" ])
        
        // Save the node
        let result = client.createNodeSync(node: node)
        
        // Verify the result of the save
        switch result {
        case let .failure(error):
            print(error.localizedDescription)
        case .success(_):
            print("Node saved successfully")
        }
    }
   
    

}

