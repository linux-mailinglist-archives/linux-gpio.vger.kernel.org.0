Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA58555DFD0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343636AbiF1Gs0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 02:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243998AbiF1GsZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 02:48:25 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AFC11A06
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 23:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656398905; x=1687934905;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kdT2e/XtM3s112/JiCqkGYfCOiGDh4jTaaROz/CknQU=;
  b=UVSKkHz+H9ZwzDI0O6oYViHvvHpWMSelXHtCz/sW+0c2H6qJuhYTT+KR
   brx1UXM8zlxVuc9FbK+K8tgDP4injb6A1cEOL+KnYkpWmrFLQZ6zpqDkH
   3RnkRBeosAj4m0Yy4uss35gtCAvd7gSGv1lYgomgYSG7etXLs2Ksai3Gq
   yZyfSWpKbyeXkrYFz4gZ1mPWHjw2WZ2saPx+yR0OPnV0kWBkyKNfJX3yc
   N34kIrxRPhjsnY0j0Spphl0COuLCKbLUA786PdlDwCtQu2lJPNySkLPeq
   OwF3DHKvZj1G1IIL0veEwXZcuUmJVT3JWVPUkOrjP61qvg2A4adUUUIje
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="281690477"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="281690477"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 23:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="836548478"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2022 23:48:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6518-0009eG-Ta;
        Tue, 28 Jun 2022 06:48:10 +0000
Date:   Tue, 28 Jun 2022 14:47:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 7885256e5adc5b6d7cc846261711d2091484498a
Message-ID: <62baa3fb.8H9jdFlZQSNn3PMo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 7885256e5adc5b6d7cc846261711d2091484498a  Merge branch 'devel' into for-next

elapsed time: 1778m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220627
m68k                       m5208evb_defconfig
sh                        sh7763rdp_defconfig
ia64                             alldefconfig
s390                          debug_defconfig
arm                          gemini_defconfig
sparc64                             defconfig
sparc64                          alldefconfig
mips                           xway_defconfig
sh                        sh7785lcr_defconfig
arm                        spear6xx_defconfig
xtensa                    smp_lx200_defconfig
powerpc                       holly_defconfig
arm                          pxa910_defconfig
mips                      maltasmvp_defconfig
arc                        nsim_700_defconfig
arc                           tb10x_defconfig
sh                   sh7770_generic_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
arm                        multi_v7_defconfig
powerpc                     tqm8541_defconfig
sh                        dreamcast_defconfig
arm                        shmobile_defconfig
powerpc                     mpc83xx_defconfig
sh                           se7750_defconfig
sh                         ap325rxa_defconfig
openrisc                 simple_smp_defconfig
sh                          rsk7201_defconfig
sh                          sdk7780_defconfig
arm                            lart_defconfig
sh                     magicpanelr2_defconfig
mips                             allmodconfig
sh                         ecovec24_defconfig
arm                         cm_x300_defconfig
riscv                    nommu_k210_defconfig
arm                           sama5_defconfig
arc                      axs103_smp_defconfig
arm                       omap2plus_defconfig
powerpc                         ps3_defconfig
arm                        realview_defconfig
m68k                          sun3x_defconfig
powerpc                      bamboo_defconfig
arc                     haps_hs_smp_defconfig
xtensa                    xip_kc705_defconfig
parisc                           allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64               randconfig-c001-20220627
arm                  randconfig-c002-20220627
ia64                             allmodconfig
x86_64               randconfig-k001-20220627
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64               randconfig-a013-20220627
x86_64               randconfig-a012-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a015-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a014-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a016-20220627
i386                 randconfig-a013-20220627
x86_64                        randconfig-a004
x86_64                        randconfig-a006
s390                 randconfig-r044-20220627
arc                  randconfig-r043-20220626
arc                  randconfig-r043-20220627
riscv                randconfig-r042-20220627
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                        multi_v5_defconfig
powerpc                     skiroot_defconfig
powerpc                     ppa8548_defconfig
mips                           rs90_defconfig
arm                           spitz_defconfig
arm                       mainstone_defconfig
mips                       lemote2f_defconfig
powerpc                     akebono_defconfig
powerpc                    socrates_defconfig
powerpc                     tqm5200_defconfig
mips                        bcm63xx_defconfig
arm                     am200epdkit_defconfig
powerpc                      acadia_defconfig
mips                           ip27_defconfig
arm                        neponset_defconfig
powerpc                     ksi8560_defconfig
x86_64               randconfig-a004-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
i386                 randconfig-a005-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a002-20220627
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220626
hexagon              randconfig-r041-20220627
riscv                randconfig-r042-20220626
hexagon              randconfig-r041-20220626
hexagon              randconfig-r045-20220627
s390                 randconfig-r044-20220626

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
