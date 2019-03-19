var express = require('express');
var adminModel = require.main.require('./model/admin-model');
var restaurantModel = require.main.require('./model/restaurant-model');
var foodModel = require.main.require('./model/food-model');
var router = express.Router();

router.get('/:restaurantId', (req, res)=>{
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
					res.render('restaurant/menu', menu);
				}
				else{
					var menu = {
						restaurant	: restaurantDetails,
						menuList : ""
					};
					res.render('restaurant/menu', menu);
				}
			});
		}
	});
});	



module.exports = router;