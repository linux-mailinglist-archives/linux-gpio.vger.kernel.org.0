Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9954F7B5E6F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 03:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjJCBFT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 21:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbjJCBFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 21:05:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BE2B7
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 18:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696295115; x=1727831115;
  h=date:from:to:cc:subject:message-id;
  bh=zV1KyDP9mywyeGGppDr6FFPcV3k2H0bGID5Qxd4blEk=;
  b=ahAsAIu4Kf8g5JIiZNoh/G7yWt5nrm+MNA6d7Alblup1aoZDRHTVTfbi
   u6MRQngQ+okPdGVCcTZ5ujcHlc65VKkWK/Npr2MKUh5a9lDjEeeh+Ew5j
   ySc9VowQBZeuCpL1/XGPGpKEf9bQIJJ2QwIKV24D8z6BCx/KR6wP+kD1H
   80BVM+M8z9lungWAW8k1ss+WgaZ22DdpF7JNGviRWcNF9m1qxbd2izs0H
   G7OzExKTnkdMFf2ez4tsFp7KrzWDvPhcb6jBpo6Fbyg9LIuxfbx7fMD9X
   BjNC7XfLEsxswZuT6Q9Ib5MmfxM5zJm1+okQkXT3jbnST9vlVjdEfWLHf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381653448"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381653448"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 18:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="785930263"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="785930263"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Oct 2023 18:05:07 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qnTqU-0006bV-0f;
        Tue, 03 Oct 2023 01:05:06 +0000
Date:   Tue, 03 Oct 2023 09:04:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING
 1c0b3cbe7fd98f54fb447e74119216f550a045b9
Message-ID: <202310030901.NDfqDTJW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1c0b3cbe7fd98f54fb447e74119216f550a045b9  Merge tag 'renesas-pinctrl-for-v6.7-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202309270234.aJGlDE0P-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309270313.mBEc9o1A-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309270448.7Aen3Sgx-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/pinctrl/realtek/pinctrl-rtd.c:180:29: warning: '%s' directive argument is null [-Wformat-overflow=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_boot_sel_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_reset_n_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_scan_switch_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_testmode_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_wd_rset_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_boot_sel_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_reset_n_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_scan_switch_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_testmode_pins' defined but not used [-Wunused-const-variable=]
drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_wd_rset_pins' defined but not used [-Wunused-const-variable=]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   |-- drivers-pinctrl-realtek-pinctrl-rtd.c:warning:s-directive-argument-is-null
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm-allyesconfig
|   |-- drivers-pinctrl-realtek-pinctrl-rtd.c:warning:s-directive-argument-is-null
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm-randconfig-004-20231002
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm64-allmodconfig
|   |-- drivers-pinctrl-realtek-pinctrl-rtd.c:warning:s-directive-argument-is-null
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-pinctrl-realtek-pinctrl-rtd.c:warning:s-directive-argument-is-null
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm64-defconfig
|   |-- drivers-pinctrl-realtek-pinctrl-rtd.c:warning:s-directive-argument-is-null
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm64-randconfig-001-20231002
|   |-- drivers-pinctrl-realtek-pinctrl-rtd.c:warning:s-directive-argument-is-null
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm64-randconfig-002-20231002
|   |-- drivers-pinctrl-realtek-pinctrl-rtd.c:warning:s-directive-argument-is-null
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
|-- arm64-randconfig-003-20231002
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
|   |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
|   `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used
`-- arm64-randconfig-004-20231002
    |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_boot_sel_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_reset_n_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_scan_switch_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_testmode_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1315e.c:warning:rtd1315e_wd_rset_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_boot_sel_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_reset_n_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_scan_switch_pins-defined-but-not-used
    |-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_testmode_pins-defined-but-not-used
    `-- drivers-pinctrl-realtek-pinctrl-rtd1319d.c:warning:rtd1319d_wd_rset_pins-defined-but-not-used

elapsed time: 1020m

configs tested: 151
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20231002   gcc  
arc                   randconfig-001-20231003   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20231002   gcc  
arm                   randconfig-001-20231003   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231002   gcc  
i386         buildonly-randconfig-001-20231003   gcc  
i386         buildonly-randconfig-002-20231002   gcc  
i386         buildonly-randconfig-002-20231003   gcc  
i386         buildonly-randconfig-003-20231002   gcc  
i386         buildonly-randconfig-003-20231003   gcc  
i386         buildonly-randconfig-004-20231002   gcc  
i386         buildonly-randconfig-004-20231003   gcc  
i386         buildonly-randconfig-005-20231002   gcc  
i386         buildonly-randconfig-005-20231003   gcc  
i386         buildonly-randconfig-006-20231002   gcc  
i386         buildonly-randconfig-006-20231003   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231002   gcc  
i386                  randconfig-001-20231003   gcc  
i386                  randconfig-002-20231002   gcc  
i386                  randconfig-002-20231003   gcc  
i386                  randconfig-003-20231002   gcc  
i386                  randconfig-003-20231003   gcc  
i386                  randconfig-004-20231002   gcc  
i386                  randconfig-004-20231003   gcc  
i386                  randconfig-005-20231002   gcc  
i386                  randconfig-005-20231003   gcc  
i386                  randconfig-006-20231002   gcc  
i386                  randconfig-006-20231003   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231002   gcc  
loongarch             randconfig-001-20231003   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231002   gcc  
x86_64                randconfig-001-20231003   gcc  
x86_64                randconfig-002-20231002   gcc  
x86_64                randconfig-002-20231003   gcc  
x86_64                randconfig-003-20231002   gcc  
x86_64                randconfig-003-20231003   gcc  
x86_64                randconfig-004-20231002   gcc  
x86_64                randconfig-004-20231003   gcc  
x86_64                randconfig-005-20231002   gcc  
x86_64                randconfig-005-20231003   gcc  
x86_64                randconfig-006-20231002   gcc  
x86_64                randconfig-006-20231003   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
