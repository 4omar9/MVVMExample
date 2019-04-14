//
//  AppDetailsSummaryCell.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/13/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import UIKit

struct AppDetailsSummaryCellModel: BaseCellViewModel {
	
	let price: String
	let currency: String
	let category: String
	let summary: String
	
	var appPrice: String {
		let price = (self.price as NSString).floatValue
		if price > 0 {
			return self.price + self.currency
		} else {
			return "Free"
		}
		
	}
}

class AppDetailsSummaryCell: UITableViewCell {

	@IBOutlet private weak var priceLbl: UILabel!
	@IBOutlet private weak var categoryLbl: UILabel!
	@IBOutlet private weak var summaryLbl: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func setCellData(model: AppDetailsSummaryCellModel) {
		self.categoryLbl.text = model.category
		self.priceLbl.text = model.appPrice
		self.summaryLbl.text = model.summary
	}

}
