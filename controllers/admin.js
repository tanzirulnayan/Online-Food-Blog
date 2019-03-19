var express = require('express');
var adminModel = require.main.require('./model/admin-model');
var restaurantModel = require.main.require('./model/restaurant-model');
var foodModel = require.main.require('./model/food-model');
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

router.get('/addRestaurant', (req, res)=>{
	res.render('admin/addRestaurant');
});	

router.post('/addRestaurant', (req, res)=>{
	var restaurant ={
		name 		: req.body.name,
		description : req.body.description,
		type 		: req.body.type,
		location	: req.body.location,
		status		: "VALID",
		image		: "/pictures/" + res.req.file.filename
	};
	
	restaurantModel.insert(restaurant, function(success){
		if(success){
			res.redirect('/admin/restaurants');
		}else{
			res.render("/admin/addRestaurant");
		}
	});
});

router.get('/restaurants', (req, res)=>{
	restaurantModel.getAll(function(results){
		if(results.length > 0){
			var restaurants = {
				restaurantList: results
			};
			res.render('admin/restaurantList', restaurants);
		}
	});	
});

router.get('/restaurant/addMenu/:restaurantId', (req, res)=>{
	restaurantModel.get(req.params.restaurantId, function(result){
		if(result.length > 0){
			res.render('admin/addMenu', result[0]);
		}
	});
});

router.post('/restaurant/addMenu/:restaurantId', (req, res)=>{
	var food = {
		title 		 : req.body.title,
		description  : req.body.description,
		image		 : "/pictures/" + res.req.file.filename,
		restaurantId : req.params.restaurantId
	};
	foodModel.insert(food, function(success){
		if(success){
			res.redirect('/admin/restaurant/view/'+req.params.restaurantId);
		}else{
			res.redirect("/admin/restaurant/addMenu/"+req.params.restaurantId);
		}
	});
});

router.get('/restaurant/:restaurantId/menu/delete/:menuId', (req, res)=>{
	foodModel.get(req.params.menuId, function(result){
		if(result.length > 0){
			res.render('admin/deleteMenu', result[0]);
		}
	});
});

router.post('/restaurant/:restaurantId/menu/delete/:menuId', (req, res)=>{
	foodModel.delete(req.params.menuId, function(success){
		if(success){
			res.redirect('/admin/restaurant/view/'+req.params.restaurantId);
		}else{
			res.redirect('/admin/restaurant/'+req.params.restaurantId+'/menu/delete/'+req.params.menuId);
		}
	});
});

router.get('/restaurant/view/:restaurantId', (req, res)=>{
	var restaurantDetails;
	restaurantModel.get(req.params.restaurantId, function(result){
		if(result.length > 0){
			restaurantDetails = result[0];
			foodModel.getAllByRestaurantId(req.params.restaurantId, function(results){
				if(results.length > 0){
					var menu = {
						restaurant	: restaurantDetails,
						menuList : results
					};
					res.render('admin/restaurantMenu', menu);
				}
				else{
					var menu = {
						restaurant	: restaurantDetails,
						menuList : ""
					};
					res.render('admin/restaurantMenu', menu);
				}
			});
		}
	});
});

router.get('/restaurant/edit/:restaurantId', (req, res)=>{
	restaurantModel.get(req.params.restaurantId, function(result){
		if(result.length >0 ){
			res.render('admin/editRestaurant', result[0]);
		}else{
			res.redirect('/admin/restaurants');
		}
	});
});	

router.post('/restaurant/edit/:restaurantId', (req, res)=>{
	var restaurant ={
		id			: req.body.id,
		name 		: req.body.name,
		description : req.body.description,
		type 		: req.body.type,
		location	: req.body.location,
		status		: "VALID",
	};
	restaurantModel.update(restaurant, function(success){
		if(success){
			res.redirect('/admin/restaurants');
		}else{
			res.render("/admin/restaurant/edit/"+req.params.restaurantId);
		}
	});
});

router.get('/restaurant/delete/:restaurantId', (req, res)=>{
	restaurantModel.get(req.params.restaurantId, function(result){
		if(result.length >0 ){
			res.render('admin/deleteRestaurant', result[0]);
		}else{
			res.redirect('/admin/restaurants');
		}
	});
});	

router.post('/restaurant/delete/:restaurantId', (req, res)=>{
	restaurantModel.delete(req.params.restaurantId, function(success){
		if(success){
			res.redirect('/admin/restaurants');
		}else{
			res.redirect("/admin/restaurant/delete/"+req.params.restaurantId);
		}
	});
});

module.exports = router;