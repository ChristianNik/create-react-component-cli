# React Component

## Initial

- 📁 Create components folder (if necessary)
- 📄 Create index file (if necessary)
  - Import all existing component (when the index file was recreated)

## Create a Component

- 📁 Create Component folder

  - 📄 Create Component style file
  - 📄 Create Component file

    - 📝 Import style into component

  - 📄 Index file
    - 📝 Import component
    - 📝 Export component as default

- 📝 Add component export in components index file

## CLI usage

```
create-react-component <name> [options]

Options:
  --styled,     -s    Use Styled-Components                 [boolean]
  --typescript, -t    Use Typescript                        [boolean]

Examples:
  create-react-component Input
  create-react-component Button -s -t
```

## Remove a Component

- 📁 Delete component folder
- 📝 Remove component export from components index file

## CLI usage

```
remove-react-component <name> [options]

Options:
  # no options

Examples:
  remove-react-component Input
  remove-react-component Button
```

## Create a Hook

- 📁 Create Hook folder

  - 📄 Create Component style file
  - 📄 Create Hook file
  - 📄 Index file

    - 📝 Import component
    - 📝 Export component as default

- 📝 Add component export in hooks index file

## Alternative CLI usage

```
react <operation> <type> <name> [options]

Operation:
  > add
  > remove

Type:
  > component
  > hook
  > context

Options:
  --styled,     -s    Use Styled-Components                 [boolean]
  --typescript, -t    Use Typescript                        [boolean]

Examples:
  react add component Input
  react add component Button -s
  react add component Button -t
  react remove provider Button
```

## Configuration / Options / Settings

| Option             |    Type | Description               | Definition                                                                                                                       |
| ------------------ | ------: | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| \_USE_TYPESCRIPT   | boolean | Use typescript            |                                                                                                                                  |
| \_COMPONENT_NAME   |  string | Component Name            | The first letter is an uppercase letter. For files and folders, the name is written in lowercase, spaces are replaced by dashes. |
| \_BASE_FOLDER_PATH |  string | \<type\> base folder path | The path of the base folder where all \<type\> are stored                                                                        |
| \_BASE_FOLDER_NAME |  string | \<type\> base folder name | The name of the base folder where all \<type\> are stored                                                                        |

### Modules

Every Module

    - Create Folder
    - Create Files
    - Write into <type> index file

- Component Module

- Hook Module

- Context Module
