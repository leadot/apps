if (window.nwA === undefined) {
  window.nwA ={};
}

nwA.init = function () {
//3rd party setup code here
  console.log("Neighborhood Watch App ONLINE");
};

$(document).on("ready", function () {
  nwA.init();
});
