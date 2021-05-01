//
//  MainViewController.swift
//  CryptocurrencyApp
//
//  Created by Dastan Mambetaliev on 2/4/21.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    
    var models = [HeadData]()
    var initial = ""
    var segueIdentifier = "HistorySegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    
        
        ServerManager.shared.getCryptoCourse(urls: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=24843aac-f3c5-4bb5-9be4-efd53c9e33bd&start=1&limit=10&convert=USD") { (courseList) in
            self.models = courseList.data!
            self.collectionView.reloadData()
            
//            print(self.models.last?.quote?.usd)
        } _: { (error) in
            print(error)
        }
    }
    
//    передача имени и сокращения валюты при вызове segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! HeadData
        
        if segue.identifier == segueIdentifier {
            if let target = segue.destination as? ChartsViewController {
                target.name = item.symbol
                target.fullName = item.name
            }
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let coin = models[indexPath.item]
        cell.nameOfCoin.text = coin.name
        cell.priceOfCoin.text = String((coin.quote?.USD?.price)!)
        if (coin.quote?.USD?.percent_change_1h)! > 0 {
            cell.priceOfCoin.textColor = UIColor.green
        } else if (coin.quote?.USD?.percent_change_1h)! < 0 {
            cell.priceOfCoin.textColor = UIColor.red
        }
        return cell
    }
    
//    размер ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 30, height: CGFloat(116))
        
    }
//    конфигурация отступов между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
//    метод для создания отступов между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var coin = models[indexPath.item]
        
        performSegue(withIdentifier: segueIdentifier, sender: coin)
    }
}
