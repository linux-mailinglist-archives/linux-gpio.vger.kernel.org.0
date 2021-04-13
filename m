Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403CD35E75C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 21:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348178AbhDMT7M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 15:59:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:23574 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231802AbhDMT7G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Apr 2021 15:59:06 -0400
IronPort-SDR: A7cjIZY15JyrklnoZZv5WtcA3vaxZrMn5dFGw/sst/EyL2+ZASFfCyQ2Po6uFPl2ohynjuBEHJ
 O6ksIWfh3PAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="255808538"
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="255808538"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 12:58:37 -0700
IronPort-SDR: SPn3zDFyfPw8crFOHI1HS49+tKftpbJ+auy1EsuMgiRmGxRFFMUsFfQu954TBisPbNpQuMSQNA
 BqrdAnYvTUuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="417993255"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2021 12:58:35 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lWPBC-0001Fu-1C; Tue, 13 Apr 2021 19:58:34 +0000
Date:   Wed, 14 Apr 2021 03:57:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 cbde6c823bfaa553fb162257a5926ba15ebaaa43
Message-ID: <6075f7b6.60Rq3ahzbtzfBiz6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: cbde6c823bfaa553fb162257a5926ba15ebaaa43  pinctrl: at91-pio4: Fix slew rate disablement

elapsed time: 723m

configs tested: 181
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
riscv                            allyesconfig
i386                             allyesconfig
powerpc                       ebony_defconfig
powerpc                     ep8248e_defconfig
mips                        omega2p_defconfig
mips                     loongson1c_defconfig
arm                           stm32_defconfig
arm                        neponset_defconfig
sh                          rsk7269_defconfig
sh                             sh03_defconfig
ia64                                defconfig
openrisc                 simple_smp_defconfig
h8300                       h8s-sim_defconfig
mips                       bmips_be_defconfig
powerpc                 canyonlands_defconfig
mips                  decstation_64_defconfig
arm                              alldefconfig
sh                           se7206_defconfig
s390                             allmodconfig
riscv             nommu_k210_sdcard_defconfig
sh                           se7343_defconfig
arm                       aspeed_g4_defconfig
powerpc                      cm5200_defconfig
arm                   milbeaut_m10v_defconfig
arm                        mvebu_v7_defconfig
mips                          ath79_defconfig
microblaze                          defconfig
arm                       cns3420vb_defconfig
ia64                          tiger_defconfig
arc                        nsim_700_defconfig
sh                          urquell_defconfig
h8300                    h8300h-sim_defconfig
arm                          collie_defconfig
m68k                          hp300_defconfig
powerpc                  storcenter_defconfig
sh                            shmin_defconfig
mips                            gpr_defconfig
ia64                             alldefconfig
powerpc                    socrates_defconfig
powerpc                   lite5200b_defconfig
powerpc                      bamboo_defconfig
arm                            xcep_defconfig
mips                        nlm_xlp_defconfig
powerpc                  iss476-smp_defconfig
sh                               j2_defconfig
arm                            mmp2_defconfig
powerpc                         wii_defconfig
mips                        workpad_defconfig
sh                          polaris_defconfig
powerpc                     tqm5200_defconfig
arm                         assabet_defconfig
sh                          landisk_defconfig
csky                             alldefconfig
powerpc                     tqm8560_defconfig
arm                       spear13xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                           h3600_defconfig
arm                       netwinder_defconfig
arm                            zeus_defconfig
openrisc                         alldefconfig
m68k                          atari_defconfig
powerpc                    gamecube_defconfig
arc                     haps_hs_smp_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
arm                     am200epdkit_defconfig
powerpc                     mpc5200_defconfig
h8300                     edosk2674_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7780_defconfig
powerpc                     pq2fads_defconfig
powerpc                     redwood_defconfig
arm                           corgi_defconfig
arm                          ixp4xx_defconfig
powerpc                     tqm8540_defconfig
arm                         hackkit_defconfig
m68k                       m5208evb_defconfig
arm                             ezx_defconfig
arm                          pxa3xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                     rainier_defconfig
arm                          pxa168_defconfig
mips                           ci20_defconfig
powerpc                 mpc834x_itx_defconfig
sparc64                             defconfig
powerpc                     sequoia_defconfig
powerpc64                        alldefconfig
arm                         bcm2835_defconfig
sh                          rsk7201_defconfig
arc                          axs103_defconfig
sh                           se7750_defconfig
arm                         socfpga_defconfig
mips                         tb0226_defconfig
arm                        clps711x_defconfig
xtensa                generic_kc705_defconfig
arm                      footbridge_defconfig
sparc64                          alldefconfig
arm                      jornada720_defconfig
powerpc                    amigaone_defconfig
powerpc                     powernv_defconfig
sh                        edosk7760_defconfig
sh                        sh7785lcr_defconfig
arc                          axs101_defconfig
powerpc                   motionpro_defconfig
mips                        nlm_xlr_defconfig
m68k                             allyesconfig
mips                         tb0219_defconfig
parisc                generic-32bit_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210413
x86_64               randconfig-a002-20210413
x86_64               randconfig-a001-20210413
x86_64               randconfig-a005-20210413
x86_64               randconfig-a006-20210413
x86_64               randconfig-a004-20210413
i386                 randconfig-a003-20210413
i386                 randconfig-a001-20210413
i386                 randconfig-a006-20210413
i386                 randconfig-a005-20210413
i386                 randconfig-a004-20210413
i386                 randconfig-a002-20210413
i386                 randconfig-a015-20210413
i386                 randconfig-a014-20210413
i386                 randconfig-a013-20210413
i386                 randconfig-a012-20210413
i386                 randconfig-a016-20210413
i386                 randconfig-a011-20210413
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210413
x86_64               randconfig-a015-20210413
x86_64               randconfig-a011-20210413
x86_64               randconfig-a013-20210413
x86_64               randconfig-a012-20210413
x86_64               randconfig-a016-20210413

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
