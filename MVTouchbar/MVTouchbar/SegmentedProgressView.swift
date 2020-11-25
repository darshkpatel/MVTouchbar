//
//  SegmentedProgressView.swift
//  MVTouchBar
//
//  Created by darsh on 25/11/20.
//

import SwiftUI
struct SegmentedProgressView: View {
  var value: Int
  var maximum: Int = 10
  var height: CGFloat = 20
    var spacing: CGFloat = 2
  var selectedColor: Color = .accentColor
  var unselectedColor: Color = Color.secondary.opacity(0.3)
  var body: some View {
    HStack(spacing: spacing) {
      ForEach(0 ..< maximum) { index in
        Rectangle()
          .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
      }
    }
    .frame(maxHeight: height)
    .clipShape(Capsule())
  }
}

struct SegmentedProgressView_Previews: PreviewProvider {
    @State var Barvalue: Int = 5
    static var previews: some View {
        SegmentedProgressView(value: 2)
    }
}
