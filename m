Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12FE6DD80C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 12:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjDKKhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 06:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDKKhI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 06:37:08 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA63AE61
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681209427; x=1712745427;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AthE1W3jbEX2GMHC0Q1cNh+XL7Ac8ngPodjvx66Rty4=;
  b=CxOsu7w6G8eezwk5t0MmYaa9rQJtF03S9TFK8RclyOVOvmbpxNsb7XO4
   1fpvPWY2deIOhEg5ptIn8RSsICZKBzv+VO9UrkrmaPshaQNOITmMmBzC8
   QHU1GHi7vw2ByRAAHiPV7mkN7dNhB7jCnlUJw/M7GecH+9vAHu3kQg/96
   71iwHfGf32i83I4bAUZKHVfuIhabyWCh3f9HzPHJa/gwymaZj7LlkMdRR
   lIBlU4/OjGjqIftp6lG8PYe3cuBUPqmgYGBgWoR2huklfyGIB8bI3bVBd
   /JPzUFQRKwupArSUbdaZusl25QkW/Kv8cvQq4EdqYM8PKrb3Ry8G7a3cG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345369226"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="345369226"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 03:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018320963"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="1018320963"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 03:37:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pmBN3-000WDD-0Z;
        Tue, 11 Apr 2023 10:37:05 +0000
Date:   Tue, 11 Apr 2023 18:36:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 3478ce851cbb3e1d8cc1495ada570a365dd48e8a
Message-ID: <64353848.MPpIP8hDj7yrS8bo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 3478ce851cbb3e1d8cc1495ada570a365dd48e8a  Merge branch 'devel' into for-next

elapsed time: 720m

configs tested: 213
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230409   gcc  
alpha        buildonly-randconfig-r006-20230410   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230410   gcc  
alpha                randconfig-r013-20230409   gcc  
alpha                randconfig-r013-20230410   gcc  
alpha                randconfig-r016-20230409   gcc  
alpha                randconfig-r031-20230410   gcc  
alpha                randconfig-r034-20230409   gcc  
alpha                randconfig-r035-20230410   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230409   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230409   gcc  
arc                  randconfig-r022-20230409   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230409   clang
arm          buildonly-randconfig-r005-20230409   clang
arm                                 defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r032-20230410   gcc  
arm                  randconfig-r033-20230410   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230410   clang
arm64                randconfig-r012-20230410   gcc  
arm64                randconfig-r016-20230410   gcc  
arm64                randconfig-r021-20230411   clang
arm64                randconfig-r032-20230410   clang
csky         buildonly-randconfig-r003-20230409   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230410   gcc  
csky                 randconfig-r003-20230411   gcc  
csky                 randconfig-r015-20230409   gcc  
csky                 randconfig-r034-20230410   gcc  
hexagon              randconfig-r005-20230410   clang
hexagon              randconfig-r013-20230410   clang
hexagon              randconfig-r016-20230409   clang
hexagon              randconfig-r025-20230409   clang
hexagon              randconfig-r031-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230410   gcc  
ia64         buildonly-randconfig-r006-20230409   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230409   gcc  
ia64                 randconfig-r005-20230411   gcc  
ia64                 randconfig-r013-20230410   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230410   gcc  
loongarch    buildonly-randconfig-r006-20230409   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230409   gcc  
loongarch            randconfig-r006-20230411   gcc  
loongarch            randconfig-r011-20230410   gcc  
loongarch            randconfig-r012-20230409   gcc  
loongarch            randconfig-r015-20230410   gcc  
loongarch            randconfig-r021-20230409   gcc  
loongarch            randconfig-r024-20230409   gcc  
loongarch            randconfig-r035-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230409   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230409   gcc  
m68k                 randconfig-r013-20230409   gcc  
m68k                 randconfig-r014-20230409   gcc  
m68k                 randconfig-r015-20230409   gcc  
m68k                 randconfig-r016-20230410   gcc  
microblaze   buildonly-randconfig-r002-20230410   gcc  
microblaze           randconfig-r015-20230410   gcc  
microblaze           randconfig-r016-20230409   gcc  
microblaze           randconfig-r021-20230410   gcc  
microblaze           randconfig-r032-20230409   gcc  
microblaze           randconfig-r035-20230409   gcc  
microblaze           randconfig-r036-20230409   gcc  
microblaze           randconfig-r036-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                 randconfig-r006-20230410   gcc  
mips                 randconfig-r016-20230410   clang
mips                 randconfig-r031-20230410   gcc  
nios2        buildonly-randconfig-r001-20230409   gcc  
nios2        buildonly-randconfig-r004-20230409   gcc  
nios2        buildonly-randconfig-r006-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230411   gcc  
nios2                randconfig-r015-20230409   gcc  
nios2                randconfig-r024-20230410   gcc  
nios2                randconfig-r026-20230409   gcc  
openrisc     buildonly-randconfig-r001-20230410   gcc  
openrisc             randconfig-r003-20230409   gcc  
openrisc             randconfig-r014-20230410   gcc  
openrisc             randconfig-r022-20230410   gcc  
openrisc             randconfig-r023-20230409   gcc  
openrisc             randconfig-r026-20230410   gcc  
parisc       buildonly-randconfig-r001-20230410   gcc  
parisc       buildonly-randconfig-r003-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230410   gcc  
parisc               randconfig-r011-20230409   gcc  
parisc               randconfig-r014-20230410   gcc  
parisc               randconfig-r023-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r006-20230409   clang
powerpc              randconfig-r012-20230409   gcc  
powerpc              randconfig-r015-20230410   gcc  
powerpc              randconfig-r025-20230410   gcc  
powerpc              randconfig-r035-20230410   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230410   gcc  
riscv        buildonly-randconfig-r004-20230410   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230409   clang
riscv                randconfig-r003-20230410   clang
riscv                randconfig-r004-20230409   clang
riscv                randconfig-r012-20230410   gcc  
riscv                randconfig-r036-20230409   clang
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230410   gcc  
s390                 randconfig-r022-20230409   gcc  
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230410   gcc  
sh                   randconfig-r013-20230409   gcc  
sh                   randconfig-r026-20230409   gcc  
sh                          sdk7780_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc        buildonly-randconfig-r001-20230409   gcc  
sparc        buildonly-randconfig-r004-20230410   gcc  
sparc        buildonly-randconfig-r005-20230410   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230409   gcc  
sparc                randconfig-r026-20230410   gcc  
sparc                randconfig-r032-20230409   gcc  
sparc                randconfig-r033-20230409   gcc  
sparc                randconfig-r033-20230410   gcc  
sparc64      buildonly-randconfig-r003-20230410   gcc  
sparc64              randconfig-r001-20230409   gcc  
sparc64              randconfig-r004-20230410   gcc  
sparc64              randconfig-r011-20230409   gcc  
sparc64              randconfig-r021-20230410   gcc  
sparc64              randconfig-r025-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                        randconfig-k001   clang
x86_64               randconfig-r006-20230410   clang
x86_64               randconfig-r022-20230410   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230409   gcc  
xtensa       buildonly-randconfig-r004-20230409   gcc  
xtensa               randconfig-r004-20230411   gcc  
xtensa               randconfig-r005-20230410   gcc  
xtensa               randconfig-r034-20230410   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
