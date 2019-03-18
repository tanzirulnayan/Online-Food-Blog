var express = require('express');
var userModel = require.main.require('./model/user-model');
var adminModel = require.main.require('./model/admin-model');
var memberModel = require.main.require('./model/member-model');
var router = express.Router();

router.get('/', (req, res)=>{
	res.render('signup/index');
});

router.get('/member', (req, res)=>{
	res.render('signup/member');
});

router.get('/admin', (req, res)=>{
	res.render('signup/admin');
});

router.post('/member', (req, res)=>{	
	if(req.body.password == req.body.conPassword)
	{
		var user={
			uname 	 : req.body.username,
			password : req.body.password,
            type 	 : "MEMBER",
            status   : "VALID"
		};
		userModel.insert(user, function(success){
			if(success){
				var  member = {
					id		:req.body.username,
					name	:req.body.name,
					address :req.body.address,
					email 	:req.body.email,
					image	:"/pictures/" + res.req.file.filename
				}; 
				memberModel.insert(member, function(success){
					if(success){
						res.redirect('/login');
					}
					else{
						res.redirect('/signup/member');
					}
				});
			}
			else{
				res.redirect('/signup/member');
			}
		});	
	}
	else
	{
		res.redirect('signup/member');
	}
});

router.post('/admin', (req, res)=>{	
	if(req.body.password == req.body.conPassword)
	{
		var user={
			uname 	 : req.body.username,
			password : req.body.password,
            type 	 : "ADMIN",
            status   : "INVALID"
		};
		console.log(user);
		userModel.insert(user, function(success){
			if(success){
				var  admin = {
					id		:req.body.username,
					name	:req.body.name,
					address :req.body.address,
					email 	:req.body.email,
					image	:"/pictures/" + res.req.file.filename
				}; 
				adminModel.insert(admin, function(success){
					if(success){
						res.redirect('/login');
					}
					else{
						res.redirect('/signup/admin');
					}
				});
			}
			else{
				res.redirect('/signup/admin');
			}
		});	
	}
	else
	{
		res.redirect('signup/admin');
	}
});

module.exports = router;