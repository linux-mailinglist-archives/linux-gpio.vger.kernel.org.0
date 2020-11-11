Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C50B2AF2CF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 15:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgKKOAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 09:00:08 -0500
Received: from mga17.intel.com ([192.55.52.151]:14591 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726923AbgKKOAG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 09:00:06 -0500
IronPort-SDR: r7Y/cg4Rl2vRCb8HKjT3NxQfDMVC3LAO/5TbqWsTXouebvtX6cPXLSWadv3QeNOHEo3X1gZvcJ
 bBE/Y5GV5iFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="149996407"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="149996407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 06:00:05 -0800
IronPort-SDR: bHPUREI8Yj4ZAW2He8KoyYG/gsXXyc62ZZYGQU0qci6tk4wIgnTFLrnVpjFW9RPZoGYXJi1rWt
 MQh5oGsnbvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="428770592"
Received: from lkp-server02.sh.intel.com (HELO 5b2c7e53fe46) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2020 06:00:03 -0800
Received: from kbuild by 5b2c7e53fe46 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcqfK-0000FJ-Bz; Wed, 11 Nov 2020 14:00:02 +0000
Date:   Wed, 11 Nov 2020 21:59:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 c4f103cf846460da0503f8e254ef2584eb48719b
Message-ID: <5fabee3e.1T0UT80yeVuyMqoE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: c4f103cf846460da0503f8e254ef2584eb48719b  Merge branch 'devel' into for-next

elapsed time: 919m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            alldefconfig
powerpc                      pcm030_defconfig
powerpc                    amigaone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      ppc64e_defconfig
arm                      pxa255-idp_defconfig
powerpc                         ps3_defconfig
powerpc                   motionpro_defconfig
mips                      fuloong2e_defconfig
mips                       bmips_be_defconfig
arm                           efm32_defconfig
arm                          iop32x_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
xtensa                    xip_kc705_defconfig
arm                            hisi_defconfig
arm                          badge4_defconfig
sh                           se7780_defconfig
sh                         apsh4a3a_defconfig
arm                       netwinder_defconfig
arm                         mv78xx0_defconfig
sh                            migor_defconfig
powerpc                   bluestone_defconfig
sh                         ap325rxa_defconfig
s390                             allyesconfig
powerpc                      bamboo_defconfig
sh                            shmin_defconfig
powerpc                     tqm8540_defconfig
mips                        maltaup_defconfig
arm                        magician_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                            q40_defconfig
arc                      axs103_smp_defconfig
x86_64                           alldefconfig
arm                   milbeaut_m10v_defconfig
arm                         nhk8815_defconfig
parisc                              defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
x86_64               randconfig-a003-20201111
x86_64               randconfig-a005-20201111
x86_64               randconfig-a004-20201111
x86_64               randconfig-a002-20201111
x86_64               randconfig-a006-20201111
x86_64               randconfig-a001-20201111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
