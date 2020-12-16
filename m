Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3232DB7E3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 01:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgLPAq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 19:46:29 -0500
Received: from mga14.intel.com ([192.55.52.115]:2191 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgLPAq3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Dec 2020 19:46:29 -0500
IronPort-SDR: KSrxg2mot74NQOiwKY4+Yx2P3PPxKrS0o0ceRJ+uaU5+7dMIr+0+idwrUpKewRZIeMpWzfOvJZ
 D+ppjhoWQUFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="174206035"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="174206035"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 16:45:48 -0800
IronPort-SDR: hdMVMPisxbWRUK1mqBBAo0aPxBjn7r/DiUAG15H/ORcGpPMtEEMRPoHuZAXdxk5AZRp9QjB1IL
 YzxaI3V88Eog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="384048174"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2020 16:45:47 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kpKws-00014K-Qr; Wed, 16 Dec 2020 00:45:46 +0000
Date:   Wed, 16 Dec 2020 08:45:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 3048c5493cd208540252e6c78b2252fedf6f0ede
Message-ID: <5fd9589b.3QaiKzh4c3Z8nqEx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 3048c5493cd208540252e6c78b2252fedf6f0ede  gpio: Skip over NULL and (empty string) line names

elapsed time: 722m

configs tested: 177
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                                  defconfig
ia64                        generic_defconfig
arm                             ezx_defconfig
mips                   sb1250_swarm_defconfig
mips                     decstation_defconfig
arm64                            alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc837x_mds_defconfig
sh                         microdev_defconfig
sh                           se7712_defconfig
powerpc                      bamboo_defconfig
m68k                       m5275evb_defconfig
powerpc                  iss476-smp_defconfig
powerpc                           allnoconfig
arm                           efm32_defconfig
powerpc                  mpc885_ads_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                           tb10x_defconfig
powerpc                     ksi8560_defconfig
arm                    vt8500_v6_v7_defconfig
riscv                    nommu_k210_defconfig
mips                            ar7_defconfig
powerpc                       ppc64_defconfig
arm                          ep93xx_defconfig
powerpc                        warp_defconfig
mips                     cu1830-neo_defconfig
powerpc                       ebony_defconfig
riscv                            alldefconfig
powerpc                     tqm8540_defconfig
c6x                        evmc6457_defconfig
powerpc                        fsp2_defconfig
h8300                    h8300h-sim_defconfig
xtensa                       common_defconfig
arm                         shannon_defconfig
m68k                          hp300_defconfig
m68k                         apollo_defconfig
powerpc                      walnut_defconfig
arm                      footbridge_defconfig
arm                        cerfcube_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
um                             i386_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                            qcom_defconfig
ia64                      gensparse_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                        sh7785lcr_defconfig
xtensa                  cadence_csp_defconfig
i386                             alldefconfig
arm                         ebsa110_defconfig
powerpc                     pq2fads_defconfig
mips                        omega2p_defconfig
mips                           ci20_defconfig
arm                        clps711x_defconfig
powerpc                     ep8248e_defconfig
arm                       netwinder_defconfig
arm                           h5000_defconfig
powerpc                     kmeter1_defconfig
arm                      integrator_defconfig
arc                                 defconfig
ia64                            zx1_defconfig
arm                        trizeps4_defconfig
h8300                     edosk2674_defconfig
arm                          moxart_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                       maple_defconfig
mips                           ip27_defconfig
mips                        bcm47xx_defconfig
arm                  colibri_pxa300_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
c6x                                 defconfig
m68k                           sun3_defconfig
arm                     davinci_all_defconfig
powerpc                 linkstation_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
mips                         tb0287_defconfig
powerpc                     sequoia_defconfig
mips                  decstation_64_defconfig
x86_64                           allyesconfig
powerpc                      ppc64e_defconfig
arm                  colibri_pxa270_defconfig
arm                            mps2_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc834x_itx_defconfig
sh                        sh7763rdp_defconfig
xtensa                          iss_defconfig
sh                           sh2007_defconfig
sh                        dreamcast_defconfig
parisc                              defconfig
s390                             allyesconfig
m68k                        m5407c3_defconfig
sh                               j2_defconfig
parisc                generic-32bit_defconfig
mips                         tb0226_defconfig
arm                           corgi_defconfig
parisc                           alldefconfig
mips                      pic32mzda_defconfig
mips                           xway_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc832x_mds_defconfig
arm                           u8500_defconfig
powerpc                     tqm8560_defconfig
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
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20201215
x86_64               randconfig-a006-20201215
x86_64               randconfig-a002-20201215
x86_64               randconfig-a005-20201215
x86_64               randconfig-a004-20201215
x86_64               randconfig-a001-20201215
i386                 randconfig-a001-20201215
i386                 randconfig-a003-20201215
i386                 randconfig-a002-20201215
i386                 randconfig-a004-20201215
i386                 randconfig-a006-20201215
i386                 randconfig-a005-20201215
i386                 randconfig-a014-20201215
i386                 randconfig-a013-20201215
i386                 randconfig-a012-20201215
i386                 randconfig-a011-20201215
i386                 randconfig-a015-20201215
i386                 randconfig-a016-20201215
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201215
x86_64               randconfig-a012-20201215
x86_64               randconfig-a013-20201215
x86_64               randconfig-a015-20201215
x86_64               randconfig-a014-20201215
x86_64               randconfig-a011-20201215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
