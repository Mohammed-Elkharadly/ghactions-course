function great(name) {
  return `hello ${name}`;
}
if (require.main === module) {
  console.log(great("john"));
}
module.exports = great;
