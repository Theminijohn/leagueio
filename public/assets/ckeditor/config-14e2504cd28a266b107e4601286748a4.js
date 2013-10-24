CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here.
    // For the complete reference:
    // http://docs.ckeditor.com/#!/api/CKEDITOR.config

    // The toolbar groups arrangement, optimized for a single toolbar row.
    config.toolbarGroups = [
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
        { name: 'links' },
        { name: 'paragraph',   groups: [ 'list', 'indent' ] },
        { name: 'tools' },
        { name: 'others' }
    ];

    // The default plugins included in the basic setup define some buttons that
    // we don't want too have in a basic editor. We remove them here.
    config.removeButtons = 'Cut,Copy,Paste,Undo,Redo,Anchor,Underline,Strike,Subscript,Superscript';

    // Let's have it basic on dialogs as well.
    config.removeDialogTabs = 'link:advanced';

    // The enter Key output
    config.enterMode = CKEDITOR.ENTER_BR;

    // Default Language Set
    config.language = 'en';
};
