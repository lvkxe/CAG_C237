const { name } = require('ejs');
const express = require('express');
const mysql = require('mysql');
const path = require('path')
const app = express();

// Create MySQL connection
const connection = mysql.createConnection({
    //host: 'localhost',
    //user: 'root',
    //password: '',
    //database: 'clothingshopcag2'
    //host: 'sql.freedb.tech',
    //user: 'freedb_C237CAG',
    //password: 'e4#5Z@FY4fHF5gH',
    //database: 'freedb_C237CAG'
    host: 'pro.freedb.tech',
    user: 'pandas',
    password: 'qjj3BGQTr7nf2R$',
    database: 'pro.freedb.tech'
});

/*
    Server: sql12.freemysqlhosting.net
    Name: sql12708695
    Username: sql12708695
    Password: CPudZWdTZ2
    Port number: 3306
*/

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

// Set up view engine
app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'public')));
app.set('views', path.join(__dirname, 'views'));

// Enable static files
app.use(express.static('public'));

// Enable form processing
app.use(express.urlencoded({
    extended: false 
}));

//--------------------------------------------------
// L08 AM - Read

//R - get all items  (it can be "/" or "/getAllItems")
app.get("/", (req, res) => {
    //database mysql connection
    const sql = "SELECT * FROM products"
    connection.query(sql, (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.render('index', { products:results }); // Render HTML page with data
    });
    
});

app.get('/home', (req, res) => {
    res.render('home');
});

app.get('/products', (req, res) => {
    const products = [
        { productid: 1, productname: 'Product A' },
        { productid: 2, productname: 'Product B' },
        // Add more products as needed
    ];
    res.render('product-list', { products: products });
});     
app.post('/products', (req, res) => {
    const { productid, productname } = req.body;
    console.log(productid, productname);
    res.redirect('/products');
});

//R - get item by id (it can be "/product/:id" or "/getProductByID/:id")
app.get("/products/:id", (req, res) => {
    const id = req.params.id;

    //database mysql connection
    const sql = "SELECT * FROM products WHERE productid = ?"
    connection.query(sql, [id], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.render('products', { products:results[0] }); // Render HTML page with the first row 
    });
});



//--------------------------------------------------
// L08 PM - Create


//C - display form
app.get("/addProduct", (req, res) => {
    res.render("addProduct");
});

//C - process form
app.post("/addProduct", (req, res) => {
    //Extract data
    const {productid, productname, productprice, image} = req.body;
    
    //optional print for debugging
    console.log("ID: " + productid)
    console.log("Name: " + productname);    
    console.log("Price: " + productprice );
    console.log("Image: " + image );
    
    //insert into database
    sql = "INSERT INTO products (productid, productname, productprice, image) VALUES (?, ?, ?, ?)";
    connection.query(sql, [productid, productname, productprice, image], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.redirect("/"); // Redirect to home page
    });


});


//L09 - Update
app.get('/editProduct/:id', (req, res) => {
    const productid = req.params.id;
    const sql = 'SELECT * FROM products WHERE productId = ?';

    connection.query(sql, [productid], (error, results) => {
        if (error) {
            console.error("Error updating product", error.message);
            return res.status(500).send("Error retrieving product by ID");
        } if (results.length > 0) {
            res.render('editProduct', { products: results[0] });
        } else {
            res.redirect('/');
        }
    });
});

app.post('/editProduct/:id', (req, res) => {
    const productId = req.params.id;
    const {productname, productprice, image} = req.body;
    let Image = req.body.currentImage;
    if (req.file) {
        Image = req.file.filename;
    }
    
    const sql = 'UPDATE products SET productName = ?, quantity = ?, price = ? WHERE productId = ?';

    connection.query(sql, [productname, productprice, image], (error, results) => {
        if (error) {
            console.error("Error updating product", error);
            res.status(500).send("Error updating product");
        } else {
            res.redirect('/');
        }
    });
});
//L09 - Delete
app.get('/deleteProduct/:id', (req, res) => {
    const productid = req.params.id;
    const sql = "DELETE FROM products WHERE productId = ?";
    connection.query(sql, [productid], (error, results) => {
        if (error) {
            console.error("Error deleting product", error);
            res.status(500).send("Error deleting product");
        } else {
            res.redirect("/");
        }
    });
});

app.get('/support', (req, res) => {
    res.render('support');
});

app.post('/support', (req, res) => {
    const { name, email, message } = req.body;
    console.log(name, email, message);
    res.redirect('/');
});
 app.get('/home', (req, res) => {
    res.render('home');
 });

 app.get('/home', (req, res) => {
    const {productid, productname, productprice, image} = req.body;
    console.log(productid, productname, productprice, image);
    res.redirect('/');
 });

 app.get('/register', (req, res) => {
    res.render('register');
 });

 app.post('/register', (req, res) => { 
    const { name, email, password } = req.body;
    console.log(name,email,password);
    res.redirect('/');
});

app.get('/signin', (req, res) => {
    res.render('signin');
});

app.post('/signin', (req, res) => {
    const { email, password } = req.body;
    console.log(email, password);
    res.redirect('/home');
});

app.get('/cart', (req, res) => {
    res.render('cart');
});

app.post('/cart', (req, res) => {
    const { productid, productname, productprice, image } = req.body;
    console.log(productid, productname, productprice, image);
    res.redirect('/');
});

app.get('/product', (req, res) => {
    res.render('product');
});

app.post('/product', (req, res) => {
    const { productid, productname, productprice, image } = req.body;
    console.log(productid, productname, productprice, image);
    res.redirect('/');
});

app.get('/forgotpwd', (req, res) => {
    res.render('forgotpwd');
});

app.post('/forgotpwd', (req, res) => {
    const { email, password } = req.body;
    console.log(email, password);
    res.redirect('/signin');
}); 

const PORT = process.env.PORT || 3004; 
app.listen(PORT, () => console.log(`Server running on port at http://localhost:${PORT}`)); 
