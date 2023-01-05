#!/usr/bin/python3

with open("vars") as env_vars:
    vars = env_vars.readlines()

    with open("Dockerfile.tmp") as old_docker:
        dfile = old_docker.readlines()
        new_dfile = [
            dfile[0]
        ]

        for l in vars:
            l = l.split("=")
            new_dfile.append(f"ENV {l[0]} {l[1]}")
        new_dfile += dfile[1:]
    with open("Dockerfile", "w") as new_docker:
        new_docker.writelines(new_dfile)   
