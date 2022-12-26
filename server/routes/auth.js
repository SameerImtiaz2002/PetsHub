//  IMPORT FROM OTHER FILES  //
const User = require("../models/user");
const express = require("express");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");
const authRouter = express.Router();

//////////  EXPORTING  //////////
module.exports = authRouter;

authRouter.get("/user", (res) => {
  res.json({ name: "PetsHub" });
});

//////////  SIGNUP API  //////////
authRouter.post("/api/signup", async function (req, res) {
  try {
    const { firstname, lastname, email, password } = req.body;
    const existingUser = User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({
        msg: "User with same email already exists !",
      });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
      firstname,
      lastname,
      email,
      password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({
      error: e.message,
    });
  }
});

//////////  LOGIN API  //////////
authRouter.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({
        msg: "User with this email does not exists !",
      });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({
        msg: "Password Incorrect !",
      });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({
      error: e.message,
    });
  }
});

//////////  TOKEN VALIDATION  //////////
authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

////////// GET USER DATA  //////////
authRouter.get('/', auth, async (req, res) => {
    const user  = await User.findById(req.user);
    res.json({...user._doc, token: req.token});
})