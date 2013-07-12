basePath = '../';

files = [
  JASMINE,
  JASMINE_ADAPTER,
  'pub/lib/angular/angular.js',
  'pub/lib/angular/angular-*.js',
  'test/lib/angular/angular-mocks.js',
  'pub/js/**/*.js',
  'test/unit/**/*.js'
];

autoWatch = true;

browsers = ['Chrome'];

junitReporter = {
  outputFile: 'test_out/unit.xml',
  suite: 'unit'
};
