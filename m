Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C53A789FA0
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Aug 2023 15:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjH0Ntu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Aug 2023 09:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjH0Ntd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Aug 2023 09:49:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F55B10F
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693144171; x=1724680171;
  h=date:from:to:cc:subject:message-id;
  bh=vl+2r7yBpaoZCgoHvfiVorUTZnjCEFpg8z0IJxRfn74=;
  b=GvoAUF4u1HB3SuGfh1VV+/VXdWYVaoTC6bCfU2xCzZyjL+4JN/Fylcsq
   DpdQRBp65IGy4ebU7sMoxEmSI4euvnTx9cn31BWYHPVfmzfNjXi/sceCX
   zCUAOYHW3VIB4/YgPnG63+gsdf03QjZE8qvEFiRawE+kqF/0foIyuUUxE
   VJqQMiGREPkeeN1QwOM57oBOhZ5nXWpJ/5muM9N9SWyt+CPSy24/biFg7
   ehTdp+wJHFDvZvGYpdIfqwRDgD1oW8CKnWFyuKwTXRBjW5IabYLJW/YnY
   9e/H2GBDousb0n1Vgn05EeN4qIhwQo+Xtr5xwPm7IjL3lnief1xAXg9co
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="377681639"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="377681639"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 06:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068753326"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="1068753326"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Aug 2023 06:49:28 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qaG8u-0005r1-0h;
        Sun, 27 Aug 2023 13:49:28 +0000
Date:   Sun, 27 Aug 2023 21:49:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b4e880a8d840e2b64937ab47ad518185c07747e3
Message-ID: <202308272112.3IR0io6T-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b4e880a8d840e2b64937ab47ad518185c07747e3  Merge branch 'devel' into for-next

elapsed time: 2851m

configs tested: 157
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230825   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230825   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230825   clang
arm                  randconfig-r013-20230825   clang
arm                  randconfig-r015-20230825   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230825   gcc  
hexagon               randconfig-001-20230825   clang
hexagon               randconfig-002-20230825   clang
hexagon              randconfig-r001-20230825   clang
i386         buildonly-randconfig-001-20230825   clang
i386         buildonly-randconfig-002-20230825   clang
i386         buildonly-randconfig-003-20230825   clang
i386         buildonly-randconfig-004-20230825   clang
i386         buildonly-randconfig-005-20230825   clang
i386         buildonly-randconfig-006-20230825   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20230826   gcc  
i386                  randconfig-002-20230826   gcc  
i386                  randconfig-003-20230826   gcc  
i386                  randconfig-004-20230826   gcc  
i386                  randconfig-005-20230826   gcc  
i386                  randconfig-006-20230826   gcc  
i386                  randconfig-011-20230826   clang
i386                  randconfig-012-20230826   clang
i386                  randconfig-013-20230826   clang
i386                  randconfig-014-20230826   clang
i386                  randconfig-015-20230826   clang
i386                  randconfig-016-20230826   clang
i386                 randconfig-r016-20230825   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230826   gcc  
loongarch            randconfig-r004-20230825   gcc  
loongarch            randconfig-r026-20230825   gcc  
loongarch            randconfig-r036-20230825   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230825   clang
mips                 randconfig-r024-20230825   clang
mips                 randconfig-r031-20230825   gcc  
mips                 randconfig-r033-20230825   gcc  
mips                 randconfig-r035-20230825   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230825   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r025-20230825   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r034-20230825   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r022-20230825   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230825   clang
riscv                randconfig-r005-20230825   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230825   gcc  
s390                 randconfig-r032-20230825   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r011-20230825   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r012-20230825   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230826   gcc  
x86_64       buildonly-randconfig-002-20230826   gcc  
x86_64       buildonly-randconfig-003-20230826   gcc  
x86_64       buildonly-randconfig-004-20230826   gcc  
x86_64       buildonly-randconfig-005-20230826   gcc  
x86_64       buildonly-randconfig-006-20230826   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230826   clang
x86_64                randconfig-002-20230826   clang
x86_64                randconfig-003-20230826   clang
x86_64                randconfig-004-20230826   clang
x86_64                randconfig-005-20230826   clang
x86_64                randconfig-006-20230826   clang
x86_64                randconfig-011-20230826   gcc  
x86_64                randconfig-012-20230826   gcc  
x86_64                randconfig-013-20230826   gcc  
x86_64                randconfig-014-20230826   gcc  
x86_64                randconfig-015-20230826   gcc  
x86_64                randconfig-016-20230826   gcc  
x86_64                randconfig-071-20230826   gcc  
x86_64                randconfig-072-20230826   gcc  
x86_64                randconfig-073-20230826   gcc  
x86_64                randconfig-074-20230826   gcc  
x86_64                randconfig-075-20230826   gcc  
x86_64                randconfig-076-20230826   gcc  
x86_64               randconfig-r002-20230825   clang
x86_64               randconfig-r023-20230825   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
