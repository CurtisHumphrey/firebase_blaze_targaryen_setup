module.exports = (grunt) ->
  grunt.initConfig
    exec:
      git:
        cmd: 'START "" "C:\\Program Files\\TortoiseGit\\bin\\TortoiseGitProc.exe" /command:log /path:..'
      jasmine_rules:
        cmd: 'node jasmine-runner.js'
      blaze: 
        cmd: 'blaze -v rules.yaml'

    watch:
      firebase_rules:
        files: ['rules.json','spec/**/*.*']
        tasks: ['exec:jasmine_rules']
      firebase_yaml:
        files: ['rules.yaml']
        tasks: ['exec:blaze']

  require('load-grunt-tasks')(grunt)
  
  grunt.registerTask 'git', ['exec:git']
  grunt.registerTask 'test', ['force:exec:blaze','force:exec:jasmine_rules','watch']
  grunt.registerTask 'default', ['test']