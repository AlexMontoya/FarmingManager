//
//  WeatherCellView.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 13/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit


class WeatherCell: Weather, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    private let cellId = "cellId"
    
    var datas: [Data]?
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|-10-[v0]|", views: collectionView)
        
        collectionView.alwaysBounceVertical = true
        collectionView.register(Weather.self, forCellWithReuseIdentifier: cellId)
        
        setupData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = datas?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Weather
        
        if let data = datas?[indexPath.item] {
            cell.data = data
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 60)
    }

}

class Weather: WeatherBaseCell {
    
    var data: Data? {
        didSet {
            
            weatherLabel.text = data?.weathertype?.name
            
            if let pictoImageName = data?.weathertype?.pictoImageName {
                pictoImageView.image = UIImage(named: pictoImageName);
            }
            
            dataLabel.text = data?.text
            
        }
    }
    

    let pictoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather Class :"
        return label
    }()
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.text = "xx °C"
        label.textColor = UIColor.gray
        return label
    }()
    
    override func setupViews() {
        
        addSubview(pictoImageView)
        addSubview(dividerLineView)
        addSubview(nextImageView)
        
        setupContainerView()
        
        pictoImageView.image = UIImage(named: "sun")
        pictoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nextImageView.image = UIImage(named: "nextcell")?.withRenderingMode(.alwaysTemplate)
        nextImageView.tintColor = UIColor.darkGray
        nextImageView.translatesAutoresizingMaskIntoConstraints = false
        
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsWithFormat(format: "H:|-12-[v0(38)]", views: pictoImageView)
        addConstraintsWithFormat(format: "V:[v0(38)]", views: pictoImageView)
        
        addConstraint(NSLayoutConstraint(item: pictoImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: dividerLineView)
        
    }
    
    private func setupContainerView() {
        let containerView = UIView()
        
        addSubview(containerView)
        
        addConstraintsWithFormat(format: "H:|-60-[v0]|", views: containerView)
        addConstraintsWithFormat(format: "V:[v0(40)]", views: containerView)
        
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        containerView.addSubview(weatherLabel)
        containerView.addSubview(dataLabel)
        containerView.addSubview(nextImageView)
        
        addConstraintsWithFormat(format: "H:|[v0]-5-[v1]", views: weatherLabel, dataLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: weatherLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: dataLabel)
        
        addConstraintsWithFormat(format: "H:[v0(24)]-10-|", views: nextImageView)
        addConstraintsWithFormat(format: "V:|-8-[v0(24)]", views: nextImageView)
        
        
    }
    
}



class WeatherBaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
    
}
    

    






