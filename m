Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989CF483BC1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 06:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiADFsb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 00:48:31 -0500
Received: from mga18.intel.com ([134.134.136.126]:26193 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230181AbiADFsb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jan 2022 00:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641275311; x=1672811311;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IQcIUBHdp25tYzxN5yAEjxDqDbEQ3WR+7vq5vHn71Qs=;
  b=R+k1frIwp1gmxBp+EGTG3RcYmWnsXnvCPlbCW6MG29lQ1+6XpZv4SeSQ
   IZNOJKyzJfuZX/n30l/TMa9MEJzG7NdBSwov+gD+UvhrBAg4IlDbFgogm
   OUYTy00B7XLOmEk4/YRCaIUqGArWLVSzndCY/mm111At8qHwWuBDii+n5
   UoTf+zqF0HNqmJE8MQdg/wFmHjzB27RcAqEkWDfHkkMGqhWpspQI5UbSu
   1tSL0IkP4UQZrE9/RoFdKNofgk3okEYUOE4T1PjlZPVthT69Ocp3/7Mle
   uf3MOR0t6JbneN2+ToGUYqa6STNLZeVEZVbtz91h7Ni41v/Gi/qekPwUt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="228981950"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="228981950"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 21:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="688447462"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Jan 2022 21:48:29 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n4cgO-000EpO-Lp; Tue, 04 Jan 2022 05:48:28 +0000
Date:   Tue, 04 Jan 2022 13:47:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 acd6fb558aa80cf34b120118258e25f3159466b2
Message-ID: <61d3df8e.Yeh9e9n8qeKMe1lk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: acd6fb558aa80cf34b120118258e25f3159466b2  Merge branch 'devel' into for-next

elapsed time: 2751m

configs tested: 184
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
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
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
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
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
hexagon              randconfig-r041-20220102
hexagon              randconfig-r045-20220102

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
