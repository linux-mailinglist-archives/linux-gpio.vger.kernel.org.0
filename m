Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8832B7AFA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 11:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgKRKN0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 05:13:26 -0500
Received: from mga01.intel.com ([192.55.52.88]:54929 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgKRKN0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Nov 2020 05:13:26 -0500
IronPort-SDR: R+58pK+KUTJWESw3aiieDLehnil4PWwe2FVoTF0Xp9eBFqmT1YIEbSt10pD7odDO5popcH9eUA
 IuSvSt2127WA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="189168821"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="189168821"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 02:13:25 -0800
IronPort-SDR: O80BwckpBlqmkh870XGeaRpW3s9/laRRK9/p3gck3v9TgKvwwB4MB0s+wBoux0FjOBDediGJJP
 edh6vDJgG/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="330427469"
Received: from lkp-server02.sh.intel.com (HELO 67996b229c47) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Nov 2020 02:13:22 -0800
Received: from kbuild by 67996b229c47 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kfKSn-00002p-G2; Wed, 18 Nov 2020 10:13:21 +0000
Date:   Wed, 18 Nov 2020 18:13:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 5fa9c5f9a4076d32913b5857bac7620f46f27267
Message-ID: <5fb4f3ac.OudMfIMkiYB4Z57B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 5fa9c5f9a4076d32913b5857bac7620f46f27267  Merge tag 'intel-pinctrl-v5.10-3' of gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes

elapsed time: 726m

configs tested: 173
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
sh                         microdev_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
arm                            hisi_defconfig
arm                         assabet_defconfig
powerpc                     kmeter1_defconfig
sh                     sh7710voipgw_defconfig
sh                         ecovec24_defconfig
powerpc                 mpc8315_rdb_defconfig
arc                          axs101_defconfig
c6x                        evmc6678_defconfig
sh                        sh7785lcr_defconfig
arm                          pxa910_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          landisk_defconfig
powerpc                        warp_defconfig
arm                            u300_defconfig
mips                           ci20_defconfig
arm                      tct_hammer_defconfig
c6x                         dsk6455_defconfig
csky                             alldefconfig
sparc64                             defconfig
arm                        cerfcube_defconfig
arm                           viper_defconfig
arc                         haps_hs_defconfig
sh                   sh7770_generic_defconfig
arm                          tango4_defconfig
mips                      loongson3_defconfig
arm                            mps2_defconfig
arc                     nsimosci_hs_defconfig
mips                            ar7_defconfig
powerpc                      cm5200_defconfig
mips                          malta_defconfig
openrisc                    or1ksim_defconfig
arm                         hackkit_defconfig
m68k                         apollo_defconfig
mips                          rm200_defconfig
mips                  decstation_64_defconfig
sh                            hp6xx_defconfig
arm                         shannon_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                    gamecube_defconfig
arm                       mainstone_defconfig
mips                       bmips_be_defconfig
xtensa                       common_defconfig
arm                        neponset_defconfig
arm                            zeus_defconfig
arm                        clps711x_defconfig
sh                         ap325rxa_defconfig
mips                     cu1000-neo_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          rsk7203_defconfig
powerpc                      pcm030_defconfig
openrisc                         alldefconfig
sparc                               defconfig
powerpc                     kilauea_defconfig
powerpc                  mpc866_ads_defconfig
arm                              zx_defconfig
powerpc                     mpc83xx_defconfig
sh                             shx3_defconfig
powerpc                     ppa8548_defconfig
powerpc                    adder875_defconfig
m68k                         amcore_defconfig
mips                            e55_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                               j2_defconfig
arm                          exynos_defconfig
xtensa                  cadence_csp_defconfig
sh                          polaris_defconfig
arm                            lart_defconfig
arm                          prima2_defconfig
h8300                            alldefconfig
mips                      bmips_stb_defconfig
arm                           h5000_defconfig
s390                             alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201117
i386                 randconfig-a005-20201117
i386                 randconfig-a001-20201117
i386                 randconfig-a003-20201117
i386                 randconfig-a002-20201117
i386                 randconfig-a004-20201117
x86_64               randconfig-a005-20201118
x86_64               randconfig-a003-20201118
x86_64               randconfig-a004-20201118
x86_64               randconfig-a002-20201118
x86_64               randconfig-a006-20201118
x86_64               randconfig-a001-20201118
i386                 randconfig-a012-20201117
i386                 randconfig-a014-20201117
i386                 randconfig-a016-20201117
i386                 randconfig-a011-20201117
i386                 randconfig-a013-20201117
i386                 randconfig-a015-20201117
i386                 randconfig-a012-20201118
i386                 randconfig-a014-20201118
i386                 randconfig-a016-20201118
i386                 randconfig-a011-20201118
i386                 randconfig-a013-20201118
i386                 randconfig-a015-20201118
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201117
x86_64               randconfig-a005-20201117
x86_64               randconfig-a004-20201117
x86_64               randconfig-a002-20201117
x86_64               randconfig-a001-20201117
x86_64               randconfig-a006-20201117
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116
x86_64               randconfig-a015-20201118
x86_64               randconfig-a014-20201118
x86_64               randconfig-a011-20201118
x86_64               randconfig-a013-20201118
x86_64               randconfig-a016-20201118
x86_64               randconfig-a012-20201118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
