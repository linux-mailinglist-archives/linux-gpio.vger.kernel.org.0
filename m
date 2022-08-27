Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610975A33DF
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Aug 2022 04:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbiH0Cni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 22:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236442AbiH0Cnh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 22:43:37 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A503E39B4
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661568216; x=1693104216;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FGAKkwRENg5+GnKplU2i99YXAb8x+NJBIUMNh0sOei0=;
  b=lN0InlIIBvHUJ7PXQhe83OvPB0FUjY+QDl9TdV6YbTGAutAJVGqVj5Mq
   8Yt2TBs/d5LncNTywaHZsMUkd9i0OopZ59qvCb2PNXcAy3ek74PUtQvl4
   Tj47BBrRAh6kESGSsjSdPcin/74V34AOg1XhOYjVpNjCc00aILQ6su7QY
   Epax62WM7dG5qgpHg5rBdsUiqOy5EtHOqL3lNZ+KOmJBVIVpNiuaWTazM
   J4cNYBlT46uU++NcnNvyB6U0PCK/KNBWheiZgkC+17+zPbuHLFtXDjnpk
   wDrD4rpQEKVMPQSS31dfwZYVWkynbDevrECkL7cw8/BnAEtxYMQFVI03f
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="277645469"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="277645469"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 19:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="679064800"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2022 19:43:34 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oRlnK-0000tV-01;
        Sat, 27 Aug 2022 02:43:34 +0000
Date:   Sat, 27 Aug 2022 10:43:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 98f0c2fc1fa3173ca5c54e10a10c932249399c95
Message-ID: <630984d1.uH41HCXcOyyucVJU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 98f0c2fc1fa3173ca5c54e10a10c932249399c95  Merge branch 'devel' into for-next

elapsed time: 721m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
um                             i386_defconfig
m68k                             allyesconfig
um                           x86_64_defconfig
loongarch                         allnoconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
loongarch                           defconfig
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                             allyesconfig
i386                          randconfig-a001
x86_64                              defconfig
i386                          randconfig-a003
x86_64                               rhel-8.3
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                           allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220827
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
x86_64                        randconfig-a011
x86_64                        randconfig-a013
ia64                             allmodconfig
sh                        apsh4ad0a_defconfig
openrisc                    or1ksim_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
s390                       zfcpdump_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc8540_ads_defconfig
arm                           sama5_defconfig
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
riscv                randconfig-r042-20220826
riscv                randconfig-r042-20220824
s390                 randconfig-r044-20220826
s390                 randconfig-r044-20220824
arc                  randconfig-r043-20220826
arc                  randconfig-r043-20220824
arc                  randconfig-r043-20220825
arm64                               defconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220827
hexagon              randconfig-r045-20220827
s390                 randconfig-r044-20220827
riscv                randconfig-r042-20220827
i386                          randconfig-a015
arm                                 defconfig
arm                         bcm2835_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
hexagon              randconfig-r045-20220825
hexagon              randconfig-r045-20220823
riscv                randconfig-r042-20220823
riscv                randconfig-r042-20220825
hexagon              randconfig-r041-20220823
hexagon              randconfig-r041-20220825
s390                 randconfig-r044-20220825
s390                 randconfig-r044-20220823
x86_64                        randconfig-k001
powerpc                  mpc885_ads_defconfig
i386                          randconfig-a013

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
