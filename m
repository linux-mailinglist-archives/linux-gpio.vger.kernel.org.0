Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF77B50C98A
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 13:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbiDWLU1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Apr 2022 07:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbiDWLUZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Apr 2022 07:20:25 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25BF71A2A
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650712648; x=1682248648;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mTO49vnluYwuIRK/X84PsQByXfJndCuIz7ThrKEcVic=;
  b=nYyFSIYA9zqTJASMHu5TmNTGFbOkL9gUZfXG+IVW5o6TLk4HxFdY7jMT
   SdWG5ySQmhTs91OWWzNBdeNU0nWHGFNSl5WAyby2gd1m7gBU/qI9DAM6T
   euN7fecpw/4mJn+LbNYBwe8PfTbm6O+IJ6XVaprQjO2w1g4T/VsnqNnTM
   0EnVlUNABDakQf7n/DzZhE96LbuLbwOeHW3vmVOdnnUVZHSG0kA4lKI2L
   N4nP3YVsJXx3qudeefjcebll2E/zeJG0r68nH3xSZr9C3J5kLIDsoM93S
   EDTm56K+YsobsxioLd0KGnO04fP8+GiGwDikQABsf5xSlnSqEtLOxN+UP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="262478463"
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="262478463"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2022 04:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,284,1643702400"; 
   d="scan'208";a="563402918"
Received: from lkp-server01.sh.intel.com (HELO dd58949a6e39) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Apr 2022 04:17:18 -0700
Received: from kbuild by dd58949a6e39 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1niDlN-0000CI-K9;
        Sat, 23 Apr 2022 11:17:17 +0000
Date:   Sat, 23 Apr 2022 19:16:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 05d8af449d93e04547b4c6b328e39c890bc803f4
Message-ID: <6263e021.lxuCODU7an0wmFKV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 05d8af449d93e04547b4c6b328e39c890bc803f4  pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested

elapsed time: 727m

configs tested: 118
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                       ppc64_defconfig
powerpc                        cell_defconfig
powerpc                    sam440ep_defconfig
openrisc                 simple_smp_defconfig
sh                               alldefconfig
arm                        shmobile_defconfig
powerpc                       holly_defconfig
powerpc                      ppc40x_defconfig
sh                        edosk7760_defconfig
arc                          axs103_defconfig
sh                              ul2_defconfig
ia64                             allyesconfig
mips                     loongson1b_defconfig
arc                         haps_hs_defconfig
m68k                         apollo_defconfig
m68k                        m5407c3_defconfig
arm                           sunxi_defconfig
arm                           h3600_defconfig
ia64                      gensparse_defconfig
powerpc                      cm5200_defconfig
h8300                    h8300h-sim_defconfig
sh                           se7722_defconfig
arm                            xcep_defconfig
sh                           se7619_defconfig
m68k                       m5475evb_defconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220422
ia64                             allmodconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220422
mips                 randconfig-c004-20220422
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220422
powerpc              randconfig-c003-20220422
arm                  colibri_pxa300_defconfig
mips                      malta_kvm_defconfig
arm                      tct_hammer_defconfig
riscv                    nommu_virt_defconfig
x86_64                           allyesconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      ppc64e_defconfig
powerpc                  mpc885_ads_defconfig
arm                         socfpga_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220422
riscv                randconfig-r042-20220422
hexagon              randconfig-r045-20220422

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
