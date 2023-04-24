Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A6A6EA248
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 05:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjDUDRN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 23:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbjDUDQl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 23:16:41 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C319F8A52
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 20:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682046968; x=1713582968;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7JXz4qdBiICWASW67B8UBudNGwHZoA+ni6z9YMqiPLk=;
  b=QuqdcJRBADVr/zgacyxq2+I/FuW7s3rxG3rlKFVyyBA+9fTwYeoSinX4
   AxvZLHWjSMgL/E+U3KPxCurPFsSbuDuYPYsQ6ont4Sk/tYIW522RhoNd9
   jJz1Z5XFsUgsuabo8N1sFqc0VhuaJmHT5hXwYiJ7D0FHFXiWHJNyW3TVP
   Orq08W7egN37KCVUX+eBjOA4blo0gemGsQGb5y1lwQ7+Ypq3ihPH4jazV
   LOv6diEGnAls2dQac2BxCuGocscH6LwdFNSXWWPcxm16SZUJ2VrxRyK/W
   QTbXVjZ5EUFg/09A3bOxwOnxqVTFMqIxCnYy9nAYC14/aVAzuKuCaVdVP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326231669"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="326231669"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 20:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692140841"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="692140841"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 20:16:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pphFh-000gGr-0M;
        Fri, 21 Apr 2023 03:16:01 +0000
Date:   Fri, 21 Apr 2023 11:15:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 19bcff7e2777c7337caeef5532ad6f93f3d24d64
Message-ID: <6441ffed.fu+lNol4NaMXjOVK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 19bcff7e2777c7337caeef5532ad6f93f3d24d64  pinctrl: qcom ssbi-gpio: Convert to immutable irq_chip

elapsed time: 727m

configs tested: 165
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230416   gcc  
alpha                randconfig-r001-20230420   gcc  
alpha                randconfig-r003-20230416   gcc  
alpha                randconfig-r011-20230418   gcc  
alpha                randconfig-r013-20230416   gcc  
alpha                randconfig-r021-20230416   gcc  
alpha                randconfig-r022-20230416   gcc  
alpha                randconfig-r025-20230417   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arc                  randconfig-r043-20230419   gcc  
arc                  randconfig-r043-20230420   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230416   gcc  
arm                  randconfig-r022-20230417   gcc  
arm                  randconfig-r034-20230417   clang
arm                  randconfig-r034-20230418   gcc  
arm                  randconfig-r035-20230418   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm                  randconfig-r046-20230419   gcc  
arm                  randconfig-r046-20230420   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230417   gcc  
arm64                randconfig-r011-20230417   clang
csky                                defconfig   gcc  
csky                 randconfig-r012-20230417   gcc  
csky                 randconfig-r021-20230420   gcc  
csky                 randconfig-r026-20230420   gcc  
csky                 randconfig-r035-20230417   gcc  
hexagon              randconfig-r005-20230417   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r041-20230419   clang
hexagon              randconfig-r041-20230420   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
hexagon              randconfig-r045-20230419   clang
hexagon              randconfig-r045-20230420   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
i386                 randconfig-r006-20230417   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230420   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r024-20230417   gcc  
ia64                 randconfig-r034-20230420   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230417   gcc  
loongarch            randconfig-r022-20230420   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230418   gcc  
m68k                 randconfig-r025-20230420   gcc  
m68k                 randconfig-r031-20230417   gcc  
m68k                 randconfig-r033-20230418   gcc  
m68k                 randconfig-r035-20230416   gcc  
m68k                 randconfig-r035-20230420   gcc  
m68k                 randconfig-r036-20230417   gcc  
microblaze           randconfig-r004-20230420   gcc  
microblaze           randconfig-r011-20230416   gcc  
microblaze           randconfig-r026-20230417   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230420   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230417   gcc  
openrisc             randconfig-r024-20230416   gcc  
openrisc             randconfig-r024-20230420   gcc  
openrisc             randconfig-r031-20230418   gcc  
openrisc             randconfig-r036-20230420   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230416   gcc  
parisc               randconfig-r026-20230416   gcc  
parisc               randconfig-r033-20230420   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230418   gcc  
powerpc              randconfig-r023-20230420   gcc  
powerpc              randconfig-r032-20230416   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230420   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230416   clang
riscv                randconfig-r016-20230417   clang
riscv                randconfig-r023-20230416   gcc  
riscv                randconfig-r031-20230420   clang
riscv                randconfig-r033-20230417   gcc  
riscv                randconfig-r034-20230416   clang
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                randconfig-r042-20230419   clang
riscv                randconfig-r042-20230420   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230420   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230420   clang
s390                 randconfig-r003-20230420   clang
s390                 randconfig-r016-20230416   gcc  
s390                 randconfig-r025-20230416   gcc  
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
s390                 randconfig-r044-20230419   clang
s390                 randconfig-r044-20230420   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230420   gcc  
sh                   randconfig-r004-20230417   gcc  
sh                   randconfig-r013-20230417   gcc  
sh                   randconfig-r031-20230416   gcc  
sh                   randconfig-r036-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230416   gcc  
sparc                randconfig-r032-20230417   gcc  
sparc                randconfig-r036-20230418   gcc  
sparc64      buildonly-randconfig-r004-20230420   gcc  
sparc64              randconfig-r014-20230418   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64               randconfig-r021-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230416   gcc  
xtensa               randconfig-r016-20230418   gcc  
xtensa               randconfig-r032-20230420   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
