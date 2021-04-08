Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B173357A33
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 04:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhDHCOi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Apr 2021 22:14:38 -0400
Received: from mga18.intel.com ([134.134.136.126]:57582 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhDHCOi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Apr 2021 22:14:38 -0400
IronPort-SDR: 1xFNLvf/P/bKVy0M4XwQdH6X9ghwRw1nSKPTR1gOzY75uUJN61yIL0jx+M18s+ysSwqyi6teJn
 H1OGYQDB9uHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="180980893"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; 
   d="scan'208";a="180980893"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 19:14:28 -0700
IronPort-SDR: dWxslmztqF+2AhawWBQMMP/C0AuCnRKH7qhmxNIA9fm9ugPmo1HDJevo/3wrMnRh/T/T1mAB4k
 G7OB6x0G1u7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; 
   d="scan'208";a="519660571"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2021 19:14:26 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lUKBd-000E67-P3; Thu, 08 Apr 2021 02:14:25 +0000
Date:   Thu, 08 Apr 2021 10:13:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 b60bab1ddf426da07853d6e8805e0e9a27248011
Message-ID: <606e66e6.lZ8l4Yy5b942xR2j%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b60bab1ddf426da07853d6e8805e0e9a27248011  Merge branch 'devel' into for-next

elapsed time: 736m

configs tested: 216
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
arm                         hackkit_defconfig
arm                           u8500_defconfig
mips                       bmips_be_defconfig
arm                           h5000_defconfig
mips                      loongson3_defconfig
nios2                               defconfig
arc                          axs101_defconfig
alpha                            alldefconfig
s390                                defconfig
mips                        nlm_xlp_defconfig
m68k                                defconfig
powerpc                    amigaone_defconfig
arc                      axs103_smp_defconfig
mips                             allyesconfig
mips                        bcm47xx_defconfig
powerpc                 mpc834x_itx_defconfig
mips                  maltasmvp_eva_defconfig
arm                       netwinder_defconfig
arm                     am200epdkit_defconfig
mips                          rb532_defconfig
powerpc                      chrp32_defconfig
arm                        keystone_defconfig
alpha                            allyesconfig
sh                            shmin_defconfig
mips                           ci20_defconfig
xtensa                         virt_defconfig
arm                         lubbock_defconfig
powerpc                     tqm8555_defconfig
s390                             alldefconfig
sh                           se7619_defconfig
powerpc                 mpc836x_mds_defconfig
mips                           ip28_defconfig
arm                         lpc18xx_defconfig
sh                               alldefconfig
powerpc               mpc834x_itxgp_defconfig
sh                             espt_defconfig
powerpc64                           defconfig
powerpc                    mvme5100_defconfig
m68k                          sun3x_defconfig
arm                         mv78xx0_defconfig
m68k                         amcore_defconfig
powerpc                   currituck_defconfig
sh                            hp6xx_defconfig
arc                     nsimosci_hs_defconfig
powerpc                   motionpro_defconfig
arm                             pxa_defconfig
mips                           ip27_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         socfpga_defconfig
mips                      malta_kvm_defconfig
i386                                defconfig
sh                      rts7751r2d1_defconfig
sh                          rsk7264_defconfig
mips                     loongson1c_defconfig
sh                           se7780_defconfig
s390                       zfcpdump_defconfig
nios2                         3c120_defconfig
m68k                        m5407c3_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc44x_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8272_ads_defconfig
sh                   sh7770_generic_defconfig
arm                          collie_defconfig
arm                     eseries_pxa_defconfig
arm                           sama5_defconfig
xtensa                           alldefconfig
powerpc                     mpc5200_defconfig
arm                       omap2plus_defconfig
csky                                defconfig
arm                        mvebu_v7_defconfig
arm                        neponset_defconfig
sh                          urquell_defconfig
sh                          kfr2r09_defconfig
m68k                        mvme16x_defconfig
xtensa                  audio_kc705_defconfig
xtensa                          iss_defconfig
arm                        spear3xx_defconfig
powerpc                     pq2fads_defconfig
mips                           rs90_defconfig
sh                             shx3_defconfig
m68k                        stmark2_defconfig
arm                  colibri_pxa300_defconfig
arm                         axm55xx_defconfig
arm                      footbridge_defconfig
arm                            zeus_defconfig
openrisc                  or1klitex_defconfig
sh                   rts7751r2dplus_defconfig
mips                      fuloong2e_defconfig
arm                            pleb_defconfig
sh                        sh7757lcr_defconfig
powerpc                       maple_defconfig
arm                        shmobile_defconfig
mips                        maltaup_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                            q40_defconfig
sparc                       sparc32_defconfig
mips                        nlm_xlr_defconfig
sh                          rsk7201_defconfig
arm                             rpc_defconfig
arm                        vexpress_defconfig
powerpc                          allmodconfig
powerpc                 mpc834x_mds_defconfig
sh                           se7721_defconfig
arm                         cm_x300_defconfig
arm                         bcm2835_defconfig
m68k                        m5307c3_defconfig
arm                      tct_hammer_defconfig
powerpc                        warp_defconfig
sh                              ul2_defconfig
mips                           gcw0_defconfig
m68k                       m5249evb_defconfig
sh                        sh7763rdp_defconfig
h8300                               defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1830-neo_defconfig
mips                           ip32_defconfig
powerpc                         ps3_defconfig
x86_64                           alldefconfig
arm                            xcep_defconfig
arm                     davinci_all_defconfig
powerpc                      mgcoge_defconfig
powerpc                         wii_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7203_defconfig
powerpc                      pcm030_defconfig
arm                       multi_v4t_defconfig
arm                       spear13xx_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8541_defconfig
mips                            ar7_defconfig
powerpc                        fsp2_defconfig
um                               allyesconfig
sh                         ap325rxa_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      bamboo_defconfig
mips                      pistachio_defconfig
arm                        trizeps4_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210407
i386                 randconfig-a003-20210407
i386                 randconfig-a001-20210407
i386                 randconfig-a004-20210407
i386                 randconfig-a002-20210407
i386                 randconfig-a005-20210407
i386                 randconfig-a006-20210408
i386                 randconfig-a003-20210408
i386                 randconfig-a001-20210408
i386                 randconfig-a004-20210408
i386                 randconfig-a005-20210408
i386                 randconfig-a002-20210408
x86_64               randconfig-a014-20210407
x86_64               randconfig-a015-20210407
x86_64               randconfig-a013-20210407
x86_64               randconfig-a011-20210407
x86_64               randconfig-a012-20210407
x86_64               randconfig-a016-20210407
i386                 randconfig-a014-20210407
i386                 randconfig-a011-20210407
i386                 randconfig-a012-20210407
i386                 randconfig-a015-20210407
i386                 randconfig-a013-20210407
i386                 randconfig-a016-20210407
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210407
x86_64               randconfig-a003-20210407
x86_64               randconfig-a005-20210407
x86_64               randconfig-a001-20210407
x86_64               randconfig-a002-20210407
x86_64               randconfig-a006-20210407

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
