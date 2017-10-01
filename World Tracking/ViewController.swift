//
//  ViewController.swift
//  World Tracking
//
//  Created by Andrew Piterov on 30/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        // device is able to track position and orientation
        self.sceneView.session.run(config)
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
        // node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        // node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
        // node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.2)
        // node.geometry = SCNCylinder(radius: 0.1, height: 0.2)
        // node.geometry = SCNSphere(radius: 0.05)
        // node.geometry = SCNTube(innerRadius: 0.02, outerRadius: 0.04, height: 0.2)
        // node.geometry = SCNTorus(ringRadius: 0.2, pipeRadius: 0.05)
        // node.geometry = SCNPlane(width: 0.1, height: 0.08)
        // node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
        path.addLine(to: CGPoint(x: 0.4, y: 0))
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        node.geometry = shape
        
        
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        /*let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        */
        node.position = SCNVector3(0, 0, -0.7)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func reset(_ sender: Any) {
        restartSession()
    }
    
    func restartSession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{
            (node, _)
            in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random())/CGFloat(UINT32_MAX)*abs(firstNum-secondNum)+min(firstNum, secondNum)
    }
    
    
    
    
    
    
    
    
    
    
    
}

