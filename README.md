# Regularity Race Timer

A comprehensive web-based race timing application designed for regularity racing teams. Track lap times, driver performance, and generate detailed reports for multi-driver endurance racing.

## Features

### Live Timing
- **Real-time Stopwatch** - Live lap timer with keyboard shortcuts (Enter key)
- **Driver Tracking** - Shows current driver and lap number on the stopwatch
- **Manual Entry** - Option to manually enter lap times in MM:SS.mmm format
- **Automatic Lap Classification** - Laps are automatically classified as:
  - **Bonus Laps** (configurable, default +2) - Within ±0.99 seconds of target time
  - **Base Laps** (configurable, default +1) - Slower than target by >0.99 seconds
  - **Broken Laps** (configurable, default 0) - Faster than target (breaking out)
  - **Changeover Laps** (configurable, default +1) - Driver change laps
  - **Safety Car Laps** (configurable, default 0) - Safety car periods

### Driver Management
- **Multiple Drivers** - Support for multiple drivers per team
- **Individual Settings** - Configure target time and penalty laps per driver
- **Changeover Button** - Dedicated button to record changeover laps during driver switches
- **Driver Statistics** - Real-time performance metrics per driver including Net Score (Bonus - Broken)

### Team Configuration
- **Team Name** - Customize your team name
- **Race Name** - Track the race/event name
- **Session Number** - Record session numbers for multi-session events
- **Session Duration** - Set session duration for goal lap calculations (default: 120 minutes)

### Audio Warnings
- **Configurable Beep Alerts** - Audio notifications for timing precision:
  - Single beep before target time (configurable seconds)
  - Double beep after lap start (configurable seconds)
  - Individual on/off toggles for each beep type
  - Test buttons to preview beep sounds

### Scoring System
- **Configurable Lap Values** - Customize point values for each lap type:
  - Bonus Lap Value (default: 2)
  - Base Lap Value (default: 1)
  - Changeover Lap Value (default: 1)
  - Broken Lap Value (default: 0)
  - Safety Car Lap Value (default: 0)
- **Goal Laps Calculation** - Dynamic formula based on session duration and driver performance
- **Team Percentage Factor** - Overall team performance metric
- **Net Score Tracking** - Track Bonus Laps - Broken Laps per driver

### Data Visualization
- **Performance Charts** - Interactive charts with trend lines:
  - **Lap Times Over Time** - Line chart showing lap times vs target with trend analysis
  - **Delta from Target** - Bar chart showing deviation from target time with trend
  - **3-Lap Rolling Average** - Track consistency over recent laps
- **Color-Coded Laps** - Visual distinction between lap types:
  - Green = Bonus
  - Blue = Base
  - Red = Broken
  - Purple = Changeover
  - Yellow = Safety Car

### Reports & Export
- **Team PDF Report** - Comprehensive multi-page report including:
  - Race name, session info, and team summary
  - Driver summary table with Net Score and all statistics
  - Individual driver lap details (each driver gets their own page)
  - Performance charts for each driver
  - Filename: `RaceName-TeamName-Session-X-Date.pdf`
- **Driver PDF Report** - Individual driver reports with:
  - Performance summary including Net Score
  - Detailed lap times table
  - Performance charts with trend lines
  - Filename: `RaceName-DriverName-Session-X-Date.pdf`
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
- **Landscape Settings Modal** - Easy-to-use two-column settings interface

### Data Management
- **Auto-save** - Data automatically saved to browser localStorage
- **Clear Functions** - Clear individual driver laps or all data
- **Edit Lap Times** - Double-click any lap time to edit (supports MM:SS.mmm format)
- **Lap Context Menu** - Right-click laps for quick actions (delete, mark as changeover/safety)

## Getting Started

### Requirements
- Modern web browser (Chrome, Firefox, Safari, Edge)
- Python 3 (for running as standalone app - optional)

### Installation Options

#### Option 1: Open Directly in Browser
- Open `index.html` in your web browser
- Works immediately, no setup required

#### Option 2: Run as Local Web Server (Recommended)
1. **Start the local server:**
   ```bash
   python3 -m http.server 8000
   ```

2. **Open in Browser:**
   - Navigate to `http://localhost:8000`

3. **Add to Dock/Desktop (Safari/Chrome):**
   - Creates a standalone app experience
   - Runs in its own window without browser UI
   - Works offline after first load

### Usage

1. **Configure Your Team**
   - Set team name, race name, and session details
   - Add drivers and set their target lap times
   - Configure lap type values in Settings if needed

2. **Start Timing**
   - Click "Start" or press Enter to begin timing
   - Press Enter again to record a lap and start the next one
   - Or manually enter lap times in MM:SS.mmm format

3. **Driver Changes**
   - Click the "Changeover" button during a changeover lap
   - Select the new driver from the modal
   - Timer automatically resets for the new driver

4. **View Performance**
   - Check Driver Statistics for real-time metrics including Net Score
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

### Lap Classification

Laps are automatically classified based on the delta (difference) from the driver's nominated target time:

- **Bonus Lap**: Delta within ±0.99 seconds of target
  - Default Awards: +2 laps (configurable)
  - Example: Target 105s, Lap time 104.5s (+0.5s delta) = Bonus

- **Base Lap**: Delta > +0.99 seconds from target (slower than target)
  - Default Awards: +1 lap (configurable)
  - Example: Target 105s, Lap time 107s (+2s delta) = Base

- **Broken Lap**: Delta < 0 seconds (faster than target - "breaking out")
  - Default Penalty: 0 laps (configurable)
  - Example: Target 105s, Lap time 103s (-2s delta) = Broken

- **Changeover Lap**: Driver change laps
  - Default Awards: +1 lap (configurable)
  - Shown as *** in delta column

- **Safety Car Lap**: Safety car periods
  - Default Awards: 0 laps (configurable)
  - Shown as SC in delta column

### Scoring Calculations

#### Driver Achieved Laps
The total laps achieved by a driver during the event (based on configurable lap values):

```
Achieved Laps = (Base Laps × Base Value) + (Bonus Laps × Bonus Value) +
                (Changeover Laps × Changeover Value) + (Safety Laps × Safety Value) +
                (Broken Laps × Broken Value) - Penalty Laps
```

#### Driver Net Score
```
Net Score = Bonus Laps - Broken Laps
```

#### Driver Goal Laps
The theoretical maximum laps a driver could achieve based on their share of the session:

```
Driver % = (Driver Base + Changeover) / (Team Base + Changeover)
Session Duration (seconds) = Session Duration (minutes) × 60
Driver Goal Laps = ((Driver % × Session Duration) / Target Time) × 2
```

The multiplication by 2 accounts for bonus laps in the theoretical maximum.

#### Team Percentage Factor (Winner Determination)
```
Team Goal Laps = Sum of all Driver Goal Laps
Team Achieved Laps = Sum of all Driver Achieved Laps
Percentage Factor = (Team Achieved Laps / Team Goal Laps) × 100
```

The team with the **highest Percentage Factor** wins the event.

## Data Storage

All data is stored locally in the browser using localStorage:
- `blindFreddyRaceTeams` - Team and driver data
- `blindFreddyActiveTeam` - Currently selected team
- `blindFreddyActiveDriver` - Currently selected driver index
- `darkMode` - Dark/light mode preference
- `audioSettings` - Audio warning configuration
- `lapTypeValues` - Configurable lap type point values

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
regularity-race-timer/
├── index.html              # Main application (single file)
├── lib/                    # External libraries
└── README.md              # This file
```

## Tips & Best Practices

1. **Configure Before Racing** - Set up team name, race name, and lap values before the event
2. **Test Audio Warnings** - Use test buttons in Settings to preview beep sounds
3. **Regular Exports** - Export data periodically to avoid data loss
4. **Calibrate Targets** - Set realistic target times based on track conditions
5. **Use Changeover Button** - Press during changeover lap for accurate tracking
6. **Review Charts** - Check trend lines to identify performance patterns
7. **Edit Mistakes** - Double-click any lap time to correct entry errors
8. **Track Net Score** - Monitor Bonus - Broken laps for driver consistency

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

**Audio beeps not working**
- Check that individual beep toggles are enabled in Settings
- Ensure browser allows audio playback
- Test beeps using the test buttons in Settings

## Customization

### Lap Type Values
You can customize the point values for each lap type in Settings:
- Adjust Bonus, Base, Changeover, Broken, and Safety Car lap values
- Values can range from 0 to 10 in 0.5 increments
- Changes apply immediately to all calculations

### Session Duration
- Default: 120 minutes (2 hours)
- Adjustable for different race formats
- Used in goal lap calculations

## License

MIT License - Free to use and modify

## Support

For issues, feature requests, or questions:
- Open an issue on GitHub
- Submit pull requests for improvements

---

**Regularity Race Timer** - Track. Analyze. Win. 🏁
