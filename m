Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28264B0642
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 07:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbiBJGYa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 01:24:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbiBJGYa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 01:24:30 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C81BA
        for <linux-gpio@vger.kernel.org>; Wed,  9 Feb 2022 22:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644474272; x=1676010272;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k/jxMxodmVg5MvDoG75u2DTQE5rltxwGilOEjvZ4tMA=;
  b=aOSkdfczcAtoPNagmZL7Y9Tp5ES4Fu+W7VW7E5q4wu2fs+lIOkw8beMP
   g7sysECrm1p2G548/9xUXj8fX34eXu2LtivgImjsBJs+KYExyD/Zx3cYp
   2AUcBy+kbs7QdAfinXr/87dOhZSZ2xsPIvjewUqnNPXU+jVNqMwerGR2x
   xXcjKGz8Uc1jEeY8KT49jgl/OWR/Vq7DCGMjP5hO8v2gkB6e7LK4UXPL0
   fGgJWG2dCaUlM+LUXc5r8/Q2T/gfvY/mkrsqRqotoKeoGATljsugMYQwi
   Eb/zuHIpJAcwSwc596B5ZqW4EBA6r5zDYARVy1jhwIUtRNmAiwKcZF9fh
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249174296"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; 
   d="scan'208";a="249174296"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 22:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="585854689"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2022 22:24:30 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nI2sX-0002oc-WD; Thu, 10 Feb 2022 06:24:29 +0000
Date:   Thu, 10 Feb 2022 14:24:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-spi] BUILD SUCCESS
 ac0e7573bd639ef99e6fa4dedfe750bc3af3304b
Message-ID: <6204af94.mFYFkdRIJ1hCnOWo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
branch HEAD: ac0e7573bd639ef99e6fa4dedfe750bc3af3304b  spi: Retire legacy GPIO handling

elapsed time: 728m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                          allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                            allyesconfig
m68k                          hp300_defconfig
mips                         db1xxx_defconfig
powerpc                        warp_defconfig
xtensa                  nommu_kc705_defconfig
riscv                            allyesconfig
sh                          r7785rp_defconfig
h8300                               defconfig
mips                         cobalt_defconfig
sh                          r7780mp_defconfig
arm                        mvebu_v7_defconfig
arm                         assabet_defconfig
sh                            shmin_defconfig
sh                              ul2_defconfig
sh                           se7206_defconfig
m68k                             alldefconfig
arm                       aspeed_g5_defconfig
arc                        nsim_700_defconfig
sh                        dreamcast_defconfig
um                                  defconfig
s390                                defconfig
powerpc                      chrp32_defconfig
m68k                       m5475evb_defconfig
sh                             sh03_defconfig
h8300                            allyesconfig
sh                          kfr2r09_defconfig
arm                          badge4_defconfig
h8300                    h8300h-sim_defconfig
arm                        cerfcube_defconfig
powerpc64                        alldefconfig
mips                      loongson3_defconfig
powerpc                      ppc40x_defconfig
arm                         nhk8815_defconfig
powerpc                    klondike_defconfig
powerpc                       ppc64_defconfig
arc                              alldefconfig
s390                          debug_defconfig
sh                        edosk7760_defconfig
m68k                          amiga_defconfig
arm                         lpc18xx_defconfig
openrisc                            defconfig
arm                         vf610m4_defconfig
sh                           se7721_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220210
arm                  randconfig-c002-20220209
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220209
arc                  randconfig-r043-20220208
arc                  randconfig-r043-20220209
riscv                randconfig-r042-20220210
riscv                randconfig-r042-20220209
arc                  randconfig-r043-20220210
s390                 randconfig-r044-20220210
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220209
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220209
i386                          randconfig-c001
mips                 randconfig-c004-20220209
arm                  randconfig-c002-20220209
riscv                randconfig-c006-20220210
powerpc              randconfig-c003-20220210
arm                  randconfig-c002-20220210
mips                 randconfig-c004-20220210
powerpc                     ksi8560_defconfig
arm                       aspeed_g4_defconfig
mips                            e55_defconfig
arm                        spear3xx_defconfig
powerpc                      ppc44x_defconfig
powerpc                    mvme5100_defconfig
powerpc                     kilauea_defconfig
powerpc                  mpc885_ads_defconfig
mips                         tb0287_defconfig
powerpc                      ppc64e_defconfig
arm                          collie_defconfig
arm                         s3c2410_defconfig
arm                              alldefconfig
powerpc                   microwatt_defconfig
riscv                             allnoconfig
powerpc                     mpc512x_defconfig
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
