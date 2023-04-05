Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897866D72AC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Apr 2023 05:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbjDEDN7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 23:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236725AbjDEDN7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 23:13:59 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA15C30EF
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 20:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680664437; x=1712200437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w40ZcO4BpzACfS1m0Ow24oqd23akKQcKnR9wER2HjoM=;
  b=Qmiw+k5ELsU1BKSKu2C9w7gHZv1BH+F7sO+eh9r0Q/ZRqXxqMSBVgfO5
   nyBMoqwkP08B7lXOf0K/w4U4UuiDENBDnlVpi73J0cG+FWzOpXQgyO2AR
   mHwBtK8XXOGNjby0Sn/S4XXvlqPNEq3/LIBR1A6Luf4ust/o3f8pbJxak
   3m6EW9CBx3VbLCsdL3MWVDLEsmJRgRvCPOVQ+ZL6RtP2Jod+p2QQz1fVn
   AAVXOsRP287h5Haw1fuiCQX2EbOYG0Iclq7QQta+dW1VQpVInNsGqD6gP
   diAELKOGA+LpLFhptoivI7V5tRQeDgBKdDlLIKWAql1URHGobexkKPCtv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="326392173"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="326392173"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 20:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686594931"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="686594931"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Apr 2023 20:13:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pjtat-000QEQ-0C;
        Wed, 05 Apr 2023 03:13:55 +0000
Date:   Wed, 05 Apr 2023 11:13:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/immutable-irqchips] BUILD SUCCESS
 1ff75a30d9fafb2fe85aa3c24a52b20c79cec876
Message-ID: <642ce755.C8DcbcqaYr32To8X%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/immutable-irqchips
branch HEAD: 1ff75a30d9fafb2fe85aa3c24a52b20c79cec876  pinctrl: sx150x: Convert to immutable irq_chip

elapsed time: 722m

configs tested: 287
configs skipped: 23

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230403   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230403   gcc  
alpha                randconfig-r015-20230403   gcc  
alpha                randconfig-r016-20230403   gcc  
alpha                randconfig-r021-20230403   gcc  
alpha                randconfig-r023-20230403   gcc  
alpha                randconfig-r024-20230403   gcc  
alpha                randconfig-r025-20230403   gcc  
alpha                randconfig-r026-20230403   gcc  
alpha                randconfig-r034-20230403   gcc  
alpha                randconfig-r036-20230403   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230403   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230403   gcc  
arc                  randconfig-r011-20230403   gcc  
arc                  randconfig-r013-20230403   gcc  
arc                  randconfig-r016-20230403   gcc  
arc                  randconfig-r021-20230403   gcc  
arc                  randconfig-r022-20230403   gcc  
arc                  randconfig-r025-20230403   gcc  
arc                  randconfig-r031-20230404   gcc  
arc                  randconfig-r032-20230403   gcc  
arc                  randconfig-r032-20230404   gcc  
arc                  randconfig-r033-20230403   gcc  
arc                  randconfig-r034-20230403   gcc  
arc                  randconfig-r034-20230404   gcc  
arc                  randconfig-r036-20230404   gcc  
arc                  randconfig-r043-20230403   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230403   clang
arm                                 defconfig   gcc  
arm                  randconfig-r033-20230403   gcc  
arm                  randconfig-r034-20230403   gcc  
arm                  randconfig-r046-20230403   clang
arm                        realview_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                       spear13xx_defconfig   clang
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230404   gcc  
arm64        buildonly-randconfig-r004-20230403   clang
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230403   clang
arm64                randconfig-r012-20230403   gcc  
arm64                randconfig-r015-20230403   gcc  
arm64                randconfig-r024-20230403   gcc  
arm64                randconfig-r026-20230403   gcc  
csky         buildonly-randconfig-r002-20230403   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r021-20230403   gcc  
csky                 randconfig-r021-20230404   gcc  
csky                 randconfig-r031-20230403   gcc  
csky                 randconfig-r034-20230403   gcc  
hexagon      buildonly-randconfig-r001-20230403   clang
hexagon      buildonly-randconfig-r006-20230403   clang
hexagon      buildonly-randconfig-r006-20230404   clang
hexagon              randconfig-r005-20230403   clang
hexagon              randconfig-r006-20230403   clang
hexagon              randconfig-r024-20230403   clang
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r045-20230403   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r002-20230403   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                          randconfig-a016   gcc  
i386                 randconfig-r014-20230403   gcc  
i386                 randconfig-r015-20230403   gcc  
i386                 randconfig-r021-20230403   gcc  
i386                 randconfig-r022-20230403   gcc  
i386                 randconfig-r023-20230403   gcc  
i386                 randconfig-r026-20230403   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230403   gcc  
ia64         buildonly-randconfig-r002-20230403   gcc  
ia64         buildonly-randconfig-r004-20230403   gcc  
ia64         buildonly-randconfig-r006-20230403   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230403   gcc  
ia64                 randconfig-r022-20230403   gcc  
ia64                 randconfig-r023-20230403   gcc  
ia64                 randconfig-r026-20230403   gcc  
ia64                 randconfig-r026-20230404   gcc  
ia64                 randconfig-r033-20230404   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r013-20230403   gcc  
loongarch            randconfig-r021-20230403   gcc  
loongarch            randconfig-r022-20230403   gcc  
loongarch            randconfig-r025-20230403   gcc  
loongarch            randconfig-r035-20230403   gcc  
loongarch            randconfig-r035-20230404   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230403   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r012-20230403   gcc  
m68k                 randconfig-r016-20230403   gcc  
m68k                 randconfig-r023-20230403   gcc  
m68k                 randconfig-r024-20230403   gcc  
m68k                 randconfig-r032-20230403   gcc  
m68k                 randconfig-r033-20230403   gcc  
m68k                 randconfig-r033-20230404   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230404   gcc  
microblaze   buildonly-randconfig-r005-20230403   gcc  
microblaze           randconfig-r002-20230403   gcc  
microblaze           randconfig-r004-20230403   gcc  
microblaze           randconfig-r011-20230403   gcc  
microblaze           randconfig-r023-20230403   gcc  
microblaze           randconfig-r024-20230403   gcc  
microblaze           randconfig-r031-20230403   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230403   gcc  
mips         buildonly-randconfig-r005-20230403   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip28_defconfig   clang
mips                 randconfig-r004-20230403   gcc  
mips                 randconfig-r021-20230403   clang
mips                 randconfig-r024-20230403   clang
mips                 randconfig-r034-20230403   gcc  
mips                 randconfig-r035-20230403   gcc  
mips                 randconfig-r036-20230403   gcc  
nios2        buildonly-randconfig-r004-20230403   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230403   gcc  
nios2                randconfig-r022-20230403   gcc  
nios2                randconfig-r023-20230403   gcc  
nios2                randconfig-r024-20230403   gcc  
nios2                randconfig-r032-20230403   gcc  
nios2                randconfig-r033-20230403   gcc  
nios2                randconfig-r034-20230403   gcc  
nios2                randconfig-r035-20230403   gcc  
openrisc                         alldefconfig   gcc  
openrisc     buildonly-randconfig-r003-20230403   gcc  
openrisc     buildonly-randconfig-r006-20230403   gcc  
openrisc             randconfig-r006-20230403   gcc  
openrisc             randconfig-r011-20230403   gcc  
openrisc             randconfig-r013-20230403   gcc  
openrisc             randconfig-r016-20230403   gcc  
openrisc             randconfig-r022-20230403   gcc  
openrisc             randconfig-r035-20230403   gcc  
openrisc                       virt_defconfig   gcc  
parisc       buildonly-randconfig-r003-20230403   gcc  
parisc       buildonly-randconfig-r005-20230403   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230403   gcc  
parisc               randconfig-r013-20230403   gcc  
parisc               randconfig-r014-20230403   gcc  
parisc               randconfig-r022-20230403   gcc  
parisc               randconfig-r025-20230403   gcc  
parisc               randconfig-r035-20230403   gcc  
parisc               randconfig-r036-20230403   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230404   clang
powerpc                    gamecube_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r001-20230403   clang
powerpc              randconfig-r003-20230403   clang
powerpc              randconfig-r005-20230403   clang
powerpc              randconfig-r013-20230403   gcc  
powerpc              randconfig-r014-20230403   gcc  
powerpc              randconfig-r025-20230403   gcc  
powerpc              randconfig-r034-20230403   clang
powerpc              randconfig-r035-20230403   clang
powerpc              randconfig-r036-20230403   clang
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230403   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r002-20230403   clang
riscv                randconfig-r014-20230403   gcc  
riscv                randconfig-r031-20230403   clang
riscv                randconfig-r032-20230404   gcc  
riscv                randconfig-r042-20230403   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230403   clang
s390                 randconfig-r006-20230403   clang
s390                 randconfig-r012-20230403   gcc  
s390                 randconfig-r031-20230404   gcc  
s390                 randconfig-r034-20230404   gcc  
s390                 randconfig-r044-20230403   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230403   gcc  
sh           buildonly-randconfig-r005-20230403   gcc  
sh                               j2_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                   randconfig-r011-20230403   gcc  
sh                   randconfig-r034-20230403   gcc  
sh                   randconfig-r036-20230403   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc        buildonly-randconfig-r001-20230403   gcc  
sparc        buildonly-randconfig-r006-20230403   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230403   gcc  
sparc                randconfig-r022-20230404   gcc  
sparc                randconfig-r025-20230403   gcc  
sparc                randconfig-r031-20230403   gcc  
sparc                randconfig-r032-20230403   gcc  
sparc                randconfig-r035-20230404   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64      buildonly-randconfig-r006-20230403   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r005-20230403   gcc  
sparc64              randconfig-r014-20230403   gcc  
sparc64              randconfig-r021-20230403   gcc  
sparc64              randconfig-r022-20230403   gcc  
sparc64              randconfig-r024-20230403   gcc  
sparc64              randconfig-r025-20230403   gcc  
sparc64              randconfig-r026-20230403   gcc  
sparc64              randconfig-r031-20230403   gcc  
sparc64              randconfig-r033-20230403   gcc  
sparc64              randconfig-r034-20230404   gcc  
sparc64              randconfig-r035-20230404   gcc  
sparc64              randconfig-r036-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230403   clang
x86_64       buildonly-randconfig-r005-20230403   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64               randconfig-r012-20230403   gcc  
x86_64               randconfig-r014-20230403   gcc  
x86_64               randconfig-r023-20230403   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230403   gcc  
xtensa       buildonly-randconfig-r003-20230403   gcc  
xtensa       buildonly-randconfig-r004-20230403   gcc  
xtensa               randconfig-r012-20230403   gcc  
xtensa               randconfig-r021-20230403   gcc  
xtensa               randconfig-r022-20230403   gcc  
xtensa               randconfig-r023-20230403   gcc  
xtensa               randconfig-r024-20230404   gcc  
xtensa               randconfig-r026-20230403   gcc  
xtensa               randconfig-r031-20230403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
