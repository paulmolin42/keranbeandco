var gm = require('gm').subClass({imageMagick: true});
var CONTAINERS_URL = '/api/containers/';

module.exports = function(File) {

  File.upload = function (ctx,options,cb) {
    if(!options) options = {};
    ctx.req.params.container = 'images';
    File.app.models.container.upload(ctx.req,ctx.result,options,function (err,fileObj) {
      if(err) {
        return cb(err);
      } else {
        if (!fileObj.files.file) {
          return cb('No file');
        }
        var fileInfo = fileObj.files.file[0];
        File.create({
          name: fileInfo.name,
          type: fileInfo.type,
          container: fileInfo.container,
          thumbnailUrl: CONTAINERS_URL+'thumbnails/download/'+fileInfo.name,
          url: CONTAINERS_URL+fileInfo.container+'/download/'+fileInfo.name
        },function (err,file) {
          if (err !== null) {
            cb(err);
          } else {
            console.log(file);
            console.log('dirname', __dirname);
            var thumbnailName = __dirname + '/../../server/storage/' + 'thumbnails' + '/' + file.name;
            gm(__dirname + '/../../server/storage/' + file.container + '/' + file.name)
              .thumb('200', '200', thumbnailName, 0, function (err) {
                if (err) cb(err);
                console.log('Thumbnailed!');
                cb(null, file);
              });
          }
        });
      }
    });
  };

  File.remoteMethod(
    'upload',
    {
      description: 'Uploads a file',
      accepts: [
        { arg: 'ctx', type: 'object', http: { source:'context' } },
        { arg: 'options', type: 'object', http:{ source: 'query'} }
      ],
      returns: {
        arg: 'fileObject', type: 'object', root: true
      },
      http: {verb: 'post'}
    }
  );

};
