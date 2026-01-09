with open("mp-harmattan-community-pr/DEBIAN/control", 'r') as f:
    file = f.read()
result = ''
for line in file.split("\n"):
    if line == '':
        result += '\n'
        continue
    linetype, command = line.split(": ", 1)
    if linetype == "Depends":
        dependencies = []
        for dependency in command.split(", "):
            if "009" not in dependency:
                dependencies.append(dependency)
        command = ", ".join(dependencies)
    result += f'{linetype}: {command}\n'
with open("mp-harmattan-community-pr/DEBIAN/control", 'w') as f:
    f.write(result)