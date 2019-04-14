//
//  AppDetailsShowCell.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/13/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import UIKit

class AppDetailsShowCell: UITableViewCell {

	public var buttonClicked: (() -> Void)?
	
    override func awakeFromNib() {
        super.awakeFromNib()

	}

	@IBAction func buttonAction(_ sender: Any) {
		if self.buttonClicked != nil {
			self.buttonClicked!()
		}
	}
	
}
