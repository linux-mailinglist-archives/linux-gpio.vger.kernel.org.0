Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9055A33E0
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Aug 2022 04:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236442AbiH0Cni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 22:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiH0Cnh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 22:43:37 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AADE3C05
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661568216; x=1693104216;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wkLXcf4akmsPMyFgKmSBhE3UY6kTxlj9gItJysv5PBU=;
  b=ngtexgvPqrGnIQ/WCDYkZW38PtFvn7NayorbGjvV8k13kheRCVWM/4hb
   ZzkuxkCyiVatXPha5vNdBe4p6C6EN/u+MVWfgAJov+npdgOswdTmXbtwq
   LH/Erkf8/GIdB8dNajPEuxKXLpHT7v9fTSnknXnboVdw/Ht9DTcluQzrI
   1G51c4/c+QNXh7dQHIA/ZU9dOSSbaydUP//bMrlCXZ/iftdbkzmiZH3Q8
   6B/LfSJU83AgDvNNavrfcuceLeuuiBWLF/wkTY/vzL2yYOdEP7iS8Y7cs
   8bZE0B2VdR2IMrBh2fU2gscplFTL4waRK7YrkHbLrxiO/Mn7JqUYxfP6h
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="295406058"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="295406058"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 19:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="938958505"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2022 19:43:34 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oRlnJ-0000tT-3A;
        Sat, 27 Aug 2022 02:43:33 +0000
Date:   Sat, 27 Aug 2022 10:43:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 76648c867c6c03b8a468d9c9222025873ecc613d
Message-ID: <630984cf.g0ik2EbzzqUNL1oj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 76648c867c6c03b8a468d9c9222025873ecc613d  pinctrl: sunxi: Fix name for A100 R_PIO

elapsed time: 722m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
loongarch                         allnoconfig
loongarch                           defconfig
x86_64                              defconfig
arm                                 defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                           allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a002
x86_64                               rhel-8.3
i386                          randconfig-a012
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
i386                                defconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a004
s390                             allmodconfig
arc                  randconfig-r043-20220824
riscv                randconfig-r042-20220824
s390                 randconfig-r044-20220826
s390                                defconfig
x86_64                        randconfig-a015
s390                 randconfig-r044-20220824
x86_64                        randconfig-a013
x86_64                        randconfig-a011
riscv                randconfig-r042-20220826
i386                             allyesconfig
arc                  randconfig-r043-20220826
arc                  randconfig-r043-20220825
s390                             allyesconfig
s390                       zfcpdump_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc8540_ads_defconfig
arm                           sama5_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                        apsh4ad0a_defconfig
openrisc                    or1ksim_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
i386                          randconfig-c001
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
sh                          landisk_defconfig
sh                          rsk7203_defconfig
parisc                generic-32bit_defconfig
arm                            xcep_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
ia64                             allmodconfig
sh                           se7343_defconfig
m68k                          multi_defconfig
sh                           se7780_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220827
sh                           se7206_defconfig
sh                               j2_defconfig
powerpc                     mpc83xx_defconfig
alpha                            alldefconfig
mips                          rb532_defconfig
powerpc                         wii_defconfig
powerpc                      ep88xc_defconfig
sh                         ap325rxa_defconfig
arc                      axs103_smp_defconfig
um                               alldefconfig
m68k                          sun3x_defconfig
arc                           tb10x_defconfig
m68k                       bvme6000_defconfig
arm64                               defconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
i386                          randconfig-a006
x86_64                        randconfig-a005
i386                          randconfig-a004
hexagon              randconfig-r041-20220825
hexagon              randconfig-r045-20220825
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220824
hexagon              randconfig-r045-20220824
hexagon              randconfig-r045-20220826
hexagon              randconfig-r041-20220826
x86_64                        randconfig-a016
riscv                randconfig-r042-20220825
x86_64                        randconfig-a012
s390                 randconfig-r044-20220825
hexagon              randconfig-r045-20220827
riscv                randconfig-r042-20220827
hexagon              randconfig-r041-20220827
s390                 randconfig-r044-20220827
arm                                 defconfig
arm                         bcm2835_defconfig
hexagon              randconfig-r045-20220823
riscv                randconfig-r042-20220823
hexagon              randconfig-r041-20220823
s390                 randconfig-r044-20220823
x86_64                        randconfig-k001
powerpc                  mpc885_ads_defconfig
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
