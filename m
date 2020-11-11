Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C984E2AE699
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 03:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKC5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 21:57:33 -0500
Received: from mga01.intel.com ([192.55.52.88]:43720 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgKKC5d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 21:57:33 -0500
IronPort-SDR: 0txWI6ag9+6VKxvfF/HS5WGZudZ+YVuXDxZce2a3t5OwzXWnd9WjKIPMajZ1qKGjtFCkNZZnC7
 cW5GAL2WnmcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="188062121"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="188062121"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 18:57:32 -0800
IronPort-SDR: y0YgNcv6qw30QIjOGHm2RGsFIinv2TQojaM0B5PQFDYixzih/DpG7DstIoNTTCH3yYngfm46we
 vK6xC0BS3NLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="473677520"
Received: from lkp-server02.sh.intel.com (HELO c6c5fbb3488a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Nov 2020 18:57:31 -0800
Received: from kbuild by c6c5fbb3488a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcgKA-0000br-Bh; Wed, 11 Nov 2020 02:57:30 +0000
Date:   Wed, 11 Nov 2020 10:57:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 dadfab0fbf0173da6e24c8322b69083fef03033d
Message-ID: <5fab5306.AiifKO4HlrgnIvkj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: dadfab0fbf0173da6e24c8322b69083fef03033d  Merge tag 'intel-pinctrl-v5.10-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes

elapsed time: 725m

configs tested: 135
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                       aspeed_g4_defconfig
sh                   sh7724_generic_defconfig
mips                malta_qemu_32r6_defconfig
sh                          lboxre2_defconfig
arm                           efm32_defconfig
arm                          iop32x_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
m68k                          hp300_defconfig
nios2                         3c120_defconfig
parisc                           alldefconfig
m68k                        m5407c3_defconfig
m68k                        stmark2_defconfig
sh                           se7721_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
arm                          moxart_defconfig
powerpc                          g5_defconfig
mips                           ip22_defconfig
arm                      jornada720_defconfig
arm                            zeus_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc64                             defconfig
arm                          badge4_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arm                       omap2plus_defconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ip32_defconfig
sparc                               defconfig
arm                       versatile_defconfig
arm                  colibri_pxa270_defconfig
microblaze                          defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      ppc44x_defconfig
arm                         shannon_defconfig
m68k                       m5475evb_defconfig
m68k                          atari_defconfig
arm                             rpc_defconfig
m68k                         amcore_defconfig
arm                            hisi_defconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a006-20201110
i386                 randconfig-a005-20201110
i386                 randconfig-a002-20201110
i386                 randconfig-a001-20201110
i386                 randconfig-a003-20201110
i386                 randconfig-a004-20201110
i386                 randconfig-a006-20201111
i386                 randconfig-a005-20201111
i386                 randconfig-a002-20201111
i386                 randconfig-a001-20201111
i386                 randconfig-a003-20201111
i386                 randconfig-a004-20201111
x86_64               randconfig-a015-20201111
x86_64               randconfig-a011-20201111
x86_64               randconfig-a014-20201111
x86_64               randconfig-a013-20201111
x86_64               randconfig-a016-20201111
x86_64               randconfig-a012-20201111
i386                 randconfig-a012-20201110
i386                 randconfig-a014-20201110
i386                 randconfig-a016-20201110
i386                 randconfig-a011-20201110
i386                 randconfig-a015-20201110
i386                 randconfig-a013-20201110
i386                 randconfig-a012-20201111
i386                 randconfig-a014-20201111
i386                 randconfig-a016-20201111
i386                 randconfig-a011-20201111
i386                 randconfig-a015-20201111
i386                 randconfig-a013-20201111
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
x86_64               randconfig-a015-20201110
x86_64               randconfig-a011-20201110
x86_64               randconfig-a014-20201110
x86_64               randconfig-a013-20201110
x86_64               randconfig-a016-20201110
x86_64               randconfig-a012-20201110

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
