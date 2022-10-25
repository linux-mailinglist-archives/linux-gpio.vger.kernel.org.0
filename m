Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E75F60C37D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 07:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiJYFvJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 01:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiJYFvG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 01:51:06 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFCB5D0D8
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 22:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666677063; x=1698213063;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LwyUhAbbIGMvj4jkVVtvAIGf6AuB+Layp2twgqyyJA8=;
  b=mYL3effJtiDxE2KLUWqD+jWByi4isVEfox4rYVrUx7VX7YP6sjYVYXUJ
   Ti3Rw6smx0jQMxvEy4IQZ+1jfbYQclUfd7oVHDr0qWcJCNscLM/PEzRZw
   j27B9ctTHJFemAZuSitZG+APPhNxAMFLn+6olpg5afkoQdBPyeJmxMQ0c
   6WGmzuoskI8nmFz+jwAy8PsiTc9pJkuUyR/08Sg7dNR/TbnWkUAt525tl
   s7mIRtmtkMr0u0Ld5irL0N6HzFwNcpD8tjaLWt5UpTy1Yepa/rvKmDRPZ
   EbhwlNpk/Uhwdmo/O9jcsx3aWdPZkq4+6tagHRtihyCZhos5PUOoSRd1x
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="294996276"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="294996276"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 22:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="960693630"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="960693630"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2022 22:51:01 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onCq4-0005y0-1f;
        Tue, 25 Oct 2022 05:51:00 +0000
Date:   Tue, 25 Oct 2022 13:50:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-media] BUILD SUCCESS
 8f57d00df1ea3a865f55a2e498170d429c0be6f5
Message-ID: <6357790c.ktXS38WxedYd5+Lf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-media
branch HEAD: 8f57d00df1ea3a865f55a2e498170d429c0be6f5  media: s5k4ecgx: Switch to GPIO descriptors

elapsed time: 886m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
arc                  randconfig-r043-20221024
riscv                randconfig-r042-20221024
s390                 randconfig-r044-20221024
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
ia64                             allmodconfig
i386                 randconfig-a011-20221024
i386                 randconfig-a013-20221024
i386                 randconfig-a012-20221024
x86_64                           rhel-8.3-kvm
i386                 randconfig-a014-20221024
i386                 randconfig-a016-20221024
x86_64                         rhel-8.3-kunit
i386                 randconfig-a015-20221024
x86_64                           rhel-8.3-syz
arm                                 defconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                             allyesconfig
m68k                             allmodconfig
x86_64               randconfig-k001-20221024
arm64                            allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
arm                              allyesconfig
mips                             allyesconfig
sh                               allmodconfig
i386                          randconfig-c001
powerpc                          allmodconfig
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
powerpc                   motionpro_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                            defconfig
m68k                            q40_defconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear6xx_defconfig
powerpc                      tqm8xx_defconfig
powerpc                 mpc834x_mds_defconfig
mips                            gpr_defconfig
sh                        sh7763rdp_defconfig
ia64                             allyesconfig
sh                             shx3_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
sh                         ap325rxa_defconfig
ia64                      gensparse_defconfig
arm                          pxa910_defconfig
i386                 randconfig-c001-20221024
arc                  randconfig-r043-20221023
parisc                generic-64bit_defconfig
sh                           se7712_defconfig
arm                        mini2440_defconfig
powerpc                      chrp32_defconfig
sh                          lboxre2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arc                              alldefconfig
sh                        dreamcast_defconfig
sh                          polaris_defconfig
riscv                    nommu_k210_defconfig
xtensa                    xip_kc705_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                       m5249evb_defconfig
arm                       aspeed_g5_defconfig
powerpc                  storcenter_defconfig
powerpc                 canyonlands_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                     tqm8555_defconfig
mips                     decstation_defconfig
arm                           h5000_defconfig
arm                       multi_v4t_defconfig

clang tested configs:
hexagon              randconfig-r041-20221024
hexagon              randconfig-r045-20221024
x86_64               randconfig-a001-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a003-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a004-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221023
mips                     loongson2k_defconfig
arm                          moxart_defconfig
arm                         s3c2410_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
