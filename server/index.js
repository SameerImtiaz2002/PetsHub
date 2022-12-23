//  IMPORT FROM OTHER PACKAGES  //
const express = require("express");
const mongoose = require("mongoose");

//  IMPORT FROM OTHER FILES  //
const authRouter = require("./routes/auth.js");

//////////  INITILIZATION  //////////
const app = express();
const PORT = 3000;
const DB = "mongodb+srv://petshub:petshub007@cluster1.g3wxjkk.mongodb.net/?retryWrites=true&w=majority"
mongoose.set('strictQuery', true);

//////////  MIDDLEWARE  //////////
app.use(express.json())
app.use("/auth", authRouter);

//////////  CONNECTIONS  //////////
mongoose
    .connect(DB)
    .then( function() {
        console.log("Connection Successful");
    })
    .catch( function(e) {
        console.log(e);
    });

app.listen(PORT, "0.0.0.0", function() {
    console.log("CONNECTED AT PORT: " + PORT);
});

