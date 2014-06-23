/*
 Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */

        CKEDITOR.editorConfig = function(config)
        {
            config.toolbar = 'MyToolbar';

            config.toolbar_MyToolbar =
                    [
                        {name: 'basicstyles', items: ['RemoveFormat']},
                        {name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']},
                        {name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll']},
                        {name: 'insert', items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe']},
                        '/',
                        {name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Subscript', 'Superscript', '-']},
                        {name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent',
                                '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']},
                        {name: 'links', items: ['Link', 'Unlink', 'Anchor']},
                        '/',
                        {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']},
                        {name: 'colors', items: ['TextColor', 'BGColor']},
                        {name: 'tools', items: ['Maximize']}
                    ];
        };
