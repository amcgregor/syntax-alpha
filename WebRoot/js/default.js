function parseUri(str) {
    var	o   = parseUri.options,
    m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
    uri = {},
    i   = 14;
    
    while (i--) uri[o.key[i]] = m[i] || "";
    
    uri[o.q.name] = {};
    uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
                           if ($1) uri[o.q.name][$1] = $2;
                           });
    
    uri['extension'] = uri.file.substr(uri.file.lastIndexOf('.') + 1);
    
    return uri;
};

parseUri.options = {
strictMode: false,
key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
q:   {
name:   "queryKey",
parser: /(?:^|&)([^&=]*)=?([^&]*)/g
},
parser: {
strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
}
};

// http://www.fileinfo.com/list/x
var ext_mapper = {
    'c': 'c',
    'h': 'c',
    'm': 'c',
    'css': 'css',
    'cpp': 'cpp',
    'c++': 'cpp',
    'cc': 'cpp',
    'h': 'cpp',
    'c#': 'csharp',
    'cs': 'csharp',
    'css': 'css',
    'diff': 'diff',
    'patch': 'diff',
    'as': 'flex',
    'html': 'html',
    'htm': 'html',
    'java': 'java',
    'js': 'javascript_dom',
    'tex': 'latex',
    'log': 'log',
    'm4': 'm4',
    'pas': 'pascal',
    '~pa': 'pascal',
    'pl': 'perl',
    'php': 'php',
    'php3': 'php',
    'php4': 'php',
    'php5': 'php',
    'py': 'python',
    'rb': 'ruby',
    'scl': 'scala',
    'sh': 'sh',
    'bash': 'bash',
    'sql': 'sql',
    'tcl': 'tcl',
    'xml': 'xml',
    'xhtml': 'xml',
    'xslt': 'xml',
    'xdl': 'xml',
    'xlnk': 'xml',
    'xsd': 'xml',
    'xsl': 'xml',
    'xspf': 'xml',
    'xul': 'xml',
};

var fn_mapper = {
    'Makefile': 'makefile'
};

function gotDocument(uri, source) {
    var components = parseUri(uri);
    var extension = components.extension;
    var syntax = ext_mapper[extension];
    
    if ( ( syntax === null ) || ( syntax === undefined ) ) {
        if ( source[0] == '<' ) syntax = 'html';
        else syntax = '';
    }
    
    document.title = components.file ? components.file : uri;
    
    $('body').empty();
    $('<pre></pre>').text(source).addClass('sh_' + syntax).appendTo('body');
    
    if ( syntax != '' )
        sh_highlightDocument('js/lang/', '.min.js');
    
    $('a').click(function(){
                 return true;
                 });
}

$(function(){
  var uri = window.location.search ? unescape(window.location.search.substr(1)) : 'samples/jquery.timeago.js';
  $.get(uri, function(data){ gotDocument(uri, data); });
  });

$('a').live('click', function(){
            var uri = '' + window.location;
            
            if ( uri.indexOf('?') != -1 ) {
            uri = uri.substr(0, uri.indexOf('?')-1);
            }
            
            window.location = '?' + escape($(this).attr('href'));
            
            return false;
            });
