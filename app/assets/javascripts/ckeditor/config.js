CKEDITOR.editorConfig = function( config ) {
  config.toolbarCanCollapse = true;
  config.toolbar = [
    { name: 'forms', items: [ 'Form', 'Checkbox', 'RadioButton', 'TextField', 'Textarea', 'SelectField', 'Button', 'ImageButton'] },
    { name: 'insert', items: [ 'HorizontalRule', 'SpecialChar', 'Iframe', 'Flash', 'Smiley'] },
    { name: 'others', items: [ 'ShowBlocks'] },
    '/',
    { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'NewPage', 'Templates' ] },
    { name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
    { name: 'styles', items: [ 'Format', 'Font', 'FontSize', 'TextColor', '-', 'BGColor'] },
    '/',
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'Styles' ] },
    { name: 'clipboard',   groups: [ 'clipboard', 'undo' ], items: ['Undo', 'Redo', '-', 'Image', 'Table'] }
  ];
  config.toolbarGroups = [
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'paragraph',   groups: [ 'list', 'indent', 'align' ] },
    { name: 'links' },
    { name: 'insert' },
    '/',
    { name: 'document',    groups: [ 'mode', 'document', 'doctools' ] },
    { name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
    { name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
    { name: 'forms' },
    '/',
    { name: 'styles' },
    { name: 'colors' },
    { name: 'tools' },
    { name: 'others' },
    { name: 'about' }
  ];
  config.removeButtons = 'Underline,JustifyCenter,Subscript,Superscript,PageBreak';
    // Define changes to default configuration here. For example:
    config.language = 'en';
    // config.uiColor = '#AADC6E';
};
