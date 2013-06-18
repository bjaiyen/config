" Unmap < and > so they don't get autoclosed
if !empty(maparg("<", "i"))
  silent! iunmap <
endif
if !empty(maparg(">", "i"))
  silent! iunmap >
endif
