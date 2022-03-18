
import UIKit

class homeViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder  = JSONDecoder()
    var movieList = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.reloadData()
        myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        obtainPosts()
    }
    func obtainPosts(){
        
        let requestURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=f910e2224b142497cc05444043cc8aa4&language=en-US&page=1"
        
        
        session.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=f910e2224b142497cc05444043cc8aa4&language=en-US&page=1")!)){
            (data, req, error) in
            do{
                let result = try self.decoder.decode(MovieResult.self, from: data!)
               
                DispatchQueue.main.async
                {
                    self.movieList = result.results!
                    self.myTableView.reloadData()
                }
            }catch{
                print(String(describing: error))
            }
        } .resume()
    }
    }

extension homeViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270 //Choose your custom row height
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //  print(dataSource.count)
        return movieList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.backgroundColor = UIColor(red: 12/255, green: 8/255, blue: 48/255, alpha: 10)
        cell.update(data: movieList[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "VCMovieDetail", sender: self)
          tableView.deselectRow(at: indexPath, animated: true)
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VCMovieDetail {
            destination.movies = movieList[(myTableView.indexPathForSelectedRow?.row)!]

        }
    }
}


