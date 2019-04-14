//
//  AppCollectionViewCell.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import UIKit
import SDWebImage

struct AppCollectionViewCellModel: BaseCellViewModel {
	let appName: String
	let imageURL: URL
}

final class AppCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet private weak var appImage: UIImageView!
	@IBOutlet private weak var appNameLbl: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	func setDataToCell(model: AppCollectionViewCellModel) {
		self.appImage.sd_setImage(with: model.imageURL, placeholderImage: UIImage(named: "app_icon_Placeholder")!)
		self.appNameLbl.text = model.appName
	}
	
	
}

