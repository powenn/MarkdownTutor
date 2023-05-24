//
//  Data.swift
//  MarkdownTutor
//
//  Created by 蕭博文 on 2023/5/11.
//

import Foundation
import SwiftUI
import MarkdownUI

// Chapter -> Paragraph

struct Chapter: Identifiable, Hashable {
    let title: String
    let id = UUID()
    let paragraphs: [Paragraph]
}

struct Paragraph: Identifiable, Hashable {
    let title: String
    let text: String
    let id = UUID()
    let hasQuiz:Bool
    let quizCase:QuizCase?
}


class Defaults: ObservableObject {
    public static let shared = Defaults()
    
    // GettingStarted
    @AppStorage(QuizCase.what_is_markdown.rawValue) public var what_is_markdown_is_done = false
    @AppStorage(QuizCase.why_use_markdown.rawValue) public var why_use_markdown_is_done = false
    @AppStorage(QuizCase.how_does_it_work.rawValue) public var
    how_does_it_work_is_done = false
    @AppStorage(QuizCase.what_is_markdown_good_for.rawValue) public var
    what_is_markdown_good_for_is_done = false
    
    // BasicSyntax
    @AppStorage(QuizCase.headings.rawValue) public var
    headings_is_done = false
    @AppStorage(QuizCase.paragraphs.rawValue) public var
    paragraphs_is_done = false
    @AppStorage(QuizCase.line_breaks.rawValue) public var
    line_breaks_is_done = false
    @AppStorage(QuizCase.emphasis.rawValue) public var
    emphasis_is_done = false
    @AppStorage(QuizCase.blockquotes.rawValue) public var
    blockquotes_is_done = false
    @AppStorage(QuizCase.lists.rawValue) public var
    lists_is_done = false
    @AppStorage(QuizCase.code.rawValue) public var
    code_is_done = false
    @AppStorage(QuizCase.horizontal_rules.rawValue) public var
    horizontal_rules_is_done = false
    @AppStorage(QuizCase.escaping_characters.rawValue) public var
    escaping_characters_is_done = false
    
    // ExtendedSyntax
    @AppStorage(QuizCase.tables.rawValue) public var
    tables_is_done = false
    @AppStorage(QuizCase.fenced_code_blocks.rawValue) public var
    fenced_code_blocks_is_done = false
    @AppStorage(QuizCase.strikethrough.rawValue) public var
    strikethrough_is_done = false
    @AppStorage(QuizCase.task_lists.rawValue) public var
    task_lists_is_donw = false
    
    
    
    func getDefaults(p :Paragraph) -> Bool {
        switch p.quizCase {
            
            // GettingStarted
        case .what_is_markdown :
            return Defaults.shared.what_is_markdown_is_done
        case .why_use_markdown :
            return Defaults.shared.why_use_markdown_is_done
        case .how_does_it_work:
            return Defaults.shared.how_does_it_work_is_done
        case .what_is_markdown_good_for:
            return Defaults.shared.what_is_markdown_good_for_is_done
            
            // BasicSyntax
        case .headings :
            return Defaults.shared.headings_is_done
        case .paragraphs:
            return Defaults.shared.paragraphs_is_done
        case .line_breaks:
            return Defaults.shared.line_breaks_is_done
        case .emphasis:
            return Defaults.shared.emphasis_is_done
        case .blockquotes:
            return Defaults.shared.blockquotes_is_done
        case .lists:
            return Defaults.shared.lists_is_done
        case .code:
            return Defaults.shared.code_is_done
        case .horizontal_rules:
            return Defaults.shared.horizontal_rules_is_done
        case .escaping_characters:
            return Defaults.shared.escaping_characters_is_done
            
            // ExtendedSyntax
        case .tables:
            return Defaults.shared.tables_is_done
        case .fenced_code_blocks:
            return Defaults.shared.fenced_code_blocks_is_done
        case .strikethrough:
            return Defaults.shared.strikethrough_is_done
        case .task_lists:
            return Defaults.shared.task_lists_is_donw
            
        default:
            return false
        }
    }
}


let ChaptersData:[Chapter] =  [GettingStarted,BasicSyntax,ExtendedSyntax,MarkdownCheatSheet]


// MARK: Getting Started And its Paragraph
let GettingStarted:Chapter = Chapter(title: "Getting Started", paragraphs: [What_Is_Markdown,Why_Use_Markdown,Kicking_The_Tires,How_Does_It_Work,What_Is_Markdown_Good_For,Flavors_Of_Markdown,Additional_Resources])


let What_Is_Markdown:Paragraph = Paragraph(title: "What is Markdown?", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/What_Is_Markdown.md"))!, encoding: .utf8)!,hasQuiz: true,quizCase: .what_is_markdown)

let Why_Use_Markdown:Paragraph = Paragraph(title: "Why Use Markdown?", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Why_Use_Markdown.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .why_use_markdown)

let Kicking_The_Tires:Paragraph = Paragraph(title: "Kicking the Tires", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Kicking_The_Tires.md"))!, encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let How_Does_It_Work:Paragraph = Paragraph(title: "How Does it Work?", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/How_Does_It_Work.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .how_does_it_work)

let What_Is_Markdown_Good_For : Paragraph = Paragraph(title: "What’s Markdown Good For?", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/What_Is_Markdown_Good_For.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .what_is_markdown_good_for)

let Flavors_Of_Markdown : Paragraph = Paragraph(title: "Flavors of Markdown", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Flavors_Of_Markdown.md"))!, encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Additional_Resources :Paragraph = Paragraph(title: "Additional Resources", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Additional_Resources.md"))!, encoding: .utf8)!, hasQuiz: false, quizCase: nil)


// MARK: Markdown Cheat Sheet And its Paragraph

let MarkdownCheatSheet:Chapter = Chapter(title: "Markdown Cheat Sheet", paragraphs: [Markdown_Cheat_Sheet])

let Markdown_Cheat_Sheet:Paragraph = Paragraph(title: "Cheat Sheet", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Markdown_Cheat_Sheet.md"))!, encoding: .utf8)!, hasQuiz: false, quizCase: nil)


// MARK: Basic Syntax And its Paragraph

let BasicSyntax:Chapter = Chapter(title: "Basic Syntax", paragraphs: [Basic_Syntax_Overview,Headings,Paragraphs,Line_Breaks,Emphasis,Blockquotes,Lists,Code,Horizontal_Rules,Links,Images,Escaping_Characters,HTML])

let Basic_Syntax_Overview:Paragraph = Paragraph(title: "Overview", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Basic_Syntax_Overview.md"))!, encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Headings:Paragraph = Paragraph(title: "Headings", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Headings.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .headings)

let Paragraphs:Paragraph = Paragraph(title: "Paragraphs", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Paragraphs.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .paragraphs)

let Line_Breaks:Paragraph = Paragraph(title: "Line Breaks", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Line_Breaks.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .line_breaks)

let Emphasis:Paragraph = Paragraph(title: "Emphasis", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Emphasis.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .emphasis)

let Blockquotes:Paragraph = Paragraph(title: "Blockquotes", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Blockquotes.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .blockquotes)

let Lists:Paragraph = Paragraph(title: "Lists", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Lists.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .lists)

let Code:Paragraph = Paragraph(title: "Code", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Code.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .code)

let Horizontal_Rules = Paragraph(title: "Horizontal Rules", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Horizontal_Rules.md"))!, encoding: .utf8)!, hasQuiz: true, quizCase: .horizontal_rules)

let Links = Paragraph(title: "Links", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Links.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Images = Paragraph(title: "Images", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Images.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Escaping_Characters = Paragraph(title: "Escaping Characters", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Escaping_Characters.md"))!,encoding: .utf8)!, hasQuiz: true, quizCase: .escaping_characters)

let HTML = Paragraph(title: "HTML", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/HTML.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)


// MARK: Extended Syntax And its Paragraph

let ExtendedSyntax:Chapter = Chapter(title: "Extended Syntax", paragraphs: [Extended_Syntax_Overview,Availability,Tables,Fenced_Code_Blocks,Footnotes,Heading_IDs,Definition_Lists,Strikethrough,Task_Lists,Using_Emoji_Shortcodes,Highlight,Subscript,Superscript,Automatic_URL_Linking,Disabling_Automatic_URL_Linking])

let Extended_Syntax_Overview:Paragraph = Paragraph(title: "Overview", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Extended_Syntax_Overview.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Availability:Paragraph = Paragraph(title: "Availability", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Availability.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Tables:Paragraph = Paragraph(title: "Tables", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Tables.md"))!,encoding: .utf8)!, hasQuiz: true, quizCase: .tables)

let Fenced_Code_Blocks:Paragraph  = Paragraph(title: "Fenced Code Blocks", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Fenced_Code_Blocks.md"))!,encoding: .utf8)!, hasQuiz: true, quizCase: .fenced_code_blocks)

let Footnotes:Paragraph = Paragraph(title: "Footnotes", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Footnotes.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Heading_IDs:Paragraph = Paragraph(title: "Heading IDs", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Heading_IDs.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Definition_Lists :Paragraph = Paragraph(title: "Definition Lists", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Definition_Lists.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Strikethrough:Paragraph = Paragraph(title: "Strikethrough", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Strikethrough.md"))!,encoding: .utf8)!, hasQuiz: true, quizCase: .strikethrough)

let Task_Lists:Paragraph = Paragraph(title: "Task Lists", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Task_Lists.md"))!,encoding: .utf8)!, hasQuiz: true, quizCase: .task_lists)

let Using_Emoji_Shortcodes:Paragraph = Paragraph(title: "Using Emoji Shortcodes", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Using_Emoji_Shortcodes.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Highlight:Paragraph = Paragraph(title: "Highlight", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Highlight.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Subscript:Paragraph = Paragraph(title: "Subscript", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Subscript.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Superscript:Paragraph = Paragraph(title: "Superscript", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Superscript.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Automatic_URL_Linking:Paragraph = Paragraph(title: "Automatic URL Linking", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Automatic_URL_Linking.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let Disabling_Automatic_URL_Linking:Paragraph = Paragraph(title: "Disabling Automatic URL Linking", text: String(data: FileManager.default.contents(atPath: resourcePath.appending("/Disabling_Automatic_URL_Linking.md"))!,encoding: .utf8)!, hasQuiz: false, quizCase: nil)

let README:String = String(data: FileManager.default.contents(atPath: resourcePath.appending("/README.md"))!,encoding: .utf8)!
