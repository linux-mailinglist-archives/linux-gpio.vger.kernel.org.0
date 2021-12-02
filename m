Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3295E46662C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 16:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358880AbhLBPKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 10:10:50 -0500
Received: from mga04.intel.com ([192.55.52.120]:6667 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1358885AbhLBPKW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Dec 2021 10:10:22 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="235458180"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="235458180"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 07:06:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="460491284"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 02 Dec 2021 07:06:33 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1msnfN-000GQE-4s; Thu, 02 Dec 2021 15:06:33 +0000
Date:   Thu, 02 Dec 2021 23:06:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 896568e5b9c8a170912ff83760dca51703e276f1
Message-ID: <61a8e0db.0hE+sEk39O09zu36%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 896568e5b9c8a170912ff83760dca51703e276f1  dt-bindings: pinctrl: convert controller description to the json-schema

elapsed time: 720m

configs tested: 147
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211202
arm                           corgi_defconfig
sparc                       sparc64_defconfig
powerpc                        warp_defconfig
arm                          pxa910_defconfig
powerpc                          g5_defconfig
arc                        nsim_700_defconfig
openrisc                 simple_smp_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 linkstation_defconfig
sh                        apsh4ad0a_defconfig
arm                       versatile_defconfig
sh                     sh7710voipgw_defconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc8540_ads_defconfig
sh                          r7780mp_defconfig
sh                         apsh4a3a_defconfig
xtensa                    smp_lx200_defconfig
arm                         hackkit_defconfig
arm                         mv78xx0_defconfig
s390                                defconfig
h8300                            allyesconfig
alpha                               defconfig
sh                        edosk7705_defconfig
nds32                            alldefconfig
sh                          landisk_defconfig
sh                        edosk7760_defconfig
m68k                       m5275evb_defconfig
arm                      tct_hammer_defconfig
xtensa                          iss_defconfig
mips                        bcm63xx_defconfig
s390                       zfcpdump_defconfig
xtensa                       common_defconfig
arm                      jornada720_defconfig
nds32                               defconfig
arm                            pleb_defconfig
arm                          pxa168_defconfig
powerpc                     tqm5200_defconfig
sh                             sh03_defconfig
powerpc                     pseries_defconfig
arm                   milbeaut_m10v_defconfig
arm                          iop32x_defconfig
sh                     magicpanelr2_defconfig
m68k                          hp300_defconfig
m68k                            q40_defconfig
arm                           sama5_defconfig
powerpc                   lite5200b_defconfig
arm                        spear3xx_defconfig
powerpc                      mgcoge_defconfig
arm                       cns3420vb_defconfig
arm                            hisi_defconfig
um                                  defconfig
powerpc                   motionpro_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5475evb_defconfig
powerpc                           allnoconfig
ia64                          tiger_defconfig
powerpc                      bamboo_defconfig
riscv                               defconfig
microblaze                      mmu_defconfig
sh                          rsk7203_defconfig
arm                           h5000_defconfig
arm                         cm_x300_defconfig
powerpc                   microwatt_defconfig
arm                         s3c2410_defconfig
sh                           se7619_defconfig
arm                  randconfig-c002-20211202
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a016-20211202
x86_64               randconfig-a011-20211202
x86_64               randconfig-a013-20211202
x86_64               randconfig-a014-20211202
x86_64               randconfig-a012-20211202
x86_64               randconfig-a015-20211202
i386                 randconfig-a016-20211202
i386                 randconfig-a013-20211202
i386                 randconfig-a011-20211202
i386                 randconfig-a014-20211202
i386                 randconfig-a012-20211202
i386                 randconfig-a015-20211202
arc                  randconfig-r043-20211202
s390                 randconfig-r044-20211202
riscv                randconfig-r042-20211202
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211202
x86_64               randconfig-c007-20211202
riscv                randconfig-c006-20211202
i386                 randconfig-c001-20211202
powerpc              randconfig-c003-20211202
s390                 randconfig-c005-20211202
x86_64               randconfig-a006-20211202
x86_64               randconfig-a005-20211202
x86_64               randconfig-a001-20211202
x86_64               randconfig-a002-20211202
x86_64               randconfig-a004-20211202
x86_64               randconfig-a003-20211202
i386                 randconfig-a001-20211202
i386                 randconfig-a005-20211202
i386                 randconfig-a002-20211202
i386                 randconfig-a003-20211202
i386                 randconfig-a006-20211202
i386                 randconfig-a004-20211202
hexagon              randconfig-r045-20211202
hexagon              randconfig-r041-20211202

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
