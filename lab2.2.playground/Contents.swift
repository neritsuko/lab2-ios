class Book {
    let title: String
    let author: String
    let year: Int
    let pageCount: Int
    
    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }
    
    func displayBookInfo() {
        print("Title: \(title)")
        print("Author: \(author)")
        print("Year: \(year)")
        print("Page Count: \(pageCount)")
    }
}

class Library {
    var books: [Book]
    
    init() {
        self.books = []
    }
    
    func addBook() {
        print("Enter book details.")
        print("Enter the title:", terminator: " ")
        let title = readLine() ?? ""
        print("Enter the author:", terminator: " ")
        let author = readLine() ?? ""
        print("Enter the year:", terminator: " ")
        let yearString = readLine() ?? ""
        print("Enter the number of pages:", terminator: " ")
        let pageCountString = readLine() ?? ""
        
        if let year = Int(yearString), let pageCount = Int(pageCountString) {
            let newBook = Book(title: title, author: author, year: year, pageCount: pageCount)
            books.append(newBook)
            print("'\(title)' was added to the library.")
        } else {
            print("Incorrect input.")
        }
    }
    
    func removeBook() {
        print("Enter the title of the book to remove:", terminator: " ")
        let titleToRemove = readLine() ?? ""
        
        if let index = books.firstIndex(where: { $0.title == titleToRemove }) {
            let removedBook = books.remove(at: index)
            print("'\(removedBook.title)' was removed from the library.")
        } else {
            print("'\(titleToRemove)' is not found in the library.")
        }
    }
    
    func displayLibraryInfo() {
        if books.isEmpty {
            print("The library is empty.")
        } else {
            print("Books in the library:")
            for book in books {
                book.displayBookInfo()
                print()
            }
        }
    }
}

let library = Library()

var continueInput = true

while continueInput {
    print("Please choose:")
    print("1. Add a book")
    print("2. Remove a book")
    print("3. Display library information")

    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            library.addBook()
        case 2:
            library.removeBook()
        case 3:
            library.displayLibraryInfo()
        default:
            print("Incorrect choice. Please enter a number from 1 to 3.")
        }
    } else {
        print("Incorrect input. Please enter a number from 1 to 3.")
    }
}
