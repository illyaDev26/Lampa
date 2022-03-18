//
//import Foundation
//import Alamofire
//struct  NetworkManager {
//
//    static let shared = NetworkManager()
//
//    fileprivate init() { }
//
//    func loadMovieList(completionBlock: @escaping(([MovieResult])->())){
//        //
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession.shared
//
//
//        session.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=f910e2224b142497cc05444043cc8aa4&language=en-US&page=1")!)){
//            (data, req, error) in
//            do{
//                let result = try JSONDecoder().decode(MovieResult.self, from: data!)
//            }catch{
//                print(String(describing: error))
//            }
//        } .resume()
//
//    }
//}
