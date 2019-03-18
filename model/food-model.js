var db = require('./db');

module.exports={
	get: function(foodId, callback){
		var sql = "select * from foods where =F_ID = ?";

		db.getResult(sql, [foodId], function(result){
			callback(result);
		});
	},
	getAll: function(callback){
		var sql = "select * from foods";
		db.getResult(sql, [], function(results){
			callback(results);
		});
	},
	insert: function(food, callback){
		var sql = "insert into foods values (NULL, ?, ?, ?, ?)";
		db.execute(sql, [food.title, food.description, food.image, food.restaurantId], function(status){
			callback(status);
		});
	},
	update: function(food, callback){
		var sql = "update foods set F_TITLE = ?, F_DESCRIPTION = ?, F_IMAGE = ?, R_ID = ? where F_ID = ?";
		db.execute(sql, [food.name, food.description, food.type, food.location, food.status, food.image, food.id], function(status){
			callback(status);
		});
	},
	delete: function(foodId, callback){
		var sql = "delete from foods where F_ID = ?";
		db.execute(sql, [foodId], function(status){
			callback(status);
		});
	}
}