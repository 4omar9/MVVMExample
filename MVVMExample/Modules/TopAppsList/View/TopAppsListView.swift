//  
//  TopAppsListView.swift
//  MVVMExample
//
//  Created by Omar Almasri on 4/12/19.
//  Copyright © 2019 Omar Almasri. All rights reserved.
//

import UIKit

class TopAppsListView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
    var viewModel = TopAppsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
		self.registerCell()
		
        self.setupViewModel()
    }
	
	fileprivate func registerCell() {
		self.collectionView.register(UINib(nibName: "AppCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppCollectionViewCell")
	}
	
    
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
			print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
			self.showAlert(title: "Internet disconnected", message: "", alertStyle: .alert, actions: nil)
        }

        self.viewModel.didGetData = {
			self.collectionView.reloadData()
			self.title = self.viewModel.title
		}
		
		self.viewModel.requestData()
    }
	
	//MARK: - CollectionView delegate, Datasource.
	
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.viewModel.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppCollectionViewCell", for: indexPath) as! AppCollectionViewCell
		if let appName = self.viewModel.getAppNameFor(index: indexPath.row), let appImage = self.viewModel.getAppImageURLFor(index: indexPath.row) {
			
			cell.setDataToCell(model: AppCollectionViewCellModel(appName: appName, imageURL: appImage))
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: (collectionView.frame.width/3 - 10), height: 100)
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if let item = self.viewModel.getItemFor(index:indexPath.row), let navigationController = self.navigationController {
			AppDetailsView.push(from: navigationController, app: item)

		}
	}
	
    
}


