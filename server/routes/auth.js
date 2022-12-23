//  IMPORT FROM OTHER FILES  //
const User = require("../models/user");

//  IMPORT FROM OTHER PACKAGES  //
const express = require("express");
const bcryptjs = require("bcryptjs");
const jwt= require("jsonwebtoken");
const authRouter = express.Router();

//////////  EXPORTING  //////////
module.exports = authRouter;

authRouter.get("/user", (res) => {
    res.json( {name: "PetsHub"});
})

//////////  SIGNUP API  //////////
authRouter.post("/api/signup", async function(req, res) {
    try{
        const { firstname, lastname , email, password } = req.body;
        const existingUser = User.findOne({ email });
        if (existingUser) {
        return res.status(400).json({
            msg: "User with same email already exists !",
            });
        }
        const hashedPassword = await bcryptjs.hash(password,8);
        let user = new User({
            firstname,
            lastname,
            email,
            password: hashedPassword,
        });
        user = await user.save();
        res.json(user);
    }
    catch (e) {
        res.status(500).json({ 
            error: e.message 
        });
    }
});

//////////  SIGNIN API  //////////
authRouter.post("/api/signin", async (req, res) => {
    try{
     const {email, password} = req.body;
        const user = await User.findOne( {email} );
        if(!user) {
            return res.status(400).json({
                msg: "User with this email does not exists !",
            });
        }
        const isMatch = await bcryptjs.compare( password, user.password);
        if(!isMatch) {
            return res.status(400).json({
                msg: "Password Incorrect !",
            });
        }
        const token = jwt.sign( {id: user._id}, "passwordKey");
        res.json({token, ...user._doc});
    }
    catch (e) {
        res.status(500).json({
            error : e.message
        });
    }
});

