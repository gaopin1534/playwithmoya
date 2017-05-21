//
//  ViewController.swift
//  playWithMoya
//
//  Created by 高松幸平 on 2017/05/21.
//  Copyright © 2017年 gaopin. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let provider = MoyaProvider<HackersNewsAPI>()
        provider.request(.newStories) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try moyaResponse.filterSuccessfulStatusCodes()
                    let data = try moyaResponse.mapJSON()
                    print(data)
                }
                catch {
                    // show an error to your user
                }
            case let .failure(error):
                print(error)
                break
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

