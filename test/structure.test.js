'use strict';
// Every example is a directory with a README and a run line, reads secrets only from the
// environment, and names no hard-coded key.
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');

const root = path.join(__dirname, '..');
const EXAMPLES = ['nextjs', 'django', 'spring-boot', 'go-nethttp', 'rails', 'laravel', 'react-native', 'flutter'];
const SKIP = new Set(['node_modules', '.git', '.wt-buffer']);

function* files(dir) {
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    if (SKIP.has(e.name)) continue;
    const p = path.join(dir, e.name);
    if (e.isDirectory()) yield* files(p);
    else yield p;
  }
}

test('every example has a README with a shell run block', () => {
  for (const ex of EXAMPLES) {
    const readme = fs.readFileSync(path.join(root, ex, 'README.md'), 'utf8');
    assert.match(readme, /```sh\n/, ex);
  }
});

test('no example contains a literal key', () => {
  for (const ex of EXAMPLES) {
    for (const f of files(path.join(root, ex))) {
      const text = fs.readFileSync(f, 'utf8');
      assert.doesNotMatch(text, /\bwt[ip]_[A-Za-z0-9]{8,}/, f);
    }
  }
});

test('top-level README lists every example directory', () => {
  const readme = fs.readFileSync(path.join(root, 'README.md'), 'utf8');
  for (const ex of EXAMPLES) assert.ok(readme.includes(`\`${ex}/\``), ex);
});
