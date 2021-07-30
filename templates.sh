function writeDefaultComponent() {
    # Component > Template text
    echo "import React from 'react'
import \"."/$component_name.style.$style_extention"\"

const ${component_name^} = (props) => {
    return (
        <div className=\"${component_name^}\">
            <p>Content of $component_name</p>
        </div>
    )
}

export default ${component_name^}" >$component
}

function writeStyledComponent() {
    # Component > Template text
    echo "import React from 'react'
import { Styled${component_name^} } from \"."/$component_name.style.$style_extention"\"

const ${component_name^} = (props) => {
    return (
        <Styled${component_name^}>
            <p>Content of styled $component_name</p>
        </Styled${component_name^}>
    )
}

export default ${component_name^}" >$component
}

function writeDefaultStyle() {
    echo ".${component_name^} {
    /* Empty */
}" >$style
}

function writeStyledStyle() {
    echo "import styled from 'styled-components'

const Styled${component_name^} = styled.div\`

\`

export {
    Styled${component_name^},
}" >$style
}
