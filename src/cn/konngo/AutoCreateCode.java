package cn.konngo;

import cn.konngo.tool.SearchTablesTool;
import cn.konngo.utils.Config;

/**
 *  peng@konngo.cn
 *  2019-12-19
 */
public class AutoCreateCode {

    public static void main(String[] args) {
        Config.init();
        new SearchTablesTool().search();
    }
}
