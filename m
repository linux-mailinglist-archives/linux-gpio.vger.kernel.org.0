Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B89D707EBA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 May 2023 13:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjERLD3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 May 2023 07:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjERLD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 May 2023 07:03:28 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F94910D8
        for <linux-gpio@vger.kernel.org>; Thu, 18 May 2023 04:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684407807; x=1715943807;
  h=date:from:to:cc:subject:message-id;
  bh=0JofkEcLoC2fWUXKxo9QscVysanO7qN58825iNdHIPo=;
  b=InYHVh8bW6nP0Ot21ALe+Livp1s1NeG2VuUECr0PgWpV5DqSrV/Plm9s
   eDSp4eRF9SSBVOvR4KeQAD1SgzDCZ+kyXKz93tB/c3zQR0Px3foPE9kbB
   /N/FuKJkXD8htOO0dxn0buT6432PrgdQAFc2BVBHKmcJoZc3AExByMq0k
   Xfouayz9TNDwIPKwsEG7jA6yl3WNhn9F+w8f2tXkrSSx7B/UOJ7LtT7tg
   yyXzq8lJZo5Yq95E8BjOYglgYaYq7HMMUIh0vxolr+KzskmpydC5F3bY6
   uVLmzoi/ZVsSctgtpYEBlssqlGPQfPtiW7T0eIDM5uLdDVMs10LM4hlM7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="352052632"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="352052632"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 04:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696256812"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="696256812"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 May 2023 04:03:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pzbPo-0009xs-2m;
        Thu, 18 May 2023 11:03:24 +0000
Date:   Thu, 18 May 2023 19:02:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4ca235d2898e7b809fab5fb2766a26b50acf05cf
Message-ID: <20230518110235.41wSv%lkp@intel.com>
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

tree/branch: INFO setup_repo_specs: /db/releases/20230517200055/lkp-src/repo/*/linusw-pinctrl
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4ca235d2898e7b809fab5fb2766a26b50acf05cf  Merge branch 'devel' into for-next

elapsed time: 735m

configs tested: 219
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230517   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230517   gcc  
alpha                randconfig-r015-20230517   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230517   gcc  
arc          buildonly-randconfig-r006-20230517   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230517   gcc  
arc                  randconfig-r022-20230517   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                            qcom_defconfig   gcc  
arm                  randconfig-r034-20230517   gcc  
arm                  randconfig-r036-20230517   gcc  
arm                  randconfig-r046-20230517   clang
arm                           sama5_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230517   clang
arm64                randconfig-r012-20230517   gcc  
arm64                randconfig-r014-20230517   gcc  
arm64                randconfig-r022-20230518   clang
arm64                randconfig-r023-20230517   gcc  
arm64                randconfig-r025-20230517   gcc  
csky         buildonly-randconfig-r005-20230517   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230517   gcc  
csky                 randconfig-r013-20230517   gcc  
hexagon              randconfig-r022-20230517   clang
hexagon              randconfig-r035-20230517   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230517   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a004   clang
i386                          randconfig-a006   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a014   gcc  
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230517   gcc  
ia64         buildonly-randconfig-r004-20230517   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230517   gcc  
ia64                 randconfig-r012-20230517   gcc  
ia64                 randconfig-r013-20230517   gcc  
ia64                 randconfig-r014-20230517   gcc  
ia64                 randconfig-r016-20230517   gcc  
ia64                 randconfig-r036-20230517   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230517   gcc  
loongarch            randconfig-r003-20230517   gcc  
loongarch            randconfig-r004-20230517   gcc  
loongarch            randconfig-r005-20230517   gcc  
loongarch            randconfig-r033-20230517   gcc  
loongarch            randconfig-r035-20230517   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r005-20230517   gcc  
m68k                 randconfig-r011-20230517   gcc  
m68k                 randconfig-r023-20230517   gcc  
m68k                 randconfig-r024-20230517   gcc  
m68k                 randconfig-r034-20230517   gcc  
microblaze   buildonly-randconfig-r002-20230517   gcc  
microblaze   buildonly-randconfig-r003-20230517   gcc  
microblaze           randconfig-r003-20230517   gcc  
microblaze           randconfig-r006-20230517   gcc  
microblaze           randconfig-r021-20230517   gcc  
microblaze           randconfig-r025-20230517   gcc  
microblaze           randconfig-r031-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips         buildonly-randconfig-r005-20230517   gcc  
mips                     decstation_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                 randconfig-r006-20230517   gcc  
mips                 randconfig-r015-20230517   clang
mips                 randconfig-r025-20230517   clang
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230517   gcc  
nios2                randconfig-r011-20230517   gcc  
nios2                randconfig-r025-20230517   gcc  
openrisc             randconfig-r001-20230517   gcc  
openrisc             randconfig-r002-20230517   gcc  
openrisc             randconfig-r003-20230517   gcc  
openrisc             randconfig-r013-20230517   gcc  
openrisc             randconfig-r035-20230517   gcc  
parisc                           alldefconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230517   gcc  
parisc               randconfig-r023-20230517   gcc  
parisc               randconfig-r026-20230517   gcc  
parisc               randconfig-r032-20230517   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc              randconfig-r011-20230517   gcc  
powerpc              randconfig-r014-20230517   gcc  
powerpc              randconfig-r016-20230517   gcc  
powerpc              randconfig-r025-20230518   clang
powerpc              randconfig-r026-20230517   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                      tqm8xx_defconfig   gcc  
powerpc                      walnut_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r011-20230517   gcc  
riscv                randconfig-r015-20230517   gcc  
riscv                randconfig-r024-20230517   gcc  
riscv                randconfig-r026-20230517   gcc  
riscv                randconfig-r032-20230517   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230517   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230517   clang
s390                 randconfig-r016-20230517   gcc  
s390                 randconfig-r021-20230517   gcc  
s390                 randconfig-r022-20230517   gcc  
s390                 randconfig-r026-20230517   gcc  
s390                 randconfig-r031-20230517   clang
s390                 randconfig-r032-20230517   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230517   gcc  
sh           buildonly-randconfig-r005-20230517   gcc  
sh           buildonly-randconfig-r006-20230517   gcc  
sh                        dreamcast_defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r002-20230517   gcc  
sh                   randconfig-r013-20230517   gcc  
sh                   randconfig-r022-20230517   gcc  
sh                   randconfig-r024-20230517   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230517   gcc  
sparc        buildonly-randconfig-r004-20230517   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230517   gcc  
sparc                randconfig-r006-20230517   gcc  
sparc                randconfig-r024-20230517   gcc  
sparc                randconfig-r033-20230517   gcc  
sparc64      buildonly-randconfig-r001-20230517   gcc  
sparc64      buildonly-randconfig-r004-20230517   gcc  
sparc64              randconfig-r005-20230517   gcc  
sparc64              randconfig-r015-20230517   gcc  
sparc64              randconfig-r033-20230517   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230517   gcc  
xtensa       buildonly-randconfig-r002-20230517   gcc  
xtensa       buildonly-randconfig-r003-20230517   gcc  
xtensa               randconfig-r002-20230517   gcc  
xtensa               randconfig-r004-20230517   gcc  
xtensa               randconfig-r006-20230517   gcc  
xtensa               randconfig-r021-20230517   gcc  
xtensa               randconfig-r034-20230517   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
