Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3EC279F8FB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 05:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbjINDoB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 23:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjINDoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 23:44:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8986A193
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 20:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694663036; x=1726199036;
  h=date:from:to:cc:subject:message-id;
  bh=9JQAqEApTpAmaZH+ouaC5bW7WQureYpPA7OF0steQCU=;
  b=hS9fjOAc7hw8t/O852BydN4ySmrlEdu0nPzR0S+vRjnhLoYVYbPd9rYS
   seCNJcDb/Vsg8hh7jKy5u3D3osnkRnpdXRxcPt7U9T2LIVnYlToZJlYDR
   QrKvLzsJCx4nk345JO4KX++ig4O8t0e4i5mLAQFH+c42wuX6AoRDNAixY
   55axyQqFAQ9bJpK7xVKBqU8Bd68AT3CK4Earl8iYcDATvxK0DxSgwTlIK
   7NV9AI1y/O7YDtcIuzbIRxp6VNzDvs1xkyyyWyCI1xtCmnnmAWYWPQhbI
   0SwQh+wm/a14tdWouV5VbG44MiO46OP4v8ZD1gKeW7/5aw7rvvfEadtZB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377751666"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377751666"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="809893682"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="809893682"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2023 20:43:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgdGi-00016v-0V;
        Thu, 14 Sep 2023 03:43:52 +0000
Date:   Thu, 14 Sep 2023 11:43:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 64061b67335e958e6328bcb5bb2b5490d57f3f59
Message-ID: <202309141148.oBBiXYV8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 64061b67335e958e6328bcb5bb2b5490d57f3f59  pinctrl: starfive: jh7110: Add system pm ops to save and restore context

elapsed time: 1004m

configs tested: 202
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230913   gcc  
alpha                randconfig-r005-20230913   gcc  
alpha                randconfig-r014-20230913   gcc  
alpha                randconfig-r021-20230913   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230913   gcc  
arc                   randconfig-001-20230914   gcc  
arc                  randconfig-r035-20230913   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                        neponset_defconfig   clang
arm                   randconfig-001-20230914   gcc  
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
hexagon                             defconfig   clang
hexagon              randconfig-r012-20230913   clang
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
i386                 randconfig-r003-20230913   gcc  
i386                 randconfig-r023-20230913   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230913   gcc  
loongarch             randconfig-001-20230914   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r022-20230913   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r015-20230913   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                       lemote2f_defconfig   clang
mips                      malta_kvm_defconfig   clang
mips                 randconfig-r025-20230913   gcc  
mips                 randconfig-r036-20230913   clang
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
openrisc             randconfig-r013-20230913   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230913   gcc  
parisc               randconfig-r024-20230913   gcc  
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
powerpc              randconfig-r001-20230913   gcc  
powerpc64            randconfig-r031-20230913   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230913   gcc  
riscv                 randconfig-001-20230914   gcc  
riscv                randconfig-r011-20230913   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230914   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230914   gcc  
sparc                randconfig-r033-20230913   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230913   clang
um                   randconfig-r026-20230913   gcc  
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
x86_64                randconfig-071-20230913   gcc  
x86_64                randconfig-071-20230914   gcc  
x86_64                randconfig-072-20230913   gcc  
x86_64                randconfig-072-20230914   gcc  
x86_64                randconfig-073-20230913   gcc  
x86_64                randconfig-073-20230914   gcc  
x86_64                randconfig-074-20230913   gcc  
x86_64                randconfig-074-20230914   gcc  
x86_64                randconfig-075-20230913   gcc  
x86_64                randconfig-075-20230914   gcc  
x86_64                randconfig-076-20230913   gcc  
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
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r016-20230913   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
