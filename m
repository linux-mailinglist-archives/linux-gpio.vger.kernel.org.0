Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A46509F88
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 14:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383851AbiDUMZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Apr 2022 08:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243488AbiDUMZx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2022 08:25:53 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7199BDFA7
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650543783; x=1682079783;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=96Wa3zzHiDNgUoaw1VP2T4nFnB9Bzz25HBThWNrE6C4=;
  b=BdZ+c3K/DXLsUA9koRsH4u+2xwYigB3yQHQ3hVAxhrBX+N7yHhFQ03wY
   v+75yh4G4TFMPorBFhcWyeMG35bF/VviX3/ihJuvVTaPw0l8ICRb5MSny
   2SXzdEoNVZMalto+y9vK4FcRK4cNaPV+FDcheQBQbAhw7q3I0G4Cw/8mB
   cCkxVE6LXvyL9gz0aa1yMsVr8AXEqdtyhXj+p2pWuyvTimxAoAdlZ9UKb
   wgp3M8UHx/sRPpnfI5cuBRPNsh2PMThkZ13Mqv8KDv0b1XiQn1s6iNQLp
   NkOD+VhX2Jq7ycoHpXpwnRP9Bak7Iz+/XezuPiY4P6QfRwyWyCqnkXWiq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="264099751"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="264099751"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 05:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="658505071"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2022 05:23:01 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nhVpt-0008Nj-8O;
        Thu, 21 Apr 2022 12:23:01 +0000
Date:   Thu, 21 Apr 2022 20:22:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 87950929e2ff2236207bdbe14bff8230558b541b
Message-ID: <62614c71.Y1sEptoGszknzTtO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 87950929e2ff2236207bdbe14bff8230558b541b  pinctrl: mediatek: moore: Fix build error

elapsed time: 730m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                 randconfig-c004-20220420
i386                          randconfig-c001
ia64                          tiger_defconfig
powerpc                     sequoia_defconfig
arm                          exynos_defconfig
powerpc                        cell_defconfig
powerpc                     mpc83xx_defconfig
arm                         nhk8815_defconfig
powerpc                      makalu_defconfig
arm                        keystone_defconfig
sh                           se7619_defconfig
arm                        cerfcube_defconfig
powerpc                       eiger_defconfig
powerpc                    klondike_defconfig
arm                          pxa3xx_defconfig
sparc                       sparc32_defconfig
sh                          sdk7780_defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
arm64                            alldefconfig
sh                          polaris_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220420
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220420
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220420
mips                 randconfig-c004-20220420
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220420
powerpc              randconfig-c003-20220420
mips                        bcm63xx_defconfig
arm                         orion5x_defconfig
arm                       spear13xx_defconfig
mips                         tb0219_defconfig
arm                           omap1_defconfig
powerpc                      ppc44x_defconfig
powerpc                     pseries_defconfig
arm                       versatile_defconfig
powerpc                     kilauea_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220420
riscv                randconfig-r042-20220420
hexagon              randconfig-r045-20220420
s390                 randconfig-r044-20220420

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
