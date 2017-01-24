// Copyright 2016 Esri.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import ArcGIS

class GroupUsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    private var portal: AGSPortal!
    private var portalGroup: AGSPortalGroup!
    private var portalUsers: [AGSPortalUser]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add the source code button item to the right of navigation bar
        (self.navigationItem.rightBarButtonItem as! SourceCodeBarButtonItem).filenames = ["GroupUsersViewController", "GroupUserCell"]

        //automatic cell sizing for table view
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 104
        
        //initialize portal with AGOL
        self.portal = AGSPortal.ArcGISOnlineWithLoginRequired(false)
        
        //load the portal group to be used
        self.loadPortalGroup()
    }
    
    private func loadPortalGroup() {
        
        //show progress hud
        SVProgressHUD.showWithStatus("Loading Portal Group", maskType: .Gradient)
        
        //query group based on owner and title
        let queryParams = AGSPortalQueryParameters(forGroupsWithOwner: "ArcGISRuntimeSDK", title: "Runtime Group")
        
        //find groups with using query params
        self.portal.findGroupsWithQueryParameters(queryParams) { [weak self] (resultSet: AGSPortalQueryResultSet?, error: NSError?) in
            
            if let error = error {
                //show error
                SVProgressHUD.showErrorWithStatus(error.localizedDescription, maskType: .Gradient)
            }
            else {
                
                //fetch users for the resulting group
                if let groups = resultSet?.results as? [AGSPortalGroup] where groups.count > 0 {
                    self?.portalGroup = groups[0]
                    self?.fetchGroupUsers()
                }
                else {
                    //show error that no groups found
                    SVProgressHUD.showErrorWithStatus("No groups found", maskType: .Gradient)
                }
            }
        }
    }
    
    private func fetchGroupUsers() {
        //show progress hud
        SVProgressHUD.showWithStatus("Fetching Users", maskType: .Gradient)
        
        //fetch users in group
        self.portalGroup.fetchUsersWithCompletion { [weak self] (users: [String]?, admins: [String]?, error: NSError?) in
            
            if let error = error {
                //show error
                SVProgressHUD.showErrorWithStatus(error.localizedDescription, maskType: .Gradient)
            }
            else {
                
                //if there are users in the group
                if let users = users where users.count > 0 {
                    self?.portalUsers = [AGSPortalUser]()
                    
                    //initialize AGSPortalUser objects with user names
                    for user in users {
                        let portalUser = AGSPortalUser(portal: self!.portal, username: user)
                        self?.portalUsers.append(portalUser)
                    }
                    
                    //load all users before populating into table view
                    self?.loadAllUsers()
                }
                else {
                    SVProgressHUD.showErrorWithStatus("No users found", maskType: .Gradient)
                }
            }
        }
    }
    
    private func loadAllUsers() {
        //show progress hud
        SVProgressHUD.showWithStatus("Loading User Data", maskType: .Gradient)
        
        //load user data
        AGSLoadObjects(self.portalUsers) { [weak self] (success) in
            if success {
                //dismiss hud
                SVProgressHUD.dismiss()
                
                //reload table view
                self?.tableView.reloadData()
            }
            else {
                SVProgressHUD.showErrorWithStatus("Error while loading users data", maskType: .Gradient)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.portalUsers?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupUserCell") as! GroupUserCell
        
        let portalUser = self.portalUsers[indexPath.row]
        cell.portalUser = portalUser
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Runtime Group"
    }
}
