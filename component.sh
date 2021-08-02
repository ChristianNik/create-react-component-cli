# templates

component.templates.default.component() {
    echo "import React from 'react'
import \"."/${2,,}.style".css\"

const ${2^} = (props) => {
    return (
        <div className=\"${2^}\">
            <p>Content of $2</p>
        </div>
    )
}

export default ${2^}" >$1
}

component.templates.default.style() {
    echo ".${2^} {
    /* Empty */
}" >$1
}

component.templates.default.index() {
    echo "import ${2^} from \"./${2,,}.component\";

export default ${2^};" >$1
}

# property
_COMPONENT_FOLDER_NAME="components"
_COMPONENT_FOLDER_PATH="$(pwd)/src/$_COMPONENT_FOLDER_NAME"

component.init() {
    if [ ! -d "$_COMPONENT_FOLDER_PATH" ]; then
        # Create folder
        log init "Components base folder created"
        mkdir -p $_COMPONENT_FOLDER_PATH
        log init "Components base file created"
        touch "$_COMPONENT_FOLDER_PATH/index.js"
    fi
}

component.add() {
    name=$1
    component.init
    log info "Component folder added"
    mkdir "$_COMPONENT_FOLDER_PATH/$name"
    touch "$_COMPONENT_FOLDER_PATH/$name/${name,,}.component.jsx"
    touch "$_COMPONENT_FOLDER_PATH/$name/${name,,}.style.css"
    touch "$_COMPONENT_FOLDER_PATH/$name/index.js"
    # write content to files
    template="default"
    component.templates.$template.component "$_COMPONENT_FOLDER_PATH/$name/${name,,}.component.jsx" $name
    component.templates.$template.style "$_COMPONENT_FOLDER_PATH/$name/${name,,}.style.css" $name
    component.templates.default.index "$_COMPONENT_FOLDER_PATH/$name/index.js" $name
}

component.remove() {
    name=$1
    log info "Component folder removed"
    rm -rf "$_COMPONENT_FOLDER_PATH/$name"
}
