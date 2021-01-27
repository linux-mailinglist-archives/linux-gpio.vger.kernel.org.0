Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50FD13052E7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 07:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbhA0GDO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 01:03:14 -0500
Received: from mga11.intel.com ([192.55.52.93]:5225 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236836AbhA0DnO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 22:43:14 -0500
IronPort-SDR: yufWlrxAkBOgrGQ8NXtpXy1yL3oismBccmLGs2BFa2bgRgs6I5ni7Vt+1rDe0hCmXdFCOXLutY
 bnOZimur2f9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="176502708"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="176502708"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 19:42:31 -0800
IronPort-SDR: dCDqMd5wFWvM80tZxWzbO+7jAb2uuKPcTbePF6/qrA/JnbRWQssh/X9OFWLXNia/9U5/15eAt9
 gmEkBtf3ulQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="473000007"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2021 19:42:30 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4biv-0001IU-OU; Wed, 27 Jan 2021 03:42:29 +0000
Date:   Wed, 27 Jan 2021 11:41:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 e79167284d62d3f9e67da76926d5990cca481dd3
Message-ID: <6010e0ee.d5+Gh4wdlcSzmXTV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: e79167284d62d3f9e67da76926d5990cca481dd3  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        warp_defconfig
powerpc                     tqm8560_defconfig
powerpc                      ppc44x_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
powerpc                    klondike_defconfig
powerpc                    mvme5100_defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
powerpc                     tqm8541_defconfig
arm                            lart_defconfig
openrisc                            defconfig
c6x                         dsk6455_defconfig
powerpc                        cell_defconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
alpha                               defconfig
mips                           ci20_defconfig
mips                       rbtx49xx_defconfig
um                           x86_64_defconfig
arm                         lubbock_defconfig
powerpc                      acadia_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
powerpc                    adder875_defconfig
arm                       cns3420vb_defconfig
um                            kunit_defconfig
sh                        edosk7705_defconfig
arm                       aspeed_g4_defconfig
powerpc                     pq2fads_defconfig
powerpc                     powernv_defconfig
arm                          pcm027_defconfig
mips                       capcella_defconfig
arm                          ep93xx_defconfig
mips                         tb0287_defconfig
arm                             pxa_defconfig
parisc                           alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                        spear6xx_defconfig
c6x                                 defconfig
powerpc                           allnoconfig
arm                        spear3xx_defconfig
sh                           se7750_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
powerpc                     asp8347_defconfig
powerpc                       ppc64_defconfig
nds32                               defconfig
arc                         haps_hs_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
arm                        multi_v7_defconfig
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
nios2                            allyesconfig
csky                                defconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210127
i386                 randconfig-a011-20210127
i386                 randconfig-a012-20210127
i386                 randconfig-a015-20210127
i386                 randconfig-a014-20210127
i386                 randconfig-a016-20210127
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
