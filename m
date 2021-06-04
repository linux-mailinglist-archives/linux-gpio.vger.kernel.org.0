Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7DA39B1E5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 07:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhFDFWj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 01:22:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:60899 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhFDFWi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Jun 2021 01:22:38 -0400
IronPort-SDR: eNRapzMMmYzIAO4oKxWZQcgDEIebpG4nb9WweJwSjbzNm22QtviQUOmAuvOjjXU6Ec1UR5s5H/
 1jrwJjQ8je0A==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="225538013"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="225538013"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 22:20:52 -0700
IronPort-SDR: KoO5e8QZvf3jsaVK0pNC5Bl66T6/dZV3o9/XdehQeODcok+Hs10ZIljUgZmIWq/+FxSKScnRV7
 4fZGthPKX4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; 
   d="scan'208";a="618146619"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Jun 2021 22:20:51 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lp2GI-0006gN-Cy; Fri, 04 Jun 2021 05:20:50 +0000
Date:   Fri, 04 Jun 2021 13:20:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 2aefadc09b35c59ee3912b66984d617ee5510a55
Message-ID: <60b9b80c.YLq9Yv2VnqKfOgZb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 2aefadc09b35c59ee3912b66984d617ee5510a55  Merge branch 'devel' into for-next

elapsed time: 9649m

configs tested: 316
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            zeus_defconfig
arm                         s5pv210_defconfig
sh                        sh7757lcr_defconfig
arc                          axs101_defconfig
powerpc64                           defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
arm                           viper_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                generic_kc705_defconfig
arm                         s3c6400_defconfig
m68k                       m5249evb_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                              alldefconfig
powerpc                       ebony_defconfig
arm                            mps2_defconfig
arm                         orion5x_defconfig
powerpc                        icon_defconfig
mips                      maltaaprp_defconfig
powerpc                      pasemi_defconfig
powerpc                     rainier_defconfig
powerpc                   currituck_defconfig
m68k                           sun3_defconfig
arm                     davinci_all_defconfig
mips                         bigsur_defconfig
mips                            ar7_defconfig
m68k                            mac_defconfig
powerpc                     ppa8548_defconfig
s390                             allyesconfig
arm                       cns3420vb_defconfig
arm                         vf610m4_defconfig
mips                           ip22_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         at91_dt_defconfig
mips                        omega2p_defconfig
arm                      footbridge_defconfig
arm                          exynos_defconfig
powerpc                      ppc40x_defconfig
arm                           sunxi_defconfig
arm                            qcom_defconfig
mips                malta_qemu_32r6_defconfig
m68k                          sun3x_defconfig
sh                            shmin_defconfig
mips                 decstation_r4k_defconfig
m68k                          hp300_defconfig
sh                            titan_defconfig
sh                          rsk7203_defconfig
openrisc                  or1klitex_defconfig
mips                          rm200_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                          allyesconfig
arm                        cerfcube_defconfig
microblaze                      mmu_defconfig
powerpc                      ppc44x_defconfig
m68k                       m5275evb_defconfig
m68k                        mvme147_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
nios2                         3c120_defconfig
sh                          rsk7264_defconfig
m68k                          atari_defconfig
s390                                defconfig
arm                             pxa_defconfig
mips                        jmr3927_defconfig
arm                          iop32x_defconfig
microblaze                          defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                    sam440ep_defconfig
ia64                             allmodconfig
arm                          collie_defconfig
arm                       mainstone_defconfig
sh                             espt_defconfig
mips                       bmips_be_defconfig
arm                      integrator_defconfig
ia64                             allyesconfig
mips                           gcw0_defconfig
arm                     eseries_pxa_defconfig
powerpc                      katmai_defconfig
powerpc                        cell_defconfig
mips                      bmips_stb_defconfig
m68k                         amcore_defconfig
mips                          rb532_defconfig
openrisc                 simple_smp_defconfig
nds32                             allnoconfig
mips                           ip27_defconfig
m68k                       bvme6000_defconfig
arm                          lpd270_defconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
powerpc                    socrates_defconfig
arm                           spitz_defconfig
mips                    maltaup_xpa_defconfig
xtensa                         virt_defconfig
arc                 nsimosci_hs_smp_defconfig
i386                                defconfig
arc                              alldefconfig
arm                         s3c2410_defconfig
um                           x86_64_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                            zx1_defconfig
mips                        vocore2_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                        bcm47xx_defconfig
arm                        spear3xx_defconfig
arm                        spear6xx_defconfig
powerpc                      arches_defconfig
um                             i386_defconfig
m68k                             alldefconfig
arm                             rpc_defconfig
arm                          ep93xx_defconfig
mips                          ath79_defconfig
m68k                        stmark2_defconfig
mips                           ip28_defconfig
m68k                       m5475evb_defconfig
arm                         palmz72_defconfig
sh                     magicpanelr2_defconfig
sh                               alldefconfig
sh                          sdk7780_defconfig
arm                       aspeed_g5_defconfig
sh                               j2_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        realview_defconfig
mips                      pistachio_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                  mpc866_ads_defconfig
mips                        workpad_defconfig
sh                               allmodconfig
arm                        mini2440_defconfig
mips                            e55_defconfig
powerpc                      chrp32_defconfig
sh                           se7721_defconfig
sh                          rsk7269_defconfig
sh                          r7785rp_defconfig
mips                          ath25_defconfig
powerpc                     stx_gp3_defconfig
mips                        nlm_xlp_defconfig
xtensa                    smp_lx200_defconfig
arc                     nsimosci_hs_defconfig
arm                       imx_v4_v5_defconfig
sparc64                          alldefconfig
sh                          polaris_defconfig
powerpc                      obs600_defconfig
powerpc                        fsp2_defconfig
arm                        multi_v7_defconfig
mips                         mpc30x_defconfig
sh                           se7343_defconfig
mips                            gpr_defconfig
powerpc                           allnoconfig
sh                          urquell_defconfig
parisc                generic-32bit_defconfig
sh                           sh2007_defconfig
sh                          lboxre2_defconfig
powerpc                     mpc5200_defconfig
m68k                          amiga_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
ia64                             alldefconfig
openrisc                    or1ksim_defconfig
mips                       capcella_defconfig
mips                      maltasmvp_defconfig
arm                  colibri_pxa300_defconfig
sh                           se7206_defconfig
arm64                            alldefconfig
riscv             nommu_k210_sdcard_defconfig
mips                       rbtx49xx_defconfig
mips                        qi_lb60_defconfig
sh                          r7780mp_defconfig
powerpc               mpc834x_itxgp_defconfig
alpha                            allyesconfig
xtensa                       common_defconfig
arm                        keystone_defconfig
arm                  colibri_pxa270_defconfig
mips                     loongson1b_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        oxnas_v6_defconfig
arm                          gemini_defconfig
arm                           sama5_defconfig
arc                         haps_hs_defconfig
sh                           se7619_defconfig
x86_64                            allnoconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20210526
x86_64               randconfig-a001-20210526
x86_64               randconfig-a006-20210526
x86_64               randconfig-a003-20210526
x86_64               randconfig-a004-20210526
x86_64               randconfig-a002-20210526
x86_64               randconfig-a006-20210531
x86_64               randconfig-a003-20210531
x86_64               randconfig-a005-20210531
x86_64               randconfig-a004-20210531
x86_64               randconfig-a002-20210531
x86_64               randconfig-a001-20210531
x86_64               randconfig-a001-20210528
x86_64               randconfig-a006-20210528
x86_64               randconfig-a005-20210528
x86_64               randconfig-a003-20210528
x86_64               randconfig-a004-20210528
x86_64               randconfig-a002-20210528
i386                 randconfig-a001-20210528
i386                 randconfig-a005-20210528
i386                 randconfig-a002-20210528
i386                 randconfig-a006-20210528
i386                 randconfig-a004-20210528
i386                 randconfig-a003-20210528
i386                 randconfig-a002-20210531
i386                 randconfig-a001-20210531
i386                 randconfig-a005-20210531
i386                 randconfig-a006-20210531
i386                 randconfig-a004-20210531
i386                 randconfig-a003-20210531
i386                 randconfig-a001-20210529
i386                 randconfig-a005-20210529
i386                 randconfig-a002-20210529
i386                 randconfig-a006-20210529
i386                 randconfig-a003-20210529
i386                 randconfig-a004-20210529
i386                 randconfig-a001-20210526
i386                 randconfig-a002-20210526
i386                 randconfig-a005-20210526
i386                 randconfig-a004-20210526
i386                 randconfig-a003-20210526
i386                 randconfig-a006-20210526
x86_64               randconfig-a013-20210529
x86_64               randconfig-a014-20210529
x86_64               randconfig-a012-20210529
x86_64               randconfig-a016-20210529
x86_64               randconfig-a015-20210529
x86_64               randconfig-a011-20210529
i386                 randconfig-a016-20210529
i386                 randconfig-a011-20210529
i386                 randconfig-a015-20210529
i386                 randconfig-a012-20210529
i386                 randconfig-a014-20210529
i386                 randconfig-a013-20210529
i386                 randconfig-a016-20210528
i386                 randconfig-a011-20210528
i386                 randconfig-a015-20210528
i386                 randconfig-a012-20210528
i386                 randconfig-a014-20210528
i386                 randconfig-a013-20210528
i386                 randconfig-a016-20210531
i386                 randconfig-a015-20210531
i386                 randconfig-a013-20210531
i386                 randconfig-a012-20210531
i386                 randconfig-a014-20210531
i386                 randconfig-a011-20210531
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210528
x86_64               randconfig-b001-20210529
x86_64               randconfig-b001-20210531
x86_64               randconfig-b001-20210527
x86_64               randconfig-a013-20210528
x86_64               randconfig-a014-20210528
x86_64               randconfig-a012-20210528
x86_64               randconfig-a016-20210528
x86_64               randconfig-a015-20210528
x86_64               randconfig-a011-20210528
x86_64               randconfig-a013-20210526
x86_64               randconfig-a012-20210526
x86_64               randconfig-a014-20210526
x86_64               randconfig-a016-20210526
x86_64               randconfig-a015-20210526
x86_64               randconfig-a011-20210526
x86_64               randconfig-a014-20210531
x86_64               randconfig-a012-20210531
x86_64               randconfig-a013-20210531
x86_64               randconfig-a016-20210531
x86_64               randconfig-a015-20210531
x86_64               randconfig-a011-20210531
x86_64               randconfig-a006-20210529
x86_64               randconfig-a001-20210529
x86_64               randconfig-a005-20210529
x86_64               randconfig-a003-20210529
x86_64               randconfig-a004-20210529
x86_64               randconfig-a002-20210529

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
