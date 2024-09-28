# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
    
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  end
  
# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
    
    def initialize(name, description)
      @name = name
      @description = description
      @users = []  
    end

    def add_user(user)
      @users << user
    end
    
    def remove_user(user)
      @users.delete(user)
    end
  end
  
# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
    
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
    
    # Method to display the message in a readable format
    def display_message
      "#{user.name}: #{content} (Room: #{room.name})"
    end
  end
# add a method to user so, user can enter to a room
# user.enter_room(room)
class User
    attr_accessor :name, :email, :password
    
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  
    # Method for a user to enter a room
    def enter_room(room)
      room.add_user(self)
      puts "#{name} has entered the room: #{room.name}"
    end
  end
 
# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
class User
    attr_accessor :name, :email, :password
    
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end

    def enter_room(room)
      room.add_user(self)
      puts "#{name} has entered the room: #{room.name}"
    end

    def send_message(room, message_content)
      message = Message.new(self, room, message_content)
      acknowledge_message(room, message)
      return message
    end

    def acknowledge_message(room, message)
      puts "#{name} has sent a message to the room: #{room.name} - \"#{message.content}\""
    end
  end
  
# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
class Room
    attr_accessor :name, :description, :users
    
    def initialize(name, description)
      @name = name
      @description = description
      @users = []  
    end

    def add_user(user)
      @users << user
    end

    def remove_user(user)
      @users.delete(user)
    end

    def broadcast(message)
      @users.each do |user|
        puts "#{user.name} received the message: \"#{message.content}\" from #{message.user.name} in room #{name}"
      end
    end
  end
  
