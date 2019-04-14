//  
//  AppDetailsView.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/13/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import UIKit

class AppDetailsView: UIViewController, UITableViewDelegate, UITableViewDataSource {

	// OUTLETS HERE
	@IBOutlet weak var tableView: UITableView!
	
    // VARIABLES HERE
    var viewModel = AppDetailsViewModel()
	var entry: Entry?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    fileprivate func setupViewModel() {

        self.viewModel.didGetData = {
            self.tableView.reloadData()
			self.title = self.viewModel.title
        }
		
		self.viewModel.setModel(entry: self.entry!)
    }
	
	fileprivate func showLink() {
		
	}
	
	//MARK: - TableViewDelegate, TableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return AppDetailsViewModel.AppDetailsViewSections.numberOfSections()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let section = AppDetailsViewModel.AppDetailsViewSections(rawValue: indexPath.section)
		
		switch section {
			
		case .AppDetailsViewHeader?:
			let cell = tableView.dequeueReusableCell(withIdentifier: "AppDetailsHeaderCell") as! AppDetailsHeaderCell
			if let model = self.viewModel.getSectionViewModel(section: .AppDetailsViewHeader) as? AppCollectionViewCellModel {
				cell.setDataToCell(model: model)
			}
			return cell
			
		case .AppDetailsViewSummary?:
			let cell = tableView.dequeueReusableCell(withIdentifier: "AppDetailsSummaryCell") as! AppDetailsSummaryCell
			if let model = self.viewModel.getSectionViewModel(section: .AppDetailsViewSummary) as? AppDetailsSummaryCellModel {
				cell.setCellData(model: model)
			}
			return cell
			
		case .AppDetailsViewAction?:
			let cell = tableView.dequeueReusableCell(withIdentifier: "AppDetailsShowCell") as! AppDetailsShowCell
			cell.buttonClicked = { [weak self] () -> () in
				if let wSelf = self {
					wSelf.viewModel.openAppLink(viewController: wSelf)
				}
			}
			return cell
			
		default:
			return UITableViewCell()
		}
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return UITableView.automaticDimension
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 100
	}
	
}

extension AppDetailsView {
	
	static let StoryBoardName = "Main"
	static let ViewControllerID = "AppDetailsViewID"
	
	static func push(from navigation: UINavigationController, app: Entry) {
		let viewController = UIStoryboard(name: AppDetailsView.StoryBoardName, bundle: Bundle.main).instantiateViewController(withIdentifier: AppDetailsView.ViewControllerID) as! AppDetailsView
		viewController.entry = app
		navigation.pushViewController(viewController, animated: true)
	}
}


