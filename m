Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1BE6C8A9F
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Mar 2023 04:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjCYDUt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 23:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCYDUs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 23:20:48 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F0BBDEF
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 20:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679714447; x=1711250447;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jcQZojnbACzavHTGFBfAoI0ryLwZ3Y1Q6Vfx3f/scXI=;
  b=hjOsD9RmUbGQA0xJHahCsxgXfEGlFCNW+ligE7jXBnxLZ0EY6g6ZrGXe
   mnAEWem1xdZwIqT1IHudabAnx+uGA/n/6ODxry3kYOTS6lVnVNxrcDUBg
   I3PA8CxuTFDnzwlAlv/GMSczNEABtH/j6pZx8yxaSFQkmj6g+STus21GV
   j8AszaX33aIjdlWdHgfBFLvX/j82d8FKntBcjZYeUnwfRNaguTNcX4Otz
   1x6WLtwGrleqyhQGMMYjSQkfODDhpE7SDnZa3X+0uxJTb6Ne9AUgEtaf8
   hg0FyztpcQobW2Oq6woXMR6XrNAkHSj4X/fPjmfsQADCXk8UYuDOKS5w9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="404852887"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="404852887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 20:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="715460938"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="715460938"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Mar 2023 20:20:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfuSS-000Fu5-1W;
        Sat, 25 Mar 2023 03:20:44 +0000
Date:   Sat, 25 Mar 2023 11:20:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 a21031ccf31b08eba585a03d444c44177d30cfa2
Message-ID: <641e686e.0YybrbW0g9tjU7Ry%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: a21031ccf31b08eba585a03d444c44177d30cfa2  gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU

elapsed time: 735m

configs tested: 185
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230322   gcc  
alpha                randconfig-r025-20230322   gcc  
alpha                randconfig-r035-20230322   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r002-20230322   gcc  
arc                  randconfig-r013-20230323   gcc  
arc                  randconfig-r023-20230322   gcc  
arc                  randconfig-r024-20230322   gcc  
arc                  randconfig-r034-20230322   gcc  
arc                  randconfig-r036-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                       aspeed_g5_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          moxart_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                  randconfig-r014-20230322   clang
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r025-20230322   clang
arm                  randconfig-r035-20230322   gcc  
arm                  randconfig-r046-20230324   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r025-20230322   gcc  
arm64                randconfig-r031-20230322   clang
csky                                defconfig   gcc  
csky                 randconfig-r022-20230324   gcc  
csky                 randconfig-r034-20230322   gcc  
hexagon                          alldefconfig   clang
hexagon      buildonly-randconfig-r006-20230323   clang
hexagon              randconfig-r004-20230322   clang
hexagon              randconfig-r041-20230324   clang
hexagon              randconfig-r045-20230324   clang
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
ia64                 randconfig-r001-20230322   gcc  
ia64                 randconfig-r004-20230322   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r011-20230322   gcc  
ia64                 randconfig-r014-20230323   gcc  
ia64                 randconfig-r015-20230322   gcc  
ia64                 randconfig-r024-20230322   gcc  
ia64                 randconfig-r031-20230322   gcc  
ia64                 randconfig-r034-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230322   gcc  
loongarch            randconfig-r024-20230322   gcc  
loongarch            randconfig-r026-20230324   gcc  
loongarch            randconfig-r032-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                 randconfig-r012-20230322   gcc  
m68k                 randconfig-r015-20230322   gcc  
microblaze           randconfig-r015-20230322   gcc  
microblaze           randconfig-r021-20230322   gcc  
microblaze           randconfig-r024-20230324   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                 randconfig-r004-20230322   gcc  
mips                 randconfig-r005-20230322   gcc  
mips                 randconfig-r012-20230322   clang
mips                 randconfig-r021-20230322   clang
mips                 randconfig-r036-20230322   gcc  
nios2        buildonly-randconfig-r004-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230322   gcc  
nios2                randconfig-r003-20230322   gcc  
nios2                randconfig-r016-20230322   gcc  
openrisc     buildonly-randconfig-r002-20230322   gcc  
openrisc             randconfig-r011-20230323   gcc  
openrisc             randconfig-r012-20230322   gcc  
openrisc             randconfig-r016-20230322   gcc  
parisc       buildonly-randconfig-r003-20230322   gcc  
parisc       buildonly-randconfig-r005-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230322   gcc  
parisc               randconfig-r004-20230322   gcc  
parisc               randconfig-r011-20230322   gcc  
parisc               randconfig-r012-20230323   gcc  
parisc               randconfig-r013-20230322   gcc  
parisc               randconfig-r016-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                 mpc832x_mds_defconfig   clang
powerpc                 mpc837x_mds_defconfig   gcc  
powerpc              randconfig-c003-20230322   gcc  
powerpc              randconfig-r001-20230322   clang
powerpc              randconfig-r013-20230322   gcc  
powerpc              randconfig-r021-20230322   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230323   clang
s390                                defconfig   gcc  
s390                 randconfig-r001-20230322   clang
s390                 randconfig-r003-20230322   clang
s390                 randconfig-r004-20230322   clang
s390                 randconfig-r011-20230322   gcc  
s390                 randconfig-r012-20230322   gcc  
s390                 randconfig-r014-20230322   gcc  
s390                 randconfig-r016-20230322   gcc  
s390                 randconfig-r023-20230322   gcc  
s390                 randconfig-r035-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230322   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r005-20230322   gcc  
sh                   randconfig-r013-20230322   gcc  
sh                   randconfig-r014-20230322   gcc  
sh                   randconfig-r016-20230322   gcc  
sh                   randconfig-r022-20230322   gcc  
sh                   randconfig-r026-20230322   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc        buildonly-randconfig-r005-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230322   gcc  
sparc                randconfig-r011-20230322   gcc  
sparc                randconfig-r014-20230322   gcc  
sparc                randconfig-r031-20230322   gcc  
sparc64              randconfig-r016-20230323   gcc  
sparc64              randconfig-r022-20230322   gcc  
sparc64              randconfig-r024-20230322   gcc  
sparc64              randconfig-r032-20230322   gcc  
sparc64              randconfig-r035-20230322   gcc  
um                               alldefconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa       buildonly-randconfig-r001-20230322   gcc  
xtensa       buildonly-randconfig-r006-20230322   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r001-20230322   gcc  
xtensa               randconfig-r002-20230322   gcc  
xtensa               randconfig-r013-20230322   gcc  
xtensa               randconfig-r014-20230322   gcc  
xtensa               randconfig-r022-20230322   gcc  
xtensa               randconfig-r031-20230322   gcc  
xtensa               randconfig-r033-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
