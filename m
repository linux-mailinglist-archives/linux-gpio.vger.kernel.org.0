Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9961D2C1BC8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 03:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgKXCxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 21:53:47 -0500
Received: from mga03.intel.com ([134.134.136.65]:30564 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727381AbgKXCxr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 21:53:47 -0500
IronPort-SDR: idI7A6TOn/LN5SzgGUKeDAld24Uex0N/hogRLKRDIEKCZvuS8DLcpZpvMuL4GwXPUDMhCmIooL
 XGxr7oUwLPFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171978422"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="171978422"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 18:53:44 -0800
IronPort-SDR: pCGVpMCJRlP4QUPgQtkCn7etW8NCPOUuYMamTCmKqlTksPHyUQJC6uvi98WdiDugxCrMoKAk93
 +xc4pxWD1D5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
   d="scan'208";a="534689810"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Nov 2020 18:53:43 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1khOSc-0000JE-DR; Tue, 24 Nov 2020 02:53:42 +0000
Date:   Tue, 24 Nov 2020 10:52:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 8dc248665f3a4261907ac35200687c4cb6e16cc0
Message-ID: <5fbc7589.9as3l0sH5rFlo1SR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 8dc248665f3a4261907ac35200687c4cb6e16cc0  Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module"

elapsed time: 724m

configs tested: 125
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            zeus_defconfig
powerpc                   bluestone_defconfig
sh                         apsh4a3a_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           u8500_defconfig
powerpc                     tqm8555_defconfig
c6x                        evmc6472_defconfig
mips                             allyesconfig
arm                        keystone_defconfig
mips                           ip32_defconfig
arm                            u300_defconfig
sh                           se7724_defconfig
csky                             alldefconfig
arm                            dove_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
arm                          gemini_defconfig
arm                         s5pv210_defconfig
sparc64                          alldefconfig
arm                       aspeed_g4_defconfig
arm                        shmobile_defconfig
arm                           h3600_defconfig
c6x                                 defconfig
arc                              alldefconfig
mips                           ip27_defconfig
powerpc                    mvme5100_defconfig
arm                  colibri_pxa270_defconfig
nds32                            alldefconfig
arm                         cm_x300_defconfig
mips                        jmr3927_defconfig
ia64                      gensparse_defconfig
powerpc                     powernv_defconfig
sh                           se7751_defconfig
mips                     loongson1b_defconfig
arm                          tango4_defconfig
xtensa                  nommu_kc705_defconfig
mips                     decstation_defconfig
arm                        mvebu_v5_defconfig
arm                            xcep_defconfig
powerpc                     kilauea_defconfig
arc                                 defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
alpha                               defconfig
sh                         ecovec24_defconfig
arm                           corgi_defconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
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
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
