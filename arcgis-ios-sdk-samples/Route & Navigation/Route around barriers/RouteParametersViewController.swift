//
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

class RouteParametersViewController: UIViewController {

    @IBOutlet var findBestSequenceSwitch:UISwitch!
    @IBOutlet var preservceFirstStopSwitch:UISwitch!
    @IBOutlet var preservceLastStopSwitch:UISwitch!
    
    var routeParameters:AGSRouteParameters!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        if self.routeParameters != nil {
            self.findBestSequenceSwitch.on = self.routeParameters.findBestSequence
            self.preservceFirstStopSwitch.on = self.routeParameters.preserveFirstStop
            self.preservceLastStopSwitch.on = self.routeParameters.preserveLastStop
            self.enableSubSwitches(self.routeParameters.findBestSequence)
        }
    }
    
    func enableSubSwitches(enable:Bool) {
        self.preservceLastStopSwitch.enabled = enable
        self.preservceFirstStopSwitch.enabled = enable
    }

    //MARK: - Actions
    
    @IBAction func switchValueChanged(sender:UISwitch) {
        if sender == self.findBestSequenceSwitch {
            self.routeParameters.findBestSequence = sender.on
            self.enableSubSwitches(sender.on)
        }
        else if sender == self.preservceFirstStopSwitch {
            self.routeParameters.preserveFirstStop = self.preservceFirstStopSwitch.on
        }
        else {
            self.routeParameters.preserveLastStop = self.preservceLastStopSwitch.on
        }
    }
}
