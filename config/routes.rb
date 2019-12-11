Rails.application.routes.draw do
  root 'landings#index'

  get '/guide',
      to: 'guides#index'

  get '/guide/:page',
      to: 'guides#page',
      constraints: {
        page: /.*/
      }

  get '/install',
      to: 'landings#install',
      as: :install

  get '/recently-updated',
      to: 'packages#recent',
      as: :recently_updated

  get '/blog',
      to: 'blog#index',
      as: :blog

  get '/blog/:slug',
      to: 'blog#post',
      as: :blog_post

  get '/packages',
      to: 'packages#index',
      as: :packages

  get '/packages/:author',
      to: 'packages#by_author',
      as: :repo_author

  get '/packages/:author/:repo',
      to: 'versions#show',
      constraints: {
        repo:  %r{[^/]+}
      },
      as: :repo_root

  get '/packages/:author/:repo/:version',
      to: 'versions#version',
      constraints: { version: /\d+\.\d+\.\d+/ },
      as: :repo_version

  get '/packages/:author/:repo/:version/:category/:entity',
      to: 'versions#entity',
      constraints: {
        version: /\d+\.\d+\.\d+/,
        entity: /.*/
      },
      as: :repo_entity

  get '/api',
      to: 'versions#core'
end
