//DECLARATION
var express 		= require('express');
var bodyParser 		= require('body-parser');
var exSession 		= require('express-session');
var cookieParser 	= require('cookie-parser');
var signup			= require('./controllers/signup');
var login			= require('./controllers/login');
var admin			= require('./controllers/admin');
var member 			= require('./controllers/member');
var logout			= require('./controllers/logout');
var app  			= express();
var port 			= 3000;

//CONFIGURATION
app.set('view engine', 'ejs');

//MIDDLEWARES
app.use(exSession({secret: 'my top secret code', saveUninitialized: true, resave: false}));
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use('/signup', signup);
app.use('/login', login);
app.use('/admin', admin);
app.use('/member', member);
app.use('/logout', logout);
app.use('/assets', express.static('ext'));
app.use('/pictures', express.static('images'));

//ROUTES
app.get('/', (req,res)=>res.send('Index page'));
app.get('/setCookie', (req,res)=>{
	res.cookie('cookie1', 'first cookie');
	res.send("done");
});

app.get('/viewCookie', (req,res)=>{
	res.send(req.cookies['cookie1']);
});

app.get('/rmCookie', (req,res)=>{
	res.clearCookie('cookie1');
	res.send('Done');
});


//SERVER STARTUP
app.listen(port, ()=>console.log('server started at'+port+"..."));