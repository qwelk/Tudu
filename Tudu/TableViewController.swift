//
//  ViewController.swift
//  Tudu
//
//  Created by Pedro on 28/8/18.
//  Copyright © 2018 Pedro. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayTudus = ["Comprar pan", "Destruir la Estrella de la Muerte", "Sacar al perro"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Métodos delegados
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTudus.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = arrayTudus[indexPath.row]
        return celda
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    //MARK - Añadir item
    @IBAction func nuevoItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alerta = UIAlertController(title: "Nuevo item", message: nil, preferredStyle: .alert)
        
        let accion = UIAlertAction(title: "Añadir", style: .default) { (action) in
            self.arrayTudus.append(textField.text!)
            self.tableView.reloadData()
        }
        
        
        alerta.addTextField { (textFieldAlerta) in
            textFieldAlerta.placeholder = "Crear nuevo item"
            textField = textFieldAlerta
            print(textField.text!)
        }
        
        alerta.addAction(accion)
        
        present(alerta, animated: true, completion: nil)
        
    }
    
}

