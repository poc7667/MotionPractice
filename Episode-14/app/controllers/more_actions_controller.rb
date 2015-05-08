class MoreActionsController < BaseLanguagesController

  SECURITY_SECTION = 0
  LOCK_CODE_ROW_NUMBER = 0
  CLEAR_CODE_ROW_NUMBER = 1
  LOGOUT_ROW_NUMBER = 2
  NUMBER_OF_ROWS_IN_SECURITY_SECTION = 3

  APP_VERSION_SECTION = 1
  APP_VERSION_ROW_NUMBER = 0
  NUMBER_OF_ROWS_IN_APP_VERSION_SECTION = 1

  CLEAR_LOCK_CODE_TEXT = "Clear Lock Code"
  SET_LOCK_CODE_TEXT = "Set Lock Code"
  LOGOUT_TEXT = "Logout"

  def init
    super
    initWithStyle(UITableViewStyleGrouped)
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('More...', image: rmq.image.resource('lightbulb'), tag: 0)
    self.title = 'More...'
    self
  end

  def viewDidLoad
    super
  end

  def numberOfSectionsInTableView tableView
    2
  end

  def tableView(tableView, numberOfRowsInSection: indexPath)
    if indexPath == 0
      NUMBER_OF_ROWS_IN_SECURITY_SECTION
    else
      NUMBER_OF_ROWS_IN_APP_VERSION_SECTION
    end
  end

  CellID = "CellIdentify"
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier: CellID)
    cell.userInteractionEnabled = true
    cell.textLabel.textColor = rmq.color.black

    case indexPath.section
    when SECURITY_SECTION
      display_security_section(indexPath, cell)
    when APP_VERSION_SECTION
      display_version_section(indexPath, cell)
    end

    cell
  end

  def tableView(tableView, titleForHeaderInSection: section)
    section == 0 ? "Security" : "App Version Info"
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    selectedCell = tableView.cellForRowAtIndexPath(indexPath)
    text = selectedCell.textLabel.text

    case text
    when CLEAR_LOCK_CODE_TEXT
      App.alert "Coming soon!"
    when SET_LOCK_CODE_TEXT
      App.alert "Coming soon!"
    when LOGOUT_TEXT
      App.alert "Coming soon!"
    else
      App.alert "Error: #{text}"
    end
  end

  private

    def display_security_section(indexPath, cell)
      case indexPath.row
      when LOCK_CODE_ROW_NUMBER
        cell.textLabel.text = SET_LOCK_CODE_TEXT
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
      when CLEAR_CODE_ROW_NUMBER
        cell.textLabel.text = CLEAR_LOCK_CODE_TEXT
      when LOGOUT_ROW_NUMBER
        cell.textLabel.text = LOGOUT_TEXT
      end
    end

    def display_version_section(indexPath, cell)
      case indexPath.row
      when APP_VERSION_ROW_NUMBER
        cell.textLabel.text = 'App Version'
        cell.userInteractionEnabled = false
        cell.detailTextLabel.text = '0.0.1'
      end
    end
end