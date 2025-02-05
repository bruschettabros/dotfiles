function! example(i)
    echo a:i " with additional text"
endfunction

function! ide()
    echo &ide
endfunction

function! ghc()
    :action com.laravel_idea.plugin.GenerateHelperCodeAction
endfunction
