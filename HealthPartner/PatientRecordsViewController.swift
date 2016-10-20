//
//  PatientRecordsViewController.swift
//  HealthPartner
//
//  Created by Admin on 03/10/2016.
//  Copyright © 2016 Yuki. All rights reserved.
//

import UIKit
import MBCircularProgressBar


class PatientRecordsViewController: UIViewController {

    
    @IBOutlet weak var menubutton: UIBarButtonItem!
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var readingView: UIView!
    
    
    var graphView = ScrollableGraphView()
    var graphConstraints = [NSLayoutConstraint]()
    
    var label = UILabel()
    var labelConstraints = [NSLayoutConstraint]()
    
    // Data
    let numberOfDataItems = 31
    
    lazy var data: [Double] = self.generateRandomData(self.numberOfDataItems, max: 100)
    lazy var labels: [String] = self.generateSequentialLabels(self.numberOfDataItems, text: "SEP")
    
    
    
    
    
    
//    @IBOutlet weak var progressBar: MBCircularProgressBarView!
//    
//    @IBOutlet weak var progressBar1: MBCircularProgressBarView!
//    
//    @IBOutlet weak var progressBar2: MBCircularProgressBarView!
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menubutton.target = revealViewController()
            menubutton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.cornerRadius = 3
        profileImageView.layer.borderColor = UIColor.colorFromHex(hexString: "#00b7f3").cgColor
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.white.cgColor
        btn1.layer.cornerRadius = 7
        btn2.layer.cornerRadius = 7
        btn3.layer.cornerRadius = 7
        readingView.layer.borderWidth = 1
        readingView.layer.borderColor = UIColor.colorFromHex(hexString: "#00b7f3").cgColor
        readingView.layer.cornerRadius = 5
        
        
//        self.progressBar.isHidden = true
//        self.progressBar1.isHidden = true
//        self.progressBar2.isHidden = true
//        
//        self.progressBar.setValue(0, animateWithDuration: 1.0)
//        self.progressBar1.setValue(0, animateWithDuration: 1.0)
//        self.progressBar2.setValue(0, animateWithDuration: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    @IBAction func pulse_click(_ sender: AnyObject) {
//        self.progressBar.isHidden = false
//        self.progressBar1.isHidden = true
//        self.progressBar2.isHidden = true
//        self.progressBar.setValue(75, animateWithDuration: 2.0)
//    }
//
//    @IBAction func pressure_click(_ sender: AnyObject) {
//        self.progressBar.isHidden = true
//        self.progressBar1.isHidden = false
//        self.progressBar2.isHidden = true
//        self.progressBar1.setValue(45, animateWithDuration: 3.0)
//    }
//    
//    @IBAction func other_click(_ sender: AnyObject) {
//        self.progressBar.isHidden = true
//        self.progressBar1.isHidden = true
//        self.progressBar2.isHidden = false
//        self.progressBar2.setValue(80, animateWithDuration: 1.0)
//    }
    
    @IBAction func clicked_btn1(_ sender: AnyObject) {
        graphView = createDarkGraph(self.bgView.frame)
        
        graphView.set(data: data, withLabels: labels)
        self.bgView.insertSubview(graphView, belowSubview: label)
        
        setupConstraints()
    }
    
    @IBAction func clicked_btn2(_ sender: AnyObject) {
        graphView = createBarGraph(self.bgView.frame)
        
        graphView.set(data: data, withLabels: labels)
        self.bgView.insertSubview(graphView, belowSubview: label)
        
        setupConstraints()
    }
    
    @IBAction func clicked_btn3(_ sender: AnyObject) {
        graphView = createDotGraph(self.bgView.frame)
        
        graphView.set(data: data, withLabels: labels)
        self.bgView.insertSubview(graphView, belowSubview: label)
        
        setupConstraints()
    }
    

    fileprivate func createDarkGraph(_ frame: CGRect) -> ScrollableGraphView {
        let graphView = ScrollableGraphView(frame: frame)
        
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#333333")
        
        graphView.lineWidth = 1
        graphView.lineColor = UIColor.colorFromHex(hexString: "#777777")
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        graphView.shouldFill = true
        graphView.fillType = ScrollableGraphViewFillType.gradient
        graphView.fillColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.fillGradientType = ScrollableGraphViewGradientType.linear
        graphView.fillGradientStartColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.fillGradientEndColor = UIColor.colorFromHex(hexString: "#444444")
        
        graphView.dataPointSpacing = 80
        graphView.dataPointSize = 2
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.numberOfIntermediateReferenceLines = 5
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        graphView.animationDuration = 1.5
        graphView.rangeMax = 50
        graphView.shouldRangeAlwaysStartAtZero = true
        
        return graphView
    }
    
    private func createBarGraph(_ frame: CGRect) -> ScrollableGraphView {
        let graphView = ScrollableGraphView(frame:frame)
        
        graphView.dataPointType = ScrollableGraphViewDataPointType.circle
        graphView.shouldDrawBarLayer = true
        graphView.shouldDrawDataPoint = false
        
        graphView.lineColor = UIColor.clear
        graphView.barWidth = 25
        graphView.barLineWidth = 1
        graphView.barLineColor = UIColor.colorFromHex(hexString: "#777777")
        graphView.barColor = UIColor.colorFromHex(hexString: "#555555")
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#333333")
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.numberOfIntermediateReferenceLines = 5
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        graphView.animationDuration = 1.5
        graphView.rangeMax = 50
        graphView.shouldRangeAlwaysStartAtZero = true
        
        return graphView
    }
    
    private func createDotGraph(_ frame: CGRect) -> ScrollableGraphView {
        
        let graphView = ScrollableGraphView(frame:frame)
        
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#00BFFF")
        graphView.lineColor = UIColor.clear
        
        graphView.dataPointSize = 5
        graphView.dataPointSpacing = 80
        graphView.dataPointLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.dataPointLabelColor = UIColor.white
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.5)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.referenceLinePosition = ScrollableGraphViewReferenceLinePosition.both
        
        graphView.numberOfIntermediateReferenceLines = 9
        
        graphView.rangeMax = 50
        
        return graphView
    }
    
    private func createPinkMountainGraph(_ frame: CGRect) -> ScrollableGraphView {
        
        let graphView = ScrollableGraphView(frame:frame)
        
        graphView.backgroundFillColor = UIColor.colorFromHex(hexString: "#222222")
        graphView.lineColor = UIColor.clear
        
        graphView.shouldFill = true
        graphView.fillColor = UIColor.colorFromHex(hexString: "#FF0080")
        
        graphView.shouldDrawDataPoint = false
        graphView.dataPointSpacing = 20
        graphView.dataPointLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.dataPointLabelColor = UIColor.white
        
        graphView.dataPointLabelsSparsity = 3
        
        graphView.referenceLineThickness = 1
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 10)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.5)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.referenceLinePosition = ScrollableGraphViewReferenceLinePosition.both
        
        graphView.numberOfIntermediateReferenceLines = 1
        
        graphView.shouldAdaptRange = true
        
        graphView.rangeMax = 50
        
        return graphView
    }
    
    private func setupConstraints() {
        
        self.graphView.translatesAutoresizingMaskIntoConstraints = false
        graphConstraints.removeAll()
        
        let topConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.bgView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.bgView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.bgView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.bgView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0)
        
        graphConstraints.append(topConstraint)
        graphConstraints.append(bottomConstraint)
        graphConstraints.append(leftConstraint)
        graphConstraints.append(rightConstraint)
        
        
        self.bgView.addConstraints(graphConstraints)
    }
    
    
    // Data Generation
    private func generateRandomData(_ numberOfItems: Int, max: Double) -> [Double] {
        var data = [Double]()
        for _ in 0 ..< numberOfItems {
            var randomNumber = Double(arc4random()).truncatingRemainder(dividingBy: 50)
            
            if(arc4random() % 100 < 10) {
                randomNumber *= 3
            }
            
            data.append(randomNumber)
        }
        return data
    }
    
    private func generateSequentialLabels(_ numberOfItems: Int, text: String) -> [String] {
        var labels = [String]()
        for i in 0 ..< numberOfItems {
            labels.append("\(text) \(i+1)")
        }
        return labels
    }

    
}
