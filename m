Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE04C7D1BCC
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Oct 2023 10:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjJUIlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Oct 2023 04:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjJUIlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Oct 2023 04:41:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49550D5E
        for <linux-gpio@vger.kernel.org>; Sat, 21 Oct 2023 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697877660; x=1729413660;
  h=date:from:to:cc:subject:message-id;
  bh=ElY4oVu7/yr3VIT91T/aYOnBwJNaOEZfO1cRkPQCdo8=;
  b=gz2SfxFZwTul6InU7BYtfGj8NWSluPWDH4d0kVlNcPWPmpVU+jt0SEai
   dP23hnRcSAwDXMXAoZNdlzVsunP5m8TGFtzd3xCgco6fKwsDmK9re+rwB
   PgvAOqAdpTn6hqxjy974PR3ZJyKjw/deDkx13xP/HHh6m+SqP3s5Qgxq6
   6k0Ts/GUZoXfOnQeODAivYptK4T0zFLg02bOHRJEdugyxJ0Oqd+fnuIMh
   sTYzwNPUDoeJfjcKA9wWpHCIaFH5WaY44NEYTSUpxCKT/+W2JjJWbMj4u
   +UJ2VmgdLpIdb1eUim7ScVOXRns9UjRXZX0T0SdHP5pJk1f7n4R7VGHKo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376996644"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="376996644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 01:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="787007800"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="787007800"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2023 01:40:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qu7XU-0004du-1d;
        Sat, 21 Oct 2023 08:40:56 +0000
Date:   Sat, 21 Oct 2023 16:40:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 62140a1e4dec4594d5d1e1d353747bf2ef434e8b
Message-ID: <202310211615.hF7hDvaF-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 62140a1e4dec4594d5d1e1d353747bf2ef434e8b  Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"

elapsed time: 2836m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231020   gcc  
arc                   randconfig-001-20231021   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231021   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231021   gcc  
i386         buildonly-randconfig-002-20231021   gcc  
i386         buildonly-randconfig-003-20231021   gcc  
i386         buildonly-randconfig-004-20231021   gcc  
i386         buildonly-randconfig-005-20231021   gcc  
i386         buildonly-randconfig-006-20231021   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231021   gcc  
i386                  randconfig-002-20231021   gcc  
i386                  randconfig-003-20231021   gcc  
i386                  randconfig-004-20231021   gcc  
i386                  randconfig-005-20231021   gcc  
i386                  randconfig-006-20231021   gcc  
i386                  randconfig-011-20231021   gcc  
i386                  randconfig-012-20231021   gcc  
i386                  randconfig-013-20231021   gcc  
i386                  randconfig-014-20231021   gcc  
i386                  randconfig-015-20231021   gcc  
i386                  randconfig-016-20231021   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231020   gcc  
loongarch             randconfig-001-20231021   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231020   gcc  
riscv                 randconfig-001-20231021   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231020   gcc  
s390                  randconfig-001-20231021   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231021   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231021   gcc  
x86_64       buildonly-randconfig-002-20231021   gcc  
x86_64       buildonly-randconfig-003-20231021   gcc  
x86_64       buildonly-randconfig-004-20231021   gcc  
x86_64       buildonly-randconfig-005-20231021   gcc  
x86_64       buildonly-randconfig-006-20231021   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231021   gcc  
x86_64                randconfig-002-20231021   gcc  
x86_64                randconfig-003-20231021   gcc  
x86_64                randconfig-004-20231021   gcc  
x86_64                randconfig-005-20231021   gcc  
x86_64                randconfig-006-20231021   gcc  
x86_64                randconfig-011-20231021   gcc  
x86_64                randconfig-012-20231021   gcc  
x86_64                randconfig-013-20231021   gcc  
x86_64                randconfig-014-20231021   gcc  
x86_64                randconfig-015-20231021   gcc  
x86_64                randconfig-016-20231021   gcc  
x86_64                randconfig-071-20231021   gcc  
x86_64                randconfig-072-20231021   gcc  
x86_64                randconfig-073-20231021   gcc  
x86_64                randconfig-074-20231021   gcc  
x86_64                randconfig-075-20231021   gcc  
x86_64                randconfig-076-20231021   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
