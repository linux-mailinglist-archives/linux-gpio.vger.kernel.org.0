Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4976C7D986B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Oct 2023 14:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345650AbjJ0Mgi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Oct 2023 08:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345539AbjJ0Mgh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Oct 2023 08:36:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F46BD
        for <linux-gpio@vger.kernel.org>; Fri, 27 Oct 2023 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698410195; x=1729946195;
  h=date:from:to:cc:subject:message-id;
  bh=dvf56dAWaKf7PbFqyGq9OUNqrVxZLXz5hK9GVvhGZro=;
  b=hVW15RUzpbWFGYUB1D82XqoKoA8XBst+1LOyYwUL/BgLbaLvqulAO6U8
   F4mRY9QKHdm6bZFs2wDTvcKkbdOTRqNlO8Ip3Kt6BF05ZOxEGfKVLJeYl
   JqAp+Q6fz1WZOe+Kn3aDuXSU13EM5CLd1iFYM2U+fGYlF1gIOExUowQ5o
   Pfj1dTCl3vHQ9xoCiu/KDs463OSBu7SEuF3Xopqd8Q+32jneEJ9ZDmUJ/
   DGcCGTZMMfoILGp0kiH2aSLk/d09GKzWG9HhivqjpBHBDaHou3A804NTV
   H9CXdhJTnQghSHjjhM36uyp8s7GEFGGRGFGxIs8Zie908jrkOHdysrL5H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391640492"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="391640492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 05:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788816197"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="788816197"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2023 05:36:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qwM4l-000Apw-17;
        Fri, 27 Oct 2023 12:36:31 +0000
Date:   Fri, 27 Oct 2023 20:36:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 e2b0bac1aae44d603817b55d62553f3d3557d5a7
Message-ID: <202310272020.ls0JlO1e-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: e2b0bac1aae44d603817b55d62553f3d3557d5a7  dt-bindings: pinctrl: qcom,sa8775p-tlmm: add missing wakeup-parent

elapsed time: 1304m

configs tested: 168
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20231026   gcc  
arc                   randconfig-001-20231027   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231027   gcc  
arm                       spear13xx_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231027   gcc  
i386         buildonly-randconfig-002-20231027   gcc  
i386         buildonly-randconfig-003-20231027   gcc  
i386         buildonly-randconfig-004-20231027   gcc  
i386         buildonly-randconfig-005-20231027   gcc  
i386         buildonly-randconfig-006-20231027   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231027   gcc  
i386                  randconfig-002-20231027   gcc  
i386                  randconfig-003-20231027   gcc  
i386                  randconfig-004-20231027   gcc  
i386                  randconfig-005-20231027   gcc  
i386                  randconfig-006-20231027   gcc  
i386                  randconfig-011-20231027   gcc  
i386                  randconfig-012-20231027   gcc  
i386                  randconfig-013-20231027   gcc  
i386                  randconfig-014-20231027   gcc  
i386                  randconfig-015-20231027   gcc  
i386                  randconfig-016-20231027   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231026   gcc  
loongarch             randconfig-001-20231027   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
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
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20231027   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231027   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231027   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231026   gcc  
x86_64       buildonly-randconfig-001-20231027   gcc  
x86_64       buildonly-randconfig-002-20231026   gcc  
x86_64       buildonly-randconfig-002-20231027   gcc  
x86_64       buildonly-randconfig-003-20231026   gcc  
x86_64       buildonly-randconfig-003-20231027   gcc  
x86_64       buildonly-randconfig-004-20231026   gcc  
x86_64       buildonly-randconfig-004-20231027   gcc  
x86_64       buildonly-randconfig-005-20231026   gcc  
x86_64       buildonly-randconfig-005-20231027   gcc  
x86_64       buildonly-randconfig-006-20231026   gcc  
x86_64       buildonly-randconfig-006-20231027   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231027   gcc  
x86_64                randconfig-002-20231027   gcc  
x86_64                randconfig-003-20231027   gcc  
x86_64                randconfig-004-20231027   gcc  
x86_64                randconfig-005-20231027   gcc  
x86_64                randconfig-006-20231027   gcc  
x86_64                randconfig-011-20231027   gcc  
x86_64                randconfig-012-20231027   gcc  
x86_64                randconfig-013-20231027   gcc  
x86_64                randconfig-014-20231027   gcc  
x86_64                randconfig-015-20231027   gcc  
x86_64                randconfig-016-20231027   gcc  
x86_64                randconfig-071-20231027   gcc  
x86_64                randconfig-072-20231027   gcc  
x86_64                randconfig-073-20231027   gcc  
x86_64                randconfig-074-20231027   gcc  
x86_64                randconfig-075-20231027   gcc  
x86_64                randconfig-076-20231027   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
