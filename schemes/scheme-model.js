const db = require('../data/db-config');

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
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

function findSteps(scheme_id) {
  return db('schemes as s')
    .join('steps as st', 's.id', 'st.scheme_id')
    .where({ scheme_id })
    .select('s.id', 's.scheme_name', 'st.step_number', 'st.instructions');
}

async function add(scheme) {
  const [id] = await db('schemes').insert(scheme);
  return findById(id);
}

async function update(changes, id) {
  await db('schemes')
    .where({ id })
    .update(changes);
  return findById(id);
}
