const db = require('../data/db-config');

module.exports = {
  find,
  findById,
};

function find() {
  return db('schemes').select();
}

function findById(id) {
  return db('schemes')
    .where({ id })
    .select()
    .first();
}
