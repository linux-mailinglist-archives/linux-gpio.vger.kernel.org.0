Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA9E679DA9C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 23:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjILVRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 17:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjILVRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 17:17:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F1B106
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 14:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694553458; x=1726089458;
  h=date:from:to:cc:subject:message-id;
  bh=g/uSRcr8HD12k5rtWrhvBGqPU0ZhcL6rwKZlH6FmtDY=;
  b=UoYK5axED6+WL+zcuZoPxY4uq6PRnj/1o5N4pwB9qMyIphV/FnWKBuZt
   vXZ6O+PLrSK9qYmPFUMyzLEwY4QvoRbGmyU+7vRSH60bgsfbRDpJgZPz8
   kkF/LsKdrs+bhIzVwymqnTNY+buoLnmFt5ubVo5U0yPJ9Y3spIzudx7LY
   ylqumAx57VYRNMD0/FuzqVlFR95YhbcU8u9qrzqeaaLVDlXZQH6YxZNo7
   5ULabGyJ76A9p8QRrjMZHI0wYa1/kTU8ltaZIlm+l/lwYGXtwCoAiKv+D
   nfNnTksGUBevyHtOVptaBGUG3w8iXwM83KUY5gd++76/H7nBGC0yLS0X0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377404245"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="377404245"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 14:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737232944"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="737232944"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Sep 2023 14:17:36 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgAlK-0000Hh-21;
        Tue, 12 Sep 2023 21:17:34 +0000
Date:   Wed, 13 Sep 2023 05:16:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 a5c612b9dbe14fee62829b4aecde17d670effed2
Message-ID: <202309130537.RCuU7LqA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a5c612b9dbe14fee62829b4aecde17d670effed2  pinctrl: da9062: don't include private GPIOLIB header

elapsed time: 735m

configs tested: 293
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230912   gcc  
alpha                randconfig-r014-20230912   gcc  
alpha                randconfig-r033-20230912   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20230912   gcc  
arc                  randconfig-r013-20230912   gcc  
arc                  randconfig-r015-20230912   gcc  
arc                  randconfig-r021-20230912   gcc  
arc                  randconfig-r022-20230912   gcc  
arc                  randconfig-r036-20230912   gcc  
arc                        vdk_hs38_defconfig   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20230912   clang
arm                  randconfig-r005-20230912   gcc  
arm                  randconfig-r035-20230912   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230913   clang
arm64                randconfig-r016-20230912   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230913   gcc  
csky                 randconfig-r025-20230912   gcc  
csky                 randconfig-r025-20230913   gcc  
hexagon               randconfig-001-20230912   clang
hexagon               randconfig-001-20230913   clang
hexagon               randconfig-002-20230912   clang
hexagon               randconfig-002-20230913   clang
hexagon              randconfig-r005-20230913   clang
hexagon              randconfig-r022-20230912   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230912   clang
i386         buildonly-randconfig-001-20230913   gcc  
i386         buildonly-randconfig-002-20230912   clang
i386         buildonly-randconfig-002-20230913   gcc  
i386         buildonly-randconfig-003-20230912   clang
i386         buildonly-randconfig-003-20230913   gcc  
i386         buildonly-randconfig-004-20230912   clang
i386         buildonly-randconfig-004-20230913   gcc  
i386         buildonly-randconfig-005-20230912   clang
i386         buildonly-randconfig-005-20230913   gcc  
i386         buildonly-randconfig-006-20230912   clang
i386         buildonly-randconfig-006-20230913   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230912   clang
i386                  randconfig-001-20230913   gcc  
i386                  randconfig-002-20230912   clang
i386                  randconfig-002-20230913   gcc  
i386                  randconfig-003-20230912   clang
i386                  randconfig-003-20230913   gcc  
i386                  randconfig-004-20230912   clang
i386                  randconfig-004-20230913   gcc  
i386                  randconfig-005-20230912   clang
i386                  randconfig-005-20230913   gcc  
i386                  randconfig-006-20230912   clang
i386                  randconfig-006-20230913   gcc  
i386                  randconfig-011-20230912   gcc  
i386                  randconfig-011-20230913   clang
i386                  randconfig-012-20230912   gcc  
i386                  randconfig-012-20230913   clang
i386                  randconfig-013-20230912   gcc  
i386                  randconfig-013-20230913   clang
i386                  randconfig-014-20230912   gcc  
i386                  randconfig-014-20230913   clang
i386                  randconfig-015-20230912   gcc  
i386                  randconfig-015-20230913   clang
i386                  randconfig-016-20230912   gcc  
i386                  randconfig-016-20230913   clang
i386                 randconfig-r015-20230912   gcc  
i386                 randconfig-r021-20230912   gcc  
i386                 randconfig-r022-20230912   gcc  
i386                 randconfig-r032-20230912   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230912   gcc  
loongarch             randconfig-001-20230913   gcc  
loongarch            randconfig-r005-20230913   gcc  
loongarch            randconfig-r011-20230912   gcc  
loongarch            randconfig-r024-20230912   gcc  
loongarch            randconfig-r031-20230912   gcc  
loongarch            randconfig-r032-20230912   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230912   gcc  
m68k                 randconfig-r023-20230913   gcc  
m68k                 randconfig-r025-20230912   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r013-20230912   gcc  
microblaze           randconfig-r034-20230912   gcc  
microblaze           randconfig-r036-20230912   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                 randconfig-r006-20230913   clang
mips                          rb532_defconfig   gcc  
mips                   sb1250_swarm_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230912   gcc  
nios2                randconfig-r022-20230912   gcc  
nios2                randconfig-r023-20230912   gcc  
nios2                randconfig-r026-20230912   gcc  
nios2                randconfig-r031-20230912   gcc  
nios2                randconfig-r033-20230913   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r021-20230913   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230912   gcc  
parisc               randconfig-r004-20230913   gcc  
parisc               randconfig-r012-20230912   gcc  
parisc               randconfig-r013-20230912   gcc  
parisc               randconfig-r023-20230913   gcc  
parisc               randconfig-r024-20230913   gcc  
parisc               randconfig-r026-20230913   gcc  
parisc               randconfig-r035-20230913   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc              randconfig-r003-20230913   gcc  
powerpc              randconfig-r013-20230912   gcc  
powerpc              randconfig-r015-20230912   gcc  
powerpc              randconfig-r023-20230912   gcc  
powerpc              randconfig-r026-20230912   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc64            randconfig-r004-20230913   gcc  
powerpc64            randconfig-r006-20230913   gcc  
powerpc64            randconfig-r012-20230912   gcc  
powerpc64            randconfig-r035-20230912   clang
powerpc64            randconfig-r036-20230912   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20230912   clang
riscv                randconfig-r011-20230912   gcc  
riscv                randconfig-r011-20230913   clang
riscv                randconfig-r014-20230912   gcc  
riscv                randconfig-r014-20230913   clang
riscv                randconfig-r016-20230913   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230912   gcc  
s390                  randconfig-001-20230913   clang
s390                 randconfig-r002-20230913   gcc  
s390                 randconfig-r005-20230913   gcc  
s390                 randconfig-r011-20230912   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r025-20230913   gcc  
sh                   randconfig-r034-20230912   gcc  
sh                           se7619_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230913   gcc  
sparc                randconfig-r031-20230913   gcc  
sparc                randconfig-r036-20230913   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r014-20230912   gcc  
sparc64              randconfig-r035-20230912   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230912   gcc  
um                   randconfig-r011-20230912   clang
um                   randconfig-r023-20230912   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230912   clang
x86_64       buildonly-randconfig-001-20230913   gcc  
x86_64       buildonly-randconfig-002-20230912   clang
x86_64       buildonly-randconfig-002-20230913   gcc  
x86_64       buildonly-randconfig-003-20230912   clang
x86_64       buildonly-randconfig-003-20230913   gcc  
x86_64       buildonly-randconfig-004-20230912   clang
x86_64       buildonly-randconfig-004-20230913   gcc  
x86_64       buildonly-randconfig-005-20230912   clang
x86_64       buildonly-randconfig-005-20230913   gcc  
x86_64       buildonly-randconfig-006-20230912   clang
x86_64       buildonly-randconfig-006-20230913   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230912   gcc  
x86_64                randconfig-001-20230913   clang
x86_64                randconfig-002-20230912   gcc  
x86_64                randconfig-002-20230913   clang
x86_64                randconfig-003-20230912   gcc  
x86_64                randconfig-003-20230913   clang
x86_64                randconfig-004-20230912   gcc  
x86_64                randconfig-004-20230913   clang
x86_64                randconfig-005-20230912   gcc  
x86_64                randconfig-005-20230913   clang
x86_64                randconfig-006-20230912   gcc  
x86_64                randconfig-006-20230913   clang
x86_64                randconfig-011-20230912   clang
x86_64                randconfig-011-20230913   gcc  
x86_64                randconfig-012-20230912   clang
x86_64                randconfig-012-20230913   gcc  
x86_64                randconfig-013-20230912   clang
x86_64                randconfig-013-20230913   gcc  
x86_64                randconfig-014-20230912   clang
x86_64                randconfig-014-20230913   gcc  
x86_64                randconfig-015-20230912   clang
x86_64                randconfig-015-20230913   gcc  
x86_64                randconfig-016-20230912   clang
x86_64                randconfig-016-20230913   gcc  
x86_64                randconfig-071-20230912   clang
x86_64                randconfig-071-20230913   gcc  
x86_64                randconfig-072-20230912   clang
x86_64                randconfig-072-20230913   gcc  
x86_64                randconfig-073-20230912   clang
x86_64                randconfig-073-20230913   gcc  
x86_64                randconfig-074-20230912   clang
x86_64                randconfig-074-20230913   gcc  
x86_64                randconfig-075-20230912   clang
x86_64                randconfig-075-20230913   gcc  
x86_64                randconfig-076-20230912   clang
x86_64                randconfig-076-20230913   gcc  
x86_64               randconfig-r031-20230912   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r015-20230912   gcc  
xtensa               randconfig-r016-20230912   gcc  
xtensa               randconfig-r024-20230912   gcc  
xtensa               randconfig-r032-20230912   gcc  
xtensa               randconfig-r034-20230913   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
