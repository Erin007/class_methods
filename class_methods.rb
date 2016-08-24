###################################
######  CLASS METHODS & SELF  #####
###################################

#Currently we have been creating classes expect many object to be created from them to utilize their functionality.

#With the help of the keyword 'self', we will have


###################################
######     LEARNING GOALS     #####
###################################

# Review what we've learned about classes so far:
    #Constructor (initialize)
    #Instance Methods
    #Attributes (stored in instance variables)

# Discover new functionality within classes:
    # Class Methods and
    # self


###################################
######      CLASS_REVIEW      #####
###################################

## INSTANCE VARIABLES, @variable_name, use it if you want all the methods in the class to be able to use that variable, instance variables usually store attributes, the specific details for each of the new objects

## ATTRIBUTES
    #ex: name, username, password

    #You don't have to set the instance variable to anything in intialize, but it's nice to have a clear list of the variables in your program all in one place

## INSTANCE METHODS
  #behaviors of the class, verbs
      #ex: make a post, send a msg, like a post, create a photo album

      #******** you can call .methods to figure out what methods can be called on an object *****************

  #INITIALIZE METHOD
    #makes the new instance of an object, actions that are performed every time you make a new object within the class




# class Order
#   def initialize(subtotal, quantity) # <= instance method
#     @subtotal = subtotal
#     @quantity = quantity
#   end
#
#   def total # <= instance method
#     @subtotal * @quantity
#   end
#
#   def to_money # <= instance method
#     # in the line below, `total` is invoking the instance method above
#     "$" + sprintf("%0.02f", total / 100)
#   end
# end
#
# order = Order.new(1000, 2)
# order.to_money #=> $20.00


###################################
########    CLASS METHODS   #######
########     USING SELF     #######
###################################

#Class methods are called directly by the class and not by an instance of the class.

# class Kitten
#
#   def self.say_meow #<------ self
#     return "meow" #<----- always return what you want, then put puts later so that you can call a method on the outcome ie .say_meow.upcase
#   end
#
# end
#
# puts Kitten.say_meow




###################################
######    LETS TRY IT OUT!    #####
###################################


class Pawn
  attr_reader :position
  def initialize(position)
    @position = position
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row

  def self.make_row(side) #<------class method because it is prepended with self. You can ONLY call the method on the class itself, not on an instance of the class
    if side == "white"
      num = 2 #row 2 on a chess board
    else
      num = 7 #row 7 on a chess board
    end

    pawns = []
    ("a".."h").each do |letter|
      pawns << self.new("#{letter}#{num}") #<--- self generates pawn objects assigned a2, b2, c2, d2, e2, f2, g2, h2
    end

    pawns
  end
end

#make one pawn
one_pawn = Pawn.new("A2") #.new is a class method because you can all it directly on a class

#make a whole row of pawns
pawns = Pawn.make_row("black")

#What is being stored in this local variable pawns?
print pawns #<------ array of instances of pawn, each pawn has a unqiue position noted by a letter and a number


#WHAT IS THIS DOING!?
puts pawns.shuffle.first.position #picks a random pawn from the row of black pawns we made



###################################
######   WHERE IS THIS USED?  #####
###################################
#Class methods are for anything that does not deal with an individual instance of a class <-----------------

  #If you want to be able to call a method on the Class without creating a new instance of the class, then you should use class methods

#In Gems, like faker
   #https://github.com/stympy/faker/blob/master/lib/faker/hacker.rb

#When we get into databases, our data will be tied to a class. That class will have some premade class methods for us to use:  .find, .last, .where
#Those class methods allow you to find specific objects of that class based on an specified attributes of that class.


# you could wrap the methods that you want to be self methods in the block

#class<< self
  #all the methods inside this code block are now class methods. as a alternative to writing all of your self methods with a self. 
#end
