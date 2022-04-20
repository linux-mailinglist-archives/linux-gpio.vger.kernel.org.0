Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529025086A5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 13:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377917AbiDTLLN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 07:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbiDTLLI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 07:11:08 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B2728E1D
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650452903; x=1681988903;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FcIWQhLPnxrucR8sB1X3ROyRtpk9KlYDGFyDsWfNHHQ=;
  b=gE6QzoKNpJaW/ULGEZ6uFhnslsSqZNpURpUDTQNIemj8e31NBNRgEIwD
   iVasLCEJXwbkNlk9XL/4aObUyJfVG1HVHYbTp1EntQMIJaHciuBM1lyWa
   QtVrraHDuvpBmxKO95UQGptVdtFqG5o5lXnTq3Es3t3jsxGpHyCc1do1L
   DAO1vytnsl5DdNIekEL5fZWchfIAYVeZCeoatOi8opf9MQU1uXwf1cUhN
   1EKvU9a+uiyEjanLUoEj9sZh8nRO2lW+gWU192xz6hKNWu2q0H4kdj6vS
   IN231mYPtx2yxGBNN2ZC51O6pXA0FBx9oJ93+o8IQDh+6U+b8XUAgYZWg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="262857597"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="262857597"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 04:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="576537256"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Apr 2022 04:08:21 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nh8C4-0006vi-Mk;
        Wed, 20 Apr 2022 11:08:20 +0000
Date:   Wed, 20 Apr 2022 19:07:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 3a683fa3b5b26e680d51e61e88422be6773ea02e
Message-ID: <625fe96b.iUq5BoOyq4+YKg3+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 3a683fa3b5b26e680d51e61e88422be6773ea02e  Merge branch 'devel' into for-next

elapsed time: 821m

configs tested: 125
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
mips                 randconfig-c004-20220420
sh                              ul2_defconfig
arm                       aspeed_g5_defconfig
nios2                               defconfig
xtensa                    xip_kc705_defconfig
h8300                       h8s-sim_defconfig
powerpc                   motionpro_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                       common_defconfig
arc                      axs103_smp_defconfig
ia64                         bigsur_defconfig
arm                        keystone_defconfig
powerpc                     redwood_defconfig
mips                     loongson1b_defconfig
m68k                         amcore_defconfig
s390                                defconfig
powerpc                      makalu_defconfig
ia64                        generic_defconfig
mips                            ar7_defconfig
sh                           se7721_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        mvme16x_defconfig
arc                            hsdk_defconfig
mips                       bmips_be_defconfig
mips                      loongson3_defconfig
arc                        nsimosci_defconfig
sh                            hp6xx_defconfig
arc                           tb10x_defconfig
arm                          iop32x_defconfig
m68k                        mvme147_defconfig
ia64                             alldefconfig
sh                        dreamcast_defconfig
sh                   rts7751r2dplus_defconfig
mips                         cobalt_defconfig
arc                     nsimosci_hs_defconfig
arm                           u8500_defconfig
sh                           sh2007_defconfig
arm                        mvebu_v7_defconfig
powerpc                     asp8347_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220420
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
riscv                randconfig-c006-20220420
mips                 randconfig-c004-20220420
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220420
powerpc              randconfig-c003-20220420
s390                 randconfig-c005-20220420
mips                        qi_lb60_defconfig
arm                         s3c2410_defconfig
arm                         shannon_defconfig
powerpc                      katmai_defconfig
powerpc                  mpc885_ads_defconfig
arm                         mv78xx0_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220420
riscv                randconfig-r042-20220420
hexagon              randconfig-r045-20220420

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
