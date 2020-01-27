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
    
    var movieFontSize : CGFloat = 17 {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let changeVC = segue.destination as? ChangeFontViewController
                   else {
                       fatalError("Could not access View Controller")
               }
               
               // pass the current font size value to the
               // change font view controller
               changeVC.fontSize = Float(movieFontSize)
         changeVC.fontSizeDelegate = self
                       print("slider value: \(changeVC.fontSize)")
        
    }
    

}

//    @IBAction func saveChanges(segue: UIStoryboardSegue){
//
//        guard let saveChanged = segue.source as? ChangeFontViewController else {
//        fatalError("Could not locate viewController")
//}
//       
//
//       movieFontSize = CGFloat(saveChanged.fontSize)
//
//    }
//}



extension MovieListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movieInRow = movies[indexPath.row]
        
        movieCell.textLabel?.text = movieInRow.name
        
        movieCell.detailTextLabel?.text = movieInRow.year.description
        
        movieCell.textLabel?.font = UIFont(name: "Snell RoundHand", size: movieFontSize )
        
         movieCell.detailTextLabel?.font = UIFont(name: "Snell RoundHand", size: movieFontSize )
        
        return movieCell
    }
    
    
}

extension MovieListViewController: FontChangeDelegate {
    func fontSizeValueDidChange(_ fontSizeController: ChangeFontViewController, fontSize: Float) {
        self.movieFontSize = CGFloat(fontSize)
    }
    
    
    
}
