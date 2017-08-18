//
//  ViewController.swift
//  Themed
//
//  Created by Brian Bal on 08/17/2017.
//  Copyright (c) 2017 Brian Bal. All rights reserved.
//

import UIKit
import Themed

class ViewController: UIViewController {

    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Themed"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "More", style: .plain, target: self, action: #selector(morePressed))
        
        view.styles = ["page"]
        
        titleLabel.text = "About"
        titleLabel.styles = ["title", "center"]
        view.addSubview(titleLabel)
        
        bodyLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec elit sit amet magna eleifend ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin vel vestibulum nisi. Nam vel interdum orci. Phasellus congue odio eget augue commodo imperdiet. Phasellus placerat volutpat enim in luctus. Vivamus mauris odio, mattis quis consequat ac, bibendum at justo. Sed eget justo non lacus auctor malesuada eu a neque. Vestibulum vel dolor sit amet arcu consequat dictum eget quis neque. Pellentesque pharetra, augue eu varius malesuada, elit felis porttitor ipsum, vitae scelerisque massa metus vel augue. In a volutpat felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
        bodyLabel.styles = ["body", "truncate"]
        bodyLabel.numberOfLines = 5
        view.addSubview(bodyLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let vs = view.frame.size
        
        let ts = titleLabel.sizeThatFits(vs)
        titleLabel.frame = CGRect(x: 0, y: 70, width: vs.width, height: ts.height)
        
        let bs = bodyLabel.sizeThatFits(vs)
        bodyLabel.frame = CGRect(x: 20, y: titleLabel.frame.maxY + 20, width: vs.width-40, height: bs.height)
    }
    
    func morePressed() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

