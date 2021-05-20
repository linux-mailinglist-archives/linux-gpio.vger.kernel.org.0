Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864CE38AE69
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 14:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238631AbhETMhb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 08:37:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:62764 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237941AbhETMhN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 08:37:13 -0400
IronPort-SDR: cKCZyEF8Hv1FYYqvkGOE+wjHhhhu2qNWfNP4BRmPHORmS1Wuoya0SDVV7ign/fylnInvBrUSPm
 8HYy+xl2G/fw==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="198127678"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="198127678"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 05:35:08 -0700
IronPort-SDR: DCrhgp4v9pJUsvoqhRjYYyM7ue5MwLyU32k1rPiFFpKRJCQiFuF/TIrP/UKM1zhwbEw9NR1nDM
 nekzXtRHUFbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="543512555"
Received: from lkp-server02.sh.intel.com (HELO 1b329be5b008) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 May 2021 05:35:07 -0700
Received: from kbuild by 1b329be5b008 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ljhtK-0000bH-SR; Thu, 20 May 2021 12:35:06 +0000
Date:   Thu, 20 May 2021 20:34:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 3dc58221cadb20cd88e5c92b2aacb528961db52a
Message-ID: <60a6576a.59jqYntRWAFLyZfY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 3dc58221cadb20cd88e5c92b2aacb528961db52a  pinctrl: npcm: Align a few entries in the pin function table

elapsed time: 723m

configs tested: 178
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
arm                             pxa_defconfig
sh                          rsk7264_defconfig
m68k                        m5307c3_defconfig
m68k                         apollo_defconfig
mips                        bcm47xx_defconfig
xtensa                         virt_defconfig
m68k                       m5275evb_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                  mpc885_ads_defconfig
arc                                 defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
powerpc                  mpc866_ads_defconfig
arm                         bcm2835_defconfig
sparc64                          alldefconfig
riscv                             allnoconfig
riscv                               defconfig
powerpc                 mpc832x_rdb_defconfig
s390                             allyesconfig
csky                                defconfig
arc                           tb10x_defconfig
sh                        edosk7705_defconfig
arc                      axs103_smp_defconfig
arm                           h3600_defconfig
ia64                        generic_defconfig
arm                            hisi_defconfig
powerpc                      ppc40x_defconfig
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
arm                         lpc18xx_defconfig
mips                     cu1000-neo_defconfig
powerpc                      cm5200_defconfig
powerpc                     rainier_defconfig
mips                          rb532_defconfig
arm                          ixp4xx_defconfig
arm                       cns3420vb_defconfig
m68k                           sun3_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7712_defconfig
powerpc                     taishan_defconfig
mips                         tb0226_defconfig
sh                        dreamcast_defconfig
arm                        oxnas_v6_defconfig
powerpc                     tqm5200_defconfig
arm                             ezx_defconfig
sh                          lboxre2_defconfig
arm                         shannon_defconfig
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
