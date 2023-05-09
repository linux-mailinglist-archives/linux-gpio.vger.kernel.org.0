Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66326FBEE2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 07:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbjEIFuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 01:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjEIFuG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 01:50:06 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EC39028
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 22:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683611405; x=1715147405;
  h=date:from:to:cc:subject:message-id;
  bh=vgB/rWXMzDbKYsAzgm2TUFle4tlUe0Hu//QpjAyp8gw=;
  b=aZutm6t68jSwnYYzVODzhOvl9ipEeKiWv0Ykn5tCOME6AkvNwkteXPEb
   ZOGGJ6WgGY1Tuomt/rQLIUuWc0Sxf4vqU0DcTVZnaeEGObNpFFfd+9v6f
   Kzlvh3Eq6GkFA1iADjx0e05D/ueDYQKMWHuNwyn7hfol31Wg9ne+Nj5av
   v4GXrzKt0mt7fJuO45fKBFyyYoqOoox/Plbs5+DPPtpXtQs51w8n9gyOc
   58p/GTQbwdS+mw0UM6yL3J0uDorkKBizhU36TKiYP8Eo65bM5nFZk9XeE
   2qF42riz2fRN9FqI/w6FqIqVP/O50ysf5RqSk35F4layVpsomK6SoNz9x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349850276"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="349850276"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 22:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="810522123"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="810522123"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 22:50:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pwGEd-0001o0-0q;
        Tue, 09 May 2023 05:50:03 +0000
Date:   Tue, 09 May 2023 13:49:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 cbbe077815144ad98fd2ea724d9ec3dade09ca92
Message-ID: <20230509054920.Eus_w%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: cbbe077815144ad98fd2ea724d9ec3dade09ca92  pinctrl: qcom: spmi-gpio: Add PM8953 support

elapsed time: 733m

configs tested: 185
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230507   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230507   gcc  
alpha                randconfig-r016-20230507   gcc  
alpha                randconfig-r016-20230508   gcc  
alpha                randconfig-r025-20230507   gcc  
alpha                randconfig-r026-20230507   gcc  
alpha                randconfig-r033-20230507   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230507   gcc  
arc          buildonly-randconfig-r003-20230508   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230508   gcc  
arc                  randconfig-r005-20230508   gcc  
arc                  randconfig-r032-20230508   gcc  
arc                  randconfig-r035-20230507   gcc  
arc                  randconfig-r036-20230508   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230507   clang
arm                  randconfig-r024-20230507   gcc  
arm                  randconfig-r026-20230508   clang
arm                  randconfig-r036-20230508   gcc  
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230507   gcc  
arm64        buildonly-randconfig-r003-20230507   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230507   gcc  
arm64                randconfig-r002-20230508   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230507   gcc  
csky                 randconfig-r006-20230508   gcc  
hexagon      buildonly-randconfig-r002-20230508   clang
hexagon      buildonly-randconfig-r006-20230508   clang
hexagon              randconfig-r013-20230507   clang
hexagon              randconfig-r015-20230508   clang
hexagon              randconfig-r023-20230507   clang
hexagon              randconfig-r023-20230508   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r011-20230508   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230508   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230508   gcc  
ia64                 randconfig-r021-20230507   gcc  
ia64                 randconfig-r023-20230507   gcc  
ia64                 randconfig-r025-20230508   gcc  
ia64                 randconfig-r026-20230507   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230507   gcc  
loongarch            randconfig-r013-20230508   gcc  
loongarch            randconfig-r014-20230508   gcc  
loongarch            randconfig-r024-20230508   gcc  
loongarch            randconfig-r031-20230508   gcc  
loongarch            randconfig-r033-20230508   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230507   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r024-20230507   gcc  
microblaze   buildonly-randconfig-r004-20230507   gcc  
microblaze   buildonly-randconfig-r004-20230508   gcc  
microblaze   buildonly-randconfig-r006-20230507   gcc  
microblaze           randconfig-r022-20230507   gcc  
microblaze           randconfig-r032-20230508   gcc  
microblaze           randconfig-r034-20230508   gcc  
microblaze           randconfig-r036-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r006-20230507   clang
mips                 randconfig-r033-20230508   gcc  
mips                 randconfig-r035-20230507   clang
mips                 randconfig-r035-20230508   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230507   gcc  
nios2                randconfig-r012-20230507   gcc  
nios2                randconfig-r031-20230507   gcc  
nios2                randconfig-r034-20230508   gcc  
openrisc     buildonly-randconfig-r006-20230507   gcc  
openrisc             randconfig-r004-20230507   gcc  
openrisc             randconfig-r015-20230507   gcc  
openrisc             randconfig-r021-20230508   gcc  
parisc       buildonly-randconfig-r001-20230507   gcc  
parisc       buildonly-randconfig-r004-20230507   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230507   gcc  
parisc               randconfig-r014-20230507   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230507   gcc  
powerpc              randconfig-r005-20230507   gcc  
powerpc              randconfig-r016-20230507   clang
powerpc              randconfig-r021-20230507   clang
powerpc              randconfig-r022-20230508   gcc  
powerpc              randconfig-r025-20230507   clang
powerpc              randconfig-r033-20230507   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230507   clang
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230508   gcc  
riscv                randconfig-r025-20230508   gcc  
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230508   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230507   gcc  
sh           buildonly-randconfig-r005-20230508   gcc  
sh                   randconfig-r012-20230508   gcc  
sh                   randconfig-r013-20230507   gcc  
sh                   randconfig-r014-20230507   gcc  
sh                   randconfig-r032-20230507   gcc  
sparc        buildonly-randconfig-r001-20230508   gcc  
sparc        buildonly-randconfig-r002-20230508   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230508   gcc  
sparc                randconfig-r005-20230507   gcc  
sparc                randconfig-r015-20230507   gcc  
sparc                randconfig-r022-20230507   gcc  
sparc                randconfig-r031-20230508   gcc  
sparc64      buildonly-randconfig-r004-20230508   gcc  
sparc64              randconfig-r012-20230507   gcc  
sparc64              randconfig-r032-20230507   gcc  
sparc64              randconfig-r034-20230507   gcc  
sparc64              randconfig-r035-20230508   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230508   clang
x86_64                        randconfig-a002   gcc  
x86_64               randconfig-a003-20230508   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230508   clang
x86_64                        randconfig-a004   gcc  
x86_64               randconfig-a005-20230508   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230508   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230508   gcc  
xtensa               randconfig-r003-20230507   gcc  
xtensa               randconfig-r021-20230508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
