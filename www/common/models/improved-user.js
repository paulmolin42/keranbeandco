loopback = require('loopback');

module.exports = function(ImprovedUser) {

  ImprovedUser.me = function (next) {
    var lbContext = loopback.getCurrentContext();
    if (!lbContext.active || !lbContext.active.accessToken || !lbContext.active.accessToken.userId)
      next(new Error('No current user was found'));
    else {
      ImprovedUser.findById(lbContext.active.accessToken.userId, function (err, user) {
        if (err) {
          next(err);
        } else {
          next(null, user)
        }
      });
    }
  };

  ImprovedUser.remoteMethod('me', {
    description: 'Returns current user if authenticated',
    http: {
      verb: 'get'
    },
    returns: {
      arg: 'currentUser',
      type: 'object'
    }
  })
};
