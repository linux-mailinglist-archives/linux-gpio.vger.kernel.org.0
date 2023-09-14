Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D36079F9AE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 06:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjINE7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Sep 2023 00:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbjINE7E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2023 00:59:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C871BCC
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694667540; x=1726203540;
  h=date:from:to:cc:subject:message-id;
  bh=2gZ/ezlgfYzkyydi7Z9TZpwWVPeqWGaw9WyOCIGmw3Y=;
  b=HRRCpvBakAkU8Hc2tAIEdOcslOwel9/cqVq57iCUTN6bNxdhoPMWUTXz
   S+qPd1XnAoqOLsqR+W79jWieb2r0vkERgTqIGRxak027XXYKl2T+AEKh0
   op8w/pgbNV4f12x/tX3aaiCic+kpSlgxUphkf0Y5wZ4Ausj5EA40oTBXr
   OuZfwLJ9y2nMjIVh2BqVXtW7Ckxa3z7iGipY9x/RXPqGOj9JYiBh35Zpr
   88K3w2Z/DcftFHNQiquNPQl3sK8adaLZaZI9YT9bCGHSJSEH37g3dkuhj
   w2imsy6t+tyF3IZh4OO3iNIoPbi/WuczWoPy1gpLaNFVk+5CIYqPP/cV2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363891008"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="363891008"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 21:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918110844"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="918110844"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 21:58:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgeRL-0001Az-1V;
        Thu, 14 Sep 2023 04:58:55 +0000
Date:   Thu, 14 Sep 2023 12:58:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 7777fa924754f69f9748d6fe730b1e6f38adf252
Message-ID: <202309141203.l5FhQwNB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 7777fa924754f69f9748d6fe730b1e6f38adf252  gpio: eic-sprd: use a helper variable for &pdev->dev

elapsed time: 931m

configs tested: 183
configs skipped: 3

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
arc                   randconfig-001-20230913   gcc  
arc                   randconfig-001-20230914   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                        neponset_defconfig   clang
arm                   randconfig-001-20230913   gcc  
arm                   randconfig-001-20230914   gcc  
arm                        vexpress_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230913   gcc  
hexagon                             defconfig   clang
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
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230913   gcc  
loongarch             randconfig-001-20230914   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                       lemote2f_defconfig   clang
mips                      malta_kvm_defconfig   clang
mips                       rbtx49xx_defconfig   clang
mips                         rt305x_defconfig   gcc  
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
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc                      ppc64e_defconfig   clang
powerpc64            randconfig-r014-20230913   clang
powerpc64            randconfig-r015-20230913   clang
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
s390                  randconfig-001-20230914   gcc  
s390                 randconfig-r013-20230913   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r011-20230913   gcc  
sh                          sdk7786_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230913   gcc  
sparc                 randconfig-001-20230914   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230913   gcc  
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
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
