//
//  BT2ViewController.swift
//  UITableView
//
//  Created by Phạm Huy on 5/22/19.
//  Copyright © 2019 Phạm Huy. All rights reserved.
//

import UIKit

class BT2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{


    @IBOutlet weak var myTable2: UITableView!
    @IBOutlet weak var edit_btn: UIBarButtonItem!


    var ArrayImag : [String]!
    var nameImage : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        myTable2.delegate = self
        myTable2.dataSource = self
        ArrayImag = ["2016_mercedes_benz_amg_gt_s-1920x1080", "12003", "Apple-tree-island-in-the-sky_1920x1200", "fb038e6941e16ae91cb835824c96a178", "Lamborghini-Veneno-Roadster-Crystal-City-Car-2014-Green-Neon-design-by-Tony-Kokhan-www.el-tony.com_"]
        nameImage = ["Anh 1", "Anh 2", "Anh 3", "Anh 4", "Anh 5"]
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Edit_btn(_ sender: UIBarButtonItem) {
        myTable2.isEditing = !myTable2.isEditing

        switch myTable2.isEditing {
        case true:
            edit_btn.title = "Done"
        default:
            edit_btn.title = "Edit"
        }
    }
    
    
    @IBAction func add_btn(_ sender: UIBarButtonItem) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayImag.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! TableViewCell
        cell.Anh_img.image = UIImage(named: ArrayImag[indexPath.row])
        cell.text_Lable.text = nameImage[indexPath.row]

        return cell
    }

    // edit btn
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentIndex = ArrayImag[sourceIndexPath.row]
        ArrayImag.remove(at: sourceIndexPath.row)
        ArrayImag.insert(currentIndex, at: destinationIndexPath.row)
    }

    //delete
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            ArrayImag.remove(at: indexPath.row)
//            myTable2.reloadData()
//        }
//    }

    //Tableview Swipe Actions

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let del = delAction(at: indexPath)
        let edit = editAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [del,edit])
    }
    func delAction(at indexPath : IndexPath) -> UIContextualAction{

        let action = UIContextualAction(style: .normal, title: "Delete"){
            (action, view, completion) in
            self.ArrayImag.remove(at: indexPath.row)
            completion(true)
            self.myTable2.reloadData()
        }
        action.backgroundColor = .red
        return action
    }
    func editAction(at indexPath : IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .normal, title: "Edit"){
            (action, view, completion) in
            self.myTable2.isEditing = !self.myTable2.isEditing
            switch self.myTable2.isEditing {
            case true:
                self.edit_btn.title = "Done"
            default:
                self.edit_btn.title = "Edit"
            }
            completion(true)
        }
        action.backgroundColor = UIColor.gray
        return action
    }
 
}
