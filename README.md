# Navigator

# Usage 

```swift
struct ContentView: View {
    @State var destination: AnyView? = nil
    
    var body: some View {
        NavigationView {
            VStack  {
                Button(action: {
                    self.destination = AnyView(Text("child 1"))
                }) {
                    Text("tap 1")
                }
                Button(action: {
                    self.destination = AnyView(Text("child 2"))
                }) {
                    Text("tap 2")
                }
            }.navigator(destination)
        }
    }
}
```
