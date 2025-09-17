import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals:[Meal] {
        [
            Meal(name: "Breakfast", food: [
                Food(name: "food 1 name", description: "food 1 description"),
                Food(name: "food 2 name", description: "food 2 description"),
                Food(name: "food 3 name", description: "food 3 description")
            ]),
            Meal(name: "Lunch", food: [
                Food(name: "food 1 name", description: "food 1 description"),
                Food(name: "food 2 name", description: "food 2 description"),
                Food(name: "food 3 name", description: "food 3 description")
            ]),
            Meal(name: "Dinner", food: [
                Food(name: "food 1 name", description: "food 1 description"),
                Food(name: "food 2 name", description: "food 2 description"),
                Food(name: "food 3 name", description: "food 3 description"),
            ])
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals[section].food.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = meals[indexPath.section].food[indexPath.row].name
        content.secondaryText = meals[indexPath.section].food[indexPath.row].description
        cell.contentConfiguration = content
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
