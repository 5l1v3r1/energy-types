energyTypes = [
  {
    name: "Joules"
    description: "The standard unit of energy"
    joules: 1
  }
  {
    name: "Hershey Kiss"
    description: "The amount of chemical energy in a hershey kiss"
    joules: 90000
  }
]

window.addEventListener 'load', ->
  inputs = []
  table = document.getElementById 'energy-table'
  for type in energyTypes
    row = document.createElement 'tr'
    
    nameCol = document.createElement 'td'
    nameCol.innerHTML = type.name
    
    descCol = document.createElement 'td'
    descCol.innerHTML = type.description
    
    numCol = document.createElement 'td'
    input = document.createElement 'input'
    inputs.push input
    numCol.appendChild input
    
    for col in [nameCol, descCol, numCol]
      row.appendChild col
    table.appendChild row
