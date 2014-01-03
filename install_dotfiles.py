#!/usr/bin/python
import sys, os, shutil, subprocess
from os.path import join, isdir, islink, lexists, exists, split

all_files = {
        "vimrc": "",
        "bashrc": "",
        "tmux.conf": "",
        "htoprc": "",
        "gitconfig": "",
        "dir_colors": "",
        "hgrc": "",
        "ssh_config": ".ssh/config",
        "tools": "tools"
        }
home = os.getenv('HOME')
dotfiles = join(home, '.dotfiles')


def die_with_usage():
    print 'Usage examples :'
    print
    print '%s all' % __file__
    print ' -> will replace all your dotfiles'
    print '%s vim bashrc' % __file__
    print ' -> will only replace your .vim and .bashrc'
    print
    print 'Possible dotfiles:', ', '.join((x for x in all_files.keys()))
    sys.exit()

if __name__ == '__main__':

    to_install = sys.argv[1:]

    if 'all' == to_install[0]:
        to_install = all_files.keys()

    if not to_install:
        die_with_usage()

    print 'Thoses files/directories will be replaced:'
    for f in to_install:
        print ' %s' % f

    choice = ''
    while choice not in ['yes', 'no']:
        choice = raw_input('Proceed? (yes/no) ')

    if choice == 'no':
        print 'Nothing done.'
        sys.exit()

    for f in to_install:
        if not f in all_files:
            raise Exception("'%s' is an unknown dotfile!" % f)

        target = all_files[f]
        if target=="":
            filename = '.' + f
        else:
            prefix, filename = split(target)
            home = join(home, prefix)
        path = join(home, filename)

        if lexists(path):
            if islink(path):
                os.unlink(path)
            elif isdir(path):
                os.rename(path, path+".old")
            else: # file
                os.rename(path, path+".old")

        # make sure base path exists
        if not exists(home):
            os.makedirs(home)

        # create symlink
        os.symlink(join(dotfiles, f), path)

