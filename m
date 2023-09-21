Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9587A9F60
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 22:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjIUUVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 16:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjIUUVR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 16:21:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C388551029
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 10:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695316533; x=1726852533;
  h=date:from:to:cc:subject:message-id;
  bh=rFVwf7n+fV8z3pwX7En7COQXktQPPNLenNfOXrgBuxk=;
  b=VlD//T4txBROQZheilvU9aFNSCDTC9Vtb0/518Xb+QmYZA9jVqmzrsa5
   vG4ugF1+SKW0bCboRHAsdiztd+eYmXBDfLQk14RBhKO/j2+D7vJxNZnef
   NEVXpMWfHgHpCR5Qfi9IQ9sfyWtgNGRl7NqeePxLDSBDYpG19y4ZyiKde
   hZVOBwWZz+x14fXrfoC8dryy1hE1ilSXQgVbpJnnIfprzsI09ALgpqqE/
   tkknuAlKfkybmhAY4VtYtAn/c4//kFn3L48Lf+36BNfhzVV7ZwP3W6y+G
   gAuxyFzmTJD+HByh1SU9Ite6qJ27dIZt6oeVFxvHxWEey9rFltAAhAR8i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444555201"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="444555201"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 01:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862370460"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="862370460"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2023 01:00:05 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qjEbQ-0009kZ-2D;
        Thu, 21 Sep 2023 08:00:01 +0000
Date:   Thu, 21 Sep 2023 15:59:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 b547b5e52a0587e6b25ea520bf2f9e03d00cbcb6
Message-ID: <202309211503.1LVEOHZA-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: b547b5e52a0587e6b25ea520bf2f9e03d00cbcb6  gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()

elapsed time: 1305m

configs tested: 184
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20230920   gcc  
arc                   randconfig-001-20230921   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                   randconfig-001-20230921   gcc  
arm                           stm32_defconfig   gcc  
arm                           u8500_defconfig   gcc  
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
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230921   gcc  
i386         buildonly-randconfig-002-20230921   gcc  
i386         buildonly-randconfig-003-20230921   gcc  
i386         buildonly-randconfig-004-20230921   gcc  
i386         buildonly-randconfig-005-20230921   gcc  
i386         buildonly-randconfig-006-20230920   gcc  
i386         buildonly-randconfig-006-20230921   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230921   gcc  
i386                  randconfig-002-20230921   gcc  
i386                  randconfig-003-20230921   gcc  
i386                  randconfig-004-20230921   gcc  
i386                  randconfig-005-20230920   gcc  
i386                  randconfig-005-20230921   gcc  
i386                  randconfig-006-20230920   gcc  
i386                  randconfig-006-20230921   gcc  
i386                  randconfig-011-20230921   gcc  
i386                  randconfig-012-20230920   gcc  
i386                  randconfig-012-20230921   gcc  
i386                  randconfig-013-20230921   gcc  
i386                  randconfig-014-20230921   gcc  
i386                  randconfig-015-20230921   gcc  
i386                  randconfig-016-20230921   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230920   gcc  
loongarch             randconfig-001-20230921   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                          rb532_defconfig   gcc  
mips                          rm200_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         alldefconfig   gcc  
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
powerpc                      ep88xc_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20230920   gcc  
riscv                 randconfig-001-20230921   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230920   gcc  
s390                  randconfig-001-20230921   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230921   gcc  
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
x86_64       buildonly-randconfig-001-20230921   gcc  
x86_64       buildonly-randconfig-002-20230921   gcc  
x86_64       buildonly-randconfig-003-20230921   gcc  
x86_64       buildonly-randconfig-004-20230921   gcc  
x86_64       buildonly-randconfig-005-20230921   gcc  
x86_64       buildonly-randconfig-006-20230920   gcc  
x86_64       buildonly-randconfig-006-20230921   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230921   gcc  
x86_64                randconfig-002-20230921   gcc  
x86_64                randconfig-003-20230921   gcc  
x86_64                randconfig-004-20230921   gcc  
x86_64                randconfig-005-20230921   gcc  
x86_64                randconfig-006-20230921   gcc  
x86_64                randconfig-011-20230920   gcc  
x86_64                randconfig-011-20230921   gcc  
x86_64                randconfig-012-20230920   gcc  
x86_64                randconfig-012-20230921   gcc  
x86_64                randconfig-013-20230920   gcc  
x86_64                randconfig-013-20230921   gcc  
x86_64                randconfig-014-20230920   gcc  
x86_64                randconfig-014-20230921   gcc  
x86_64                randconfig-015-20230920   gcc  
x86_64                randconfig-015-20230921   gcc  
x86_64                randconfig-016-20230920   gcc  
x86_64                randconfig-016-20230921   gcc  
x86_64                randconfig-071-20230921   gcc  
x86_64                randconfig-072-20230921   gcc  
x86_64                randconfig-073-20230921   gcc  
x86_64                randconfig-074-20230921   gcc  
x86_64                randconfig-075-20230921   gcc  
x86_64                randconfig-076-20230920   gcc  
x86_64                randconfig-076-20230921   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
