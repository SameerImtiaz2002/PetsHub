/////  IMPORT FROM PACKAGES  /////
mongoose = require("mongoose");

//////////  INITILIZATION  //////////
const userSchema = mongoose.Schema({
    firstname: {
        required: true,
        type: String,
        trim: true,
    },
    lastname: {
        required: true,
        type: String,
        trim: true,        
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
                message: "Please enter a valid email address.";
            },
        },
    },
    password: {
        required: true,
        type: String,
        validate: {
            validator: (value) => {
                return value.length > 8;
                message: "Please enter a eight digit password.";
            },
        },
    },
});

//////////  EXPORTING  //////////
const User = mongoose.model("User", userSchema);
module.exports = User;

