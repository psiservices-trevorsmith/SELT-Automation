function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'local';
  }
  
  var config = {
    env: env,
	myVarName: 'someValue',
    baseUrl : 'http://localhost:8086'
  }
  
  if (env == 'local') {
	config.baseUrl = 'http://localhost:8086';
  } else if (env == 'dev') {
    // customize
  }
  
  return config;
}