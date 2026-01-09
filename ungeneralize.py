with open("mp-harmattan-009-pr/DEBIAN/control", 'r') as f:
    file = f.read()
result = ''
for line in file.split("\n"):
    if line == '':
        result += '\n'
        continue
    print(line)
    linetype, command = line.split(": ", 1)
    if linetype == "Depends":
        dependencies = []
        for dependency in command.split(", "):
            if "-009" in dependency:
                dependencies.append(dependency)
        dependencies.append("mp-harmattan-community-pr (>= 2025.0)")
        command = ", ".join(dependencies)
    result += f'{linetype}: {command}\n'
with open("mp-harmattan-009-pr/DEBIAN/control", 'w') as f:
    f.write(result)