Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C47A723279
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 23:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbjFEVp3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 17:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbjFEVp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 17:45:28 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9582C102
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 14:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686001527; x=1717537527;
  h=date:from:to:cc:subject:message-id;
  bh=VGLRgsVLDizntTKHnuZTnmVcQ4vO+Rxa8Zz6m10NJHk=;
  b=N5X6eBseCSBJObJaO9ZeylCyTF9n54b1xKWdjS1YgMsrwtajG7EyyXIz
   RmcaRdCXy5Qs0A0yCD309AD3AS94qFntdfgzqirkjadHpEDl3o1NqMCIs
   7TxrhN6w0fHKU69GQ6ZZIejR613dDExQobVHchE27O1c+kZe5qnfEPNA4
   2vxhAVeUDxgrm/nflWdqDsLviLd9H+ZvPWAcp5S+3wTcmUKvRql1wmmFC
   zAcnUQsDxmp1owZrIrkkxf4ku0ozkX2+Sxndlh3HFZO2jicueej4IlSAq
   rygdKnkSrb5Y8ALW0ID/ZWMZRbbVin+yoFaZcNETkE9rNClytJmUIkQQ6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356499223"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="356499223"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 14:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="883070609"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="883070609"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Jun 2023 14:45:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6I0z-0004St-0G;
        Mon, 05 Jun 2023 21:45:25 +0000
Date:   Tue, 06 Jun 2023 05:44:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 7ce8d39e342167b2be7004b28926728176e6d94e
Message-ID: <20230605214449.BV6Zh%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 7ce8d39e342167b2be7004b28926728176e6d94e  gpio: Fix dependency for gpio-delay

elapsed time: 724m

configs tested: 211
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230605   gcc  
alpha                randconfig-r005-20230605   gcc  
alpha                randconfig-r013-20230605   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230605   gcc  
arc          buildonly-randconfig-r005-20230605   gcc  
arc          buildonly-randconfig-r006-20230605   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230605   gcc  
arc                  randconfig-r025-20230605   gcc  
arc                  randconfig-r026-20230605   gcc  
arc                  randconfig-r043-20230605   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r031-20230605   gcc  
arm                  randconfig-r032-20230605   gcc  
arm                  randconfig-r036-20230605   gcc  
arm                  randconfig-r046-20230605   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230605   clang
arm64                randconfig-r012-20230605   gcc  
arm64                randconfig-r034-20230605   clang
csky         buildonly-randconfig-r001-20230605   gcc  
csky         buildonly-randconfig-r005-20230605   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230605   gcc  
csky                 randconfig-r004-20230605   gcc  
csky                 randconfig-r014-20230605   gcc  
csky                 randconfig-r015-20230605   gcc  
csky                 randconfig-r031-20230605   gcc  
csky                 randconfig-r032-20230605   gcc  
csky                 randconfig-r034-20230605   gcc  
csky                 randconfig-r035-20230605   gcc  
hexagon              randconfig-r004-20230605   clang
hexagon              randconfig-r025-20230605   clang
hexagon              randconfig-r036-20230605   clang
hexagon              randconfig-r041-20230605   clang
hexagon              randconfig-r045-20230605   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230605   clang
i386                 randconfig-i002-20230605   clang
i386                 randconfig-i003-20230605   clang
i386                 randconfig-i004-20230605   clang
i386                 randconfig-i005-20230605   clang
i386                 randconfig-i006-20230605   clang
i386                 randconfig-i011-20230605   gcc  
i386                 randconfig-i012-20230605   gcc  
i386                 randconfig-i013-20230605   gcc  
i386                 randconfig-i014-20230605   gcc  
i386                 randconfig-i015-20230605   gcc  
i386                 randconfig-i016-20230605   gcc  
i386                 randconfig-i051-20230605   clang
i386                 randconfig-i052-20230605   clang
i386                 randconfig-i053-20230605   clang
i386                 randconfig-i054-20230605   clang
i386                 randconfig-i055-20230605   clang
i386                 randconfig-i056-20230605   clang
i386                 randconfig-i061-20230605   clang
i386                 randconfig-i062-20230605   clang
i386                 randconfig-i063-20230605   clang
i386                 randconfig-i064-20230605   clang
i386                 randconfig-i065-20230605   clang
i386                 randconfig-i066-20230605   clang
i386                 randconfig-r011-20230605   gcc  
i386                 randconfig-r021-20230605   gcc  
i386                 randconfig-r022-20230605   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230605   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230606   gcc  
loongarch            randconfig-r016-20230605   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230605   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230605   gcc  
m68k                 randconfig-r002-20230606   gcc  
m68k                 randconfig-r023-20230605   gcc  
microblaze           randconfig-r001-20230605   gcc  
microblaze           randconfig-r003-20230606   gcc  
microblaze           randconfig-r004-20230605   gcc  
microblaze           randconfig-r006-20230605   gcc  
microblaze           randconfig-r026-20230605   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230605   gcc  
mips         buildonly-randconfig-r002-20230605   gcc  
mips         buildonly-randconfig-r003-20230605   gcc  
mips         buildonly-randconfig-r005-20230605   gcc  
mips                        maltaup_defconfig   clang
mips                 randconfig-r003-20230605   gcc  
nios2                            alldefconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230605   gcc  
nios2                randconfig-r011-20230605   gcc  
nios2                randconfig-r016-20230605   gcc  
nios2                randconfig-r032-20230605   gcc  
nios2                randconfig-r035-20230605   gcc  
openrisc     buildonly-randconfig-r001-20230605   gcc  
openrisc     buildonly-randconfig-r003-20230605   gcc  
openrisc     buildonly-randconfig-r004-20230605   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r006-20230605   gcc  
openrisc             randconfig-r033-20230605   gcc  
parisc       buildonly-randconfig-r003-20230605   gcc  
parisc       buildonly-randconfig-r004-20230605   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230605   gcc  
parisc               randconfig-r012-20230605   gcc  
parisc               randconfig-r015-20230605   gcc  
parisc               randconfig-r025-20230605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230605   gcc  
powerpc                     kmeter1_defconfig   clang
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc              randconfig-r005-20230606   gcc  
powerpc              randconfig-r012-20230605   gcc  
powerpc              randconfig-r013-20230605   gcc  
powerpc              randconfig-r014-20230605   gcc  
powerpc              randconfig-r015-20230605   gcc  
powerpc              randconfig-r021-20230605   gcc  
powerpc              randconfig-r035-20230605   clang
powerpc              randconfig-r036-20230605   clang
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230605   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230605   clang
riscv                randconfig-r006-20230605   clang
riscv                randconfig-r022-20230605   gcc  
riscv                randconfig-r042-20230605   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230606   gcc  
s390                 randconfig-r015-20230605   gcc  
s390                 randconfig-r016-20230605   gcc  
s390                 randconfig-r044-20230605   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230605   gcc  
sh                             espt_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r013-20230605   gcc  
sh                   randconfig-r031-20230605   gcc  
sh                   randconfig-r034-20230605   gcc  
sh                             sh03_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230605   gcc  
sparc                randconfig-r004-20230605   gcc  
sparc                randconfig-r012-20230605   gcc  
sparc                randconfig-r022-20230605   gcc  
sparc                randconfig-r024-20230605   gcc  
sparc                randconfig-r025-20230605   gcc  
sparc                randconfig-r026-20230605   gcc  
sparc                randconfig-r032-20230605   gcc  
sparc                randconfig-r033-20230605   gcc  
sparc                randconfig-r035-20230605   gcc  
sparc64      buildonly-randconfig-r003-20230605   gcc  
sparc64      buildonly-randconfig-r006-20230605   gcc  
sparc64              randconfig-r003-20230605   gcc  
sparc64              randconfig-r011-20230605   gcc  
sparc64              randconfig-r023-20230605   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230605   clang
x86_64               randconfig-a002-20230605   clang
x86_64               randconfig-a003-20230605   clang
x86_64               randconfig-a004-20230605   clang
x86_64               randconfig-a005-20230605   clang
x86_64               randconfig-a006-20230605   clang
x86_64               randconfig-a011-20230605   gcc  
x86_64               randconfig-a012-20230605   gcc  
x86_64               randconfig-a013-20230605   gcc  
x86_64               randconfig-a014-20230605   gcc  
x86_64               randconfig-a015-20230605   gcc  
x86_64               randconfig-a016-20230605   gcc  
x86_64               randconfig-r005-20230605   clang
x86_64               randconfig-r016-20230605   gcc  
x86_64               randconfig-x051-20230605   gcc  
x86_64               randconfig-x052-20230605   gcc  
x86_64               randconfig-x053-20230605   gcc  
x86_64               randconfig-x054-20230605   gcc  
x86_64               randconfig-x055-20230605   gcc  
x86_64               randconfig-x056-20230605   gcc  
x86_64               randconfig-x061-20230605   gcc  
x86_64               randconfig-x062-20230605   gcc  
x86_64               randconfig-x063-20230605   gcc  
x86_64               randconfig-x064-20230605   gcc  
x86_64               randconfig-x065-20230605   gcc  
x86_64               randconfig-x066-20230605   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230605   gcc  
xtensa       buildonly-randconfig-r006-20230605   gcc  
xtensa               randconfig-r002-20230605   gcc  
xtensa               randconfig-r011-20230605   gcc  
xtensa               randconfig-r013-20230605   gcc  
xtensa               randconfig-r015-20230605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
