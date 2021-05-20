Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6CA38AE61
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 14:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237936AbhETMhE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 08:37:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:64470 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235963AbhETMgh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 08:36:37 -0400
IronPort-SDR: Zl7is/CwhYwm0FVi9knKR8P5hmBXCtUlSXpbB7GY/gdiPdBz3SwTJjCkCVyXu+Jh3iM+AswMat
 0Ex5elmjD5AQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="180818266"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="180818266"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 05:35:12 -0700
IronPort-SDR: LNedmBEgvU/3qVn5wHFfwgO7qTW9EtFFyX5SdmCp9yW77m8E0kP2781zmmaYsSCAJOCPSmnBgM
 cfK85l11P3pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="544959179"
Received: from lkp-server02.sh.intel.com (HELO 1b329be5b008) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 May 2021 05:35:10 -0700
Received: from kbuild by 1b329be5b008 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ljhtL-0000bK-0m; Thu, 20 May 2021 12:35:07 +0000
Date:   Thu, 20 May 2021 20:34:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 9f96bd5ae866e9d061827b9eaa885f611a8afcba
Message-ID: <60a6576c.HtYaUQ5cvEYpONDU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 9f96bd5ae866e9d061827b9eaa885f611a8afcba  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 170
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
sh                 kfr2r09-romimage_defconfig
h8300                    h8300h-sim_defconfig
xtensa                           alldefconfig
arc                          axs103_defconfig
powerpc                     mpc5200_defconfig
openrisc                         alldefconfig
powerpc                      walnut_defconfig
mips                      malta_kvm_defconfig
mips                           mtx1_defconfig
sh                         microdev_defconfig
m68k                       m5208evb_defconfig
arm                          pcm027_defconfig
sh                         ap325rxa_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           sama5_defconfig
m68k                       bvme6000_defconfig
mips                         tb0287_defconfig
m68k                        m5307c3_defconfig
m68k                         apollo_defconfig
mips                        bcm47xx_defconfig
xtensa                         virt_defconfig
m68k                       m5275evb_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                  mpc885_ads_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
arc                                 defconfig
powerpc                 mpc832x_rdb_defconfig
s390                             allyesconfig
csky                                defconfig
arc                           tb10x_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                          rsk7203_defconfig
arm                           corgi_defconfig
powerpc                 mpc832x_mds_defconfig
arm                      jornada720_defconfig
h8300                            allyesconfig
arm                         vf610m4_defconfig
sh                           sh2007_defconfig
mips                      maltasmvp_defconfig
arm                        multi_v7_defconfig
powerpc                     powernv_defconfig
um                             i386_defconfig
x86_64                              defconfig
ia64                                defconfig
mips                     cu1000-neo_defconfig
powerpc                      cm5200_defconfig
powerpc                     rainier_defconfig
mips                          rb532_defconfig
arm                          ixp4xx_defconfig
arm                         lpc18xx_defconfig
arm                         shannon_defconfig
powerpc                      obs600_defconfig
mips                           jazz_defconfig
arm                        keystone_defconfig
mips                   sb1250_swarm_defconfig
sh                           se7712_defconfig
powerpc                     taishan_defconfig
mips                         tb0226_defconfig
sh                        dreamcast_defconfig
arm                        oxnas_v6_defconfig
powerpc                     tqm5200_defconfig
arm                             ezx_defconfig
sh                          lboxre2_defconfig
xtensa                  audio_kc705_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
powerpc                 mpc836x_mds_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210520
x86_64               randconfig-a006-20210520
x86_64               randconfig-a005-20210520
x86_64               randconfig-a003-20210520
x86_64               randconfig-a004-20210520
x86_64               randconfig-a002-20210520
i386                 randconfig-a003-20210519
i386                 randconfig-a001-20210519
i386                 randconfig-a005-20210519
i386                 randconfig-a004-20210519
i386                 randconfig-a002-20210519
i386                 randconfig-a006-20210519
i386                 randconfig-a001-20210520
i386                 randconfig-a005-20210520
i386                 randconfig-a002-20210520
i386                 randconfig-a006-20210520
i386                 randconfig-a004-20210520
i386                 randconfig-a003-20210520
x86_64               randconfig-a012-20210519
x86_64               randconfig-a015-20210519
x86_64               randconfig-a013-20210519
x86_64               randconfig-a011-20210519
x86_64               randconfig-a016-20210519
x86_64               randconfig-a014-20210519
i386                 randconfig-a016-20210520
i386                 randconfig-a011-20210520
i386                 randconfig-a015-20210520
i386                 randconfig-a012-20210520
i386                 randconfig-a014-20210520
i386                 randconfig-a013-20210520
i386                 randconfig-a014-20210519
i386                 randconfig-a016-20210519
i386                 randconfig-a011-20210519
i386                 randconfig-a015-20210519
i386                 randconfig-a012-20210519
i386                 randconfig-a013-20210519
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210520
x86_64               randconfig-b001-20210519
x86_64               randconfig-a013-20210520
x86_64               randconfig-a014-20210520
x86_64               randconfig-a012-20210520
x86_64               randconfig-a016-20210520
x86_64               randconfig-a015-20210520
x86_64               randconfig-a011-20210520
x86_64               randconfig-a003-20210519
x86_64               randconfig-a004-20210519
x86_64               randconfig-a005-20210519
x86_64               randconfig-a001-20210519
x86_64               randconfig-a002-20210519
x86_64               randconfig-a006-20210519

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
