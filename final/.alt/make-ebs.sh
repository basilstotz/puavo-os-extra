#!/bin/sh

pfad="amxabasis"


doit(){
echo "#!/bin/sh"
echo "puavo-conf puavo.image.servers | grep -q images.amxa.ch || exit 0"
echo "cat <<'EOF' | base64 -d | tar -x -z -C /tmp/"

tar -c -z $pfad/bin.d $pfad/debs.d $pfad/parts.d $pfad/install.sh | base64

echo "EOF"
echo "/tmp/$pfad/install.sh"
echo "rm -rf /tmp/$pfad"
}

touch $pfad
doit >  $pfad.ebs
chmod +x $pfad.ebs

gpg --homedir ~/.gnupg/ -e -a -r puavo@amxa.ch $pfad.ebs











