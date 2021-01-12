kitty = User.create(username: "kitty", password: "kittycat", email: "kitty@cat.com")

paul = User.create(username: "paul", password: "paulanka", email: "paul@anka.com")

plath = Author.create(name: "Sylvia Plath")

belljar = Book.create(title: "The Bell Jar", description: "Sylvia Plath's shocking, realistic, and intensely emotional novel about a woman falling into the grip of insanity", genre: "Roman à clef", author_id: plath.id, user_id: kitty.id)

br = Review.create(title: "Superb", stars: 5, content: "A phenomenal book!", book_id: belljar.id, user_id: kitty.id)