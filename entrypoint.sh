#!/bin/sh
set -e
set -o errexit

export GATSBY_DIR="/site"
export PATH="$PATH:/usr/local/bin/gatsby"

# Initialize Gatsby or run NPM install if needed
check_project() {
  if [ ! -f "$GATSBY_DIR/package.json" ]
  then
    echo "Initializing Gatsby..."
    gatsby new $GATSBY_DIR

  else
    if [ ! -e "$GATSBY_DIR/node_modules/" ]
    then
      echo "Node modules is empty. Running npm install..."
      npm install

    fi
  fi
}

# Change ownership to directories and files
change_owner() {
  USER_ID=$(stat -c '%u' $GATSBY_DIR )
  GROUP_ID=$(stat -c '%g' $GATSBY_DIR)

  echo "Change owner to $USER_ID:$GROUP_ID"
  chown -R "$USER_ID":"$GROUP_ID" $GATSBY_DIR
}

# Decide what to do
if  [ "$1" = "develop" ]
then
  echo "Corriendo el proyecto"
  rm -rf $GATSBY_DIR/public
  gatsby develop --host 0.0.0.0

elif  [ "$1" = "build" ]
then
  rm -rf $GATSBY_DIR/public
  gatsby build
  change_owner

elif  [ "$1" = "stage" ]
then
  rm -rf $GATSBY_DIR/public
  gatsby build
  change_owner
  gatsby serve --port 8000

elif [ "$1" = "new" ]
then
  [ -z "$2" ] echo "Initializing Gatsby from $2" || echo "Initializing default new project's Gatsby" 
  gatsby new $GATSBY_DIR $2
  change_owner

else
  if [ "$1" != "gatsby" ]
  then
    check_project
  fi

  exec $@

fi

