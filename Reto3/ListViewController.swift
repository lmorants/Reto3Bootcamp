//
//  ListViewController.swift
//  Reto3
//
//  Created by Luis Miguel Morante Santander on 3/12/22.
//

import UIKit

class ListViewController: UITableViewController {
    
    var homeworks = [
        Homework(title: "Lavar Ropa",description: "Lavar la ropa de toda la familia en la tarde",priority: "Alta"),
        Homework(title: "Limpiar Cocina",description: "Limpiar la cocina antes de las 12:00pm para cocinar ",priority: "Baja"),
        Homework(title: "Barrer Sala",description: "Barrer la sala antes de las 2:00om ya que llegarám visitas",priority: "Baja"),
        Homework(title: "Pagar Banco",description: "Pagar al banco antes de las 5:00pm , en caso contrario cerrará",priority: "Alta"),
        Homework(title: "Regar Plantas",description: "Regar las plantas antes que se marchiten",priority: "Alta"),
        Homework(title: "Tender Ropa",description: "Tender la ropa temprano antes que baje el sol",priority: "Baja"),
        Homework(title: "Manteniemiento Pc",description: "Dar mantenimiento a la PC antes que muestre fallas al usarlo",priority: "Alta"),
        Homework(title: "Alimentar gato",description: "Dar alimento al gato porque sino estará llorando todo el día",priority: "Alta"),
        Homework(title: "Reparar Laptop",description: "Reparar la laptop antes que sea lunes porque me toca llevarlo",priority: "Alta"),
        Homework(title: "Doblar Ropa",description: "Doblar la ropa para que sea fácil encontralo",priority: "Baja"),
        Homework(title: "Ordenar libros",description: "Ordenar los libros de forma ascendente para su fácil ubiación",priority: "Baja"),
        Homework(title: "Imprimir documentos",description: "Imprimir documentos que tengo en mi drive para guardarlo en mi folio",priority: "Alta"),
    ]

    @IBAction func addButton(_ sender: Any) {
        
        guard let formViewController = storyboard?.instantiateViewController(withIdentifier: "FormViewController") as? FormViewController else {return}
        let nav = UINavigationController(rootViewController: formViewController)
        present(nav, animated: true)
        formViewController.delegate = self
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomTableViewCell{
            let homework = homeworks[indexPath.row]
            cell.setup(homework: homework)
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homework = homeworks[indexPath.row]
        let index = indexPath.row
        
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        
        detailViewController.titleDetail = homework.title
        detailViewController.descriptionDetail = homework.description
        detailViewController.priorityDetail = homework.priority
        
        present(detailViewController, animated: true)
        detailViewController.delegate = self
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}

extension ListViewController: FormViewControllerDelegate{
    func FormViewController(_ ViewController: FormViewController, didCreateTarea newHomework: Homework) {
        homeworks.append(newHomework)
        tableView.reloadData()
    }
}

extension ListViewController: DetailViewControllerDelegate{
    func deleteHomework(_ ViewController: DetailViewController, index: Int) {
        homeworks.remove(at: index)
        tableView.reloadData()
    }
}
