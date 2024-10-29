// Count file lines under project folder

const fs = require("fs");
const path = require("path");
const readline = require("readline");

// update as your project path. note: use \\ or /
const root = `C:\\Users\\Snow-Angel\\Desktop\\codes\\nodejs-hello`;
const ExcludedFolders = [".git\\", "node_modules\\"];

entrypoint(root);


async function entrypoint(dir) {
  console.log("project-lines ...");

  const filepaths = readFilepathSync(dir);
  const filepathsFiltered = filepaths.filter(filepath => !isExcluded(filepath));
  // console.log({filepathsFiltered});

  const filelinePromiseList = filepathsFiltered.map(filepath => readFileLine(filepath).then(fileline => ({ filepath, fileline })));
  // waiting for all settled, regardless fulfilled or rejected
  let resultPromiseList = await Promise.allSettled(filelinePromiseList);
  let filevalues = resultPromiseList.map(resultPromise => resultPromise.value)
  console.log(filevalues);

  const totalLines = filevalues
    .map(filevalue => filevalue.fileline)
    .reduce((previous, current) => previous + current, 0);

  console.log(`project: ${dir}, total lines: ${totalLines}`);
}

//#region define function
function isExcluded(filepath) {
  for (const folder of ExcludedFolders) {
    if (filepath.includes(folder)) {
      return true;
    }
  }
  return false;
}

/**
 * Get filepaths with recursive
 * @param {string} dir 
 * @param {object} options? default: { encoding: "utf8", withFileTypes: false, recursive: false }
 * @returns {Generator}
 */
function* walkSync(dir, options) {
  const newOptions = { withFileTypes: true, ...options };
  const files = fs.readdirSync(dir, newOptions);
  for (const file of files) {
    if (file.isDirectory()) {
      yield* walkSync(path.join(dir, file.name), newOptions);
    } else {
      yield path.join(dir, file.name);
    }
  }
}

/**
 * Read filepaths under the directorry including sub-directory
 * @param {string} dir 
 * @param {object} options 
 * @returns {Array} filepaths
 */
function readFilepathSync(dir, options) {
  let filepaths = [];
  for (const filepath of walkSync(dir, options)) {
    filepaths.push(filepath);
  }
  return filepaths;
}

/**
 * Read file line by stream
 * @param {string} filePath 
 * @returns {Promise}
 */
function readFileLine(filePath) {
  return new Promise((resolve, reject) => {
    let lineCount = 0;
    const fileReadStream = fs.createReadStream(filePath, "utf-8");
    const reader = readline.createInterface({ input: fileReadStream, crlfDelay: Infinity });

    reader.on("line", () => {
      lineCount++;
    });
    reader.on("close", () => {
      resolve(lineCount);
    });
    reader.on("error", (error) => {
      reject(error);
    });
  });
}
//#endregion
