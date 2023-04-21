Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02C4E6EB45F
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Apr 2023 00:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjDUWDf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 18:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbjDUWDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 18:03:33 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA3310FF
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682114612; x=1713650612;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Nn3gNw74DOd8Ae2stKEc8+DgQX1I6ojfetLLVCFTTfQ=;
  b=Ue2zT2JYIH5VhEYkNNU+iLJw8zCZqR1LgXdsiPcWnqx+TQwSotE41yga
   zjeJX0huL00u7ClZP93NacRpoonKxfPr+F9b472Oez7JHv3tLCDCfUvDM
   udjUU2laN6MgQmTUJmX0pRnOq6RsrhOn9f46Kxr0wjNMMb9J8+X4bcCQt
   NfzbDu1WZ9WgjSTuSSbZ2nHbMM8mKssKtjR9YrBusybUSu2ICYXr42IfH
   zhgGf6gS2TiOkw2OGhA+m9rq4PP1p3V0aHdFs10V7X+7Q0stGTIOU+Ih5
   8bMSe69ffdvxMNY7ggurT5/tjwNHgmT2eb1MXnwr6mHfX6fifJM4W3n6l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330294193"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="330294193"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 15:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761715877"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="761715877"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 15:03:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppyqi-000grS-2H;
        Fri, 21 Apr 2023 22:03:24 +0000
Date:   Sat, 22 Apr 2023 06:03:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 b7badd752de05312fdb1aeb388480f706d0c087f
Message-ID: <64430822.sOZurIO1TvR/my8b%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: b7badd752de05312fdb1aeb388480f706d0c087f  pinctrl-bcm2835.c: fix race condition when setting gpio dir

elapsed time: 727m

configs tested: 187
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230421   gcc  
alpha                randconfig-r006-20230419   gcc  
alpha                randconfig-r014-20230416   gcc  
alpha                randconfig-r015-20230416   gcc  
alpha                randconfig-r025-20230420   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230421   gcc  
arc                  randconfig-r013-20230417   gcc  
arc                  randconfig-r021-20230420   gcc  
arc                  randconfig-r043-20230420   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230416   clang
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                          exynos_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                         nhk8815_defconfig   gcc  
arm                  randconfig-r011-20230416   clang
arm                  randconfig-r024-20230420   clang
arm                  randconfig-r046-20230420   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230418   clang
arm64                randconfig-r006-20230417   gcc  
arm64                randconfig-r031-20230421   gcc  
csky         buildonly-randconfig-r001-20230420   gcc  
csky         buildonly-randconfig-r004-20230420   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230416   gcc  
hexagon      buildonly-randconfig-r001-20230421   clang
hexagon              randconfig-r001-20230417   clang
hexagon              randconfig-r034-20230420   clang
hexagon              randconfig-r035-20230420   clang
hexagon              randconfig-r041-20230420   clang
hexagon              randconfig-r041-20230421   clang
hexagon              randconfig-r045-20230420   clang
hexagon              randconfig-r045-20230421   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230417   gcc  
ia64         buildonly-randconfig-r005-20230418   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230416   gcc  
ia64                 randconfig-r005-20230416   gcc  
ia64                 randconfig-r006-20230416   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230420   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230419   gcc  
loongarch            randconfig-r035-20230421   gcc  
loongarch            randconfig-r036-20230421   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230416   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                 randconfig-r005-20230418   gcc  
m68k                 randconfig-r006-20230418   gcc  
m68k                 randconfig-r016-20230416   gcc  
microblaze   buildonly-randconfig-r004-20230418   gcc  
microblaze   buildonly-randconfig-r006-20230418   gcc  
microblaze           randconfig-r003-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r002-20230418   gcc  
mips                 randconfig-r004-20230417   clang
mips                 randconfig-r013-20230416   clang
nios2                         3c120_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2        buildonly-randconfig-r001-20230416   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230417   gcc  
nios2                randconfig-r006-20230421   gcc  
nios2                randconfig-r022-20230420   gcc  
nios2                randconfig-r033-20230420   gcc  
openrisc             randconfig-r004-20230419   gcc  
openrisc             randconfig-r015-20230417   gcc  
parisc       buildonly-randconfig-r003-20230416   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc      buildonly-randconfig-r003-20230417   clang
powerpc      buildonly-randconfig-r004-20230417   clang
powerpc      buildonly-randconfig-r006-20230421   clang
powerpc                 mpc837x_mds_defconfig   gcc  
powerpc              randconfig-r025-20230421   clang
powerpc              randconfig-r032-20230420   clang
powerpc              randconfig-r032-20230421   gcc  
powerpc              randconfig-r034-20230421   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230418   gcc  
riscv        buildonly-randconfig-r004-20230421   clang
riscv        buildonly-randconfig-r005-20230421   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230417   gcc  
riscv                randconfig-r002-20230419   gcc  
riscv                randconfig-r002-20230421   gcc  
riscv                randconfig-r016-20230417   clang
riscv                randconfig-r042-20230420   gcc  
riscv                randconfig-r042-20230421   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230421   clang
s390         buildonly-randconfig-r004-20230416   gcc  
s390         buildonly-randconfig-r004-20230421   clang
s390         buildonly-randconfig-r005-20230421   clang
s390                                defconfig   gcc  
s390                 randconfig-r023-20230421   clang
s390                 randconfig-r044-20230420   gcc  
s390                 randconfig-r044-20230421   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230416   gcc  
sh           buildonly-randconfig-r005-20230417   gcc  
sh                        edosk7760_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                   randconfig-r001-20230418   gcc  
sh                   randconfig-r003-20230417   gcc  
sh                   randconfig-r026-20230420   gcc  
sh                   randconfig-r031-20230420   gcc  
sh                           se7712_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230421   gcc  
sparc                randconfig-r011-20230417   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64      buildonly-randconfig-r002-20230417   gcc  
sparc64      buildonly-randconfig-r003-20230418   gcc  
sparc64      buildonly-randconfig-r003-20230420   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                        randconfig-a016   clang
x86_64               randconfig-r012-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230416   gcc  
xtensa               randconfig-r014-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
