Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7D078914E
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Aug 2023 00:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjHYV7w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 17:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjHYV72 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 17:59:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FAF26B0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 14:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693000766; x=1724536766;
  h=date:from:to:cc:subject:message-id;
  bh=BL+hH5NecfpiWxO0cETCtx5cP0SdqI6NVhZahd9+Blg=;
  b=QAYFLy0HQ0Z73PrX1Ht3NZsliQTlrNCFt9dVLOlLzY4Tb48J2kAy69+p
   qzjpxGNC0LvukGQVZYXiIoH5WkeoG2Hwpwn0B0PlWJmGhaa5CDALnKyUP
   jOc3vOMRyemfICduJfUZs2ZkFc/3FS9twstdQFI6MB7DewX/XbfjUKLb5
   sGHL+kgNEpDZpEyfFzJMly2wfDHW5V+IOg/ICnGkBlqF+lDdgG8Z7iFQC
   1w+6vc9Pkoz4K7CMuIWH/J+n4ltKW0ISkzeNXroHjh6i0BvLXnHQHqCdR
   2OPTWqkLaIK1hDONIEm/TNlhRc8CSonv+Ndp7CZlFU+Aw5Q3SFvdo+Epk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354337846"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="354337846"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 14:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911413196"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="911413196"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 14:59:24 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZeps-00042j-14;
        Fri, 25 Aug 2023 21:59:21 +0000
Date:   Sat, 26 Aug 2023 05:58:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 6e39c1ac688161b4db3617aabbca589b395242bc
Message-ID: <202308260547.pu8MXFGN-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 6e39c1ac688161b4db3617aabbca589b395242bc  gpio: sim: pass the GPIO device's software node to irq domain

elapsed time: 3025m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230824   gcc  
alpha                randconfig-r003-20230824   gcc  
alpha                randconfig-r014-20230824   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230824   gcc  
arc                  randconfig-r025-20230824   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                             mxs_defconfig   clang
arm                   randconfig-001-20230824   gcc  
arm                  randconfig-r023-20230824   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon               randconfig-001-20230824   clang
hexagon               randconfig-002-20230824   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230824   gcc  
i386         buildonly-randconfig-002-20230824   gcc  
i386         buildonly-randconfig-003-20230824   gcc  
i386         buildonly-randconfig-004-20230824   gcc  
i386         buildonly-randconfig-005-20230824   gcc  
i386         buildonly-randconfig-006-20230824   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230824   gcc  
i386                  randconfig-002-20230824   gcc  
i386                  randconfig-003-20230824   gcc  
i386                  randconfig-004-20230824   gcc  
i386                  randconfig-005-20230824   gcc  
i386                  randconfig-006-20230824   gcc  
i386                  randconfig-011-20230824   clang
i386                  randconfig-012-20230824   clang
i386                  randconfig-013-20230824   clang
i386                  randconfig-014-20230824   clang
i386                  randconfig-015-20230824   clang
i386                  randconfig-016-20230824   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230824   gcc  
loongarch            randconfig-r005-20230824   gcc  
loongarch            randconfig-r006-20230824   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r036-20230824   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r004-20230824   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                           ip28_defconfig   clang
mips                     loongson2k_defconfig   clang
mips                        qi_lb60_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r033-20230824   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230824   gcc  
parisc               randconfig-r032-20230824   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc64            randconfig-r015-20230824   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230824   gcc  
riscv                randconfig-r024-20230824   clang
riscv                randconfig-r035-20230824   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230824   clang
s390                 randconfig-r001-20230824   gcc  
s390                 randconfig-r022-20230824   clang
s390                 randconfig-r026-20230824   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230824   gcc  
sparc                randconfig-r016-20230824   gcc  
sparc                randconfig-r021-20230824   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r034-20230824   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230824   gcc  
x86_64       buildonly-randconfig-002-20230824   gcc  
x86_64       buildonly-randconfig-003-20230824   gcc  
x86_64       buildonly-randconfig-004-20230824   gcc  
x86_64       buildonly-randconfig-005-20230824   gcc  
x86_64       buildonly-randconfig-006-20230824   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-006-20230824   clang
x86_64                randconfig-011-20230824   gcc  
x86_64                randconfig-012-20230824   gcc  
x86_64                randconfig-013-20230824   gcc  
x86_64                randconfig-014-20230824   gcc  
x86_64                randconfig-015-20230824   gcc  
x86_64                randconfig-016-20230824   gcc  
x86_64                randconfig-075-20230824   gcc  
x86_64                randconfig-076-20230824   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r012-20230824   gcc  
xtensa               randconfig-r031-20230824   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
