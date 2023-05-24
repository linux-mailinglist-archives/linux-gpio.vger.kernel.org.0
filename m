Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3725370EC6D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 06:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjEXERu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 00:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbjEXERt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 00:17:49 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12A7FC
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 21:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684901867; x=1716437867;
  h=date:from:to:cc:subject:message-id;
  bh=SdK678skThTonE4bLp8hoEhy6hefrwxOxCluYyYrdyA=;
  b=km/gZc1L7oIXonyLR8uAawiriBcT6uhKcBYQh6Nl7cq5LXKjuY9GJPzz
   DC1LgV/qZF8q0gN604hXC0Pwx7WsNLIp5wk4FboRh2VBXXHRARRsr0EJ7
   CLxk5JWP9tpQMfb4TaLIOMHAH9dPPaW68mEso3q69tKvp/mRp3519IuMo
   3lKZgp2J4LZLpPUKdbQbmETn2rEnZXfxmcMy4nguVpkhebrCj1yVYR0jJ
   L/Ixh8mVNgp5g70KQ6I9bYjxKuuSff0uOn78FHbRJREK5O3n2eq6AhMkp
   T9QuWd8rYIgo7CPqkjiHMHina7loqiCLXjOt1t1WxC7DLeUHXhe+AwhId
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="439796899"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="439796899"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 21:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816410294"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="816410294"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 May 2023 21:17:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1fwX-000ENt-0h;
        Wed, 24 May 2023 04:17:45 +0000
Date:   Wed, 24 May 2023 12:17:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 3002b8642f016d7fe3ff56240dacea1075f6b877
Message-ID: <20230524041732.ijxEa%lkp@intel.com>
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

tree/branch: INFO setup_repo_specs: /db/releases/20230524121217/lkp-src/repo/*/brgl
https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 3002b8642f016d7fe3ff56240dacea1075f6b877  gpio-f7188x: fix chip name and pin count on Nuvoton chip

elapsed time: 946m

configs tested: 219
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r006-20230521   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230522   gcc  
alpha                randconfig-r026-20230522   gcc  
alpha                randconfig-r035-20230521   gcc  
alpha                randconfig-r036-20230522   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230522   gcc  
arc          buildonly-randconfig-r003-20230522   gcc  
arc          buildonly-randconfig-r004-20230522   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230522   gcc  
arc                  randconfig-r014-20230521   gcc  
arc                  randconfig-r025-20230522   gcc  
arc                  randconfig-r034-20230522   gcc  
arc                  randconfig-r036-20230521   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                  randconfig-r014-20230522   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230522   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r004-20230521   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230521   gcc  
csky                 randconfig-r022-20230522   gcc  
csky                 randconfig-r026-20230521   gcc  
csky                 randconfig-r035-20230521   gcc  
hexagon              randconfig-r032-20230521   clang
hexagon              randconfig-r035-20230522   clang
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-i051-20230523   clang
i386                 randconfig-i052-20230523   clang
i386                 randconfig-i053-20230523   clang
i386                 randconfig-i054-20230523   clang
i386                 randconfig-i055-20230523   clang
i386                 randconfig-i056-20230523   clang
i386                 randconfig-i061-20230523   clang
i386                 randconfig-i062-20230523   clang
i386                 randconfig-i063-20230523   clang
i386                 randconfig-i064-20230523   clang
i386                 randconfig-i065-20230523   clang
i386                 randconfig-i066-20230523   clang
i386                 randconfig-r016-20230522   clang
i386                 randconfig-r036-20230522   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230522   gcc  
ia64                 randconfig-r003-20230522   gcc  
ia64                 randconfig-r013-20230522   gcc  
ia64                 randconfig-r021-20230522   gcc  
ia64                 randconfig-r023-20230521   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230522   gcc  
loongarch            randconfig-r012-20230521   gcc  
loongarch            randconfig-r014-20230521   gcc  
loongarch            randconfig-r022-20230521   gcc  
loongarch            randconfig-r025-20230521   gcc  
loongarch            randconfig-r034-20230521   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                 randconfig-r003-20230521   gcc  
m68k                 randconfig-r004-20230521   gcc  
m68k                 randconfig-r022-20230521   gcc  
m68k                 randconfig-r024-20230522   gcc  
microblaze   buildonly-randconfig-r006-20230522   gcc  
microblaze           randconfig-r001-20230521   gcc  
microblaze           randconfig-r005-20230521   gcc  
microblaze           randconfig-r006-20230521   gcc  
microblaze           randconfig-r016-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                 randconfig-r004-20230521   gcc  
mips                 randconfig-r036-20230521   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230522   gcc  
nios2                randconfig-r006-20230522   gcc  
nios2                randconfig-r025-20230521   gcc  
nios2                randconfig-r031-20230521   gcc  
openrisc     buildonly-randconfig-r002-20230521   gcc  
openrisc             randconfig-r002-20230522   gcc  
openrisc             randconfig-r014-20230522   gcc  
openrisc             randconfig-r015-20230522   gcc  
openrisc             randconfig-r026-20230521   gcc  
openrisc             randconfig-r032-20230521   gcc  
parisc       buildonly-randconfig-r002-20230522   gcc  
parisc       buildonly-randconfig-r004-20230522   gcc  
parisc       buildonly-randconfig-r006-20230521   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230522   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230521   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc              randconfig-r002-20230522   gcc  
powerpc              randconfig-r021-20230521   gcc  
powerpc              randconfig-r032-20230522   gcc  
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230521   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230521   gcc  
s390                 randconfig-r013-20230521   gcc  
s390                 randconfig-r033-20230521   clang
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230521   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r004-20230522   gcc  
sh                   randconfig-r015-20230521   gcc  
sh                   randconfig-r034-20230522   gcc  
sh                           se7722_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc        buildonly-randconfig-r005-20230521   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230522   gcc  
sparc                randconfig-r012-20230521   gcc  
sparc                randconfig-r023-20230522   gcc  
sparc                randconfig-r033-20230521   gcc  
sparc                randconfig-r035-20230522   gcc  
sparc64      buildonly-randconfig-r003-20230522   gcc  
sparc64      buildonly-randconfig-r005-20230521   gcc  
sparc64              randconfig-r003-20230521   gcc  
sparc64              randconfig-r006-20230522   gcc  
sparc64              randconfig-r013-20230522   gcc  
sparc64              randconfig-r015-20230522   gcc  
sparc64              randconfig-r034-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230522   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r011-20230522   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64               randconfig-x083-20230522   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64               randconfig-x085-20230522   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64               randconfig-x091-20230523   gcc  
x86_64               randconfig-x092-20230523   gcc  
x86_64               randconfig-x093-20230523   gcc  
x86_64               randconfig-x094-20230523   gcc  
x86_64               randconfig-x095-20230523   gcc  
x86_64               randconfig-x096-20230523   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r006-20230521   gcc  
xtensa               randconfig-r013-20230521   gcc  
xtensa               randconfig-r031-20230522   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
