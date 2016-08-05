

QUESTIONSBACKUP = { 
	what: [
		"A duck. Obviously, it's duck.",
		"You don't want to know. I know, and the answer just isn't for you.",
		"A group of puppies playing in the park."
	],
	when: [
		"Not today and definitely not tomorrow...",
		"They tell me that Thursdays are good.",
		"Four score and seven years ago...",
		"Like a decade probably."
	],
	why: [
		"Because some do and some people don't.",
		"Why does the goat eat the garbage?",
		"Well, I don't really have time to go into it. Have you tried Google?"
	],
	who: [
		"Hillary -- we can only hope.",
		"The dog and the neighbor's dog. Bad influences, both of them.",
		"Donald Trump, of course!"
	],
	where: [
		"There is no place like home -- if you have a home. If you don't, there is no place like the park.",
		"A shed in a swamp in Louisiana without air conditioning.",
		"I am thinking beaches and palm trees."
	],
	how: [
		"With a lot of help.",
		"By thinking less and eating more."
	],
	misc: [
		"Absolutely! As long as you want that too... Was that the right answer?",
		"No... But that really isn't that surprising...",
		"Did you call your mother? Don't you think you should stop playing with an 8-ball and call your mother?",
		"Yes! Of course I will go with you to prom!! (I hope I heard that right... Otherwise, this would be awkward.)",
		"Yup! Or my name isn't Magic 8-Ball!"
	]
}

@questions = QUESTIONSBACKUP.clone

def intro
	puts "Welcome to Magic-8 Ball!"
	puts "Ask wisely (and without expecation)."
	input_eval
end


def add_answer()
	puts "Go ahead!"
	puts "Type 'no' if that is too a big a job for you."
	puts "Or type 'yes' if you have are are ready to go."
	while true
		edit = gets.strip.downcase
		if edit == "no"
			puts "I like you....\n\n"
			input_eval
		elsif edit == "yes"
			answer_submit
		else 
			puts "I didn't quite catch that. Type 'yes' or 'no'."
		end
	end
end

def answer_submit
	puts "Type your answer to someone's burning question."
	while true
		new_answer = gets.strip.downcase
		if @questions[:misc].include?(new_answer.to_s)
			puts "Sorry. We already have that one. Get more creative this time."
		else
			@questions[:misc].push("#{new_answer} (USERANSWER)")
			puts "It worked. I guess anyone can do this job... Let's ask more questions."
			puts "~~~~~~~~~~~~~~~~"
			input_eval
		end
	end
end

# def play_again
# 	puts "Play again? Type 'yes' or 'quit'."
# 	while true
# 		again = gets.strip.downcase
# 		if again == "yes"
# 			input_eval
# 		elsif again == "quit"
# 			quit
# 		else
# 			puts "I didn't quite catch that. Type 'yes' or 'quit'."
# 		end
# 	end
# end

def reset_answers
	puts "Would you like to clear all user input answers? Type 'yes' or 'no'."
	while true
		reset = gets.strip.downcase
		if reset == "yes"
			@questions[:misc].delete_if { |item| item.include?("USERANSWER")}
			puts "Success! All answers are factory fresh!"
			puts "Let's get back to asking questions!"
			input_eval
		elsif reset == "no"
			puts "Your answers are still there!"
			input_eval
		else
			puts "I didn't quite catch that. Type 'yes' or 'no'."
		end
	end
end

def print_answers
	puts "Would you like to print all possible answers? Type 'yes' or 'no'."
	print = gets.strip.downcase
	while true
		if print == "yes"
			puts @questions
			puts "Let's get back to asking questions!"
			input_eval
		elsif print == "no"
			puts "Let's get back to asking questions!"
			input_eval
		else
			puts "I didn't quite catch that. Type 'yes' or 'no'."		
		end
	end
end

def quit
	puts "Thanks for playing!"
	exit(0)
end

def question_response(input)
	if !input.empty?	
		word = input[0]
		puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
		puts @questions[word.to_sym].sample
		puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
		input_eval
	else 
		puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
		puts @questions[:misc].sample
		puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
		input_eval
	end
end

def input_eval
	while true
	puts "Ask away! Or type 'quit' to exit."
	input = gets.strip.downcase
	question = input.split(" ")
	key_words = question.map(&:to_sym) & @questions.keys
		if input == "quit" ? quit : nil
		elsif input.include?("reset answer") ? reset_answers : nil
		elsif input.include?("print answer") ? print_answers : nil
		elsif input =~ /.*add.*answer.*/ ? add_answer : nil
		elsif question.count <= 2
			puts "I need a real question to work with."
		else
			question_response(key_words)
		end
	end
end



intro






