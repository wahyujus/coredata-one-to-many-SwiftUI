//
//  ContentView.swift
//  hufffffff
//
//  Created by wahyujus on 16/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Wizard.date, ascending: false)])
    var wizards: FetchedResults<Wizard>
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(wizards,id:\.self){ wizard in
                        
                        VStack {
//                            Text(wizard.name ?? "asd")
                                                        Section(header: Text(wizard.wrappedName)){
                            ForEach(wizard.candyArray, id:\.self){ candy in
                                Text(candy.wrappedCandyName)
                            }
                                                        }}
                    }
                    .onDelete(perform: deleteTasks)
                }
                Button("add item"){
                    addNew()
                }
                
            }.navigationTitle("asd")
            .navigationBarItems(leading: Button("add ke rendang"){
//                saveMovie()
                                addNew()
            },trailing: Button("Add ke sop"){
                addMovie()
            })
        }
    }
    
    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map { wizards[$0] }.forEach(moc.delete)
            saveMovie()
        }
    }
    
    private func addMovie(){
        withAnimation{
//            let movie = Wizard(context: self.moc)
//            movie.name = "Interstellar"
            let candy2 = Candy(context: self.moc)
            candy2.candyName = "rambut ail"
            candy2.origin = Wizard(context: self.moc)
            candy2.origin?.name = "Sop Ail"
            candy2.origin?.date = Date()
            
            saveMovie()
        }
                
    }
    
    private func saveMovie(){
        do {
            try self.moc.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func addNew(){
        withAnimation{
            //            let add = Wizard(context: self.moc)
            //            add.name = "asd"
            
            let candy4 = Candy(context: self.moc)
            candy4.candyName = "daging ail"
            candy4.origin = Wizard(context: self.moc)
            candy4.origin?.name = "Rendang Ail"
            candy4.origin?.date = Date()
            
            try? self.moc.save()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
