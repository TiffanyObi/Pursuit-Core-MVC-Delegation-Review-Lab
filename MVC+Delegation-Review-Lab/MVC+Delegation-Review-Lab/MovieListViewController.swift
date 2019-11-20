//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movie = [Movie](){
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       loadData()
        tableView.dataSource = self
    }

    func loadData(){
        movie = Movie.allMovies
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let changeFont = segue.destination as? ChangeFontViewController,
            
            let indexPath = tableView.indexPathForSelectedRow
            else {
                fatalError("Could not access View Controller")
        }
        
        let movieInList = movie[indexPath.row]
        
        changeFont.eachMovie = movieInList
        
        
        
        
    }
   
    
    
    
    
}

extension MovieListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movieInRow = movie[indexPath.row]
        
        movieCell.textLabel?.text = movieInRow.name
        
        movieCell.detailTextLabel?.text = movieInRow.year.description
        
        return movieCell
    }
    
    
}
