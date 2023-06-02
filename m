Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E51720AAA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 23:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235994AbjFBVAG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 17:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235923AbjFBVAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 17:00:05 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1B819B
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739603; x=1717275603;
  h=date:from:to:cc:subject:message-id;
  bh=JzVfCU+gbdOyFh3N6ZcT7RC5vmL5FzPpsje2+CTrBro=;
  b=IHxQh3p/R6gLmMTBTnvhDqlnOi2AO9Pwt4m9L2FoP2xF9dbHuc3qPUYX
   /V6ZkkpFKCFshR0gbsLKOkoTAjlLYORbkZ3REBZEOQoe/PGGRRonxV6KA
   fWTBmYJcMfqTJzJulkCd+o20F9KT5aA2xxoU4jU3qLA0LykBOf7fqexbP
   +1oJiT2IzbU6ZPpMZfhrscdQYS/u7Z7q4tdLZ5aCv47sYKsKB3Aw0xd8O
   kwyhsBr1jhorVZx1RXNEbqz2vwGZzrR+ZIXWwKfVHjjB58U3EWSbhTDlf
   duZdhhOtC9s0j6iQbF2BLM3bhCV0HNnsvW4pS+8UeW9ZuAlBX8xm9hVOc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="384252454"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="384252454"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 14:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="711099602"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="711099602"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2023 14:00:01 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q5BsP-0000xR-0q;
        Fri, 02 Jun 2023 21:00:01 +0000
Date:   Sat, 03 Jun 2023 04:59:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4ab0b8b357186731b3f3a09c12378460914fbb0f
Message-ID: <20230602205933.lItB1%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4ab0b8b357186731b3f3a09c12378460914fbb0f  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 210
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230531   gcc  
alpha        buildonly-randconfig-r005-20230531   gcc  
alpha        buildonly-randconfig-r006-20230531   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230531   gcc  
alpha                randconfig-r013-20230531   gcc  
alpha                randconfig-r031-20230531   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc          buildonly-randconfig-r005-20230531   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r003-20230531   gcc  
arc                  randconfig-r022-20230531   gcc  
arc                  randconfig-r043-20230531   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230531   gcc  
arm                                 defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                             mxs_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r016-20230601   clang
arm                  randconfig-r021-20230531   gcc  
arm                  randconfig-r022-20230531   gcc  
arm                  randconfig-r024-20230531   gcc  
arm                  randconfig-r046-20230531   gcc  
arm                             rpc_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230531   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230602   gcc  
arm64                randconfig-r012-20230602   clang
arm64                randconfig-r024-20230531   clang
arm64                randconfig-r025-20230531   clang
arm64                randconfig-r026-20230531   clang
arm64                randconfig-r034-20230602   gcc  
csky         buildonly-randconfig-r002-20230531   gcc  
csky         buildonly-randconfig-r003-20230531   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230531   gcc  
csky                 randconfig-r006-20230602   gcc  
csky                 randconfig-r012-20230601   gcc  
csky                 randconfig-r014-20230602   gcc  
csky                 randconfig-r023-20230531   gcc  
csky                 randconfig-r025-20230531   gcc  
csky                 randconfig-r035-20230531   gcc  
hexagon              randconfig-r031-20230531   clang
hexagon              randconfig-r036-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230531   gcc  
i386         buildonly-randconfig-r001-20230602   gcc  
i386         buildonly-randconfig-r002-20230531   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-r003-20230531   gcc  
i386                 randconfig-r004-20230531   gcc  
i386                 randconfig-r006-20230531   gcc  
ia64                          tiger_defconfig   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230602   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230531   gcc  
loongarch            randconfig-r033-20230602   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k         buildonly-randconfig-r004-20230531   gcc  
m68k         buildonly-randconfig-r006-20230531   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r002-20230531   gcc  
m68k                 randconfig-r011-20230602   gcc  
m68k                 randconfig-r021-20230531   gcc  
m68k                 randconfig-r031-20230531   gcc  
m68k                 randconfig-r034-20230531   gcc  
m68k                 randconfig-r036-20230531   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze           randconfig-r003-20230531   gcc  
microblaze           randconfig-r014-20230601   gcc  
microblaze           randconfig-r015-20230531   gcc  
microblaze           randconfig-r015-20230602   gcc  
microblaze           randconfig-r021-20230531   gcc  
microblaze           randconfig-r022-20230531   gcc  
microblaze           randconfig-r025-20230531   gcc  
microblaze           randconfig-r031-20230602   gcc  
microblaze           randconfig-r032-20230531   gcc  
microblaze           randconfig-r036-20230602   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230531   clang
mips                           ci20_defconfig   gcc  
mips                 randconfig-r013-20230602   gcc  
mips                          rb532_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2        buildonly-randconfig-r002-20230531   gcc  
nios2        buildonly-randconfig-r004-20230531   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230531   gcc  
nios2                randconfig-r012-20230531   gcc  
nios2                randconfig-r024-20230531   gcc  
nios2                randconfig-r026-20230531   gcc  
openrisc     buildonly-randconfig-r003-20230531   gcc  
openrisc             randconfig-r002-20230531   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230531   gcc  
parisc               randconfig-r006-20230531   gcc  
parisc               randconfig-r016-20230531   gcc  
parisc               randconfig-r023-20230531   gcc  
parisc               randconfig-r026-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r002-20230602   gcc  
powerpc              randconfig-r006-20230531   gcc  
powerpc              randconfig-r011-20230601   gcc  
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230531   clang
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230531   gcc  
riscv                randconfig-r033-20230531   gcc  
riscv                randconfig-r034-20230531   gcc  
riscv                randconfig-r036-20230531   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r016-20230602   clang
s390                 randconfig-r033-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r003-20230531   gcc  
sh                   randconfig-r005-20230602   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc        buildonly-randconfig-r002-20230602   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230531   gcc  
sparc                randconfig-r016-20230601   gcc  
sparc                randconfig-r035-20230602   gcc  
sparc64              randconfig-r002-20230531   gcc  
sparc64              randconfig-r013-20230601   gcc  
sparc64              randconfig-r025-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230531   gcc  
x86_64       buildonly-randconfig-r005-20230602   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-r004-20230531   gcc  
x86_64               randconfig-r032-20230602   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                              defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230531   gcc  
xtensa               randconfig-r023-20230531   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
