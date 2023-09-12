Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF0479C421
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 05:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237536AbjILD2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 23:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236412AbjILD1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 23:27:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463E77AB8
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694488575; x=1726024575;
  h=date:from:to:cc:subject:message-id;
  bh=cZJwrT96NSVWEXM4acfHfjLMmGyEBZa3UEnNXsmoKOo=;
  b=nphsrMLER7sNtKawzTG6V9WQzMgd26WHB8TjnECii65YXUMmlyzCneXL
   hb+3mgCz6KS5fY5IJsE83EGgFrfdd0PrAR4A/mdP05CfmM3oTVCcsO4uQ
   sVFIO08m+KB0jV6hyfqFtvRDyXMr0c8M2MgXfZQq5ebArNH7uxbM793eV
   x9L6ngjBAnlEj6Rk+Hnp35Yoyi51s6iTMUFRo05oPjZ2+roZZmAlGo2B4
   vHzBXQbfT2z9SYMO3+GOVjToXfJZhnSe5GPHOQo47RqD+sDjMG2Gxtu9a
   SGunu+/93SctjJdvGdp/EzfaXHYTHE/xo9tbkQT0shkajQMywUOA/XGJl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464632658"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="464632658"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 20:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="867199053"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="867199053"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Sep 2023 20:16:13 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qftso-0007Cx-3C;
        Tue, 12 Sep 2023 03:16:10 +0000
Date:   Tue, 12 Sep 2023 11:15:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-asoc-max] BUILD SUCCESS
 4b9c5533a1b89f833db2100124f210863b88cf26
Message-ID: <202309121131.bC7gRuvM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-asoc-max
branch HEAD: 4b9c5533a1b89f833db2100124f210863b88cf26  ASoC: max98927: Drop pointless includes

elapsed time: 888m

configs tested: 180
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
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r011-20230912   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20230912   clang
arm                  randconfig-r026-20230912   clang
arm                         s3c6400_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230912   clang
arm64                randconfig-r006-20230912   clang
arm64                randconfig-r016-20230912   gcc  
arm64                randconfig-r036-20230912   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon               randconfig-001-20230912   clang
hexagon               randconfig-002-20230912   clang
hexagon              randconfig-r004-20230912   clang
hexagon              randconfig-r026-20230912   clang
hexagon              randconfig-r032-20230912   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230912   clang
i386         buildonly-randconfig-002-20230912   clang
i386         buildonly-randconfig-003-20230912   clang
i386         buildonly-randconfig-004-20230912   clang
i386         buildonly-randconfig-005-20230912   clang
i386         buildonly-randconfig-006-20230912   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230912   clang
i386                  randconfig-002-20230912   clang
i386                  randconfig-003-20230912   clang
i386                  randconfig-004-20230912   clang
i386                  randconfig-005-20230912   clang
i386                  randconfig-006-20230912   clang
i386                  randconfig-011-20230912   gcc  
i386                  randconfig-012-20230912   gcc  
i386                  randconfig-013-20230912   gcc  
i386                  randconfig-014-20230912   gcc  
i386                  randconfig-015-20230912   gcc  
i386                  randconfig-016-20230912   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230912   gcc  
loongarch            randconfig-r015-20230912   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r013-20230912   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230912   clang
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
parisc               randconfig-r022-20230912   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                    amigaone_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                     ppa8548_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r001-20230912   clang
powerpc              randconfig-r005-20230912   clang
powerpc              randconfig-r023-20230912   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64            randconfig-r014-20230912   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20230912   clang
riscv                randconfig-r005-20230912   clang
riscv                randconfig-r035-20230912   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r031-20230912   clang
s390                 randconfig-r032-20230912   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r012-20230912   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
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
x86_64       buildonly-randconfig-001-20230912   clang
x86_64       buildonly-randconfig-002-20230912   clang
x86_64       buildonly-randconfig-003-20230912   clang
x86_64       buildonly-randconfig-004-20230912   clang
x86_64       buildonly-randconfig-005-20230912   clang
x86_64       buildonly-randconfig-006-20230912   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230912   gcc  
x86_64                randconfig-002-20230912   gcc  
x86_64                randconfig-003-20230912   gcc  
x86_64                randconfig-004-20230912   gcc  
x86_64                randconfig-005-20230912   gcc  
x86_64                randconfig-006-20230912   gcc  
x86_64                randconfig-011-20230912   clang
x86_64                randconfig-012-20230912   clang
x86_64                randconfig-013-20230912   clang
x86_64                randconfig-014-20230912   clang
x86_64                randconfig-015-20230912   clang
x86_64                randconfig-016-20230912   clang
x86_64                randconfig-071-20230912   clang
x86_64                randconfig-072-20230912   clang
x86_64                randconfig-073-20230912   clang
x86_64                randconfig-074-20230912   clang
x86_64                randconfig-075-20230912   clang
x86_64                randconfig-076-20230912   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r024-20230912   gcc  
xtensa               randconfig-r025-20230912   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
