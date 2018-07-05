# coding: utf-8

def create_include(repo, include_path)
  puts("Quel est le nom du projet ? (fichier include)")
  name_project = gets.chomp
  puts("Entrez la description du projet: (fichier include)")
  desc_project = gets.chomp
  tech_header = "/*\n** EPITECH PROJECT, 2018\n** "+ name_project +"\n** File description:\n** "+ desc_project +"\n*/\n\n"
  File.open(include_path + name_project + ".h","w") {|f| f.write(tech_header + "#pragma once\n") }
end

def create_makefile(repo)
  puts("Quel est nom de l'executable ?")
  name = gets.chomp
  tech_header = "##\n## EPITECH PROJECT, 2018\n## Makefile\n## File description:\n## Makefile\n##\n\nNAME\t=\t"
  all_makefile = "\n\nSRC\t=\t\n\nOBJ\t=\t$(SRC:.c=.o)\n\nCFLAGS\t=\t-I ./include\n\nCPPFLAGS\t+=\t-W -Wall -Wextra\n\nall:\t$(NAME)\n\n$(NAME): $(OBJ)\n\tgcc $(CFLAGS) -o $(NAME) $(SRC)\n\nclean:\n\trm -f $(OBJ)\n\nfclean: clean\n\trm -f $(NAME)\n\nre:\tfclean all\n\n.PHONY: all clean fclean re\n"
  File.open(repo + "/" + "Makefile","w") {|f| f.write(tech_header + name + all_makefile) }
end

def complete_src(repo, src_path)
  tech_header = "/*\n** EPITECH PROJECT, 2018\n** main.c\n** File description:\n** main\n*/\n\n"
  File.open(src_path + "main.c","w") {|f| f.write(tech_header + "int main(int ac, char **av)\n{\n\treturn(0);\n}\n") }
end

def complete_repo(repo)
  puts("Voulez vous un fichier include ?\noui\tnon")
  rep = gets.chomp
  if (rep == "oui")
    include_path = repo + "/" + "include/"
    system("mkdir -p " + repo + "/" + "include")
    create_include(repo,include_path)
  end

  puts("Voulez vous un Makefile ?\noui\tnon")
  rep = gets.chomp
  if (rep == "oui")
    create_makefile(repo)
  end

  puts("Voulez vous un fichier src ?\noui\tnon")
  rep = gets.chomp
  if (rep == "oui")
    system("mkdir -p " + repo + "/src")
    complete_src(repo, repo + "/src/")
  end
end

def create_repo(repo)
  system("mkdir -p " + repo)
end

def start_autoproject()
  puts("Quel est le nom du repo ?")
  repo = gets.chomp
  puts("Voulez vous créez un repos vide ?\noui\tnon")
  rep = gets.chomp
  if (rep == "oui")
    create_repo(repo)
  elsif
    create_repo(repo)
    complete_repo(repo)
  end
end

start_autoproject()
