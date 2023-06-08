Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251F3727796
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jun 2023 08:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbjFHGqq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jun 2023 02:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234886AbjFHGqo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 02:46:44 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961202132
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jun 2023 23:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686206802; x=1717742802;
  h=date:from:to:cc:subject:message-id;
  bh=8TGlUhRVpEGx46ZT9Ps4zzdtybi/Ozfvgi6lcoL6wWA=;
  b=B+85T3eAiiF02ShCAuOnjbodrO8LOkcz0XigfaINzmp9dkDqvG34he/C
   0ql2C8huqcEMAyaAgXH64nK5wkCUurkeFU06MQu4aPV8Z461xdoe/snDT
   /Buy9rl103utqgOA2Gb5KQTZsSN887db7ah7kLn3I2LgvegzeNPo8bI+t
   5CfPaCe49axJQ0/kS2dntI3UYmb2BiQX2XFidvTqj7L+4TAc1JCZkoDPZ
   1O+P0o1pUprccxvpdggjG8crxoy0h+uYvm/g1RC0KmtFGBXKd2zIKRCNT
   me4G7spbRNTUVfZtAZvvUn0tiIv+qYnrJ9e/IpRI2J/U3s6VW79e1uaVJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="356079446"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="356079446"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 23:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="884071723"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="884071723"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2023 23:46:40 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q79Pr-0007U3-2h;
        Thu, 08 Jun 2023 06:46:39 +0000
Date:   Thu, 08 Jun 2023 14:46:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 d1f11f41eb746a33816695f1b6b6719826cc532c
Message-ID: <202306081406.cLfDT5dc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: d1f11f41eb746a33816695f1b6b6719826cc532c  MAINTAINERS: add Andy Shevchenko as reviewer for the GPIO subsystem

elapsed time: 1059m

configs tested: 203
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230607   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r036-20230607   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230607   gcc  
arc                  randconfig-r023-20230607   gcc  
arc                  randconfig-r024-20230607   gcc  
arc                  randconfig-r025-20230607   gcc  
arc                  randconfig-r043-20230607   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                  randconfig-r013-20230607   clang
arm                  randconfig-r021-20230607   clang
arm                  randconfig-r046-20230607   clang
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230607   clang
arm64                randconfig-r011-20230607   gcc  
arm64                randconfig-r023-20230607   gcc  
csky         buildonly-randconfig-r001-20230607   gcc  
csky         buildonly-randconfig-r006-20230607   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230607   gcc  
csky                 randconfig-r024-20230607   gcc  
csky                 randconfig-r035-20230607   gcc  
csky                 randconfig-r036-20230607   gcc  
hexagon              randconfig-r003-20230607   clang
hexagon              randconfig-r004-20230607   clang
hexagon              randconfig-r015-20230607   clang
hexagon              randconfig-r041-20230607   clang
hexagon              randconfig-r045-20230607   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230607   clang
i386                 randconfig-i002-20230607   clang
i386                 randconfig-i003-20230607   clang
i386                 randconfig-i004-20230607   clang
i386                 randconfig-i005-20230607   clang
i386                 randconfig-i006-20230607   clang
i386                 randconfig-i011-20230607   gcc  
i386                 randconfig-i012-20230607   gcc  
i386                 randconfig-i013-20230607   gcc  
i386                 randconfig-i014-20230607   gcc  
i386                 randconfig-i015-20230607   gcc  
i386                 randconfig-i016-20230607   gcc  
i386                 randconfig-i051-20230607   clang
i386                 randconfig-i052-20230607   clang
i386                 randconfig-i053-20230607   clang
i386                 randconfig-i054-20230607   clang
i386                 randconfig-i055-20230607   clang
i386                 randconfig-i056-20230607   clang
i386                 randconfig-i061-20230607   clang
i386                 randconfig-i062-20230607   clang
i386                 randconfig-i063-20230607   clang
i386                 randconfig-i064-20230607   clang
i386                 randconfig-i065-20230607   clang
i386                 randconfig-i066-20230607   clang
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230607   gcc  
loongarch    buildonly-randconfig-r005-20230607   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230607   gcc  
loongarch            randconfig-r013-20230607   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k         buildonly-randconfig-r001-20230607   gcc  
m68k         buildonly-randconfig-r003-20230607   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230607   gcc  
m68k                 randconfig-r025-20230607   gcc  
m68k                           sun3_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230607   gcc  
microblaze           randconfig-r002-20230607   gcc  
microblaze           randconfig-r012-20230607   gcc  
microblaze           randconfig-r021-20230607   gcc  
microblaze           randconfig-r023-20230607   gcc  
microblaze           randconfig-r034-20230607   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                       bmips_be_defconfig   gcc  
mips         buildonly-randconfig-r001-20230607   gcc  
mips                     decstation_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                 randconfig-r033-20230607   gcc  
mips                          rm200_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230607   gcc  
nios2                randconfig-r024-20230607   gcc  
openrisc     buildonly-randconfig-r003-20230607   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r001-20230607   gcc  
openrisc             randconfig-r006-20230607   gcc  
openrisc             randconfig-r025-20230607   gcc  
openrisc             randconfig-r031-20230607   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r025-20230607   gcc  
parisc               randconfig-r031-20230607   gcc  
parisc               randconfig-r035-20230607   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230607   gcc  
powerpc      buildonly-randconfig-r003-20230607   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                        icon_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r005-20230607   clang
powerpc              randconfig-r006-20230607   clang
powerpc              randconfig-r014-20230607   gcc  
powerpc              randconfig-r026-20230607   gcc  
powerpc                     tqm8540_defconfig   clang
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230607   gcc  
riscv                randconfig-r016-20230607   gcc  
riscv                randconfig-r022-20230607   gcc  
riscv                randconfig-r042-20230607   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230607   clang
s390                 randconfig-r044-20230607   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r024-20230607   gcc  
sh                   randconfig-r026-20230607   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r005-20230607   gcc  
sparc        buildonly-randconfig-r006-20230607   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r002-20230607   gcc  
sparc64      buildonly-randconfig-r003-20230607   gcc  
sparc64      buildonly-randconfig-r006-20230607   gcc  
sparc64              randconfig-r004-20230607   gcc  
sparc64              randconfig-r014-20230607   gcc  
sparc64              randconfig-r033-20230607   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230607   clang
x86_64               randconfig-a002-20230607   clang
x86_64               randconfig-a003-20230607   clang
x86_64               randconfig-a004-20230607   clang
x86_64               randconfig-a005-20230607   clang
x86_64               randconfig-a006-20230607   clang
x86_64               randconfig-a011-20230607   gcc  
x86_64               randconfig-a012-20230607   gcc  
x86_64               randconfig-a013-20230607   gcc  
x86_64               randconfig-a014-20230607   gcc  
x86_64               randconfig-a015-20230607   gcc  
x86_64               randconfig-a016-20230607   gcc  
x86_64               randconfig-k001-20230607   gcc  
x86_64               randconfig-r004-20230607   clang
x86_64               randconfig-r005-20230607   clang
x86_64               randconfig-r031-20230607   clang
x86_64               randconfig-x051-20230607   gcc  
x86_64               randconfig-x052-20230607   gcc  
x86_64               randconfig-x053-20230607   gcc  
x86_64               randconfig-x054-20230607   gcc  
x86_64               randconfig-x055-20230607   gcc  
x86_64               randconfig-x056-20230607   gcc  
x86_64               randconfig-x061-20230607   gcc  
x86_64               randconfig-x062-20230607   gcc  
x86_64               randconfig-x063-20230607   gcc  
x86_64               randconfig-x064-20230607   gcc  
x86_64               randconfig-x065-20230607   gcc  
x86_64               randconfig-x066-20230607   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230607   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230607   gcc  
xtensa               randconfig-r002-20230607   gcc  
xtensa               randconfig-r021-20230607   gcc  
xtensa               randconfig-r034-20230607   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
