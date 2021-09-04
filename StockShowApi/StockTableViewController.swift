//
//  StockTableViewController.swift
//  StockTableViewController
//
//  Created by water on 2021/9/3.
//

import UIKit

class StockTableViewController: UITableViewController {

    var stocks = [Stock]()
    

    func fetchStock() {
        if let url = URL(string: "https://www.tpex.org.tw/openapi/v1/tpex_active_advanced") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let stock = try JSONDecoder().decode([Stock].self, from: data)
                        self.stocks = stock
                        print(self.stocks.count)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStock()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stocks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! stockTableViewCell

        let stock = stocks[indexPath.row]
        cell.companylabel.text = stock.CompanyName
        cell.closeLabel.text = stock.ClosingPrice
        cell.upLabel.text = stock.Up
        cell.rationLabel.text = stock.UpRatio
        if stock.UpRatio == "10.00%" {
            cell.rationLabel.textColor = .white
            cell.rationLabel.backgroundColor = .red
        } else {
            cell.rationLabel.textColor = .black
            cell.rationLabel.backgroundColor = .white
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header: String = "股票名        收盤價            漲跌             幅度"
        return header
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
