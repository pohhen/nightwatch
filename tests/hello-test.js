module.exports = {
  'Test hello' : function (browser) {
    browser
      .url('https://www.google.fi')
      .refresh()
      .saveScreenshot('./output/test.png')
      .getTitle(function(title){
        this.assert.ok(title.includes("Google"));
      })
      .end();
  }
};
