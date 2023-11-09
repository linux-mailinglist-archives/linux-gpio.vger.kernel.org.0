Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC717E6CD4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Nov 2023 16:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjKIPC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Nov 2023 10:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjKIPC4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Nov 2023 10:02:56 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83FB2D62
        for <linux-gpio@vger.kernel.org>; Thu,  9 Nov 2023 07:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699542174; x=1731078174;
  h=date:from:to:cc:subject:message-id;
  bh=F6tc5XhGKcbIgD9TQVGXUEoRJUxhUFocPHLFX1LPjwU=;
  b=mygSOhxPKV5uPjjRKcsi8sQF8tBqha+107k4mC0x1JXDwx4VnWiXdOp6
   QAqhiRNjjbvq42+zAjbeEpqS47ehGPWd72VV4TL8TDYYLiIj2AsB4Ucoi
   1GF7wRnIqpwTvFnLXWVEqFd2gufqZAqOeT0pfQpb9JDlDqu6a0E3p4b8i
   r4+balqzVcm2jqUvW7rCq+Gq5Kp0DOmv98Bq3agEcvh8ngKo0HNWLi7qD
   3cOS/f/5mq0zciJQHO80T7ktmBAhrLMnzuxT7q/aXZBQaq7O5vSaf5p3X
   QquxLvRi5Zuj7FSBWtEQ7Asd2Ktg2sZQD4BU+YYRiu6Uf00P+Vi2ah3DX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3030914"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3030914"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 07:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763426607"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="763426607"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Nov 2023 07:02:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r16YR-0008pX-1q;
        Thu, 09 Nov 2023 15:02:47 +0000
Date:   Thu, 09 Nov 2023 23:02:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/fix-mips-nand] BUILD SUCCESS
 d4c5bc8e0ff6796052b332a4813a6b23dfa12435
Message-ID: <202311092309.UYux5lMh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/fix-mips-nand
branch HEAD: d4c5bc8e0ff6796052b332a4813a6b23dfa12435  mtd: rawnand: gpio: Rename file

elapsed time: 1451m

configs tested: 197
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
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-001-20231109   gcc  
arc                   randconfig-002-20231108   gcc  
arc                   randconfig-002-20231109   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20231109   gcc  
arm                   randconfig-002-20231109   gcc  
arm                   randconfig-003-20231109   gcc  
arm                   randconfig-004-20231109   gcc  
arm                        shmobile_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                 randconfig-001-20231109   gcc  
arm64                 randconfig-002-20231109   gcc  
arm64                 randconfig-003-20231109   gcc  
arm64                 randconfig-004-20231109   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-001-20231109   gcc  
csky                  randconfig-002-20231108   gcc  
csky                  randconfig-002-20231109   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231109   gcc  
i386         buildonly-randconfig-002-20231109   gcc  
i386         buildonly-randconfig-003-20231109   gcc  
i386         buildonly-randconfig-004-20231109   gcc  
i386         buildonly-randconfig-005-20231109   gcc  
i386         buildonly-randconfig-006-20231109   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231109   gcc  
i386                  randconfig-002-20231109   gcc  
i386                  randconfig-003-20231109   gcc  
i386                  randconfig-004-20231109   gcc  
i386                  randconfig-005-20231109   gcc  
i386                  randconfig-006-20231109   gcc  
i386                  randconfig-011-20231109   gcc  
i386                  randconfig-012-20231109   gcc  
i386                  randconfig-013-20231109   gcc  
i386                  randconfig-014-20231109   gcc  
i386                  randconfig-015-20231109   gcc  
i386                  randconfig-016-20231109   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-001-20231109   gcc  
loongarch             randconfig-002-20231108   gcc  
loongarch             randconfig-002-20231109   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231109   gcc  
nios2                 randconfig-002-20231109   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231109   gcc  
parisc                randconfig-002-20231109   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20231109   gcc  
powerpc               randconfig-002-20231109   gcc  
powerpc               randconfig-003-20231109   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm8540_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc64             randconfig-001-20231109   gcc  
powerpc64             randconfig-002-20231109   gcc  
powerpc64             randconfig-003-20231109   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231109   gcc  
riscv                 randconfig-002-20231109   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231109   gcc  
s390                  randconfig-002-20231109   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20231109   gcc  
sh                    randconfig-002-20231109   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231109   gcc  
sparc                 randconfig-002-20231109   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231109   gcc  
sparc64               randconfig-002-20231109   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231109   gcc  
um                    randconfig-002-20231109   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231109   gcc  
x86_64       buildonly-randconfig-002-20231109   gcc  
x86_64       buildonly-randconfig-003-20231109   gcc  
x86_64       buildonly-randconfig-004-20231109   gcc  
x86_64       buildonly-randconfig-005-20231109   gcc  
x86_64       buildonly-randconfig-006-20231109   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231109   gcc  
x86_64                randconfig-002-20231109   gcc  
x86_64                randconfig-003-20231109   gcc  
x86_64                randconfig-004-20231109   gcc  
x86_64                randconfig-005-20231109   gcc  
x86_64                randconfig-006-20231109   gcc  
x86_64                randconfig-011-20231109   gcc  
x86_64                randconfig-012-20231109   gcc  
x86_64                randconfig-013-20231109   gcc  
x86_64                randconfig-014-20231109   gcc  
x86_64                randconfig-015-20231109   gcc  
x86_64                randconfig-016-20231109   gcc  
x86_64                randconfig-071-20231109   gcc  
x86_64                randconfig-072-20231109   gcc  
x86_64                randconfig-073-20231109   gcc  
x86_64                randconfig-074-20231109   gcc  
x86_64                randconfig-075-20231109   gcc  
x86_64                randconfig-076-20231109   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20231109   gcc  
xtensa                randconfig-002-20231109   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
