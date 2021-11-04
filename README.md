# Random-Trivia-API-iOS-App
This app demonstrates how to connect to an API over the network, and display its results. The API 
in question returns a string, a random fact, which we display in the user interface.

The networking information goes into play within the ContentModel of the app:
```
class ContentModel: ObservableObject {
    
    @Published var fact = ""
    
    init() {
        // Get one fact from the random website
        fetchRandomFact()
    }
    
    // MARK: - Methods
    
    /*
     Issues an HTTP request to get a random fact, then set this to the random fact property
     */
    func fetchRandomFact() {
        
        let urlString = "http://numbersapi.com/random/trivia"
        
        // Create a URL object
        let url = URL(string: urlString)
        
        // Check that the URL exists
        guard url != nil else {
            return
        }
        
        // Create a URL request object
        let urlRequest = URLRequest(url: url!)
        
        // Access the shared Session object used for network tasks
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            // Ensure no errors happened
            guard error == nil else {
                return
            }
            
            // Ensure that there is text
            if data != nil {
                
                // Convert the text based response from the API from a data object to a string
                if let stringData = String(data: data!, encoding: .utf8) {
    
                    // Make updates to the UI in the main thread, and not in a background thread
                    DispatchQueue.main.async {
                        self.fact = stringData
                    }
                }
                
            }
                        
        }
        
        // Issues the GET here, then handles it above
        dataTask.resume()
        
    }
    
}

```
