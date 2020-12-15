Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797552DABA6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 12:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgLOLIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 06:08:25 -0500
Received: from mga03.intel.com ([134.134.136.65]:1501 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727637AbgLOLIS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Dec 2020 06:08:18 -0500
IronPort-SDR: fTUxYxYkAOMiFcytFlorXNXutSpxqUNa48gfAQJybnzAJFBt6KATuWD640H+BfTa02QDRIA/53
 7f1QLO/qnWGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174970465"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="174970465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 03:07:35 -0800
IronPort-SDR: UPpcrUtwCC/nUduh98rG6wD15cEqWtlDljh47AM88oOSvsE0c+bUb7EmCffdN2ec3wfyjXz6bd
 yXy/48utafKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="336669676"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2020 03:07:34 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kp8B3-0000j7-MK; Tue, 15 Dec 2020 11:07:33 +0000
Date:   Tue, 15 Dec 2020 19:06:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 a2e5f9277f66a89e2237d8d7cf0e99a819304f58
Message-ID: <5fd898c4.idivrjcc5HPiIZ20%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: a2e5f9277f66a89e2237d8d7cf0e99a819304f58  MAINTAINERS: Remove reference to non-existing file

elapsed time: 725m

configs tested: 187
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                       maple_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                       ebony_defconfig
sh                   secureedge5410_defconfig
m68k                             allmodconfig
mips                        nlm_xlp_defconfig
arm                      pxa255-idp_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
arm                          badge4_defconfig
arc                          axs101_defconfig
sh                           se7206_defconfig
arm                              zx_defconfig
powerpc                      arches_defconfig
arc                              alldefconfig
powerpc                     kmeter1_defconfig
arc                      axs103_smp_defconfig
powerpc                      walnut_defconfig
sparc                               defconfig
m68k                          atari_defconfig
powerpc                 mpc8560_ads_defconfig
mips                         rt305x_defconfig
arm                      tct_hammer_defconfig
arm                       cns3420vb_defconfig
alpha                            allyesconfig
mips                      pistachio_defconfig
arc                        nsimosci_defconfig
h8300                       h8s-sim_defconfig
arm                     eseries_pxa_defconfig
m68k                          amiga_defconfig
arm                            dove_defconfig
sparc                            allyesconfig
xtensa                    xip_kc705_defconfig
mips                           xway_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
microblaze                    nommu_defconfig
powerpc                     akebono_defconfig
arc                                 defconfig
mips                         db1xxx_defconfig
mips                        vocore2_defconfig
h8300                     edosk2674_defconfig
sh                          sdk7780_defconfig
m68k                           sun3_defconfig
arm                            u300_defconfig
arm                       omap2plus_defconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
sparc64                             defconfig
arm                      footbridge_defconfig
arm                       aspeed_g4_defconfig
arm                        shmobile_defconfig
mips                            ar7_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     pq2fads_defconfig
m68k                       m5475evb_defconfig
parisc                           alldefconfig
m68k                        m5407c3_defconfig
arm                         orion5x_defconfig
powerpc                         ps3_defconfig
powerpc                      obs600_defconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
x86_64                           alldefconfig
mips                      bmips_stb_defconfig
mips                     loongson1c_defconfig
powerpc                      pmac32_defconfig
xtensa                         virt_defconfig
sh                        edosk7760_defconfig
mips                       capcella_defconfig
sh                          lboxre2_defconfig
nds32                             allnoconfig
sh                          sdk7786_defconfig
sh                            titan_defconfig
powerpc                    gamecube_defconfig
c6x                        evmc6472_defconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
mips                        nlm_xlr_defconfig
mips                            gpr_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc832x_rdb_defconfig
um                             i386_defconfig
m68k                            mac_defconfig
m68k                        stmark2_defconfig
sh                          rsk7264_defconfig
powerpc                          g5_defconfig
powerpc                   currituck_defconfig
arm                           sunxi_defconfig
sh                         ap325rxa_defconfig
sh                         microdev_defconfig
powerpc64                        alldefconfig
mips                 decstation_r4k_defconfig
mips                  cavium_octeon_defconfig
sh                   sh7724_generic_defconfig
sh                         apsh4a3a_defconfig
h8300                               defconfig
sh                           se7619_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
i386                 randconfig-a001-20201213
i386                 randconfig-a004-20201213
i386                 randconfig-a003-20201213
i386                 randconfig-a002-20201213
i386                 randconfig-a005-20201213
i386                 randconfig-a006-20201213
i386                 randconfig-a001-20201215
i386                 randconfig-a004-20201215
i386                 randconfig-a003-20201215
i386                 randconfig-a002-20201215
i386                 randconfig-a006-20201215
i386                 randconfig-a005-20201215
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214
x86_64               randconfig-a016-20201213
x86_64               randconfig-a012-20201213
x86_64               randconfig-a013-20201213
x86_64               randconfig-a015-20201213
x86_64               randconfig-a014-20201213
x86_64               randconfig-a011-20201213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
