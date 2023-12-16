//
//  ColorTableVC.swift
//  RandomColor
//
//  Created by Hakan Türkmen on 16.12.2023.
//

import UIKit

class ColorTableVC: UIViewController {
    
    var colors : [UIColor] = []
    
    enum Segues {
        static let toDetailVC = "ToColorsDetailVC"

    }
    
    enum Cells {
        static let colorCell = "ColorCell"

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColor()
        // Do any additional setup after loading the view.
    }
    
    func addRandomColor(){
        for _ in 0..<50{
            colors.append(UIColor.random())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC
        destVC.color = sender as? UIColor
    }
    
  
   
}

extension ColorTableVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else{
            return UITableViewCell()
        }
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetailVC  , sender: color)
    }
}
