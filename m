Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC9733750C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 15:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbhCKOGO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 09:06:14 -0500
Received: from mga18.intel.com ([134.134.136.126]:1767 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233919AbhCKOF4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 09:05:56 -0500
IronPort-SDR: LLOlWeqJ2R6IWeE6qFcuO0Lt0LZWC3ba+jwDSds4+2vw6eqjOezJ3UoFOTUn5/AGrKnax0uYXD
 +Fjl+pLVlCow==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="176264401"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="176264401"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 06:05:55 -0800
IronPort-SDR: beH41DaIkSTPgZ7fkZKgWgj7OcFihBIjBALE2++fLjM009HKYLXx9z/+WuzvSec3YCx1CW0QFD
 KfpD8vXaKsFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="387020267"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Mar 2021 06:05:54 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKLwn-0000nk-Aq; Thu, 11 Mar 2021 14:05:53 +0000
Date:   Thu, 11 Mar 2021 22:05:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 5739ffc10d047d190bf53a6dddbf5e5a9c94c373
Message-ID: <604a2395.oFVn1xKqk1EMHVMD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 5739ffc10d047d190bf53a6dddbf5e5a9c94c373  Merge tag 'intel-pinctrl-v5.12-2' of gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes

elapsed time: 721m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
sh                           se7724_defconfig
mips                        omega2p_defconfig
arm                        oxnas_v6_defconfig
arm                       versatile_defconfig
sh                           sh2007_defconfig
arm                           viper_defconfig
mips                        vocore2_defconfig
arc                          axs103_defconfig
sh                          lboxre2_defconfig
sh                          rsk7203_defconfig
openrisc                         alldefconfig
powerpc                      obs600_defconfig
sparc                               defconfig
ia64                         bigsur_defconfig
arm                       imx_v4_v5_defconfig
mips                           ip28_defconfig
m68k                             alldefconfig
arm                          moxart_defconfig
powerpc                      ppc6xx_defconfig
sh                         ecovec24_defconfig
arm                            zeus_defconfig
m68k                          sun3x_defconfig
powerpc                    gamecube_defconfig
powerpc                     tqm8548_defconfig
sh                     magicpanelr2_defconfig
arm                  colibri_pxa300_defconfig
powerpc                  mpc866_ads_defconfig
m68k                        m5307c3_defconfig
mips                          malta_defconfig
arm                          badge4_defconfig
mips                      pic32mzda_defconfig
powerpc                          allmodconfig
sh                             shx3_defconfig
powerpc                        cell_defconfig
arm                            mps2_defconfig
arm                         hackkit_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     pseries_defconfig
arm                            xcep_defconfig
sh                              ul2_defconfig
mips                      maltaaprp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210311
i386                 randconfig-a005-20210311
i386                 randconfig-a003-20210311
i386                 randconfig-a002-20210311
i386                 randconfig-a004-20210311
i386                 randconfig-a006-20210311
i386                 randconfig-a013-20210311
i386                 randconfig-a016-20210311
i386                 randconfig-a011-20210311
i386                 randconfig-a014-20210311
i386                 randconfig-a015-20210311
i386                 randconfig-a012-20210311
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210311
x86_64               randconfig-a016-20210311
x86_64               randconfig-a013-20210311
x86_64               randconfig-a015-20210311
x86_64               randconfig-a014-20210311
x86_64               randconfig-a012-20210311

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
