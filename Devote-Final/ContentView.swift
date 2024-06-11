//
//  ContentView.swift
//  Devote-Final
//
//  Created by shopnil hasan on 9/6/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingTaskItem = false
    @Environment(\.modelContext) private var context
    @Query(sort: \Tasks.date) var tasks : [Tasks]
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    HStack {
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                        Spacer()
                        
                        EditButton()
                            .font(.system(size: 16,weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth: 70, minHeight: 24)
                            .background(
                                Capsule().stroke(.white, lineWidth: 2)
                            )
                        
                        Button {
                            isDarkModeOn.toggle()
                            playSound(sound: "sound-tap", type: "mp3")
                        } label: {
                            Image(systemName: "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .font(.system(.title, design: .rounded))
                        }
                    }//: HSTACK
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 80)
                    
                    Button {
                        withAnimation {
                            showingTaskItem = true
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        
                        Text("New Task")
                            .font(.system(size: 24,weight: .bold, design: .rounded))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                    backGroundGradient
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
                    )

                    List {
                        ForEach(tasks) {task in
                            TaskItemView(item: task)
                        }
                        .onDelete(perform: { indexSet in
                            withAnimation {
                                indexSet.map {tasks[$0]}.forEach(context.delete)
                            }
                        })
                    }//: LIST
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: .black.opacity(0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                }//: VSTACK
                .blur(radius: showingTaskItem ? 8 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                
                // MARK: Shows New Task Bar
                if showingTaskItem {
                    BlankView(backgroundColor: Color.gray, backgroundOpacity: 0.3)
                        .onTapGesture {
                            withAnimation {
                                showingTaskItem = false
                            }
                        }
                    NewTaskItemView(isShowing: $showingTaskItem)
                }
            }//: ZSTACK
            .background(
            BackgroundImageView()
                .blur(radius: showingTaskItem ? 8 : 0, opaque: false)
            )
            .background(backGroundGradient.ignoresSafeArea(.all))
        }//: NAVIGATIONVIEW
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
