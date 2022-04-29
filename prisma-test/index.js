//routes
const app = require("./Backend/routes/index");

app.get('/', (req, res) => {
    res.json("Test");
})

//port number
const PORT = process.env.PORT || 5000;

//app to run at this port number
app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}...`);
});