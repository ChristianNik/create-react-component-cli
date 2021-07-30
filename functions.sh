function checkComponentName {
    if [ -z "$1" ]; then
        echo "No Component name provided. [component_name, options]"
        exit
    fi
}

function removeComponent {
    component_folder=$1
    component_name=$2
    components_index=$3
    rm -rf $component_folder

    # remove entry from components index file
    sed -i "/import ${component_name^} from \".\/${component_name}\";/d" $components_index
    sed -i "/${component_name^},/d" $components_index
}

function checkFolderExists {
    if [ ! -d "$1" ]; then
        echo "Component »${2^}« does not exist."
        exit
    fi
}

function addComponentToComponentsIndex {
    component_name=$1
    components_index=$2

    _first_line=1
    while IFS= read -r line; do

        if [[ $_first_line == 1 ]]; then
            x="${line}
import ${component_name^} from \"./$component_name\";"
        else

            if [[ $line =~ "export" ]]; then
                x="${x}
${line}
    ${component_name^},"
            else
                x="${x}
${line}"
            fi

        fi

        _first_line=0
    done <"$components_index"

    echo "${x%%*( )}" >$components_index
}

function createComponent {
    component_name=$1
    component_folder=$2
    component=$3
    style=$4
    component_index=$5
    _STYLED_COMPONENTS=$6
    COMPONENTS_INDEX=$7

    # Create folders / files
    mkdir $component_folder
    touch $component
    touch $style
    touch $component_index

    if [[ $_STYLED_COMPONENTS -eq 1 ]]; then
        writeStyledComponent
    else
        writeDefaultComponent
    fi

    # Style > Template text

    if [[ $_STYLED_COMPONENTS -eq 1 ]]; then
        writeStyledStyle
    else
        writeDefaultStyle
    fi

    # Component Index > Template text
    echo "import ${component_name^} from \"./$component_name.component\";

export default ${component_name^};" >$component_index

    # Add to components index file
    addComponentToComponentsIndex $component_name $COMPONENTS_INDEX

}
