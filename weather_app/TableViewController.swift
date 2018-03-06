import UIKit


class TableViewController: UIViewController{
    @IBOutlet weak var TableView: UITableView!
    var testData = Array<Any>(arrayLiteral: "1","2","3")
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // セルのテキストを追加
    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = testData[indexPath.row] as? String
        return cell
    }
    
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> Int{
        return self.cellNum
    }
    
    var table:UITableView!
    // APIのURLを定義
    // APPID=XXXは先程取得したAPI KEYを各自設定してください
    var api_key = "8b0f4fb6ed0ce1993dde1749b404c010"
    var urlString = "http://api.openweathermap.org/data/2.5/forecast?units=metric&q=Tokyo&APPID=8b0f4fb6ed0ce1993dde1749b404c010"
    
    var cellItems = NSMutableArray()
    let cellNum = 10
    var selectedInfo : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TableView.delegate = self
        //TableView.dataSource = self
        makeTableData()
    }
    
     
    func makeTableData(){
        let url = URL(string:self.urlString)
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data, let response = response {
                print(response)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                } catch {
                    print("Serialize Error")
                }
            } else {
                print(error ?? "Error")
            }
        }
        
        task.resume()
    }
 
}
