Return-Path: <linux-gpio+bounces-221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5347EEFDD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 11:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D772C2812EA
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 10:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F4718658;
	Fri, 17 Nov 2023 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ls8H9Jay"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D1CC1
	for <linux-gpio@vger.kernel.org>; Fri, 17 Nov 2023 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215993; x=1731751993;
  h=date:from:to:cc:subject:message-id;
  bh=qoIyECRC0zldvgJKcvvcLCktxQPlycA2h40icNKp01Y=;
  b=ls8H9JaybDIxFPv5erWlXb50/h/wN/8zOkxFQ+iFE7GyDUKCE961weV/
   +uCljGpxjbf9XHap8gUZ34p7tzl89BO09hHJ6IC4eJ7xEWrbBnd0UH21C
   QUSwYUTN99/8wa/4WGG2D92JPifsOOShlp+aF+dM9MpfKTl4tV7GFMW/s
   Na9NYHQD40FDMGHx+SLuFLTgY1OlByifAf37f1F1A0yf2vC0s1MZEYUZg
   ALrj2D6bt9w9/Oo7DqgJ5p3Nhnj7WHU//95BlO7B7V0+KUlFzUqxCjjWE
   yRR36i0U7F5v8TbtfqGKNXQDcRk2axDjdIyBdg4EqtaNzKBO7+wUtHUFD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="371455280"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="371455280"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:13:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="13449486"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2023 02:13:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3vq1-0002aE-1l;
	Fri, 17 Nov 2023 10:12:53 +0000
Date: Fri, 17 Nov 2023 18:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/cy8c95x0-doc] BUILD SUCCESS
 e01be5d0b42676827126b85d6c532b3d16cac80b
Message-ID: <202311171813.FYnpEhwz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/cy8c95x0-doc
branch HEAD: e01be5d0b42676827126b85d6c532b3d16cac80b  pinctrl: cy8c95x0: Fix doc warning

elapsed time: 4044m

configs tested: 371
configs skipped: 4

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
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231115   gcc  
arc                   randconfig-001-20231116   gcc  
arc                   randconfig-001-20231117   gcc  
arc                   randconfig-002-20231115   gcc  
arc                   randconfig-002-20231116   gcc  
arc                   randconfig-002-20231117   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                           h3600_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20231115   gcc  
arm                   randconfig-001-20231116   gcc  
arm                   randconfig-001-20231117   gcc  
arm                   randconfig-002-20231115   gcc  
arm                   randconfig-002-20231116   gcc  
arm                   randconfig-002-20231117   gcc  
arm                   randconfig-003-20231115   gcc  
arm                   randconfig-003-20231116   gcc  
arm                   randconfig-003-20231117   gcc  
arm                   randconfig-004-20231115   gcc  
arm                   randconfig-004-20231116   gcc  
arm                   randconfig-004-20231117   gcc  
arm                         vf610m4_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231115   gcc  
arm64                 randconfig-001-20231116   gcc  
arm64                 randconfig-001-20231117   gcc  
arm64                 randconfig-002-20231115   gcc  
arm64                 randconfig-002-20231116   gcc  
arm64                 randconfig-002-20231117   gcc  
arm64                 randconfig-003-20231115   gcc  
arm64                 randconfig-003-20231116   gcc  
arm64                 randconfig-003-20231117   gcc  
arm64                 randconfig-004-20231115   gcc  
arm64                 randconfig-004-20231116   gcc  
arm64                 randconfig-004-20231117   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231115   gcc  
csky                  randconfig-001-20231116   gcc  
csky                  randconfig-001-20231117   gcc  
csky                  randconfig-002-20231115   gcc  
csky                  randconfig-002-20231116   gcc  
csky                  randconfig-002-20231117   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231115   gcc  
i386         buildonly-randconfig-001-20231116   gcc  
i386         buildonly-randconfig-001-20231117   gcc  
i386         buildonly-randconfig-002-20231115   gcc  
i386         buildonly-randconfig-002-20231116   gcc  
i386         buildonly-randconfig-002-20231117   gcc  
i386         buildonly-randconfig-003-20231115   gcc  
i386         buildonly-randconfig-003-20231116   gcc  
i386         buildonly-randconfig-003-20231117   gcc  
i386         buildonly-randconfig-004-20231115   gcc  
i386         buildonly-randconfig-004-20231116   gcc  
i386         buildonly-randconfig-004-20231117   gcc  
i386         buildonly-randconfig-005-20231115   gcc  
i386         buildonly-randconfig-005-20231116   gcc  
i386         buildonly-randconfig-005-20231117   gcc  
i386         buildonly-randconfig-006-20231115   gcc  
i386         buildonly-randconfig-006-20231116   gcc  
i386         buildonly-randconfig-006-20231117   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231115   gcc  
i386                  randconfig-001-20231116   gcc  
i386                  randconfig-001-20231117   gcc  
i386                  randconfig-002-20231115   gcc  
i386                  randconfig-002-20231116   gcc  
i386                  randconfig-002-20231117   gcc  
i386                  randconfig-003-20231115   gcc  
i386                  randconfig-003-20231116   gcc  
i386                  randconfig-003-20231117   gcc  
i386                  randconfig-004-20231115   gcc  
i386                  randconfig-004-20231116   gcc  
i386                  randconfig-004-20231117   gcc  
i386                  randconfig-005-20231115   gcc  
i386                  randconfig-005-20231116   gcc  
i386                  randconfig-005-20231117   gcc  
i386                  randconfig-006-20231115   gcc  
i386                  randconfig-006-20231116   gcc  
i386                  randconfig-006-20231117   gcc  
i386                  randconfig-011-20231115   gcc  
i386                  randconfig-011-20231116   gcc  
i386                  randconfig-011-20231117   gcc  
i386                  randconfig-012-20231115   gcc  
i386                  randconfig-012-20231116   gcc  
i386                  randconfig-012-20231117   gcc  
i386                  randconfig-013-20231115   gcc  
i386                  randconfig-013-20231116   gcc  
i386                  randconfig-013-20231117   gcc  
i386                  randconfig-014-20231115   gcc  
i386                  randconfig-014-20231116   gcc  
i386                  randconfig-014-20231117   gcc  
i386                  randconfig-015-20231115   gcc  
i386                  randconfig-015-20231116   gcc  
i386                  randconfig-015-20231117   gcc  
i386                  randconfig-016-20231115   gcc  
i386                  randconfig-016-20231116   gcc  
i386                  randconfig-016-20231117   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231115   gcc  
loongarch             randconfig-001-20231116   gcc  
loongarch             randconfig-001-20231117   gcc  
loongarch             randconfig-002-20231115   gcc  
loongarch             randconfig-002-20231116   gcc  
loongarch             randconfig-002-20231117   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231115   gcc  
nios2                 randconfig-001-20231116   gcc  
nios2                 randconfig-001-20231117   gcc  
nios2                 randconfig-002-20231115   gcc  
nios2                 randconfig-002-20231116   gcc  
nios2                 randconfig-002-20231117   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231115   gcc  
parisc                randconfig-001-20231116   gcc  
parisc                randconfig-001-20231117   gcc  
parisc                randconfig-002-20231115   gcc  
parisc                randconfig-002-20231116   gcc  
parisc                randconfig-002-20231117   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20231115   gcc  
powerpc               randconfig-001-20231116   gcc  
powerpc               randconfig-001-20231117   gcc  
powerpc               randconfig-002-20231115   gcc  
powerpc               randconfig-002-20231116   gcc  
powerpc               randconfig-002-20231117   gcc  
powerpc               randconfig-003-20231115   gcc  
powerpc               randconfig-003-20231116   gcc  
powerpc               randconfig-003-20231117   gcc  
powerpc                     tqm8540_defconfig   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc                      walnut_defconfig   clang
powerpc64             randconfig-001-20231115   gcc  
powerpc64             randconfig-001-20231116   gcc  
powerpc64             randconfig-001-20231117   gcc  
powerpc64             randconfig-002-20231115   gcc  
powerpc64             randconfig-002-20231116   gcc  
powerpc64             randconfig-002-20231117   gcc  
powerpc64             randconfig-003-20231115   gcc  
powerpc64             randconfig-003-20231116   gcc  
powerpc64             randconfig-003-20231117   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231115   gcc  
riscv                 randconfig-001-20231116   gcc  
riscv                 randconfig-001-20231117   gcc  
riscv                 randconfig-002-20231115   gcc  
riscv                 randconfig-002-20231116   gcc  
riscv                 randconfig-002-20231117   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231115   gcc  
s390                  randconfig-001-20231116   gcc  
s390                  randconfig-001-20231117   gcc  
s390                  randconfig-002-20231115   gcc  
s390                  randconfig-002-20231116   gcc  
s390                  randconfig-002-20231117   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20231115   gcc  
sh                    randconfig-001-20231116   gcc  
sh                    randconfig-001-20231117   gcc  
sh                    randconfig-002-20231115   gcc  
sh                    randconfig-002-20231116   gcc  
sh                    randconfig-002-20231117   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231115   gcc  
sparc64               randconfig-001-20231116   gcc  
sparc64               randconfig-001-20231117   gcc  
sparc64               randconfig-002-20231115   gcc  
sparc64               randconfig-002-20231116   gcc  
sparc64               randconfig-002-20231117   gcc  
um                               allmodconfig   clang
um                               allmodconfig   gcc  
um                                allnoconfig   gcc  
um                               allyesconfig   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231115   gcc  
um                    randconfig-001-20231116   gcc  
um                    randconfig-001-20231117   gcc  
um                    randconfig-002-20231115   gcc  
um                    randconfig-002-20231116   gcc  
um                    randconfig-002-20231117   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231115   gcc  
x86_64       buildonly-randconfig-001-20231116   gcc  
x86_64       buildonly-randconfig-001-20231117   gcc  
x86_64       buildonly-randconfig-002-20231115   gcc  
x86_64       buildonly-randconfig-002-20231116   gcc  
x86_64       buildonly-randconfig-002-20231117   gcc  
x86_64       buildonly-randconfig-003-20231115   gcc  
x86_64       buildonly-randconfig-003-20231116   gcc  
x86_64       buildonly-randconfig-003-20231117   gcc  
x86_64       buildonly-randconfig-004-20231115   gcc  
x86_64       buildonly-randconfig-004-20231116   gcc  
x86_64       buildonly-randconfig-004-20231117   gcc  
x86_64       buildonly-randconfig-005-20231115   gcc  
x86_64       buildonly-randconfig-005-20231116   gcc  
x86_64       buildonly-randconfig-005-20231117   gcc  
x86_64       buildonly-randconfig-006-20231115   gcc  
x86_64       buildonly-randconfig-006-20231116   gcc  
x86_64       buildonly-randconfig-006-20231117   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231115   gcc  
x86_64                randconfig-001-20231116   gcc  
x86_64                randconfig-001-20231117   gcc  
x86_64                randconfig-002-20231115   gcc  
x86_64                randconfig-002-20231116   gcc  
x86_64                randconfig-002-20231117   gcc  
x86_64                randconfig-003-20231115   gcc  
x86_64                randconfig-003-20231116   gcc  
x86_64                randconfig-003-20231117   gcc  
x86_64                randconfig-004-20231115   gcc  
x86_64                randconfig-004-20231116   gcc  
x86_64                randconfig-004-20231117   gcc  
x86_64                randconfig-005-20231115   gcc  
x86_64                randconfig-005-20231116   gcc  
x86_64                randconfig-005-20231117   gcc  
x86_64                randconfig-006-20231115   gcc  
x86_64                randconfig-006-20231116   gcc  
x86_64                randconfig-006-20231117   gcc  
x86_64                randconfig-011-20231115   gcc  
x86_64                randconfig-011-20231116   gcc  
x86_64                randconfig-011-20231117   gcc  
x86_64                randconfig-012-20231115   gcc  
x86_64                randconfig-012-20231116   gcc  
x86_64                randconfig-012-20231117   gcc  
x86_64                randconfig-013-20231115   gcc  
x86_64                randconfig-013-20231116   gcc  
x86_64                randconfig-013-20231117   gcc  
x86_64                randconfig-014-20231115   gcc  
x86_64                randconfig-014-20231116   gcc  
x86_64                randconfig-014-20231117   gcc  
x86_64                randconfig-015-20231115   gcc  
x86_64                randconfig-015-20231116   gcc  
x86_64                randconfig-015-20231117   gcc  
x86_64                randconfig-016-20231115   gcc  
x86_64                randconfig-016-20231116   gcc  
x86_64                randconfig-016-20231117   gcc  
x86_64                randconfig-071-20231115   gcc  
x86_64                randconfig-071-20231116   gcc  
x86_64                randconfig-071-20231117   gcc  
x86_64                randconfig-072-20231115   gcc  
x86_64                randconfig-072-20231116   gcc  
x86_64                randconfig-072-20231117   gcc  
x86_64                randconfig-073-20231115   gcc  
x86_64                randconfig-073-20231116   gcc  
x86_64                randconfig-073-20231117   gcc  
x86_64                randconfig-074-20231115   gcc  
x86_64                randconfig-074-20231116   gcc  
x86_64                randconfig-074-20231117   gcc  
x86_64                randconfig-075-20231115   gcc  
x86_64                randconfig-075-20231116   gcc  
x86_64                randconfig-075-20231117   gcc  
x86_64                randconfig-076-20231115   gcc  
x86_64                randconfig-076-20231116   gcc  
x86_64                randconfig-076-20231117   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20231115   gcc  
xtensa                randconfig-001-20231116   gcc  
xtensa                randconfig-001-20231117   gcc  
xtensa                randconfig-002-20231115   gcc  
xtensa                randconfig-002-20231116   gcc  
xtensa                randconfig-002-20231117   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

