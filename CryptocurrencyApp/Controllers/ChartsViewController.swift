//
//  ChartsViewController.swift
//  CryptocurrencyApp
//
//  Created by Dastan Mambetaliev on 5/4/21.
//
import Charts
import UIKit

class ChartsViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    
    var model = [TimeData]()
    var name: String?
    var fullName: String?
    var entries = [ChartDataEntry]()
    var urlForHistory = "https://min-api.cryptocompare.com/data/v2/histohour?tsym=USD&limit=23&api_key=62b75013483ec331b5654dc205098b009a02793ccd55150caf4f69cd6f98440e&fsym="

    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabel()
        
        ServerManager.shared.getCryptoHistory(urls: urlForHistory) { (historyList) in
            self.model = (historyList.data?.data)!
            
            for i in 0..<self.model.count {
                let highPrice = self.model[i].high
                self.entries.append(ChartDataEntry(x: Double(i), y: highPrice!))
            }
            self.addLineChart()
        } _: { (error) in
            print(error)
        }
        lineChartView.delegate = self
        
    }
    
    func addLineChart() {
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChartView.data = data
    }
    
    func changeLabel () {
        guard let fullText = fullName else {return}
        fullNameLabel.text = fullText
        
        guard let text = name else {return}
        urlForHistory = urlForHistory + "\(text)"
    }
}
