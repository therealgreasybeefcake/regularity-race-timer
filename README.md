# Blind Freddy Race Timer

A comprehensive web-based race timing application designed for the Blind Freddy racing team. Track lap times, driver performance, and generate detailed reports for multi-driver endurance racing.

## Features

### Live Timing
- **Real-time Stopwatch** - Live lap timer with keyboard shortcuts (Enter key)
- **Driver Tracking** - Shows current driver and lap number on the stopwatch
- **Manual Entry** - Option to manually enter lap times
- **Automatic Lap Classification** - Laps are automatically classified as:
  - **Bonus Laps** (+2 laps) - Within ±0.99 seconds of target time
  - **Base Laps** (+1 lap) - Slower than target by >0.99 seconds
  - **Broken Laps** (-1 lap) - Faster than target (breaking out)
  - **Changeover Laps** (+1 lap) - Driver change laps (auto-detected >3 min gap)

### Driver Management
- **Multiple Drivers** - Support for up to 4 drivers (Harry, Dave, Tom, Neil)
- **Individual Settings** - Configure target time and penalty laps per driver
- **Changeover Button** - Dedicated button to record changeover laps during driver switches
- **Driver Statistics** - Real-time performance metrics per driver

### Scoring System
- **Goal Laps Calculation** - Complex formula based on driver performance:
  - `Driver Goal Laps = (Base + Changeover) × Team % + Bonus - Broken - Penalty`
  - `Team Goal Laps = Sum of all driver Goal Laps`
- **Team Percentage Factor** - Overall team performance metric
- **Percentage of Team Base** - Shows each driver's contribution to team total

### Data Visualization
- **Performance Charts** - Interactive charts with trend lines:
  - **Lap Times Over Time** - Line chart showing lap times vs target with trend analysis
  - **Delta from Target** - Bar chart showing deviation from target time with trend
- **Color-Coded Laps** - Visual distinction between lap types:
  - Green = Bonus
  - Blue = Base
  - Red = Broken
  - Purple = Changeover

### Reports & Export
- **Team PDF Report** - Comprehensive multi-page report including:
  - Team summary with goal laps and percentage factor
  - Driver summary table with all statistics
  - Individual driver lap details (each driver gets their own page)
  - Performance charts for each driver
- **Driver PDF Report** - Individual driver reports with:
  - Performance summary
  - Detailed lap times table
  - Performance charts with trend lines
- **CSV Export** - Export all lap data to CSV format
- **JSON Import/Export** - Save and load race data

### User Interface
- **Dark/Light Mode** - Toggle between dark and light themes
- **Responsive Layout** - Three-column dashboard with:
  - Left: Driver settings and statistics
  - Center: Live stopwatch and status indicator
  - Right: Lap history with scrollable table
- **Real-time Status Indicator** - Visual feedback on last lap performance
- **Tab-based Navigation** - Switch between drivers while maintaining timer state

### Data Management
- **Auto-save** - Data automatically saved to browser localStorage
- **Clear Functions** - Clear individual driver laps or all data
- **Simulation Data** - Import sample data for testing (100 laps per driver)

## Getting Started

### Requirements
- Modern web browser (Chrome, Firefox, Safari, Edge)
- Python 3 (for running as standalone app)

### Installation Options

#### Option 1: Open Directly in Browser
- Open `index.html` in your web browser
- Works immediately, no setup required

#### Option 2: Install as Standalone App (Recommended)
1. **Start the local server:**
   ```bash
   python3 -m http.server 8000
   ```

2. **Open in Safari:**
   - Navigate to `http://localhost:8000`

3. **Add to Dock:**
   - In Safari: **File → Add to Dock**
   - Creates a standalone app with the Blind Freddy logo
   - Runs in its own window without browser UI
   - Works offline after first load

4. **Keep it running:**
   - Leave the server running in the terminal
   - Or restart with the same command when needed

### Usage

1. **Open the Application**
   - Open `index.html` in your browser, or
   - Launch the app from your Dock (if installed)
   - The app loads with default driver settings

2. **Start Timing**
   - Click "Start" or press Enter to begin timing
   - Press Enter again to record a lap and start the next one
   - Or manually enter lap times in the input field

3. **Driver Changes**
   - Click the "Changeover" button during a changeover lap
   - Select the new driver from the modal
   - Timer automatically resets for the new driver

4. **View Performance**
   - Check Driver Statistics for real-time metrics
   - Click "Charts" to view performance trends
   - Click "Team Score" to see overall team standings

5. **Generate Reports**
   - Click "PDF" to generate team report with all drivers
   - Click "PDF" in Driver Statistics for individual driver report
   - Click "CSV" to export raw data

## Keyboard Shortcuts

- **Enter** - Start timer / Record lap and restart
- **Tab** - Navigate between input fields

## Scoring Rules

This application implements the official Blind Freddy Motor Racing Club scoring system as per the event regulations.

### Lap Classification

Laps are automatically classified based on the delta (difference) from the driver's nominated target time:

- **Bonus Lap**: Delta within ±0.99 seconds of target
  - Awards: +2 laps (1 base + 1 bonus)
  - Example: Target 105s, Lap time 104.5s (+0.5s delta) = Bonus

- **Base Lap**: Delta > +0.99 seconds from target (slower than target)
  - Awards: +1 lap
  - Example: Target 105s, Lap time 107s (+2s delta) = Base

- **Broken Lap**: Delta < 0 seconds (faster than target - "breaking out")
  - Penalty: -1 lap
  - Example: Target 105s, Lap time 103s (-2s delta) = Broken

- **Changeover Lap**: Automatically detected when > 3 minutes between laps
  - Awards: +1 lap
  - Shown as ***** in delta column

### Scoring Calculations

#### Driver Achieved Laps
The total laps achieved by a driver during the event:

```
Achieved Laps = Base Laps + (Bonus Laps × 2) + Changeover Laps - Broken Laps - Penalty Laps
```

**Example:**
- Base Laps: 75
- Bonus Laps: 23 (counted as 23 × 2 = 46 in calculation)
- Changeover Laps: 1
- Broken Laps: 2
- Penalty Laps: 0
- **Achieved Laps: 75 + 46 + 1 - 2 - 0 = 120**

#### Driver Goal Laps
The theoretical maximum laps a driver could achieve based on their share of the event:

```
Driver % = (Driver Base + Changeover) / (Team Base + Changeover)

Driver Goal Laps = ((Driver % × 36000 seconds) / Target Time in seconds) × 2

OR equivalently:

Driver Goal Laps = ((Base + Changeover) / Team Total) × Team Theoretical Max × 2
```

The multiplication by 2 accounts for bonus laps in the theoretical maximum.

#### Team Goal Laps
```
Team Goal Laps = Sum of all Driver Goal Laps
```

#### Team Achieved Laps
```
Team Achieved Laps = Sum of all Driver Achieved Laps
```

#### Percentage Factor (Winner Determination)
```
Percentage Factor = (Team Achieved Laps / Team Goal Laps) × 100
```

The team with the **highest Percentage Factor** wins the event.

### Lap Value Reference

| Lap Type | Display | Lap Value | Notes |
|----------|---------|-----------|-------|
| Bonus | Green | +2 | Within ±0.99s of target |
| Base | Blue | +1 | Slower than target by >0.99s |
| Changeover | Purple | +1 | Driver change (auto-detected) |
| Broken | Red | -1 | Faster than target (penalty) |

### Example Calculation

**Driver A:**
- Target Time: 1:42.00 (102 seconds)
- Base Laps: 75
- Bonus Laps: 23
- Changeover Laps: 1
- Broken Laps: 2
- Penalty Laps: 0

**Achieved Laps:**
```
75 + (23 × 2) + 1 - 2 - 0 = 75 + 46 + 1 - 2 = 120
```

**If Team Total Base+Changeover = 300 laps:**
```
Driver % = (75 + 1) / 300 = 25.33%
Driver Share of Event = 25.33% × 36000 seconds = 9,120 seconds
Theoretical Laps = 9,120 / 102 = 89.41 laps
Goal Laps (with bonus factor) = 89.41 × 2 = 178.82
```

## Data Storage

All data is stored locally in the browser using localStorage:
- `blindFreddyRaceTeams` - Team and driver data
- `blindFreddyActiveTeam` - Currently selected team (always 0)
- `blindFreddyActiveDriver` - Currently selected driver index
- `raceTimerTheme` - Dark/light mode preference

## Technical Details

### Built With
- **React 18** - UI framework
- **Chart.js 4.4** - Data visualization
- **Tailwind CSS** - Styling
- **jsPDF** - PDF generation
- **jsPDF-AutoTable** - PDF table generation

### Browser Compatibility
- Chrome/Edge 90+
- Firefox 88+
- Safari 14+

### File Structure
```
winton/
├── index.html              # Main application (single file)
├── simulation-data.json    # Sample data (100 laps per driver)
└── README.md              # This file
```

## Tips & Best Practices

1. **Regular Exports** - Export data periodically to avoid data loss
2. **Calibrate Targets** - Set realistic target times based on track conditions
3. **Use Changeover Button** - Press during changeover lap for accurate tracking
4. **Review Charts** - Check trend lines to identify performance patterns
5. **Clear Before New Race** - Use "Clear" button to reset for a new race

## Troubleshooting

**Timer not stopping**
- Click the "Reset" button to stop and reset the timer

**Data lost after browser refresh**
- Data should persist in localStorage. Check browser settings to ensure localStorage is enabled

**PDF not generating**
- Ensure pop-up blocker is disabled for the page
- Try a different browser if issues persist

**Charts not displaying**
- Ensure you have recorded at least one lap
- Charts require lap data to render

## Future Enhancements

Potential features for future versions:
- Multi-team support
- Live timing synchronization across devices
- Historical race comparison
- Weather/track condition logging
- Fuel consumption tracking
- Pit stop timing

## Version History

**v1.0** (Current)
- Initial release with core timing features
- Multi-driver support
- PDF and CSV export
- Performance charts with trend lines
- Dark/light mode
- Changeover lap tracking

## License

Proprietary - Developed for Blind Freddy Racing Team

## Support

For issues or questions, please contact the development team.

---

**Blind Freddy Race Timer** - Track. Analyze. Win. 🏁
