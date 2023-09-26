Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22B57AF424
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 21:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235753AbjIZT3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 15:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235757AbjIZT3g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 15:29:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB960124
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695756569; x=1727292569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LpshlaAHgNigwwzwHKSBxlSsuYET/Tkzdn2EysROnd4=;
  b=fVireqgJGdMHDKILpd9TrYRVfGnz2AXUbzIT/TL9P9xOpCQGaMj+v9L2
   FyHRGrmtHg7lfJM4hAuQgDYmfj6aQGGr0embos78gahvOiGK57/JBAKd1
   2u2FvnR67Id2wLmzt1EriNRZ0zwnsBbYMx60GP0so+dfhKdYXxdSglm/i
   3l10vYCT+rPEF5qIz/V083+mU39p/Aoiy7LhSTAS7URJOQCyEVVC3J8dg
   VzsN169MqGqyka4TpiHEj2cNDPE7jrjcBcePZf43cN+Q71EbIZi3Gsbyr
   wm2Ryuk5cS4B86nZ1EZ71GWrFDAyVKjH8YbRxnczZ5Ffn5C9ZdAWRaY11
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378932139"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="378932139"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 12:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1079832580"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="1079832580"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2023 12:29:27 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlDkL-0003IF-1L;
        Tue, 26 Sep 2023 19:29:25 +0000
Date:   Wed, 27 Sep 2023 03:29:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 16/25]
 drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning:
 'rtd1315e_testmode_pins' defined but not used
Message-ID: <202309270313.mBEc9o1A-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   caaeb8c551123e26e86270c8dec99a78f1f6fe0f
commit: aa399e6c6b24c9cc8a8e4ccc205457205cd41491 [16/25] pinctrl: realtek: Add pinctrl driver for RTD1315E
config: arm-randconfig-001-20230926 (https://download.01.org/0day-ci/archive/20230927/202309270313.mBEc9o1A-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270313.mBEc9o1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270313.mBEc9o1A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_testmode_pins' defined but not used [-Wunused-const-variable=]
     231 |         static const unsigned int rtd1315e_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1315e.c:336:1: note: in expansion of macro 'DECLARE_RTD1315E_PIN'
     336 | DECLARE_RTD1315E_PIN(RTD1315E_ISO_TESTMODE, testmode);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_reset_n_pins' defined but not used [-Wunused-const-variable=]
     231 |         static const unsigned int rtd1315e_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1315e.c:335:1: note: in expansion of macro 'DECLARE_RTD1315E_PIN'
     335 | DECLARE_RTD1315E_PIN(RTD1315E_ISO_RESET_N, reset_n);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_boot_sel_pins' defined but not used [-Wunused-const-variable=]
     231 |         static const unsigned int rtd1315e_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1315e.c:334:1: note: in expansion of macro 'DECLARE_RTD1315E_PIN'
     334 | DECLARE_RTD1315E_PIN(RTD1315E_ISO_BOOT_SEL, boot_sel);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_wd_rset_pins' defined but not used [-Wunused-const-variable=]
     231 |         static const unsigned int rtd1315e_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1315e.c:333:1: note: in expansion of macro 'DECLARE_RTD1315E_PIN'
     333 | DECLARE_RTD1315E_PIN(RTD1315E_ISO_WD_RSET, wd_rset);
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_scan_switch_pins' defined but not used [-Wunused-const-variable=]
     231 |         static const unsigned int rtd1315e_## _name ##_pins[] = { _pin }
         |                                   ^~~~~~~~~
   drivers/pinctrl/realtek/pinctrl-rtd1315e.c:332:1: note: in expansion of macro 'DECLARE_RTD1315E_PIN'
     332 | DECLARE_RTD1315E_PIN(RTD1315E_ISO_SCAN_SWITCH, scan_switch);
         | ^~~~~~~~~~~~~~~~~~~~


vim +/rtd1315e_testmode_pins +231 drivers/pinctrl/realtek/pinctrl-rtd1315e.c

   229	
   230	#define DECLARE_RTD1315E_PIN(_pin, _name) \
 > 231		static const unsigned int rtd1315e_## _name ##_pins[] = { _pin }
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
