Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40A07AEFD5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 17:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbjIZPku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 11:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234874AbjIZPkr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 11:40:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A1911F
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695742839; x=1727278839;
  h=date:from:to:cc:subject:message-id;
  bh=oBDjm5zDXS0mWkuWlQOH6E2/iI1L9lfWpQlNArFXMPo=;
  b=muw0DoIeUjprzqWt5gZA5l9fxSPAgf75I7UsUKQSMxnveKE+JkkkgTmq
   nvRaWRWlcPBqVdVq9MBTJpvgjieHq8SngMzSDsj37XNBHq/23GzSCFaQ/
   ScsQzWMilJhXOZTDmW2JtaAz3KinbhmUV4sVeJqbv1SYoD2tR9zI64aXU
   Swg6P4SAvkkCom7iqGaceXvG3632ih2dyXgIDl/9tBWvo0UJDCFD0HJRg
   /AKz/u+p7ofxVGwEuY/vG+9kndS2ZsTgUqBUPUkx4Cjwn9wpQMcL2Q2DT
   ywanlX0fBr5myH9/Q7t8+wKX6SGY6CR+RU8T5lWxHGx+Dj14wSQ8InDkm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361846806"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361846806"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 08:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819065940"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="819065940"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 08:40:38 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlAAu-0002zp-14;
        Tue, 26 Sep 2023 15:40:36 +0000
Date:   Tue, 26 Sep 2023 23:39:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-amlogic-t7] BUILD SUCCESS
 9681df024c9af234a9b6c56dfa2af227aee3fa59
Message-ID: <202309262341.4ZLn7ZIj-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-amlogic-t7
branch HEAD: 9681df024c9af234a9b6c56dfa2af227aee3fa59  pinctrl: Add driver support for Amlogic T7 SoCs

elapsed time: 1478m

configs tested: 174
configs skipped: 2

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
arc                   randconfig-001-20230926   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                           omap1_defconfig   clang
arm                   randconfig-001-20230926   gcc  
arm                        spear6xx_defconfig   gcc  
arm                        vexpress_defconfig   clang
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
i386         buildonly-randconfig-001-20230926   gcc  
i386         buildonly-randconfig-002-20230926   gcc  
i386         buildonly-randconfig-003-20230926   gcc  
i386         buildonly-randconfig-004-20230926   gcc  
i386         buildonly-randconfig-005-20230926   gcc  
i386         buildonly-randconfig-006-20230926   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230926   gcc  
i386                  randconfig-002-20230926   gcc  
i386                  randconfig-003-20230926   gcc  
i386                  randconfig-004-20230926   gcc  
i386                  randconfig-005-20230926   gcc  
i386                  randconfig-006-20230926   gcc  
i386                  randconfig-011-20230926   gcc  
i386                  randconfig-012-20230926   gcc  
i386                  randconfig-013-20230926   gcc  
i386                  randconfig-014-20230926   gcc  
i386                  randconfig-015-20230926   gcc  
i386                  randconfig-016-20230926   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230926   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                        bcm63xx_defconfig   clang
mips                  cavium_octeon_defconfig   clang
mips                     cu1830-neo_defconfig   clang
mips                     loongson1b_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                           xway_defconfig   gcc  
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
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          allyesconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      chrp32_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230926   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230926   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230926   gcc  
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
x86_64       buildonly-randconfig-001-20230926   gcc  
x86_64       buildonly-randconfig-002-20230926   gcc  
x86_64       buildonly-randconfig-003-20230926   gcc  
x86_64       buildonly-randconfig-004-20230926   gcc  
x86_64       buildonly-randconfig-005-20230926   gcc  
x86_64       buildonly-randconfig-006-20230926   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230926   gcc  
x86_64                randconfig-002-20230926   gcc  
x86_64                randconfig-003-20230926   gcc  
x86_64                randconfig-004-20230926   gcc  
x86_64                randconfig-005-20230926   gcc  
x86_64                randconfig-006-20230926   gcc  
x86_64                randconfig-011-20230926   gcc  
x86_64                randconfig-012-20230926   gcc  
x86_64                randconfig-013-20230926   gcc  
x86_64                randconfig-014-20230926   gcc  
x86_64                randconfig-015-20230926   gcc  
x86_64                randconfig-016-20230926   gcc  
x86_64                randconfig-071-20230926   gcc  
x86_64                randconfig-072-20230926   gcc  
x86_64                randconfig-073-20230926   gcc  
x86_64                randconfig-074-20230926   gcc  
x86_64                randconfig-075-20230926   gcc  
x86_64                randconfig-076-20230926   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
