#!/usr/bin/env node
const util = require("util");

let p = require("./JisonJulio.js").parser;
let t = p.parse(process.argv[2] || "a|bc");
console.log(util.inspect(t, {depth: null}));
