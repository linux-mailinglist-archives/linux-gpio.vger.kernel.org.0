Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B2B5AD8EA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 20:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbiIESOz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 14:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiIESOv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 14:14:51 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EB91A804
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662401689; x=1693937689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AIGQ/g02sQd4YdTAl0F1gRfZjOCIkYdWYMPX9J/G3/0=;
  b=aKht8bHHWfJLq0A66vQqmREQxclKnMEfO001nhHAYiuUAiqkVVQ1ZPzl
   ecxC9SDgxIwqM7DzZKhXm0ZvohJJAn7K8Vto4PtvojGx8OIu9u3xyx2WO
   +NtJ8zCvbBnqtvWEyn7eq0zxaMqc5GwsnVXeb4rRLWZ6TEEkO0XQz7tb1
   13wSXwTj8a/AKdxkoyd0sbguH2aAwT1NVFgIQpo1kBaGM9VRlZ8y0Ltf3
   AN4pojtsim6Al4CF9zCv8T8Sokht0dzeL/ke9XCqCoJPzzsK8fUtWuf46
   kYb8jAKryWFFR+0wCBI5vKib8JtUBDUmGQpBI2lxK0F29RYKMKXcTXaXf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="283429453"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="283429453"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 11:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="682136938"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2022 11:14:43 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVGcN-0004Pp-0f;
        Mon, 05 Sep 2022 18:14:43 +0000
Date:   Tue, 6 Sep 2022 02:14:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: [linusw-pinctrl:devel 26/32]
 drivers/pinctrl/freescale/pinctrl-imx.c:41:32: error: 'struct pinctrl_dev'
 has no member named 'num_groups'
Message-ID: <202209060213.cvJgITgB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Francesco,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   1074e1d23a5c201b6558878a09f1d2b7c9506835
commit: 87c2a29a6bf1a078d82427d42a2480a61814f8e3 [26/32] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
config: alpha-randconfig-s033-20220905 (https://download.01.org/0day-ci/archive/20220906/202209060213.cvJgITgB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=87c2a29a6bf1a078d82427d42a2480a61814f8e3
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout 87c2a29a6bf1a078d82427d42a2480a61814f8e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/pinctrl/freescale/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_find_group_by_name':
>> drivers/pinctrl/freescale/pinctrl-imx.c:41:32: error: 'struct pinctrl_dev' has no member named 'num_groups'
      41 |         for (i = 0; i < pctldev->num_groups; i++) {
         |                                ^~
>> drivers/pinctrl/freescale/pinctrl-imx.c:42:23: error: implicit declaration of function 'pinctrl_generic_get_group' [-Werror=implicit-function-declaration]
      42 |                 grp = pinctrl_generic_get_group(pctldev, i);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:42:21: warning: assignment to 'const struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |                 grp = pinctrl_generic_get_group(pctldev, i);
         |                     ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:43:39: error: invalid use of undefined type 'const struct group_desc'
      43 |                 if (grp && !strcmp(grp->name, name))
         |                                       ^~
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_dt_node_to_map':
   drivers/pinctrl/freescale/pinctrl-imx.c:80:31: error: invalid use of undefined type 'const struct group_desc'
      80 |                 map_num += grp->num_pins;
         |                               ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:82:36: error: invalid use of undefined type 'const struct group_desc'
      82 |                 for (i = 0; i < grp->num_pins; i++) {
         |                                    ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:83:55: error: invalid use of undefined type 'const struct group_desc'
      83 |                         pin = &((struct imx_pin *)(grp->data))[i];
         |                                                       ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:110:32: error: invalid use of undefined type 'const struct group_desc'
     110 |         for (i = j = 0; i < grp->num_pins; i++) {
         |                                ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:111:47: error: invalid use of undefined type 'const struct group_desc'
     111 |                 pin = &((struct imx_pin *)(grp->data))[i];
         |                                               ^~
   drivers/pinctrl/freescale/pinctrl-imx.c: At top level:
>> drivers/pinctrl/freescale/pinctrl-imx.c:155:29: error: 'pinctrl_generic_get_group_count' undeclared here (not in a function)
     155 |         .get_groups_count = pinctrl_generic_get_group_count,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:156:27: error: 'pinctrl_generic_get_group_name' undeclared here (not in a function)
     156 |         .get_group_name = pinctrl_generic_get_group_name,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:157:27: error: 'pinctrl_generic_get_group_pins' undeclared here (not in a function); did you mean 'pinctrl_get_group_pins'?
     157 |         .get_group_pins = pinctrl_generic_get_group_pins,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           pinctrl_get_group_pins
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pmx_set':
>> drivers/pinctrl/freescale/pinctrl-imx.c:256:13: warning: assignment to 'struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     256 |         grp = pinctrl_generic_get_group(pctldev, group);
         |             ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:260:16: error: implicit declaration of function 'pinmux_generic_get_function'; did you mean 'pinmux_generic_free_functions'? [-Werror=implicit-function-declaration]
     260 |         func = pinmux_generic_get_function(pctldev, selector);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx.c:260:14: warning: assignment to 'struct function_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     260 |         func = pinmux_generic_get_function(pctldev, selector);
         |              ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:264:20: error: invalid use of undefined type 'struct group_desc'
     264 |         npins = grp->num_pins;
         |                    ^~
   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/pinctrl/freescale/pinctrl-imx.c:16:
>> drivers/pinctrl/freescale/pinctrl-imx.c:267:21: error: invalid use of undefined type 'struct function_desc'
     267 |                 func->name, grp->name);
         |                     ^~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:266:9: note: in expansion of macro 'dev_dbg'
     266 |         dev_dbg(ipctl->dev, "enable function %s group %s\n",
         |         ^~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:267:32: error: invalid use of undefined type 'struct group_desc'
     267 |                 func->name, grp->name);
         |                                ^~
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:266:9: note: in expansion of macro 'dev_dbg'
     266 |         dev_dbg(ipctl->dev, "enable function %s group %s\n",
         |         ^~~~~~~
   drivers/pinctrl/freescale/pinctrl-imx.c:275:47: error: invalid use of undefined type 'struct group_desc'
     275 |                 pin = &((struct imx_pin *)(grp->data))[i];
         |                                               ^~
   drivers/pinctrl/freescale/pinctrl-imx.c: At top level:
>> drivers/pinctrl/freescale/pinctrl-imx.c:287:32: error: 'pinmux_generic_get_function_count' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     287 |         .get_functions_count = pinmux_generic_get_function_count,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx.c:288:30: error: 'pinmux_generic_get_function_name' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     288 |         .get_function_name = pinmux_generic_get_function_name,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              pinmux_generic_free_functions
>> drivers/pinctrl/freescale/pinctrl-imx.c:289:32: error: 'pinmux_generic_get_function_groups' undeclared here (not in a function); did you mean 'pinmux_generic_free_functions'?
     289 |         .get_function_groups = pinmux_generic_get_function_groups,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                pinmux_generic_free_functions
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinconf_parse_generic_config':
>> drivers/pinctrl/freescale/pinctrl-imx.c:341:15: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
     341 |         ret = pinconf_generic_parse_dt_config(np, pctl, &configs,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               pinconf_generic_dump_config
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinconf_group_dbg_show':
   drivers/pinctrl/freescale/pinctrl-imx.c:472:29: error: 'struct pinctrl_dev' has no member named 'num_groups'
     472 |         if (group >= pctldev->num_groups)
         |                             ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:476:13: warning: assignment to 'struct group_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     476 |         grp = pinctrl_generic_get_group(pctldev, group);
         |             ^
   drivers/pinctrl/freescale/pinctrl-imx.c:480:28: error: invalid use of undefined type 'struct group_desc'
     480 |         for (i = 0; i < grp->num_pins; i++) {
         |                            ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:481:63: error: invalid use of undefined type 'struct group_desc'
     481 |                 struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
         |                                                               ^~
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_groups':
   drivers/pinctrl/freescale/pinctrl-imx.c:592:12: error: invalid use of undefined type 'struct group_desc'
     592 |         grp->name = np->name;
         |            ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:620:12: error: invalid use of undefined type 'struct group_desc'
     620 |         grp->num_pins = size / pin_size;
         |            ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:621:12: error: invalid use of undefined type 'struct group_desc'
     621 |         grp->data = devm_kcalloc(ipctl->dev,
         |            ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:622:37: error: invalid use of undefined type 'struct group_desc'
     622 |                                  grp->num_pins, sizeof(struct imx_pin),
         |                                     ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:624:12: error: invalid use of undefined type 'struct group_desc'
     624 |         grp->pins = devm_kcalloc(ipctl->dev,
         |            ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:625:37: error: invalid use of undefined type 'struct group_desc'
     625 |                                  grp->num_pins, sizeof(unsigned int),
         |                                     ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:627:17: error: invalid use of undefined type 'struct group_desc'
     627 |         if (!grp->pins || !grp->data)
         |                 ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:627:31: error: invalid use of undefined type 'struct group_desc'
     627 |         if (!grp->pins || !grp->data)
         |                               ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:630:28: error: invalid use of undefined type 'struct group_desc'
     630 |         for (i = 0; i < grp->num_pins; i++) {
         |                            ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:631:47: error: invalid use of undefined type 'struct group_desc'
     631 |                 pin = &((struct imx_pin *)(grp->data))[i];
         |                                               ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:633:64: error: invalid use of undefined type 'struct group_desc'
     633 |                         info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
         |                                                                ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:636:63: error: invalid use of undefined type 'struct group_desc'
     636 |                         imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i],
         |                                                               ^~
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_parse_functions':
   drivers/pinctrl/freescale/pinctrl-imx.c:656:14: warning: assignment to 'struct function_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     656 |         func = pinmux_generic_get_function(pctl, index);
         |              ^
   drivers/pinctrl/freescale/pinctrl-imx.c:661:13: error: invalid use of undefined type 'struct function_desc'
     661 |         func->name = np->name;
         |             ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:662:13: error: invalid use of undefined type 'struct function_desc'
     662 |         func->num_group_names = of_get_child_count(np);
         |             ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:663:17: error: invalid use of undefined type 'struct function_desc'
     663 |         if (func->num_group_names == 0) {
         |                 ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:668:52: error: invalid use of undefined type 'struct function_desc'
     668 |         group_names = devm_kcalloc(ipctl->dev, func->num_group_names,
         |                                                    ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:675:13: error: invalid use of undefined type 'struct function_desc'
     675 |         func->group_names = group_names;
         |             ^~
>> drivers/pinctrl/freescale/pinctrl-imx.c:679:55: error: invalid application of 'sizeof' to incomplete type 'struct group_desc'
     679 |                 grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
         |                                                       ^~~~~~
>> drivers/pinctrl/freescale/pinctrl-imx.c:687:40: error: 'struct pinctrl_dev' has no member named 'pin_group_tree'
     687 |                 radix_tree_insert(&pctl->pin_group_tree,
         |                                        ^~
   drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_probe_dt':
>> drivers/pinctrl/freescale/pinctrl-imx.c:752:59: error: invalid application of 'sizeof' to incomplete type 'struct function_desc'
     752 |                 function = devm_kzalloc(&pdev->dev, sizeof(*function),
         |                                                           ^
>> drivers/pinctrl/freescale/pinctrl-imx.c:758:40: error: 'struct pinctrl_dev' has no member named 'pin_function_tree'
     758 |                 radix_tree_insert(&pctl->pin_function_tree, i, function);
         |                                        ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:761:13: error: 'struct pinctrl_dev' has no member named 'num_functions'
     761 |         pctl->num_functions = nfuncs;
         |             ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:765:21: error: 'struct pinctrl_dev' has no member named 'num_groups'
     765 |                 pctl->num_groups = of_get_child_count(np);
         |                     ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:767:21: error: 'struct pinctrl_dev' has no member named 'num_groups'
     767 |                 pctl->num_groups = 0;
         |                     ^~
   drivers/pinctrl/freescale/pinctrl-imx.c:769:29: error: 'struct pinctrl_dev' has no member named 'num_groups'
     769 |                         pctl->num_groups += of_get_child_count(child);
         |                             ^~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_IMX
   Depends on [n]: PINCTRL [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_IMX8MM [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
   - PINCTRL_IMX8MN [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
   - PINCTRL_IMX8MP [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
   - PINCTRL_IMX8MQ [=y] && PINCTRL [=y] && SOC_IMX8M [=y]


vim +41 drivers/pinctrl/freescale/pinctrl-imx.c

ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   33  
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02   34  static inline const struct group_desc *imx_pinctrl_find_group_by_name(
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02   35  				struct pinctrl_dev *pctldev,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   36  				const char *name)
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   37  {
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02   38  	const struct group_desc *grp = NULL;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   39  	int i;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   40  
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02  @41  	for (i = 0; i < pctldev->num_groups; i++) {
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02  @42  		grp = pinctrl_generic_get_group(pctldev, i);
a51c158bf0f7ca drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2016-12-02  @43  		if (grp && !strcmp(grp->name, name))
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   44  			break;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   45  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   46  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   47  	return grp;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   48  }
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   49  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   50  static void imx_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   51  		   unsigned offset)
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   52  {
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   53  	seq_printf(s, "%s", dev_name(pctldev->dev));
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   54  }
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   55  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   56  static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   57  			struct device_node *np,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   58  			struct pinctrl_map **map, unsigned *num_maps)
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   59  {
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   60  	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   61  	const struct imx_pinctrl_soc_info *info = ipctl->info;
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02   62  	const struct group_desc *grp;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   63  	struct pinctrl_map *new_map;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   64  	struct device_node *parent;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   65  	struct imx_pin *pin;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   66  	int map_num = 1;
18071610677fc4 drivers/pinctrl/pinctrl-imx.c           Hui Wang         2012-06-20   67  	int i, j;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   68  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   69  	/*
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   70  	 * first find the group of this node and check if we need create
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   71  	 * config maps for pins
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   72  	 */
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02   73  	grp = imx_pinctrl_find_group_by_name(pctldev, np->name);
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   74  	if (!grp) {
94f4e54cecaf3e drivers/pinctrl/freescale/pinctrl-imx.c Rob Herring      2018-08-27   75  		dev_err(ipctl->dev, "unable to find group for node %pOFn\n", np);
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   76  		return -EINVAL;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   77  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   78  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   79  	if (info->flags & IMX_USE_SCU) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   80  		map_num += grp->num_pins;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   81  	} else {
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02   82  		for (i = 0; i < grp->num_pins; i++) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   83  			pin = &((struct imx_pin *)(grp->data))[i];
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   84  			if (!(pin->conf.mmio.config & IMX_NO_PAD_CTL))
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   85  				map_num++;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   86  		}
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30   87  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   88  
6da2ec56059c3c drivers/pinctrl/freescale/pinctrl-imx.c Kees Cook        2018-06-12   89  	new_map = kmalloc_array(map_num, sizeof(struct pinctrl_map),
6da2ec56059c3c drivers/pinctrl/freescale/pinctrl-imx.c Kees Cook        2018-06-12   90  				GFP_KERNEL);
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   91  	if (!new_map)
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   92  		return -ENOMEM;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   93  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   94  	*map = new_map;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   95  	*num_maps = map_num;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   96  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   97  	/* create mux map */
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27   98  	parent = of_get_parent(np);
c71157c54a4f86 drivers/pinctrl/pinctrl-imx.c           Devendra Naga    2012-06-07   99  	if (!parent) {
c71157c54a4f86 drivers/pinctrl/pinctrl-imx.c           Devendra Naga    2012-06-07  100  		kfree(new_map);
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  101  		return -EINVAL;
c71157c54a4f86 drivers/pinctrl/pinctrl-imx.c           Devendra Naga    2012-06-07  102  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  103  	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  104  	new_map[0].data.mux.function = parent->name;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  105  	new_map[0].data.mux.group = np->name;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  106  	of_node_put(parent);
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  107  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  108  	/* create config map */
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  109  	new_map++;
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02  110  	for (i = j = 0; i < grp->num_pins; i++) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  111  		pin = &((struct imx_pin *)(grp->data))[i];
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  112  
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  113  		/*
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  114  		 * We only create config maps for SCU pads or MMIO pads that
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  115  		 * are not using the default config(a.k.a IMX_NO_PAD_CTL)
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  116  		 */
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  117  		if (!(info->flags & IMX_USE_SCU) &&
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  118  		    (pin->conf.mmio.config & IMX_NO_PAD_CTL))
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  119  			continue;
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  120  
18071610677fc4 drivers/pinctrl/pinctrl-imx.c           Hui Wang         2012-06-20  121  		new_map[j].type = PIN_MAP_TYPE_CONFIGS_PIN;
18071610677fc4 drivers/pinctrl/pinctrl-imx.c           Hui Wang         2012-06-20  122  		new_map[j].data.configs.group_or_pin =
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02  123  					pin_get_name(pctldev, pin->pin);
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  124  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  125  		if (info->flags & IMX_USE_SCU) {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  126  			/*
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  127  			 * For SCU case, we set mux and conf together
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  128  			 * in one IPC call
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  129  			 */
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  130  			new_map[j].data.configs.configs =
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  131  					(unsigned long *)&pin->conf.scu;
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  132  			new_map[j].data.configs.num_configs = 2;
571610678bf344 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-11-12  133  		} else {
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  134  			new_map[j].data.configs.configs =
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  135  					&pin->conf.mmio.config;
18071610677fc4 drivers/pinctrl/pinctrl-imx.c           Hui Wang         2012-06-20  136  			new_map[j].data.configs.num_configs = 1;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  137  		}
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  138  
b96eea718bf697 drivers/pinctrl/freescale/pinctrl-imx.c A.s. Dong        2018-10-30  139  		j++;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  140  	}
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  141  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  142  	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
67695f2eae210b drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-06-08  143  		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  144  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  145  	return 0;
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  146  }
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  147  
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  148  static void imx_dt_free_map(struct pinctrl_dev *pctldev,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  149  				struct pinctrl_map *map, unsigned num_maps)
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  150  {
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  151  	kfree(map);
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  152  }
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  153  
022ab148d28e84 drivers/pinctrl/pinctrl-imx.c           Laurent Pinchart 2013-02-16  154  static const struct pinctrl_ops imx_pctrl_ops = {
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02 @155  	.get_groups_count = pinctrl_generic_get_group_count,
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02 @156  	.get_group_name = pinctrl_generic_get_group_name,
e566fc11ea76ec drivers/pinctrl/freescale/pinctrl-imx.c Gary Bisson      2017-01-02 @157  	.get_group_pins = pinctrl_generic_get_group_pins,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  158  	.pin_dbg_show = imx_pin_dbg_show,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  159  	.dt_node_to_map = imx_dt_node_to_map,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  160  	.dt_free_map = imx_dt_free_map,
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  161  };
ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng     2012-04-27  162  

:::::: The code at line 41 was first introduced by commit
:::::: e566fc11ea76ec10a42fc92c5561ace4479770dd pinctrl: imx: use generic pinctrl helpers for managing groups

:::::: TO: Gary Bisson <gary.bisson@boundarydevices.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
