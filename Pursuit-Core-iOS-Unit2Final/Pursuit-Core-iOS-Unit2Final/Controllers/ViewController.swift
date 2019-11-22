//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentColor = CGFloat (0.0) {
        didSet{
            tableView.reloadData()
        }
    }
    
  var didSetCrayons = [Crayon]() {
        didSet {
            tableView.reloadData()
        }
        
    }

  override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
       
    }
    func loadData() {
        didSetCrayons = Crayon.allTheCrayons
    }

    //MARK: Segue
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let detailViewController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
             fatalError("Failed to sugue")
         }
         let indexCrayons = didSetCrayons[indexPath.row]
         detailViewController.colorDVC = indexCrayons
    detailViewController.colorRedSlider?.value = Float(indexCrayons.red)
    detailViewController.colorBlueSlider?.value = Float(indexCrayons.blue)
    detailViewController.colorGreenSlider?.value = Float(indexCrayons.green)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return didSetCrayons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let colorCellForRow = didSetCrayons[indexPath.row]
        
        cell.textLabel?.text = colorCellForRow.name
        cell.detailTextLabel?.text = colorCellForRow.hex
        
        cell.backgroundColor? = UIColor(displayP3Red: CGFloat(colorCellForRow.red / 255), green: CGFloat(colorCellForRow.green / 255), blue: CGFloat(colorCellForRow.blue / 255), alpha: 1.0)
        
        
        
        return cell
        
       
    }
}



