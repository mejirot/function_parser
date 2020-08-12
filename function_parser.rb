require 'parslet'

class FunctionParser < Parslet::Parser
    rule(:extern?) { str('extern').maybe}
    rule(:name_re) { match('\w') | match('[/*]') }
    rule(:return_value) { name_re.repeat(1).as(:ret) }
    rule(:name) { name_re.repeat(1).as(:name)}
    rule(:arg_start) { str('(') }
    rule(:arg_end) { str(')') }
    rule(:arg) { space? >> (return_value >> space >> name).as(:arg) }
    rule(:separator?) { (str(',') >> space).maybe }
    rule(:semicolon) { str(';') }

    rule(:space) { match('\s').repeat(1) }
    rule(:space?) { space.maybe }

    rule(:function) {extern? >> space? >> return_value >> space >> name >> arg_start >> (arg >> separator?).repeat(1) >> arg_end >> semicolon}
    root(:function)
end
