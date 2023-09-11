Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A7F79C3C1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 05:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241434AbjILDKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 23:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241765AbjILDKl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 23:10:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3543157551
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694473911; x=1726009911;
  h=date:from:to:cc:subject:message-id;
  bh=l3EaZfbWLlIDD1jKtVREjWHp0UpW5O3DYnqHY3nWoJ4=;
  b=Z6k8Qw4PPfhw4ETP1t0BC1NZ2j3yhIqgtC33HQ7bhdU6vUPsXUtF+cRu
   WvYhBv33gm1fFwJnH5EpgTaMGwLHgLn/Uvml31ZqroS9ui8yceu3okP3z
   CPqrsgXJ81aXmfauKKAD7JOmmhofN8T5qPQHdxD/DufomjXFZFjpWZQ1Z
   PtP1P1+i9bWtams8gES1aSs3zgluHbQUkV7ZO5gCrsxQIu5FTFhTEWq+T
   v9u5T8TR6EGmdqZ+81JYanZfuN0cTXc5hattxXTLyOkO8IJtnFATttVMn
   36huoes/3vpwYMaKFyTRHFv6nB4OZKEk+I2FfiYXIdhKo7i+DmpwKhT92
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442233110"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="442233110"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 15:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074339619"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="1074339619"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Sep 2023 15:32:51 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfpSb-0006os-2J;
        Mon, 11 Sep 2023 22:32:49 +0000
Date:   Tue, 12 Sep 2023 06:32:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 4cdc5dbbc1df36c4d7c93c7c15dde88e997922c2
Message-ID: <202309120636.sajSeQss-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: 4cdc5dbbc1df36c4d7c93c7c15dde88e997922c2  eeprom: at24: Drop at24_get_chip_data()

elapsed time: 896m

configs tested: 261
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230911   gcc  
alpha                randconfig-r016-20230911   gcc  
alpha                randconfig-r023-20230911   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20230911   gcc  
arc                  randconfig-r012-20230911   gcc  
arc                  randconfig-r014-20230911   gcc  
arc                  randconfig-r015-20230911   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20230911   gcc  
arm                   randconfig-001-20230912   clang
arm                  randconfig-r014-20230911   gcc  
arm                         s3c6400_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230912   clang
arm64                randconfig-r006-20230912   clang
arm64                randconfig-r035-20230911   gcc  
arm64                randconfig-r036-20230912   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230911   gcc  
hexagon               randconfig-001-20230911   clang
hexagon               randconfig-001-20230912   clang
hexagon               randconfig-002-20230911   clang
hexagon               randconfig-002-20230912   clang
hexagon              randconfig-r004-20230912   clang
hexagon              randconfig-r016-20230911   clang
hexagon              randconfig-r023-20230911   clang
hexagon              randconfig-r024-20230911   clang
hexagon              randconfig-r026-20230911   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230911   gcc  
i386         buildonly-randconfig-001-20230912   clang
i386         buildonly-randconfig-002-20230911   gcc  
i386         buildonly-randconfig-002-20230912   clang
i386         buildonly-randconfig-003-20230911   gcc  
i386         buildonly-randconfig-003-20230912   clang
i386         buildonly-randconfig-004-20230911   gcc  
i386         buildonly-randconfig-004-20230912   clang
i386         buildonly-randconfig-005-20230911   gcc  
i386         buildonly-randconfig-005-20230912   clang
i386         buildonly-randconfig-006-20230911   gcc  
i386         buildonly-randconfig-006-20230912   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230911   gcc  
i386                  randconfig-002-20230911   gcc  
i386                  randconfig-003-20230911   gcc  
i386                  randconfig-004-20230911   gcc  
i386                  randconfig-005-20230911   gcc  
i386                  randconfig-006-20230911   gcc  
i386                  randconfig-011-20230911   clang
i386                  randconfig-012-20230911   clang
i386                  randconfig-013-20230911   clang
i386                  randconfig-014-20230911   clang
i386                  randconfig-015-20230911   clang
i386                  randconfig-016-20230911   clang
i386                 randconfig-r005-20230911   gcc  
i386                 randconfig-r012-20230911   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230911   gcc  
loongarch             randconfig-001-20230912   gcc  
loongarch            randconfig-r001-20230911   gcc  
loongarch            randconfig-r002-20230911   gcc  
loongarch            randconfig-r004-20230911   gcc  
loongarch            randconfig-r026-20230911   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r025-20230911   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                 randconfig-r013-20230911   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230911   gcc  
nios2                randconfig-r016-20230911   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r011-20230911   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230911   gcc  
parisc               randconfig-r022-20230911   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r001-20230912   clang
powerpc                     tqm8555_defconfig   gcc  
powerpc64            randconfig-r003-20230911   gcc  
powerpc64            randconfig-r022-20230911   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230911   gcc  
riscv                 randconfig-001-20230912   clang
riscv                randconfig-r003-20230911   gcc  
riscv                randconfig-r005-20230911   gcc  
riscv                randconfig-r005-20230912   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230911   clang
s390                 randconfig-r002-20230911   gcc  
s390                 randconfig-r031-20230911   gcc  
s390                 randconfig-r031-20230912   clang
s390                 randconfig-r032-20230911   gcc  
s390                 randconfig-r032-20230912   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r011-20230911   gcc  
sh                   randconfig-r015-20230911   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230911   gcc  
sparc                randconfig-r006-20230911   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r004-20230911   gcc  
sparc64              randconfig-r005-20230911   gcc  
sparc64              randconfig-r012-20230911   gcc  
sparc64              randconfig-r033-20230911   gcc  
sparc64              randconfig-r034-20230911   gcc  
sparc64              randconfig-r036-20230911   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r021-20230911   gcc  
um                   randconfig-r035-20230911   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230911   gcc  
x86_64       buildonly-randconfig-001-20230912   clang
x86_64       buildonly-randconfig-002-20230911   gcc  
x86_64       buildonly-randconfig-002-20230912   clang
x86_64       buildonly-randconfig-003-20230911   gcc  
x86_64       buildonly-randconfig-003-20230912   clang
x86_64       buildonly-randconfig-004-20230911   gcc  
x86_64       buildonly-randconfig-004-20230912   clang
x86_64       buildonly-randconfig-005-20230911   gcc  
x86_64       buildonly-randconfig-005-20230912   clang
x86_64       buildonly-randconfig-006-20230911   gcc  
x86_64       buildonly-randconfig-006-20230912   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230911   clang
x86_64                randconfig-001-20230912   gcc  
x86_64                randconfig-002-20230911   clang
x86_64                randconfig-002-20230912   gcc  
x86_64                randconfig-003-20230911   clang
x86_64                randconfig-003-20230912   gcc  
x86_64                randconfig-004-20230911   clang
x86_64                randconfig-004-20230912   gcc  
x86_64                randconfig-005-20230911   clang
x86_64                randconfig-005-20230912   gcc  
x86_64                randconfig-006-20230911   clang
x86_64                randconfig-006-20230912   gcc  
x86_64                randconfig-011-20230911   gcc  
x86_64                randconfig-011-20230912   clang
x86_64                randconfig-012-20230911   gcc  
x86_64                randconfig-012-20230912   clang
x86_64                randconfig-013-20230911   gcc  
x86_64                randconfig-013-20230912   clang
x86_64                randconfig-014-20230911   gcc  
x86_64                randconfig-014-20230912   clang
x86_64                randconfig-015-20230911   gcc  
x86_64                randconfig-015-20230912   clang
x86_64                randconfig-016-20230911   gcc  
x86_64                randconfig-016-20230912   clang
x86_64                randconfig-071-20230911   gcc  
x86_64                randconfig-071-20230912   clang
x86_64                randconfig-072-20230911   gcc  
x86_64                randconfig-072-20230912   clang
x86_64                randconfig-073-20230911   gcc  
x86_64                randconfig-073-20230912   clang
x86_64                randconfig-074-20230911   gcc  
x86_64                randconfig-074-20230912   clang
x86_64                randconfig-075-20230911   gcc  
x86_64                randconfig-075-20230912   clang
x86_64                randconfig-076-20230911   gcc  
x86_64                randconfig-076-20230912   clang
x86_64               randconfig-r002-20230911   gcc  
x86_64               randconfig-r006-20230911   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r001-20230911   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
