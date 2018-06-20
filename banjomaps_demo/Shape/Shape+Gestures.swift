//
//  Shape+Gestures.swift
//  banjomaps_demo
//
//  Created by Dmitrii Zverev on 20/6/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import  UIKit

extension Shape: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
extension Shape {
    func addGestures()  {
        self.isMultipleTouchEnabled = true
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action:nil)) //To Override superview's  UITapGestureRecognizer
        let doubleTap  = UITapGestureRecognizer(target: self, action:  #selector(self.doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTap)
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action:  #selector(self.handlePan)))
        let pitch = UIPinchGestureRecognizer(target: self, action:  #selector(self.handlePinch))
        pitch.delegate = self
        self.addGestureRecognizer(pitch)
        let rotate = UIRotationGestureRecognizer(target: self, action:  #selector(self.rotatePiece))
        rotate.delegate = self
        self.addGestureRecognizer(rotate)
    }
    
    @objc private func doubleTapped()  {
        UIImpactFeedbackGenerator().impactOccurred()
        self.decore()
    }
    
   @objc func rotatePiece(_ gestureRecognizer : UIRotationGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        if gestureRecognizer.state == .began {self.superview?.bringSubview(toFront: self)}
        gestureRecognizer.view?.transform = gestureRecognizer.view!.transform.rotated(by: gestureRecognizer.rotation)
        gestureRecognizer.rotation = 0
    }

    @objc private func handlePinch(gestureRecognizer: UIPinchGestureRecognizer) {
        guard let gestureRecognizerView =  gestureRecognizer.view else {return}
        if gestureRecognizer.state == .began {self.superview?.bringSubview(toFront: self)}
        let pinchCenter = CGPoint(x: gestureRecognizer.location(in: gestureRecognizerView).x - gestureRecognizerView.bounds.midX,
                                  y: gestureRecognizer.location(in: gestureRecognizerView).y - gestureRecognizerView.bounds.midY)
        let transform = gestureRecognizerView.transform.translatedBy(x: pinchCenter.x, y: pinchCenter.y)
            .scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
            .translatedBy(x: -pinchCenter.x, y: -pinchCenter.y)
        gestureRecognizerView.transform = transform
        gestureRecognizer.scale = 1
    }
    
   @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let gestureRecognizerView =  gestureRecognizer.view else {return}
        if gestureRecognizer.state == .began {self.superview?.bringSubview(toFront: self)}
        let translation = gestureRecognizer.translation(in: self.superview)
        gestureRecognizerView.center = CGPoint(x:gestureRecognizerView.center.x + translation.x,
                              y:gestureRecognizerView.center.y + translation.y)
        gestureRecognizer.setTranslation(.zero, in: self.superview)
    }
}
