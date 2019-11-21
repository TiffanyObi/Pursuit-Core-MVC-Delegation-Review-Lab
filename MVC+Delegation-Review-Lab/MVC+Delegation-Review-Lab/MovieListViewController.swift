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
    
    var movies = [Movie](){
        didSet {
            tableView.reloadData()
        }
    }
    
    var movieFontSize : CGFloat = 0 {
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
        movies = Movie.allMovies
    }
    
    
        
@IBAction func settingsButton(button: UIButton){
        
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.destination is ChangeFontViewController
            
            else {
                fatalError("Could not access View Controller")
        }
        
    }
    
 }
    @IBAction func saveChanges(segue: UIStoryboardSegue){
    
        guard let saveChanged = segue.source as? ChangeFontViewController else {
        fatalError("Could not locate viewController")
}
        
       movieFontSize = CGFloat(saveChanged.stepperValue)
    
    }
}



extension MovieListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movieInRow = movies[indexPath.row]
        
        movieCell.textLabel?.text = movieInRow.name
        
        movieCell.detailTextLabel?.text = movieInRow.year.description
        
        movieCell.textLabel?.font = UIFont(name: "Didot", size: movieFontSize )
        return movieCell
    }
    
    
}

