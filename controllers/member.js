var express = require('express');
var memberModel = require.main.require('./model/member-model');
var foodModel = require.main.require('./model/food-model');
var restaurantModel = require.main.require('./model/restaurant-model');
var router = express.Router();

router.get('*', function(req, res, next){
	if(req.session.uId != null){
		next();
	}else{
		res.redirect('/login');
	}
});

router.get('/', (req, res)=>{
	restaurantModel.getAll(function(results){
		if(results.length > 0){
			var restaurants = {
				name: req.session.uId,
				restaurantList: results
			};
			res.render('member/index', restaurants);
		}
		else{
			var restaurants = {
				name: req.session.uId,
				restaurantList: ""
			};
			res.render('member/index', restaurants);
		}
	});	
});	

router.get('/profile', (req, res)=>{
	memberModel.get(req.session.uId, function(result){
		if(result.length > 0){
			res.render('member/profile', result[0]);
		}
	});	
});

router.get('/editProfile', (req, res)=>{
	memberModel.get(req.session.uId, function(result){
		if(result.length > 0){
			res.render('member/editProfile', result[0]);
		}
	});	
});

router.post('/editProfile', (req, res)=>{
	var member = {
		id 	 : req.session.uId,
		name : req.body.name,
		address : req.body.address,
		email	: req.body.email
	}
	memberModel.update(member, function(success){
		if(success){
			res.redirect('/member/profile');
		}else{
			res.redirect('/member/editProfile');
		}
	});	
});

router.get('/restaurant/:restaurantId', (req, res)=>{
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
					res.render('member/restaurantMenu', menu);
				}
				else{
					var menu = {
						restaurant	: restaurantDetails,
						menuList : ""
					};
					res.render('member/restaurantMenu', menu);
				}
			});
		}
	});
});

module.exports = router;