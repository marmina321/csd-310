
create database whatabook;



CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';


CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);



CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

insert into store (locale) values('Galvin BOOKs');


insert into book(book_name,author,details) values ('To Kill a Mockingbird','Harper Lee','This classic novel follows a young girl growing up in the South during the Great Depression and her father, a lawyer who defends a black man falsely accused of rape.');

insert into book(book_name,author,details) values ('1984','George Orwell','Set in a dystopian society in which the government controls all aspects of life, this novel follows a man who rebels against the oppressive regime');



 
insert into book(book_name,author,details) values ('The Catcher in the Rye','J.D. Salinger','This novel follows a teenage boy who is struggling to find his place in the world after being expelled from his prep school.');

insert into book(book_name,author,details) values ('The Great Gatsby','F. Scott Fitzgerald','This classic novel is set in the 1920s and follows a mysterious millionaire as he tries to win back his lost love.');

insert into book(book_name,author,details) values ('Pride and Prejudice','Jane Austen','This beloved novel follows the romantic entanglements of the Bennet sisters as they navigate societal expectations and class divisions in 19th century England.');

insert into book(book_name,author,details) values ('One Hundred Years of Solitude','Gabriel Garcia Marquez','This novel tells the story of the Buendia family over the course of several generations, blending magical realism with historical events in Colombia.');

insert into book(book_name,author,details) values ('The Adventures of Huckleberry Finn','Mark Twain','Set in the antebellum South, this novel follows a young boy who runs away from home and embarks on a series of adventures along the Mississippi River.');

insert into book(book_name,author,details) values ('Beloved','Toni Morrison','This novel tells the story of a former slave who is haunted by the memories of her past and the ghost of her daughter.');

insert into book(book_name,author,details) values ('The Road','Cormac McCarthy','This post-apocalyptic novel follows a father and son as they journey through a desolate, dangerous landscape in search of safety and a better future.');
 
 
insert into user (first_name,last_name) values('Mina','Sedik');
insert into user (first_name,last_name) values('Poulus','Khozam');
insert into user (first_name,last_name) values('Mark','Fawzy');

insert into wishlist (user_id,book_id) values(1,4);
insert into wishlist (user_id,book_id) values(2,7);
insert into wishlist (user_id,book_id) values(3,6);



