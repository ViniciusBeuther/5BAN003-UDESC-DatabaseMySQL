from sqlalchemy import create_engine, Column, String, Integer, DECIMAL, ForeignKey
from sqlalchemy.orm import declarative_base, sessionmaker, Relationship

# lembrar de criar a base de dados "teste" antes de executar este script
engine = create_engine("mysql+pymysql://root:udesc@localhost:3306/teste")
Base = declarative_base()


class Pessoa(Base):
	__tablename__ = "pessoas"
	
	cpf = Column("cpf", DECIMAL(11), primary_key = True, autoincrement=False)
	nome = Column("nome", String(50))
	idade = Column("idade", Integer)
	
	def __repr__(self):
		return f"(<{self.cpf}> - {self.nome} - {self.idade} anos)"


class Pertence(Base):
	__tablename__ = "pertences"
	
	pid = Column("tid", Integer, primary_key=True, autoincrement=True)
	descricao = Column("description", String(40))
	cpfDono = Column("cpfdono", DECIMAL(11), ForeignKey('pessoas.cpf'), primary_key=True, autoincrement=False)
	dono = Relationship('Pessoa', backref='pertences', lazy='subquery')
	
	def __repr__(self):
		return f"({self.pid} - {self.descricao} => dono: {self.cpfDono})"


Base.metadata.create_all(bind=engine)
Sessao = sessionmaker(bind=engine)

# INSERT
'''
sessao = Sessao()
pessoa = Pessoa(cpf='10111213141', nome='Ana Schizel', idade=25)
sessao.add(pessoa)
sessao.commit()
sessao.close()
'''

# SELECT ALL
'''
with Sessao() as sessao:
	pessoas = sessao.query(Pessoa).all()
	for pessoa in pessoas:
		print(pessoa)
'''

# SELECT
'''
with Sessao() as sessao:
	print("Buscar usuario cpf: 30963058640")
	pessoa = sessao.query(Pessoa).filter_by(cpf='30963058640').first()
	print(pessoa)
	
	print("\nBuscar usuarios com menos de 35 anos - do mais velho para mais novo")
	pessoas = sessao.query(Pessoa).filter(Pessoa.idade < 35).order_by(Pessoa.idade.desc()).all()
	for pessoa in pessoas:
		print(pessoa)
'''

# UPDATE
'''
with Sessao() as sessao:
	pessoa = sessao.query(Pessoa).filter_by(cpf='10111213141').first()
	pessoa.idade += 1
	sessao.commit()
'''

# DELETE
'''
with Sessao() as sessao:
	pessoa = sessao.query(Pessoa).filter_by(cpf='10111213141').first()
	sessao.delete(pessoa)
	sessao.commit()
'''

# ADD REGISTROS - CHAVE ESTRANGEIRA
'''
with Sessao() as sessao:
	pertences = []
	pertences.append(Pertence(pid=1, descricao='computador', cpfDono='30963058640'))
	pertences.append(Pertence(pid=2, descricao='monitor', cpfDono='30963058640'))
	pertences.append(Pertence(pid=3, descricao='carro', cpfDono='06485036903'))
	for pertence in pertences:
		print("Pertence: ", pertence)
		sessao.add(pertence)
	sessao.commit()
	sessao.close()
'''

# CONSULTANDO REGISTROS PUXADOS PELA CHAVE ESTRANGEIRA
with Sessao() as sessao:
	carro = sessao.query(Pertence).filter(Pertence.descricao=='carro').first()
	print(carro.dono)
