# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ReadingList.destroy_all
Review.destroy_all
Book.destroy_all
User.destroy_all
Author.destroy_all
Genre.destroy_all

#USERS
aude = User.create(email_address: "aude53@gmail.com", password: "aude")

#AUTHORS
jane = Author.create(name: "Jane Austen")

#GENRES
romance = Genre.create(name: "Romance")

#BOOKS
pride = Book.create(title: "Pride and Prejudice", synopsis: "Pride and Prejudice is one of the greatest romances ever wrote. If you've always wanted to read the classic, but just don't have the time, this abridged version can help. At just 15,000 (100's of pages shorter than the original) words long, this version of the classic novel will let you read Austen's classic in just hours, and provide you with an excellent overview of the entire novel. The story follows the main character Elizabeth Bennet as she deals with issues of manners, upbringing, morality, education and marriage in the society of the landed gentry of early 19th-century England. Elizabeth is the second of five daughters of a country gentleman, living near the fictional town of Meryton in Hertfordshire, near London. BookCaps' is a leader in eBook study guides; the BookCaps abridged classic series is intended to give readers a chance to read classic novels in hours instead of days. BookCaps is not trying to replace these classic novels—its intention is to provide an introduction to readers, so they can read and appreciate the novel in its entirely when they have free time.", published_date: 2008, author: jane, genre: romance)
sense = Book.create(title: "Sense and Sensibility", synopsis: "This first of Jane Austen's published novels is the story of two starkly different English sisters: Elinor Dashwood, the epitome of prudence and self-control, and her younger, more impetuous sister Marianne, who embodies emotion, openness, and sheer enthusiasm. To each comes the sorrow of unhappy love: Elinor desires a man who is promised to another, while Marianne loses her heart to a scoundrel who jilts her. Their mutual suffering brings a closer understanding between the two sisters--and true love finally triumphs when sense gives way to sensibility and sensibility gives way to sense. Newly designed and typeset in a modern 6-by-9-inch format by Waking Lion Press.", published_date: 2008, author: jane, genre: romance)

#REVIEWS
review1 = Review.create(rating: 5, content: "Great Book", user: aude, book: pride)
review2 = Review.create(rating: 4, content: "Good Book", user: aude, book: sense)

#READING LISTS
aude_list = ReadingList.create(user: aude, book: pride)
aude_list = ReadingList.create(user: aude, book: sense)



