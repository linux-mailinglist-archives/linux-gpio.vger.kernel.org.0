Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4D172B1A4
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jun 2023 13:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjFKLWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 07:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233606AbjFKLWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 07:22:04 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7831730
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 04:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686482523; x=1718018523;
  h=date:from:to:cc:subject:message-id;
  bh=wD56mfUjMwYUL/WrIr3Kc2nHf4ffnBNKgvZOgts+bug=;
  b=O2i1uyHH/tB+slyzqzbckcMGIR8w2v1pvSAyQTEMPFH/FJW9nVJYOwHp
   RWuLWIHmHaky4sX6fLzC/2PH2GdyBEi5bHXxdz1v4fJRbsj4MvSe0bsHq
   hnAnPtYeccQ+0xo2STc8ZK0Lz5UoS+ybZYaMGZhwqBG3n5DUEWpIJeJb0
   l20fO/TaAieyx8VbX1rmDlR2AOj6RsME4JxmKPJ25rF4tt8C7EJr3D5G0
   7QVGqprND1j3I/xQa8Bo8YFUQSuPCZwCXuO8FWJujzDBQrU5p/y3rLfya
   ucvGEugmFrkpIl3mUBzHQ3TK3RkhnHqSrq9umBPnjmtsDRe0qWkl+7Kgg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="444220838"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="444220838"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 04:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="885095456"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="885095456"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jun 2023 04:22:01 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q8J8y-000ApY-2T;
        Sun, 11 Jun 2023 11:22:00 +0000
Date:   Sun, 11 Jun 2023 19:21:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 4e739807ca96e56d0a7f6256f13c4ff416850ef9
Message-ID: <202306111944.H7YCtAiA-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 4e739807ca96e56d0a7f6256f13c4ff416850ef9  Merge tag 'qcom-pinctrl-6.5' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt into devel

elapsed time: 971m

configs tested: 136
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230611   gcc  
alpha                randconfig-r035-20230611   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                  randconfig-r031-20230611   gcc  
arc                  randconfig-r036-20230611   gcc  
arc                  randconfig-r043-20230611   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                            mmp2_defconfig   clang
arm                             mxs_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r046-20230611   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230611   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r001-20230611   clang
hexagon              randconfig-r041-20230611   clang
hexagon              randconfig-r045-20230611   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230611   gcc  
i386                 randconfig-i002-20230611   gcc  
i386                 randconfig-i003-20230611   gcc  
i386                 randconfig-i004-20230611   gcc  
i386                 randconfig-i005-20230611   gcc  
i386                 randconfig-i006-20230611   gcc  
i386                 randconfig-i011-20230611   clang
i386                 randconfig-i012-20230611   clang
i386                 randconfig-i013-20230611   clang
i386                 randconfig-i014-20230611   clang
i386                 randconfig-i015-20230611   clang
i386                 randconfig-i016-20230611   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r012-20230611   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r003-20230611   gcc  
m68k                           sun3_defconfig   gcc  
m68k                           virt_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230611   clang
mips                     decstation_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allyesconfig   gcc  
nios2        buildonly-randconfig-r002-20230611   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230611   gcc  
nios2                randconfig-r025-20230611   gcc  
openrisc                         alldefconfig   gcc  
openrisc             randconfig-r006-20230611   gcc  
openrisc             randconfig-r013-20230611   gcc  
openrisc             randconfig-r024-20230611   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r003-20230611   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230611   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r023-20230611   clang
powerpc              randconfig-r026-20230611   clang
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv        buildonly-randconfig-r005-20230611   clang
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r021-20230611   clang
riscv                randconfig-r042-20230611   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230611   clang
sh                               allmodconfig   gcc  
sh                               j2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230611   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r006-20230611   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230611   gcc  
x86_64               randconfig-a002-20230611   gcc  
x86_64               randconfig-a003-20230611   gcc  
x86_64               randconfig-a004-20230611   gcc  
x86_64               randconfig-a005-20230611   gcc  
x86_64               randconfig-a006-20230611   gcc  
x86_64               randconfig-a011-20230611   clang
x86_64               randconfig-a012-20230611   clang
x86_64               randconfig-a013-20230611   clang
x86_64               randconfig-a014-20230611   clang
x86_64               randconfig-a015-20230611   clang
x86_64               randconfig-a016-20230611   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r033-20230611   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
