Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93DF072A55F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 23:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjFIVcv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 17:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjFIVcu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 17:32:50 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA613A82
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686346369; x=1717882369;
  h=date:from:to:cc:subject:message-id;
  bh=jeTY9dFrRMFeX4vOSRRz+mH1sxD8hP0xXEVzbvUW5Jo=;
  b=QAQqlryi2zBrcjCs1tonmQ4GUy3aAtc44dRuDMO22hPG2bZftcPfPn1E
   WOdgLCMelDGnnmX90r9e47EmuVWzq2Z8MPI0Uv39nMJx6ICFGZ5Wgk1OK
   ZkpZNlav0iYbkwK+yF7+1+7Yv6YKIg/mKBLfH4KZTib9L7MWX8RGqLbcg
   KdvGxbP7BC0QGPjfKKssfNhFy7TmBj9vvedmCgTonFK1JniWPDgaib1Q9
   gKp9Hkpqlq7n75x6Py4SqQmeLG9o465ZDAGxGCyXrABdiAPeGKp/Pn1d3
   VLcxzW+w75oaBZNdZSv7R8r+5t5dbpHDFlacd/9/ic3lsQZvu89rO0Z8U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="337330735"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="337330735"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 14:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800353555"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="800353555"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2023 14:32:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q7jix-0009QQ-0C;
        Fri, 09 Jun 2023 21:32:47 +0000
Date:   Sat, 10 Jun 2023 05:31:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 ad64639417161e90b30dda00486570eb150aeee5
Message-ID: <202306100551.CUc7b44O-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: ad64639417161e90b30dda00486570eb150aeee5  pinctrl: npcm7xx: Add missing check for ioremap

elapsed time: 726m

configs tested: 166
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230608   gcc  
alpha                randconfig-r026-20230609   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230608   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230608   gcc  
arc                  randconfig-r016-20230608   gcc  
arc                  randconfig-r021-20230609   gcc  
arc                  randconfig-r043-20230608   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                  randconfig-r021-20230608   gcc  
arm                  randconfig-r046-20230608   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230608   clang
arm64                randconfig-r034-20230608   gcc  
csky         buildonly-randconfig-r002-20230608   gcc  
csky         buildonly-randconfig-r006-20230608   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230608   gcc  
hexagon              randconfig-r006-20230608   clang
hexagon              randconfig-r041-20230608   clang
hexagon              randconfig-r045-20230608   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230608   gcc  
i386                 randconfig-i002-20230608   gcc  
i386                 randconfig-i003-20230608   gcc  
i386                 randconfig-i004-20230608   gcc  
i386                 randconfig-i005-20230608   gcc  
i386                 randconfig-i006-20230608   gcc  
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i056-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230608   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230608   gcc  
loongarch            randconfig-r024-20230609   gcc  
loongarch            randconfig-r025-20230609   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k         buildonly-randconfig-r002-20230608   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r022-20230609   gcc  
microblaze           randconfig-r025-20230608   gcc  
microblaze           randconfig-r036-20230608   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                 randconfig-r001-20230608   clang
mips                 randconfig-r032-20230608   clang
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230608   gcc  
openrisc     buildonly-randconfig-r002-20230608   gcc  
openrisc     buildonly-randconfig-r005-20230608   gcc  
openrisc     buildonly-randconfig-r006-20230608   gcc  
openrisc             randconfig-r004-20230608   gcc  
openrisc             randconfig-r006-20230608   gcc  
openrisc             randconfig-r011-20230608   gcc  
openrisc             randconfig-r014-20230608   gcc  
openrisc             randconfig-r016-20230608   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230608   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r005-20230608   gcc  
powerpc              randconfig-r021-20230608   clang
powerpc              randconfig-r022-20230608   clang
powerpc              randconfig-r034-20230608   gcc  
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r031-20230608   gcc  
riscv                randconfig-r042-20230608   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230608   gcc  
s390                 randconfig-r035-20230608   gcc  
s390                 randconfig-r044-20230608   clang
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh           buildonly-randconfig-r003-20230608   gcc  
sh           buildonly-randconfig-r004-20230608   gcc  
sh                        edosk7705_defconfig   gcc  
sh                   randconfig-r014-20230608   gcc  
sh                   randconfig-r022-20230608   gcc  
sh                   randconfig-r023-20230609   gcc  
sh                   randconfig-r035-20230608   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230608   gcc  
sparc                randconfig-r013-20230608   gcc  
sparc                randconfig-r033-20230608   gcc  
sparc64      buildonly-randconfig-r005-20230608   gcc  
sparc64              randconfig-r012-20230608   gcc  
sparc64              randconfig-r013-20230608   gcc  
sparc64              randconfig-r016-20230608   gcc  
sparc64              randconfig-r032-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230608   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-r036-20230608   gcc  
x86_64               randconfig-x051-20230608   clang
x86_64               randconfig-x052-20230608   clang
x86_64               randconfig-x053-20230608   clang
x86_64               randconfig-x054-20230608   clang
x86_64               randconfig-x055-20230608   clang
x86_64               randconfig-x056-20230608   clang
x86_64               randconfig-x061-20230608   clang
x86_64               randconfig-x062-20230608   clang
x86_64               randconfig-x063-20230608   clang
x86_64               randconfig-x064-20230608   clang
x86_64               randconfig-x065-20230608   clang
x86_64               randconfig-x066-20230608   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230608   gcc  
xtensa               randconfig-r014-20230608   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
