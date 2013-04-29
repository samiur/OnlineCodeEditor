myApp = angular.module('myApp', ['ui'])

@codeCtrl = ($scope, $http) ->
  $scope.languageOption = 'C'
  $scope.themeOption = 'solarized'

  myTextArea = document.getElementById("editor")

  $scope.languages = [
    'C',
    'C++',
    'RUBY'
  ]

  $scope.themes = [
    'solarized',
    'night',
    'ambiance',
    'monokai'
  ]

  languageModes =
    'C': 'clike'
    'C++': 'clike'
    'RUBY': 'ruby'

  $scope.editor = CodeMirror.fromTextArea(myTextArea, {
    lineWrapping : true
    lineNumbers: true
    mode: languageModes[$scope.languageOption]
    theme: $scope.themeOption
  })

  $scope.editor.setValue('Code goes here')
  $scope.output = 'Output will go here'
   
  $scope.changeTheme = ->
    console.log("Theme changed")
    $scope.editor.setOption("theme", $scope.themeOption)
 
  $scope.changeMode = ->
    console.log("Mode changed")
    $scope.editor.setOption("mode", languageModes[$scope.languageOption])

  $scope.runCode = ->
    post_data =
      source: $scope.editor.getValue()
      input: $scope.input
      lang: $scope.languageOption
      
    $http
      method: 'POST'
      url: "/editor/compile"
      data: post_data,
    .success((data, status, headers, config) ->
      console.log("Received response")
      $scope.output = data.output
      console.log($scope.output)
      )