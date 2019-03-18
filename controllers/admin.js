var express = require('express');
var userModel = require.main.require('./model/user-model');
var adminModel = require.main.require('./model/admin-model');
var router = express.Router();

router.get('*', function(req, res, next){
	if(req.session.uId != null){
		next();
	}else{
		res.redirect('/login');
	}
});

router.get('/', (req, res)=>{
	var user = {
		name: req.session.uId
	};
	res.render('admin/index', user);
});	


router.get('/userlist', (req, res)=>{
	
	userModel.getAll(function(results){
		if(results.length > 0){
			
			var user = {
				name: req.session.uId,
				uList: results
			};
			res.render('home/userlist', user);
		}
	});	
});

router.get('/profile', (req, res)=>{
	adminModel.get(req.session.uId, function(result){
		if(result.length > 0){
			res.render('admin/profile', result[0]);
		}
	});	
});

router.get('/editProfile', (req, res)=>{
	adminModel.get(req.session.uId, function(result){
		if(result.length > 0){
			res.render('admin/editProfile', result[0]);
		}
	});	
});

router.post('/editProfile', (req, res)=>{
	var admin = {
		id 	 : req.session.uId,
		name : req.body.name,
		address : req.body.address,
		email	: req.body.email
	}
	adminModel.update(admin, function(success){
		if(success){
			res.redirect('/admin/profile');
		}else{
			res.redirect('/admin/editProfile');
		}
	});	
});

router.get('/adduser', (req, res)=>{
	res.render('home/adduser');
});	

router.post('/adduser', (req, res)=>{
	
	var user ={
		uname : req.body.uname,
		password : req.body.password,
		type : req.body.type
	};
	
	userModel.insert(user, function(success){
		if(success){
			res.redirect('/home/userlist');
		}else{
			res.render("/home/adduser");
		}
	});
});

router.get('/edit/:id', (req, res)=>{

	userModel.get(req.params.id, function(result){
		if(result.length >0 ){
			res.render('home/edit', result[0]);
		}else{
			res.redirect('/home/userlist');
		}
	});
});	

router.post('/edit/:id', (req, res)=>{
	
	var user ={
		id: req.params.id,
		uname : req.body.uname,
		password : req.body.password,
		type : req.body.type
	};
	
	userModel.update(user, function(success){
		if(success){
			res.redirect('/home/userlist');
		}else{
			res.render("/home/edit/"+req.params.id);
		}
	});
});

router.get('/delete/:id', (req, res)=>{

	userModel.get(req.params.id, function(result){
		if(result.length >0 ){
			res.render('home/delete', result[0]);
		}else{
			res.redirect('/home/userlist');
		}
	});
});	

router.post('/delete/:id', (req, res)=>{
	
	userModel.delete(req.params.id, function(success){
		if(success){
			res.redirect('/home/userlist');
		}else{
			res.redirect("/home/delete/"+req.params.id);
		}
	});
});
module.exports = router;