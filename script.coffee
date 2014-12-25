energyTypes = [
  {
    name: "Joules"
    description: "The standard unit of energy"
    joules: 1
    image: "jewel.png"
  }
  {
    name: "Kilowatt Hours"
    description: "An industrial unit of energy"
    joules: 3600000
    image: "meter.png"
  }
  {
    name: "Hershey Kisses"
    description: "A popular chocolate candy"
    joules: 9e4
    image: "hershey_kiss.png"
  }
  {
    name: "Gasoline"
    description: "A gallon of standard gasoline"
    joules: 1.3e8
    image: "gasoline.png"
  }
  {
    name: "AA battery"
    description: "An AA battery"
    joules: 1.4e4
    image: "aa_battery.png"
  }
  {
    name: "Uranium-235"
    description: "A gram of Uranium-235"
    joules: 81570940000
    image: "uranium.png"
  }
  {
    name: "Dynamite"
    description: "A gram of dynamite"
    joules: 7.5e3
    image: "dynamite.png"
  }
  {
    name: "Lightbulb"
    description: "A 60-watt bulb running for one day"
    joules: 5184000
    image: "lightbulb.png"
  }
  {
    name: "Bullet"
    description: "Muzzle energy from one shot of a 9mm pistol"
    joules: 519
    image: "bullet.png"
  }
]

inputs = []

window.addEventListener 'load', ->
  table = document.getElementById 'energy-table'
  for type in energyTypes
    row = document.createElement 'tr'
    
    # Name column
    nameCol = document.createElement 'td'
    image = document.createElement 'img'
    image.src = "images/" + type.image
    image.width = 100
    image.height = 100
    label = document.createElement 'label'
    label.innerHTML = type.name
    nameCol.appendChild image
    nameCol.appendChild label
    nameCol.style['text-align'] = 'center'
    
    descCol = document.createElement 'td'
    descCol.innerHTML = type.description
    numCol = document.createElement 'td'
    type.input = document.createElement 'input'
    inputs.push type.input
    numCol.appendChild type.input
    
    for col in [nameCol, descCol, numCol]
      row.appendChild col
    table.appendChild row
  registerEvents()
  updateValues 100000

registerEvents = ->
  for type, i in energyTypes
    do (type, i) ->
      change = ->
        num = parseFloat type.input.value
        num = 0 if isNaN num
        updateValues num * type.joules, i
      for event in ['change', 'keydown', 'paste', 'input']
        type.input.addEventListener event, change

updateValues = (joules, idx = -1) ->
  for type, i in energyTypes
    continue if i == idx
    numVal = joules / type.joules
    inputs[i].value = numVal.toPrecision 10
