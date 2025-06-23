
## Tips

ENOENT = Error NO ENTry / Error NO Entity

**JavaScript**
- object to string: `JSON.stringify(object);`
- array to string: `array.join(", ");`
- number to string: `number.toString();`
- string to number: `parseInt(number); or parseFloat(number);`

**Node.js**
- base64 encoding:
```js
const {username, password} = credentials;
const buffer = Buffer.from(`${username}:${password}`, "utf-8");
const token = buffer.toString("base64");
```
- base64 decoding: 
```js
const buffer = Buffer.from(token, "base64");
const data = buffer.toString("utf-8");
```
- folder:
  - check exists:; if not exists, throw error
  `fs.statSync("data\\godenfile");`
  - create folder
  ```js
  // method 1. synchron: if exists, throw error.
  fs.mkdierSync("data\\godenfile");

  // method 2. asynchron: if not exists, make dir; otherwise, don't throw error.
  fs.mkdir("data\\godenfile", {recursive: true}, (err) => {
    if (err) throw err;
  });
  ```
- file:
  - check exists: if not exists, throw error.
  `fs.accessSync("data\\godenfile\\weekly.json", fs.constants.F_OK);`
  - create file:
  ```js
  fs.writeFileSync(filepath, content, "utf-8");

  // synchronously append data to a file, create the file if it does not exist.
  fs.appendFileSync(filepath, content, "utf-8");
  ```
  