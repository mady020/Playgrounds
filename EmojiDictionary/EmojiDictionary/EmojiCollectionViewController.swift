import UIKit

private let reuseIdentifier = "Cell"

class EmojiCollectionViewController: UICollectionViewController {


    
    // MARK: - Layout
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let spacing: CGFloat = 10
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: 0, trailing: spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }

    // MARK: - Data Source
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EmojiCollectionViewCell
        let emoji = emojis[indexPath.item]
        cell.symbolLabel.text = emoji.symbol
        cell.nameLabel.text = emoji.name
        cell.descriptionLabel.text = emoji.description
        return cell
    }
    
    // MARK: - Context Menu (Delete)
    override func collectionView(_ collectionView: UICollectionView,
                                 contextMenuConfigurationForItemAt indexPath: IndexPath,
                                 point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let delete = UIAction(title: "Delete", attributes: .destructive) { _ in
                self.deleteEmoji(at: indexPath)
            }
            return UIMenu(title: "", children: [delete])
        }
    }

    func deleteEmoji(at indexPath: IndexPath) {
        emojis.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
    }
    
    // MARK: - Unwind Segue
    @IBAction func unwindToEmojiCollectionView(_ segue: UIStoryboardSegue) {
      
        guard let sourceVC = segue.source as? AddEditEmojiTableViewController,
              let emoji = sourceVC.emoji else { return }

     
        if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
            emojis[selectedIndexPath.row] = emoji
            collectionView.reloadItems(at: [selectedIndexPath])
        }
   
        else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            collectionView.insertItems(at: [newIndexPath])
        }
    }
    
    // MARK: - Segue for Add/Edit
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        if let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell) {
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else {
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "EditEmoji" {
//            if let cell = sender as? UICollectionViewCell,
//               let indexPath = collectionView.indexPath(for: cell) {
//                let emojiToEdit = emojis[indexPath.row]
//                let destinationVC = segue.destination as! AddEditEmojiTableViewController
//                destinationVC.emoji = emojiToEdit
//            }
//        }
//    }

    
    
}
