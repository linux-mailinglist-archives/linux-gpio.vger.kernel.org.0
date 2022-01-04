Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE19483BC3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 06:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiADFsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 00:48:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:61063 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230181AbiADFsv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jan 2022 00:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641275331; x=1672811331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6M/NsuoG5yBDdckcDmP053RuZ8kpVO8bEueMQ7XMwCY=;
  b=BtUfha/06DlrITxh0eNf89qMNTBW2EcfztOqe/nkSyllNVxqw8mFAmxv
   e9rVSB5zkRiZA7jahfkTWd6MErlxHCk+iqupJbBRx/yC365+ReqN2MMOA
   yERJga30JWOZGUMr4UELXt7cvDv82C3fKFlDRd/qW30Ziusi4B33lmkjW
   x5gygc/8hbuWVKJYg/4p6VRolM+5vxeVk8pd7g9J/b8brBt0lMhotfsx1
   uG4LD5kqW3WQ1hHqC16BdLxfWdjuqgF8gpHHoDKxpxQnBhEn4vbxHdBu5
   I3YLQVvAqIGabrjcZsWnX01JMc3tVOhwFe7/N2s2DqWx5KjPBC/4/MNsH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="241957898"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="241957898"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 21:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="488068030"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jan 2022 21:48:29 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n4cgO-000EpR-N2; Tue, 04 Jan 2022 05:48:28 +0000
Date:   Tue, 04 Jan 2022 13:48:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 7442936633bd1906a2571116ae334b68c56c8a72
Message-ID: <61d3df91.QoZ5kvoss/KNXmic%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 7442936633bd1906a2571116ae334b68c56c8a72  pinctrl: imx: fix assigning groups names

elapsed time: 2752m

configs tested: 182
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220103
sh                            shmin_defconfig
xtensa                       common_defconfig
openrisc                         alldefconfig
nios2                            alldefconfig
arm                            qcom_defconfig
sh                        dreamcast_defconfig
arm                            mps2_defconfig
sh                         ap325rxa_defconfig
sh                          rsk7264_defconfig
xtensa                    smp_lx200_defconfig
x86_64                           alldefconfig
arm                        oxnas_v6_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                       ppc64_defconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
xtensa                          iss_defconfig
powerpc                     tqm8548_defconfig
microblaze                      mmu_defconfig
xtensa                         virt_defconfig
powerpc                     ep8248e_defconfig
mips                           ci20_defconfig
m68k                       m5208evb_defconfig
powerpc                      ppc6xx_defconfig
arm                       multi_v4t_defconfig
sh                             sh03_defconfig
powerpc                      makalu_defconfig
arm                         nhk8815_defconfig
nios2                         3c120_defconfig
parisc                           alldefconfig
sh                               j2_defconfig
m68k                            q40_defconfig
sh                          kfr2r09_defconfig
sh                        edosk7760_defconfig
arc                              alldefconfig
arc                          axs103_defconfig
mips                           gcw0_defconfig
arc                        vdk_hs38_defconfig
arm64                            alldefconfig
ia64                        generic_defconfig
um                             i386_defconfig
m68k                          multi_defconfig
csky                                defconfig
mips                        vocore2_defconfig
powerpc                    adder875_defconfig
mips                         tb0226_defconfig
sh                         ecovec24_defconfig
powerpc                   motionpro_defconfig
ia64                                defconfig
ia64                          tiger_defconfig
mips                      loongson3_defconfig
sh                   sh7724_generic_defconfig
mips                           ip32_defconfig
arc                      axs103_smp_defconfig
arm                        shmobile_defconfig
arm                           viper_defconfig
um                                  defconfig
arm                  randconfig-c002-20220103
arm                  randconfig-c002-20220102
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20220103
x86_64               randconfig-a001-20220103
x86_64               randconfig-a004-20220103
x86_64               randconfig-a006-20220103
x86_64               randconfig-a002-20220103
x86_64               randconfig-a003-20220103
x86_64               randconfig-a015-20220102
x86_64               randconfig-a012-20220102
x86_64               randconfig-a014-20220102
x86_64               randconfig-a013-20220102
x86_64               randconfig-a011-20220102
x86_64               randconfig-a016-20220102
i386                 randconfig-a012-20220102
i386                 randconfig-a016-20220102
i386                 randconfig-a014-20220102
i386                 randconfig-a015-20220102
i386                 randconfig-a011-20220102
i386                 randconfig-a013-20220102
s390                 randconfig-r044-20220102
arc                  randconfig-r043-20220102
riscv                randconfig-r042-20220102
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220102
mips                 randconfig-c004-20220102
i386                 randconfig-c001-20220102
riscv                randconfig-c006-20220102
powerpc              randconfig-c003-20220102
x86_64               randconfig-c007-20220102
s390                 randconfig-c005-20220102
arm64                            allyesconfig
mips                     cu1000-neo_defconfig
mips                      bmips_stb_defconfig
arm                        multi_v5_defconfig
mips                          ath79_defconfig
powerpc                        icon_defconfig
arm                          pcm027_defconfig
powerpc                   bluestone_defconfig
arm                                 defconfig
mips                       lemote2f_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v5_defconfig
hexagon                             defconfig
mips                      malta_kvm_defconfig
mips                           ip22_defconfig
arm                       spear13xx_defconfig
arm                    vt8500_v6_v7_defconfig
x86_64                           allyesconfig
arm                           omap1_defconfig
x86_64               randconfig-a005-20220102
x86_64               randconfig-a001-20220102
x86_64               randconfig-a004-20220102
x86_64               randconfig-a006-20220102
x86_64               randconfig-a002-20220102
x86_64               randconfig-a003-20220102
i386                 randconfig-a003-20220102
i386                 randconfig-a005-20220102
i386                 randconfig-a004-20220102
i386                 randconfig-a006-20220102
i386                 randconfig-a001-20220102
i386                 randconfig-a002-20220102
x86_64               randconfig-a015-20220103
x86_64               randconfig-a012-20220103
x86_64               randconfig-a014-20220103
x86_64               randconfig-a013-20220103
x86_64               randconfig-a011-20220103
x86_64               randconfig-a016-20220103
i386                 randconfig-a012-20220103
i386                 randconfig-a016-20220103
i386                 randconfig-a014-20220103
i386                 randconfig-a015-20220103
i386                 randconfig-a011-20220103
i386                 randconfig-a013-20220103
hexagon              randconfig-r041-20220103
hexagon              randconfig-r045-20220103
riscv                randconfig-r042-20220103

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
