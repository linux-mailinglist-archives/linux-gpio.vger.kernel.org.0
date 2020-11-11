Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBD12AE87E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 06:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgKKFyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 00:54:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:27574 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbgKKFyi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 00:54:38 -0500
IronPort-SDR: 5EasEyLa3zCkyCSywep44fokx5og+W/q0QWo8kUsHTva2e97rPUO+LtfBdt+ndBwSxFyO8Eayx
 H8feHPyvUbSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="231723664"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="231723664"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 21:54:36 -0800
IronPort-SDR: c0iU/zF0m1tFS0tjgiMq5w6hO0QMebRybNUso261ZAqLgLrxrXS47ubOZRtXf0DnYzUXwZjjZm
 ZbmCKvRU5hZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="308712792"
Received: from lkp-server02.sh.intel.com (HELO 898ef09051d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2020 21:54:34 -0800
Received: from kbuild by 898ef09051d7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcj5V-00000Y-NK; Wed, 11 Nov 2020 05:54:33 +0000
Date:   Wed, 11 Nov 2020 13:54:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 ff0e46434147ca330e03a68bb34ba1f446e5c763
Message-ID: <5fab7c81.8ni/cb9jPOhvsOWi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: ff0e46434147ca330e03a68bb34ba1f446e5c763  gpio: sifive: Fix SiFive gpio probe

elapsed time: 898m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                            pleb_defconfig
h8300                    h8300h-sim_defconfig
sh                             shx3_defconfig
sh                        sh7757lcr_defconfig
mips                        nlm_xlp_defconfig
arm                       aspeed_g4_defconfig
sh                   sh7724_generic_defconfig
mips                malta_qemu_32r6_defconfig
sh                          lboxre2_defconfig
nios2                            alldefconfig
powerpc                      pcm030_defconfig
powerpc                    amigaone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      ppc64e_defconfig
arm                      pxa255-idp_defconfig
mips                malta_kvm_guest_defconfig
mips                         rt305x_defconfig
mips                           jazz_defconfig
m68k                        stmark2_defconfig
arm                          imote2_defconfig
arm                           efm32_defconfig
arm                          iop32x_defconfig
arm                        cerfcube_defconfig
h8300                               defconfig
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
sh                         apsh4a3a_defconfig
arm                       netwinder_defconfig
arm                         mv78xx0_defconfig
sh                            migor_defconfig
arm                       omap2plus_defconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ip32_defconfig
mips                        maltaup_defconfig
arm                        magician_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc836x_mds_defconfig
sparc                               defconfig
arm                       versatile_defconfig
arm                  colibri_pxa270_defconfig
microblaze                          defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      ppc44x_defconfig
m68k                            q40_defconfig
arc                      axs103_smp_defconfig
x86_64                           alldefconfig
arm                         nhk8815_defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
x86_64               randconfig-a003-20201111
x86_64               randconfig-a005-20201111
x86_64               randconfig-a004-20201111
x86_64               randconfig-a002-20201111
x86_64               randconfig-a006-20201111
x86_64               randconfig-a001-20201111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
