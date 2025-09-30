# Blind Freddy Race Timer

A comprehensive web-based race timing application designed for the Blind Freddy racing team. Track lap times, driver performance, and generate detailed reports for multi-driver endurance racing.

## Features

### Live Timing
- **Real-time Stopwatch** - Live lap timer with keyboard shortcuts (Enter key)
- **Driver Tracking** - Shows current driver and lap number on the stopwatch
- **Manual Entry** - Option to manually enter lap times
- **Automatic Lap Classification** - Laps are automatically classified as:
  - **Bonus Laps** (+2 points) - Within 0.99 seconds of target time
  - **Base Laps** (+1 point) - Positive delta from target
  - **Broken Laps** (0 points) - Negative delta from target
  - **Changeover Laps** (+1 point) - Driver change laps

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
- No server or installation required - runs entirely in the browser

### Usage

1. **Open the Application**
   - Open `race-timer.html` in your web browser
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

### Lap Classification
- **Bonus Lap**: Delta within ±0.99 seconds of target (2 points)
- **Base Lap**: Delta > +0.99 seconds from target (1 point)
- **Broken Lap**: Delta < 0 seconds (negative delta) (0 points)
- **Changeover Lap**: Driver change lap (1 point)

### Goal Laps Formula
```
Driver Achieved Laps = Base + Bonus×2 + Changeover - Broken - Penalty

Driver Goal Laps = ((Base + Changeover) × Team Percentage Factor) + Bonus - Broken - Penalty

Team Goal Laps = Sum of all Driver Goal Laps

Team Percentage Factor = (Total Achieved Laps / Total Goal Laps) × 100
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
├── race-timer.html          # Main application (single file)
├── simulation-data.json     # Sample data (100 laps per driver)
└── README.md               # This file
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
