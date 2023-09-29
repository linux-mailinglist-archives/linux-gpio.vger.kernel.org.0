Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A197B2D72
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 10:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjI2IEg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 04:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjI2IEf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 04:04:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B375F1A7
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 01:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695974672; x=1727510672;
  h=date:from:to:cc:subject:message-id;
  bh=6HAq1LYFkQGtr6skRJfP1d2RKF5IxdCBZ/3NIwn9Kus=;
  b=bAmeaNB/x22BV3KDOwfz2g2uyROFUpVuhB1uBBYKX/Rur8ag+8wz1ZgK
   LzpZYwBoZMFAR3nvivIhJS/dphEJd5V3LeK159h6ySyfCf+EMnJAwyJZX
   OZH290WSmb6nROLwYqQ2dYo4WSwNo+7EI7LP1rvEcjHlxb3qDWLEq+fpC
   lTByIJ77n4SykhUnIbYg7vlwBtN+THPCReTdcREjbJq3KA2AGdqWQHGWY
   QN4ywIqOPvYRPrfzIiPzWipAjqcj2yC6HBjWwG3KFH9027/nf+fEZei0k
   aDv258P+72r6/+DIQaJ2ZgVRzzfMClCiAAeoFqpc974kOnhTD2jMk/Hwo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379519564"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="379519564"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 00:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815516595"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="815516595"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 00:14:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qm7hk-0002Zm-1s;
        Fri, 29 Sep 2023 07:14:28 +0000
Date:   Fri, 29 Sep 2023 15:13:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING
 e8b4ff6a856d02ee64a6023edf45e11827badeef
Message-ID: <202309291530.qDP0N7ET-lkp@intel.com>
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
branch HEAD: e8b4ff6a856d02ee64a6023edf45e11827badeef  pinctrl: uniphier: Annotate struct uniphier_pinctrl_reg_region with __counted_by

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
|-- arm-randconfig-002-20230929
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
|-- arm-randconfig-004-20230929
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
`-- arm64-randconfig-001-20230929
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

elapsed time: 1455m

configs tested: 167
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230928   gcc  
arc                   randconfig-001-20230929   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230929   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230928   gcc  
i386         buildonly-randconfig-001-20230929   gcc  
i386         buildonly-randconfig-002-20230928   gcc  
i386         buildonly-randconfig-002-20230929   gcc  
i386         buildonly-randconfig-003-20230928   gcc  
i386         buildonly-randconfig-003-20230929   gcc  
i386         buildonly-randconfig-004-20230929   gcc  
i386         buildonly-randconfig-005-20230929   gcc  
i386         buildonly-randconfig-006-20230929   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230929   gcc  
i386                  randconfig-002-20230929   gcc  
i386                  randconfig-003-20230929   gcc  
i386                  randconfig-004-20230929   gcc  
i386                  randconfig-005-20230929   gcc  
i386                  randconfig-006-20230929   gcc  
i386                  randconfig-011-20230928   gcc  
i386                  randconfig-011-20230929   gcc  
i386                  randconfig-012-20230928   gcc  
i386                  randconfig-012-20230929   gcc  
i386                  randconfig-013-20230928   gcc  
i386                  randconfig-013-20230929   gcc  
i386                  randconfig-014-20230928   gcc  
i386                  randconfig-014-20230929   gcc  
i386                  randconfig-015-20230928   gcc  
i386                  randconfig-015-20230929   gcc  
i386                  randconfig-016-20230928   gcc  
i386                  randconfig-016-20230929   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230928   gcc  
loongarch             randconfig-001-20230929   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                          rb532_defconfig   gcc  
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
powerpc                   currituck_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230928   gcc  
riscv                 randconfig-001-20230929   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230928   gcc  
s390                  randconfig-001-20230929   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230928   gcc  
sparc                 randconfig-001-20230929   gcc  
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
x86_64       buildonly-randconfig-001-20230928   gcc  
x86_64       buildonly-randconfig-001-20230929   gcc  
x86_64       buildonly-randconfig-002-20230928   gcc  
x86_64       buildonly-randconfig-002-20230929   gcc  
x86_64       buildonly-randconfig-003-20230928   gcc  
x86_64       buildonly-randconfig-003-20230929   gcc  
x86_64       buildonly-randconfig-004-20230928   gcc  
x86_64       buildonly-randconfig-004-20230929   gcc  
x86_64       buildonly-randconfig-005-20230928   gcc  
x86_64       buildonly-randconfig-005-20230929   gcc  
x86_64       buildonly-randconfig-006-20230928   gcc  
x86_64       buildonly-randconfig-006-20230929   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230929   gcc  
x86_64                randconfig-002-20230929   gcc  
x86_64                randconfig-003-20230929   gcc  
x86_64                randconfig-004-20230929   gcc  
x86_64                randconfig-005-20230929   gcc  
x86_64                randconfig-006-20230929   gcc  
x86_64                randconfig-011-20230929   gcc  
x86_64                randconfig-012-20230929   gcc  
x86_64                randconfig-013-20230929   gcc  
x86_64                randconfig-014-20230929   gcc  
x86_64                randconfig-015-20230929   gcc  
x86_64                randconfig-016-20230929   gcc  
x86_64                randconfig-071-20230929   gcc  
x86_64                randconfig-072-20230929   gcc  
x86_64                randconfig-073-20230929   gcc  
x86_64                randconfig-074-20230929   gcc  
x86_64                randconfig-075-20230929   gcc  
x86_64                randconfig-076-20230929   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
