package package_id;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Timer;
import java.util.TimerTask;

public class plugin_name extends CordovaPlugin {

    private final String TAG = "plugin_name";

    /**
     * response result to web
     * */
    //private CallbackContext pluginResultCallback;
    //private JSONObject resultData = null;
    //private JSONObject resultHeader = null;

    /**
     * request parameters from web
     * */
    //private JSONObject param = null;
    //private JSONObject body = null;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        //pluginResultCallback = callbackContext;

        //param = args.getJSONObject(0);
        //Log.d(TAG, "param = " + param);
        //if (param.has("body")) {
        //    body = param.getJSONObject("body");
        //}
        //
 action_name

        return false;
    }

function_name

    /**
     * sendSuccessCallback
     * @usage   used to success
     * */
    //private void sendSuccessCallback() {
    //    resultData = new JSONObject();
    //    resultHeader = new JSONObject();
    //    try {
    //        resultHeader.put("result", true);
    //        resultData.put("header", resultHeader);
    //    } catch (JSONException e) {
    //        e.printStackTrace();
    //    }
    //    PluginResult pluginResult = new PluginResult(PluginResult.Status.OK, resultData);
    //    pluginResult.setKeepCallback(true);
    //    pluginResultCallback.sendPluginResult(pluginResult);
    //}

    /**
     * sendSuccessCallback
     * @usage   used to error with errorCode and errorMessage
     * */
    //private void sendErrorCallback() {
    //    resultData = new JSONObject();
    //    resultHeader = new JSONObject();
    //    try {
    //        resultHeader.put("result", false);
    //        resultHeader.put("errorCode", -1);
    //        resultHeader.put("errorMessage", "error");
    //        resultData.put("header", resultHeader);
    //    } catch (JSONException e) {
    //        e.printStackTrace();
    //    }
    //    pluginResultCallback.error(resultData);
    //}
}
