Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE5C79F7EA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 04:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbjINCXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 22:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbjINCXp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 22:23:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AD1198
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 19:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694658221; x=1726194221;
  h=date:from:to:cc:subject:message-id;
  bh=AWFL6ueT5hDPA4GVqWU/7BWcadBwmTb38dR/cCLjoxo=;
  b=HUYxe2D3qwoE9kRLfl8+iVCPg0sOsH8I31JlfBDGwWTrrBXP2WzkWsUY
   voBiNnYTnzbdi6TfgPVLID1iNhYSo+LbUYJIaCsb0tfcNCUH+rNAAiZqb
   9TW4DQI+lqagkV5FsANM+MESlxCDvnRWHisYnmMdTRU8qkV81qIeUeShP
   pWJ6hLm1lKSO+OcxeAPDhDyZR7wIZKAws6MvLs98irMAw3CTaTR67ueXW
   MeFjgXcd5yp+IL/EeRjmDiSXw5AsOKQA+9IpU6kvFKtjB6GlnH7EFfUdg
   8oZzwrlzdaMJbZxNAb5YQs7WHj/Dway4Un8nBZQUz8KSK5GIHWDVpidpo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377741997"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377741997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 19:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694062706"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694062706"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 19:23:40 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgc13-00010Y-2s;
        Thu, 14 Sep 2023 02:23:37 +0000
Date:   Thu, 14 Sep 2023 10:23:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/novoton-kconfig] BUILD SUCCESS
 6ddefcd670ca6445caeacf29908e4666f55595bf
Message-ID: <202309141002.qPHxHmVs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/novoton-kconfig
branch HEAD: 6ddefcd670ca6445caeacf29908e4666f55595bf  pinctrl: nuvoton: Fix up Kconfig deps

elapsed time: 923m

configs tested: 205
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20230913   gcc  
arc                   randconfig-001-20230914   gcc  
arc                  randconfig-r035-20230913   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                   randconfig-001-20230913   gcc  
arm                   randconfig-001-20230914   gcc  
arm                           sunxi_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r034-20230913   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230913   gcc  
csky                 randconfig-r006-20230913   gcc  
hexagon                             defconfig   clang
hexagon               randconfig-001-20230913   clang
hexagon               randconfig-002-20230913   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230914   gcc  
i386         buildonly-randconfig-002-20230914   gcc  
i386         buildonly-randconfig-003-20230914   gcc  
i386         buildonly-randconfig-004-20230914   gcc  
i386         buildonly-randconfig-005-20230914   gcc  
i386         buildonly-randconfig-006-20230914   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230914   gcc  
i386                  randconfig-002-20230914   gcc  
i386                  randconfig-003-20230914   gcc  
i386                  randconfig-004-20230914   gcc  
i386                  randconfig-005-20230914   gcc  
i386                  randconfig-006-20230914   gcc  
i386                  randconfig-011-20230914   gcc  
i386                  randconfig-012-20230914   gcc  
i386                  randconfig-013-20230914   gcc  
i386                  randconfig-014-20230914   gcc  
i386                  randconfig-015-20230914   gcc  
i386                  randconfig-016-20230914   gcc  
i386                 randconfig-r015-20230913   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230913   gcc  
loongarch             randconfig-001-20230914   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                      malta_kvm_defconfig   clang
mips                 randconfig-r016-20230913   gcc  
mips                 randconfig-r036-20230913   clang
mips                         rt305x_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230913   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc                      ppc64e_defconfig   clang
powerpc                     stx_gp3_defconfig   gcc  
powerpc64            randconfig-r003-20230913   gcc  
powerpc64            randconfig-r013-20230913   clang
powerpc64            randconfig-r031-20230913   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230913   gcc  
riscv                 randconfig-001-20230914   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230913   clang
s390                  randconfig-001-20230914   gcc  
s390                 randconfig-r012-20230913   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                   randconfig-r011-20230913   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230913   gcc  
sparc                 randconfig-001-20230914   gcc  
sparc                randconfig-r033-20230913   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r005-20230913   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230913   gcc  
x86_64       buildonly-randconfig-001-20230914   gcc  
x86_64       buildonly-randconfig-002-20230913   gcc  
x86_64       buildonly-randconfig-002-20230914   gcc  
x86_64       buildonly-randconfig-003-20230913   gcc  
x86_64       buildonly-randconfig-003-20230914   gcc  
x86_64       buildonly-randconfig-004-20230913   gcc  
x86_64       buildonly-randconfig-004-20230914   gcc  
x86_64       buildonly-randconfig-005-20230913   gcc  
x86_64       buildonly-randconfig-005-20230914   gcc  
x86_64       buildonly-randconfig-006-20230913   gcc  
x86_64       buildonly-randconfig-006-20230914   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230914   gcc  
x86_64                randconfig-002-20230914   gcc  
x86_64                randconfig-003-20230914   gcc  
x86_64                randconfig-004-20230914   gcc  
x86_64                randconfig-005-20230914   gcc  
x86_64                randconfig-006-20230914   gcc  
x86_64                randconfig-011-20230914   gcc  
x86_64                randconfig-012-20230914   gcc  
x86_64                randconfig-013-20230914   gcc  
x86_64                randconfig-014-20230914   gcc  
x86_64                randconfig-015-20230914   gcc  
x86_64                randconfig-016-20230914   gcc  
x86_64                randconfig-071-20230914   gcc  
x86_64                randconfig-072-20230914   gcc  
x86_64                randconfig-073-20230914   gcc  
x86_64                randconfig-074-20230914   gcc  
x86_64                randconfig-075-20230914   gcc  
x86_64                randconfig-076-20230914   gcc  
x86_64               randconfig-r032-20230913   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r004-20230913   gcc  
xtensa               randconfig-r014-20230913   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
