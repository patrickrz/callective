//
//  HomeFeedVC.swift
//  Callective
//
//  Created by Patrick Zhu on 11/21/20.
//

import UIKit

class HomeFeedVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var radarCollectionView: UICollectionView!
    var radarCourses: [Course] = CourseGenerator.getCourseArray()
    var course: Course!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radarCollectionView.delegate = self
        radarCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        radarCollectionView.reloadData()
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        course = radarCourses[indexPath.row]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return radarCourses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeFeedCollectionViewCell
        let currCourse: Course!
        currCourse = radarCourses[indexPath.row]
        cell.courseNameLabel.text = currCourse.classAbrv
        return cell
    }
    
    

}
