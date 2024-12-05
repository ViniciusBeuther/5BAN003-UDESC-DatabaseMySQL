import mysql.connector

'''
con = mysql.connector.connect(
  user='operador',
  password='OperadorCL1N1CA',
  host='localhost',
  database='clinica'
)

if con.is_connected():
  print ('conectado no BD')
else:
  print ('conexão falhou')
'''


class Paciente:
  def __init__(self, codp, nome, idade, cpf):
    self.codp = codp
    self.nome = nome
    self.idade = idade
    self.cpf = cpf
    

class BancoDados:
  conexao = None
  
  def __conectar__(self):
    if self.conexao == None or not self.conexao.is_connected():
      self.conexao = mysql.connector.connect(
        user = 'suporte',
        password = '$uport3CL1N1CA',
        host = 'localhost',
        database = 'clinica'
    )
    return self.conexao.cursor()
     
 
  def __desconectar__(self):
    if self.conexao != None and self.conexao.is_connected():
      self.conexao.disconnect()
  
  
  def getPacientes(self):
    cursor = self.__conectar__()
    cursor.execute("select codp, nome, idade, cpf from pacientes")
    pacientes = []
    for linha in cursor:
      pacientes.append(
        Paciente(
          codp = linha[0],
          nome = linha[1],
          idade = linha[2],
          cpf = linha[3]
        )
      )
    self.__desconectar__()
    return pacientes
    
    
  def getPaciente(self, codp: int):
    cursor = self.__conectar__()
    cursor.execute(
      "select codp, nome, idade, cpf from pacientes \
       where codp=%s", [codp])
    paciente = None
    for linha in cursor:
      paciente = Paciente(
        codp = linha[0],
        nome = linha[1],
        idade = linha[2],
        cpf = linha[3]
      )
    self.__desconectar__()
    return paciente


  def adicionarPaciente(self, paciente):
    if not isinstance(paciente, Paciente):
      return False
    cursor = self.__conectar__()
    sql = "insert into pacientes (codp, nome, idade, cpf) \
             values (%s, %s, %s, %s)"
    valores = (paciente.codp, paciente.nome, paciente.idade, paciente.cpf)
    cursor.execute(sql, valores)
    self.conexao.commit()
    self.__desconectar__()
    

bd = BancoDados()
'''
paciente = Paciente(15, 'Teste', 99, '40404040406')
bd.adicionarPaciente(paciente)
pacientes = bd.getPacientes()
for p in pacientes:
   print(p.codp, p.nome, p.cpf)
'''
codigo = int(input("Digite o codigo do paciente: "))
p = bd.getPaciente(codigo)
if p == None:
    print("Paciente nao existe!")
else:
    print(p.codp, p.nome, p.cpf)
   
