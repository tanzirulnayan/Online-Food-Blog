var db = require('./db');

module.exports={
	get: function(memberId, callback){
		var sql = "select * from members where M_ID = ?";

		db.getResult(sql, [memberId], function(result){
			callback(result);
		});
	},
	getAll: function(callback){
		var sql = "select * from members";
		db.getResult(sql, [], function(results){
			callback(results);
		});
	},
	insert: function(member, callback){
		var sql = "insert into members values (?, ?, ?, ?, ?)";
		db.execute(sql, [member.id, member.name, member.address, member.email, member.image], function(status){
			callback(status);
		});
	},
	update: function(member, callback){
		var sql = "update members set M_NAME = ?, M_ADDRESS = ?, M_EMAIL = ?, M_IMAGE = ? where M_ID = ?";
		db.execute(sql, [member.name, member.address, member.email, member.image, member.id], function(status){
			callback(status);
		});
	},
	delete: function(memberId, callback){
		var sql = "delete from members where M_ID = ?";
		db.execute(sql, [memberId], function(status){
			callback(status);
		});
	}
}



