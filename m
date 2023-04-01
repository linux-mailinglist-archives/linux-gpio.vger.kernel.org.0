Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666366D2D95
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Apr 2023 04:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbjDACGL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 22:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjDACGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 22:06:10 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5606F1710
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 19:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680314769; x=1711850769;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BLWJ85p03s8ccR+rHtFbi0hmLdvKIBXiUG4tfB6u11c=;
  b=dm5JlPeySgknixTTcK1MYY5fEZHkxJk67coENYY3VyCpML2/RPVz/ioR
   qCaYD2VIFBjhKEcTdqH28D4WkvgeZaNHwCRxzrlv9gWGSb1sIuJhgmDtA
   VUD4cU/jFYtkK/H7RYE2BXmsdLdL21C2M2PnLIeUM02B9OTby9KgVG2PW
   jh+BzGfa+lc1hjh0YyqFYHO+BU0mdI7bdRlccKDl+xFVS2nXZDg3zCVFp
   0RlJMDm5YOAObz6ly5H+O4Tb+0rtv7C5myWWU+mj9j4LqhoZhUSZUPyo2
   1j41xFyLc1GcEZ4w3xhndDM+Ug2vsYqutZMohJfbEVr8eDowRhuSh8WC4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340324431"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="340324431"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 19:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828927736"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="828927736"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2023 19:06:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1piQd4-000MMb-2Y;
        Sat, 01 Apr 2023 02:06:06 +0000
Date:   Sat, 01 Apr 2023 10:06:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 c436561687421493fe745c2cc26a8ad0f8dc208b
Message-ID: <6427918b.kF6n/kvxOj8e+0G+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c436561687421493fe745c2cc26a8ad0f8dc208b  dt-bindings: pinctrl: xway: drop the deprecated compatible strings

elapsed time: 777m

configs tested: 186
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230329   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230329   gcc  
alpha                randconfig-r004-20230329   gcc  
alpha                randconfig-r005-20230329   gcc  
alpha                randconfig-r016-20230329   gcc  
alpha                randconfig-r024-20230329   gcc  
alpha                randconfig-r025-20230329   gcc  
alpha                randconfig-r034-20230329   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230329   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230329   gcc  
arc                  randconfig-r013-20230329   gcc  
arc                  randconfig-r016-20230329   gcc  
arc                  randconfig-r025-20230329   gcc  
arc                  randconfig-r033-20230329   gcc  
arc                  randconfig-r035-20230329   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230329   gcc  
arm64                randconfig-r036-20230329   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230329   gcc  
csky                 randconfig-r013-20230331   gcc  
csky                 randconfig-r022-20230329   gcc  
csky                 randconfig-r033-20230329   gcc  
csky                 randconfig-r035-20230329   gcc  
hexagon              randconfig-r023-20230329   clang
hexagon              randconfig-r041-20230329   clang
hexagon              randconfig-r041-20230330   clang
hexagon              randconfig-r045-20230329   clang
hexagon              randconfig-r045-20230330   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a004   clang
i386                          randconfig-a006   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a014   gcc  
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230329   gcc  
ia64                 randconfig-r023-20230329   gcc  
ia64                 randconfig-r024-20230329   gcc  
ia64                 randconfig-r025-20230329   gcc  
ia64                 randconfig-r031-20230329   gcc  
ia64                 randconfig-r036-20230329   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230329   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230329   gcc  
loongarch            randconfig-r002-20230330   gcc  
loongarch            randconfig-r005-20230330   gcc  
loongarch            randconfig-r021-20230329   gcc  
loongarch            randconfig-r023-20230329   gcc  
loongarch            randconfig-r036-20230329   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                 randconfig-r001-20230330   gcc  
m68k                 randconfig-r013-20230329   gcc  
m68k                 randconfig-r015-20230329   gcc  
m68k                 randconfig-r031-20230329   gcc  
m68k                 randconfig-r035-20230329   gcc  
microblaze           randconfig-r023-20230329   gcc  
microblaze           randconfig-r024-20230329   gcc  
microblaze           randconfig-r032-20230329   gcc  
microblaze           randconfig-r036-20230329   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips         buildonly-randconfig-r003-20230329   clang
mips                            gpr_defconfig   gcc  
mips                 randconfig-r021-20230329   gcc  
mips                 randconfig-r026-20230329   gcc  
mips                          rb532_defconfig   gcc  
nios2        buildonly-randconfig-r004-20230329   gcc  
nios2        buildonly-randconfig-r005-20230329   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230330   gcc  
nios2                randconfig-r006-20230329   gcc  
nios2                randconfig-r014-20230331   gcc  
nios2                randconfig-r026-20230329   gcc  
nios2                randconfig-r033-20230329   gcc  
nios2                randconfig-r035-20230329   gcc  
openrisc     buildonly-randconfig-r003-20230329   gcc  
openrisc     buildonly-randconfig-r006-20230329   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r004-20230329   gcc  
openrisc             randconfig-r006-20230330   gcc  
openrisc             randconfig-r011-20230329   gcc  
openrisc             randconfig-r021-20230329   gcc  
openrisc             randconfig-r034-20230329   gcc  
openrisc             randconfig-r036-20230329   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230330   gcc  
parisc               randconfig-r006-20230329   gcc  
parisc               randconfig-r014-20230329   gcc  
parisc               randconfig-r015-20230329   gcc  
parisc               randconfig-r022-20230329   gcc  
parisc               randconfig-r025-20230329   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc              randconfig-r032-20230329   gcc  
powerpc              randconfig-r034-20230329   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230329   clang
riscv                               defconfig   gcc  
riscv                randconfig-r016-20230331   gcc  
riscv                randconfig-r032-20230329   gcc  
riscv                randconfig-r035-20230329   gcc  
riscv                randconfig-r042-20230329   clang
riscv                randconfig-r042-20230330   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230329   clang
s390         buildonly-randconfig-r003-20230329   clang
s390                                defconfig   gcc  
s390                 randconfig-r005-20230329   gcc  
s390                 randconfig-r015-20230331   gcc  
s390                 randconfig-r031-20230329   gcc  
s390                 randconfig-r032-20230329   gcc  
s390                 randconfig-r034-20230329   gcc  
s390                 randconfig-r035-20230329   gcc  
s390                 randconfig-r044-20230329   clang
s390                 randconfig-r044-20230330   clang
sh                               allmodconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                   randconfig-r011-20230331   gcc  
sh                   randconfig-r014-20230329   gcc  
sh                   randconfig-r023-20230329   gcc  
sh                   randconfig-r024-20230329   gcc  
sh                   randconfig-r031-20230329   gcc  
sh                   randconfig-r032-20230329   gcc  
sh                           se7705_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230329   gcc  
sparc                randconfig-r022-20230329   gcc  
sparc64              randconfig-r002-20230329   gcc  
sparc64              randconfig-r012-20230329   gcc  
sparc64              randconfig-r024-20230329   gcc  
sparc64              randconfig-r025-20230329   gcc  
sparc64              randconfig-r031-20230329   gcc  
sparc64              randconfig-r032-20230329   gcc  
sparc64              randconfig-r034-20230329   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230329   gcc  
xtensa               randconfig-r012-20230329   gcc  
xtensa               randconfig-r026-20230329   gcc  
xtensa               randconfig-r031-20230329   gcc  
xtensa               randconfig-r033-20230329   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
