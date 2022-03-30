Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D26C4EC8B6
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Mar 2022 17:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiC3PtR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 11:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345814AbiC3PtR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 11:49:17 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16CA920E942
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648655252; x=1680191252;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1brr2KW+OsGY0ow9URJ7VIAl4jZhlMFG0y6dQIt6KUQ=;
  b=Az6P8xf9H2qMcCwVDmxdK2tDGJUFUz5YsvuH7Yy374pkCLA9asEICgAO
   J4glD3gPkvorfdzVceHxlGb7ASYex/bSmUzdvJVacpes8miIMPzrBWOLd
   P4TcF//KObvalOrUQyHVHlSGZWdBEwCtcU+nQqWzmp2TjfWiSFXWrZZH5
   EhFBoRReIZeH9kN+tXTO9sgnvcpiLgX+2j2yIhVu9mXhHmsUbTbNVjEru
   gOWq0zSSL0hqcwKanZjHefvzTEVu9chkV53Wy1S1X0KtQgS7BoyvCReh9
   2eRa5bAXkSK1vQQB9Knq1G7YoaECH6P76hh2z9xf0cpKAWg/4CtA9wm9/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259759663"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="259759663"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 08:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="618574480"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2022 08:47:15 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nZaXT-00009X-5r;
        Wed, 30 Mar 2022 15:47:15 +0000
Date:   Wed, 30 Mar 2022 23:46:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4a6d01495a167762de1691eb51e0413954db20eb
Message-ID: <62447b69.YfGYEKs7nN3IUzfu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4a6d01495a167762de1691eb51e0413954db20eb  pinctrl: mediatek: common-v1: fix semicolon.cocci warnings

elapsed time: 4500m

configs tested: 282
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220328
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
ia64                             allyesconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
riscv                            allyesconfig
um                             i386_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
s390                             allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
sparc                            allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                           allyesconfig
xtensa                           allyesconfig
m68k                        mvme147_defconfig
m68k                          sun3x_defconfig
powerpc                  iss476-smp_defconfig
powerpc64                           defconfig
m68k                            mac_defconfig
h8300                    h8300h-sim_defconfig
sh                           se7619_defconfig
sh                          urquell_defconfig
powerpc                     pq2fads_defconfig
ia64                          tiger_defconfig
mips                       capcella_defconfig
powerpc                       ppc64_defconfig
m68k                            q40_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7722_defconfig
sh                             shx3_defconfig
powerpc                     asp8347_defconfig
alpha                            alldefconfig
powerpc                      bamboo_defconfig
mips                         mpc30x_defconfig
sh                           sh2007_defconfig
nios2                         3c120_defconfig
sh                          rsk7269_defconfig
m68k                       m5275evb_defconfig
openrisc                            defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
csky                                defconfig
arm                           sama5_defconfig
m68k                       bvme6000_defconfig
xtensa                              defconfig
powerpc                       maple_defconfig
arm                          badge4_defconfig
ia64                      gensparse_defconfig
sh                         ap325rxa_defconfig
arm                           imxrt_defconfig
powerpc                      ppc6xx_defconfig
arc                                 defconfig
sh                         apsh4a3a_defconfig
arm                          exynos_defconfig
arm                          simpad_defconfig
parisc                           alldefconfig
arm                            pleb_defconfig
sparc                       sparc64_defconfig
powerpc                     stx_gp3_defconfig
arc                         haps_hs_defconfig
mips                            ar7_defconfig
mips                           ci20_defconfig
sh                      rts7751r2d1_defconfig
m68k                         apollo_defconfig
ia64                                defconfig
parisc64                            defconfig
arc                        nsim_700_defconfig
arm                        mvebu_v7_defconfig
m68k                       m5249evb_defconfig
arm                           sunxi_defconfig
sh                           se7705_defconfig
powerpc                    klondike_defconfig
arc                          axs101_defconfig
arc                            hsdk_defconfig
nios2                               defconfig
arm64                            alldefconfig
powerpc                         wii_defconfig
mips                           gcw0_defconfig
nios2                            allyesconfig
i386                             alldefconfig
arc                     haps_hs_smp_defconfig
sparc64                             defconfig
x86_64                              defconfig
arm                             pxa_defconfig
powerpc                     ep8248e_defconfig
xtensa                       common_defconfig
nios2                         10m50_defconfig
sh                          kfr2r09_defconfig
parisc                generic-64bit_defconfig
mips                          rb532_defconfig
m68k                        m5272c3_defconfig
powerpc                      makalu_defconfig
arc                        nsimosci_defconfig
arm                     eseries_pxa_defconfig
arm                         assabet_defconfig
mips                     loongson1b_defconfig
sh                          r7785rp_defconfig
arm                            hisi_defconfig
sh                           se7206_defconfig
sh                          sdk7780_defconfig
m68k                         amcore_defconfig
um                               alldefconfig
sh                          r7780mp_defconfig
m68k                       m5208evb_defconfig
m68k                                defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      pasemi_defconfig
m68k                          atari_defconfig
arm                             rpc_defconfig
microblaze                      mmu_defconfig
m68k                             alldefconfig
sh                               j2_defconfig
arm                        mini2440_defconfig
sh                     magicpanelr2_defconfig
sh                           se7750_defconfig
arm                         s3c6400_defconfig
arm                        realview_defconfig
arm                         lpc18xx_defconfig
arm                           stm32_defconfig
um                                  defconfig
powerpc                     redwood_defconfig
sh                            hp6xx_defconfig
m68k                          multi_defconfig
xtensa                    xip_kc705_defconfig
arm                       aspeed_g5_defconfig
sh                           se7343_defconfig
s390                       zfcpdump_defconfig
h8300                       h8s-sim_defconfig
arc                              allyesconfig
mips                        bcm47xx_defconfig
arm                        trizeps4_defconfig
powerpc                   motionpro_defconfig
arm                           h3600_defconfig
sh                             espt_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                        mvme16x_defconfig
arm                          pxa3xx_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          pxa910_defconfig
sh                          landisk_defconfig
sh                          rsk7264_defconfig
csky                             alldefconfig
s390                                defconfig
arm                        multi_v7_defconfig
openrisc                 simple_smp_defconfig
powerpc                  storcenter_defconfig
arm                         axm55xx_defconfig
powerpc                   currituck_defconfig
arm                           tegra_defconfig
xtensa                           alldefconfig
arm                  randconfig-c002-20220327
arm                  randconfig-c002-20220329
alpha                               defconfig
alpha                            allyesconfig
parisc                              defconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a001-20220328
x86_64               randconfig-a003-20220328
x86_64               randconfig-a004-20220328
x86_64               randconfig-a002-20220328
x86_64               randconfig-a005-20220328
x86_64               randconfig-a006-20220328
i386                 randconfig-a001-20220328
i386                 randconfig-a003-20220328
i386                 randconfig-a006-20220328
i386                 randconfig-a005-20220328
i386                 randconfig-a004-20220328
i386                 randconfig-a002-20220328
i386                          randconfig-a005
i386                          randconfig-a003
i386                          randconfig-a001
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a016
i386                          randconfig-a014
i386                          randconfig-a012
riscv                randconfig-r042-20220327
s390                 randconfig-r044-20220327
arc                  randconfig-r043-20220327
arc                  randconfig-r043-20220328
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220327
arm                  randconfig-c002-20220327
riscv                randconfig-c006-20220327
powerpc              randconfig-c003-20220327
i386                          randconfig-c001
s390                 randconfig-c005-20220327
mips                 randconfig-c004-20220328
arm                  randconfig-c002-20220328
x86_64               randconfig-c007-20220328
powerpc              randconfig-c003-20220328
riscv                randconfig-c006-20220328
i386                 randconfig-c001-20220328
s390                 randconfig-c005-20220328
arm                  colibri_pxa300_defconfig
powerpc                      acadia_defconfig
x86_64                           allyesconfig
powerpc                     tqm8540_defconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
arm                         s5pv210_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                  cavium_octeon_defconfig
arm                         mv78xx0_defconfig
mips                           ip27_defconfig
powerpc                      walnut_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc836x_mds_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
arm                        magician_defconfig
arm                             mxs_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                        multi_v5_defconfig
mips                      bmips_stb_defconfig
powerpc                      pmac32_defconfig
arm                       imx_v4_v5_defconfig
arm                           omap1_defconfig
arm                       spear13xx_defconfig
arm                          imote2_defconfig
mips                       rbtx49xx_defconfig
powerpc                     ksi8560_defconfig
powerpc                        icon_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a016-20220328
x86_64               randconfig-a012-20220328
x86_64               randconfig-a011-20220328
x86_64               randconfig-a014-20220328
x86_64               randconfig-a013-20220328
x86_64               randconfig-a015-20220328
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a015-20220328
i386                 randconfig-a016-20220328
i386                 randconfig-a011-20220328
i386                 randconfig-a012-20220328
i386                 randconfig-a014-20220328
i386                 randconfig-a013-20220328
riscv                randconfig-r042-20220328
hexagon              randconfig-r045-20220328
hexagon              randconfig-r041-20220328
hexagon              randconfig-r041-20220327
hexagon              randconfig-r045-20220327

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
