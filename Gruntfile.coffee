module.exports = (grunt) ->
	grunt.initConfig({
		uglify: {
			options: {
				mangle: false,
				compress: {
					drop_console: true
				}
			},
			vendor: {
				src: [
					'./bower_components/angular/*.js',
					'./bower_components/angular-ui-router/release/*.js',
					'./bower_components/jquery/jquery.min.js'
				],
				dest: './public/js/vendor.min.js'
			},
			app: {
				src: './public/js/app.js',
				dest:'./public/js/app.min.js'
			}
		},
		image: {
			dynamic: {
				files: [{
					expand: true,
					cwd: './app/img',
					src: ['**/*.{png,jpg,gif}'],
					dest: './public/img'
				}]
			}
		},
		coffee: {
			options:{
				join:true
			},
			compile: {
				files: {
					'./public/js/app.js': [
						'./app/scripts/*.coffee',
						'./app/scripts/config/**/*.coffee',
						'./app/scripts/controllers/**/*.coffee',
						'./app/scripts/services/**/*.coffee',
						'./app/scripts/directives/**/*.coffee'
					]
				}
			}
		},
		less: {
			development: {
				options: {
					paths: ["app/styles"]
				},
				files: [
					src: ["./app/styles/**/**.less"]
					dest: "./public/css/main.css"
				]
			},
			production: {
				options: {
					paths: ["assets/css"],
					cleancss: true
				},
				files: [
					src: ["./app/styles/**/**.less"]
					dest: "./public/css/main.css"
				]
			}
		},
		jade: {
			compile: {
				options: {
					client: false,
					pretty: true
				},
				files: [
					'./public/index.html': './app/views/index.jade',
					[ {
						cwd: "app/views/home",
						src: "**/*.jade",
						dest: "public/views/home",
						expand: true,
						ext: ".html"
					} ]
				]
			}
		},
		watch: {
			coffee: {
				files: 'app/scripts/**/**.coffee'
				tasks: ['coffee:compile']
			},
			jade: {
				files: 'app/views/**/**.jade'
				tasks: ['jade:compile']
			},
			less: {
				files: 'app/styles/**/**.less'
				tasks: ['less:development']
			},
			image: {
				files: 'app/img/**/**.{png,jpg,gif}'
				tasks: ['newer:image']
			}
		},
	})

	#loadNpmTasks
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-concat'
	grunt.loadNpmTasks 'grunt-newer'
	grunt.loadNpmTasks 'grunt-image'
	
	#Run Default task(s).
	grunt.registerTask('default', ['watch'])
	
	grunt.registerTask('compile', ['newer:coffee','newer:jade','newer:less','newer:image','newer:uglify'])
