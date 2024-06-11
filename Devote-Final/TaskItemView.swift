//
//  TaskItemView.swift
//  Devote-Final
//
//  Created by shopnil hasan on 9/6/24.
//

import SwiftUI

struct TaskItemView: View {
    @State var item: Tasks = Tasks(task: "Hemlo")
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task)
            .font(.system(.title2, design: .rounded))
            .fontWeight(.heavy)
            .foregroundStyle(item.completion ? Color.pink : Color.primary)
            .padding(.vertical, 12)
        }
        .toggleStyle(CheckBox())
        .onTapGesture {
            withAnimation() {
                item.completion.toggle()
            }
        }
    }
}

#Preview {
    TaskItemView()
}
