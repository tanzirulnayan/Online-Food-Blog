var db = require('./db');

module.exports={
	get: function(restaurantId, callback){
		var sql = "select * from restaurants where R_ID = ?";
		db.getResult(sql, [restaurantId], function(result){
			callback(result);
		});
	},
	getAll: function(callback){
		var sql = "select * from restaurants";
		db.getResult(sql, [], function(results){
			callback(results);
		});
	},
	insert: function(restaurant, callback){
		var sql = "insert into restaurants values (NULL, ?, ?, ?, ?, ?, ?)";
		db.execute(sql, [restaurant.name, restaurant.description, restaurant.type, restaurant.location, restaurant.status, restaurant.image], function(status){
			callback(status);
		});
	},
	update: function(restaurant, callback){
		var sql = "update restaurants set R_NAME = ?, R_DESCRIPTION = ?, R_TYPE = ?, R_LOCATION = ?, R_STATUS  = ? where R_ID = ?";
		db.execute(sql, [restaurant.name, restaurant.description, restaurant.type, restaurant.location, restaurant.status, restaurant.id], function(status){
			callback(status);
		});
	},
	delete: function(restaurantId, callback){
		var sql = "delete from restaurants where R_ID = ?";
		db.execute(sql, [restaurantId], function(status){
			callback(status);
		});
	}
}