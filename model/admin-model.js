var db = require('./db');

module.exports={
	get: function(adminId, callback){
		var sql = "select * from admins where A_ID = ?";

		db.getResult(sql, [adminId], function(result){
			callback(result);
		});
	},
	getAll: function(callback){
		var sql = "select * from admins";
		db.getResult(sql, [], function(results){
			callback(results);
		});
	},
	insert: function(admin, callback){
		var sql = "insert into admins values (?, ?, ?, ?, ?)";
		db.execute(sql, [admin.id, admin.name, admin.address, admin.email, admin.image], function(status){
			callback(status);
		});
	},
	update: function(admin, callback){
		var sql = "update admins set A_NAME = ?, A_ADDRESS = ?, A_EMAIL = ? where A_ID = ?";
		db.execute(sql, [admin.name, admin.address, admin.email, admin.id], function(status){
			callback(status);
		});
	},
	delete: function(adminId, callback){
		var sql = "delete from admins where A_ID = ?";
		db.execute(sql, [adminId], function(status){
			callback(status);
		});
	}
}



