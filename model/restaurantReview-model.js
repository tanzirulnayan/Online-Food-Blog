var db = require('./db');

module.exports={
	get: function(restaurantReviewId, callback){
		var sql = "select * from restaurant_review where = RR_ID = ?";

		db.getResult(sql, [restaurantReviewId], function(result){
			callback(result);
		});
    },
    getByFoodId: function(foodId, callback){
		var sql = "select * from restaurant_review where = F_ID = ?";

		db.getResult(sql, [foodId], function(result){
			callback(result);
		});
	},
	getAll: function(callback){
		var sql = "select * from restaurant_review";
		db.getResult(sql, [], function(results){
			callback(results);
		});
	},
	insert: function(review, callback){
		var sql = "insert into restaurant_review values (NULL, ?, ?, ?, ?)";
		db.execute(sql, [review.text, review.time, review.restaurantId, review.userId], function(status){
			callback(status);
		});
	},
	update: function(review, callback){
		var sql = "update restaurant_review set RR_TEXT = ?, RR_TIME = ?, R_ID = ?, U_ID = ? where RR_ID = ?";
		db.execute(sql, [review.text, review.time, review.restaurantId, review.userId, review.reviewId], function(status){
			callback(status);
		});
	},
	delete: function(restaurantReviewId, callback){
		var sql = "delete from restaurant_review where RR_ID = ?";
		db.execute(sql, [restaurantReviewId], function(status){
			callback(status);
		});
	}
}