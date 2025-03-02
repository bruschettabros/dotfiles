function! example(i)
    echo a:i " with additional text"
endfunction

function! ide()
    echo &ide
endfunction

function! ghc()
    :action com.laravel_idea.plugin.GenerateHelperCodeAction
endfunction

function! shaun()
    :! php ~/Projects/Evaluagent/evaluagent/artisan shaun:go
    endfunction
   
function! a(command)
    :! php ~/Projects/Evaluagent/evaluagent/artisan a:command
    endfunction