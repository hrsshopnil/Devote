//
//  CheckBox.swift
//  Devote-Final
//
//  Created by shopnil hasan on 9/6/24.
//

import SwiftUI

struct CheckBox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design:  .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    if configuration.isOn {
                        playSound(sound: "sound-ding", type: "mp3")
                    } else {
                        playSound(sound: "sound-rise", type: "mp3")
                    }
                }
            configuration.label
        }
    }
}

#Preview {
    Toggle("Hemlo", isOn: .constant(true))
        .toggleStyle(CheckBox())
}
