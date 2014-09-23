/*jshint strict:false */
angular.module('testApp').
  factory('Item', function($resource){
    return $resource('/api/item/:id.json', {
      id: '@id'
    },
    {
      create: {
        method: 'POST',
        params: {
          id: 'create'
        }
      },

      update: {
        method: 'PUT'
      },

      get: {
        method: 'GET'
      },

      delete: {
        method: 'DELETE'
      },

      getAllItems: {
        method: 'GET',
        params: {
          id: 'all'
        }
      },
    });
  });
