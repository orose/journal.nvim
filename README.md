# journal.nvim

A simple and focused journaling plugin for Neovim that helps you maintain daily reflection habits, practice gratitude, and reduce mindless screen time.

## ✨ Features

- **Daily, Weekly, and Monthly** journal entries with structured templates
- **Automatic file organization** by year and month
- **Template system** with customizable reflection prompts
- **Seamless integration** with your existing Neovim workflow
- **Minimal setup** - works out of the box
- **Markdown-based** - compatible with any markdown tools

## 📁 File Structure

```
~/journal/
├── templates/
│   ├── daily-template.md
│   ├── weekly-template.md
│   ├── monthly-template.md
│   └── special-day-template.md
└── 2025/
├── 01-january/
│   ├── 2025-01-15.md
│   ├── week-03.md
│   └── january-2025.md
└── 08-august/
├── 2025-08-04.md
└── week-32.md
```

## 🚀 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "orose/journal.nvim",
  config = function()
    require('journal').setup()
  end
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'orose/journal.nvim',
  config = function()
    require('journal').setup()
  end
}
```


### Manual installation

Clone the repository to your Neovim configuration directory:

```bash
git clone https://github.com/orose/journal.nvim.git ~/.config/nvim/pack/plugins/start/journal.nvim
```

## Configuration

### Default setup

```lua
require('journal').setup()
```


### Custom configuration

```lua
require('journal').setup({
  journal_path = "~/my-journal",           -- Where to store journal files
  templates_path = "~/my-journal/templates", -- Where to find templates
  date_format = "%Y-%m-%d",                -- Date format for daily entries
  month_format = "%m-%B",                  -- Month format for directories
  auto_create_dirs = true,                 -- Automatically create directories
  keymaps = {
    daily = "<leader>td",                  -- Open daily journal
    weekly = "<leader>tw",                 -- Open weekly journal
    monthly = "<leader>tm"                 -- Open monthly journal
  }
})
```

## Commands

`:JournalDaily` - Open or create today's journal entry
`:JournalWeekly` - Open or create this week's journal entry
`:JournalMonthly` - Open or create this month's journal entry

### Default Keymaps

`<leader>td` - Open daily journal
`<leader>tw` - Open weekly journal
`<leader>tm` - Open monthly journal

## Templates
The plugin comes with structured templates that encourage meaningful reflection:

### Daily Template

* How am I feeling right now?
* What from yesterday stays with me?
* What am I grateful for today?
* Did I use my time yesterday as I intended?
* What am I looking forward to today?

### Weekly Template

* What did I learn this week that I can actually use?
* What patterns do I see in my behavior?
* How much time did I spend scrolling vs creating/learning?

### Monthly Template

* How has my mindset changed?
* What surprised me about myself?
* Which habits stuck, which ones slipped?

## 🎯 Philosophy
This plugin was born from the desire to:

* Replace mindless scrolling with meaningful reflection
* Maintain focus on what truly matters
* Document personal growth over time
* Build sustainable habits through simple, consistent practice

## 📚 Workflow Integration

### Morning Routine

* Open Neovim
* Press `<leader>td` or run `:JournalDaily`
* Reflect for 5-10 minutes
* Start your day with intention

### With Git

Consider keeping your journal in a private Git repository:

```bash
cd ~/journal
git init
git remote add origin https://github.com/yourusername/my-journal.git
git add . && git commit -m "Daily reflection" && git push
```

🛠️ Templates

Create your own templates in the templates/ directory. Use these placeholders:

`{{ date }}` - Current date (YYYY-MM-DD)
`{{ uke_nummer }}` - Week number
`{{ måned }}` - Month name
`{{ år }}` - Year

🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

📄 License

MIT License - see LICENSE file for details.

🙏 Acknowledgments
Inspired by the practice of daily reflection and the desire to use technology mindfully.

----- 

*Start your journaling journey today with `:JournalDaily`*
