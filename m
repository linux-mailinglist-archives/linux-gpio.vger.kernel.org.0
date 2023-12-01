Return-Path: <linux-gpio+bounces-823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24180090D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 11:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18BDF1C210D1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 10:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10662208A9;
	Fri,  1 Dec 2023 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbxF3HOv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739591BCA
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 02:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701427814; x=1732963814;
  h=date:from:to:cc:subject:message-id;
  bh=4S5W1s0G0vtFWNVTa5ACa50hLZCdmrjTF76YeDhn7ko=;
  b=NbxF3HOve5L+OvtQQQro913lm/DLoFIvyss3ePnPJAASHDMKKUYpFGnG
   bGNJHgSYDzeiBHk0a/Xy0hDKxtal7r3iB1EvkCdqllf1kbMI3u+AkOCIU
   kOJJlfvwcQdJUx8pdoIGnQ+HDl+1ohtsSxu8t1eI3nyEXzIDcMzUGJML/
   juZdfVC3XYQmHg1um71+g88PPkhG6rrBqUqV+8qe60ZhSLFo4xi+f4XNv
   vcsNqCS+kP+ftuLHLdnCDwA2O2yiSOBMFYAJs3IKUqtXMGOGuhrBidsVW
   Y5/S/f6oX4zfv/9EhGZqjoY2w25zX3JIZRwzuYYsf7WASv2ahXK+CZbzM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="396284679"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396284679"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 02:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860524489"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="860524489"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2023 02:50:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9162-0003Wa-07;
	Fri, 01 Dec 2023 10:50:10 +0000
Date: Fri, 01 Dec 2023 18:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-sound-cirrus] BUILD SUCCESS
 80041e36e9335aa149135de9f37281f555bbde5c
Message-ID: <202312011810.fXMifZce-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-sound-cirrus
branch HEAD: 80041e36e9335aa149135de9f37281f555bbde5c  ASoC: cs4349: Drop legacy include

elapsed time: 1453m

configs tested: 240
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
arc                   randconfig-001-20231130   gcc  
arc                   randconfig-001-20231201   gcc  
arc                   randconfig-002-20231130   gcc  
arc                   randconfig-002-20231201   gcc  
arc                           tb10x_defconfig   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   gcc  
arm                   randconfig-001-20231130   gcc  
arm                   randconfig-001-20231201   gcc  
arm                   randconfig-002-20231130   gcc  
arm                   randconfig-002-20231201   gcc  
arm                   randconfig-003-20231130   gcc  
arm                   randconfig-003-20231201   gcc  
arm                   randconfig-004-20231130   gcc  
arm                   randconfig-004-20231201   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231130   gcc  
arm64                 randconfig-001-20231201   gcc  
arm64                 randconfig-002-20231130   gcc  
arm64                 randconfig-002-20231201   gcc  
arm64                 randconfig-003-20231130   gcc  
arm64                 randconfig-003-20231201   gcc  
arm64                 randconfig-004-20231130   gcc  
arm64                 randconfig-004-20231201   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231130   gcc  
csky                  randconfig-001-20231201   gcc  
csky                  randconfig-002-20231130   gcc  
csky                  randconfig-002-20231201   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231130   clang
i386                  randconfig-011-20231201   clang
i386                  randconfig-012-20231130   clang
i386                  randconfig-012-20231201   clang
i386                  randconfig-013-20231130   clang
i386                  randconfig-013-20231201   clang
i386                  randconfig-014-20231130   clang
i386                  randconfig-014-20231201   clang
i386                  randconfig-015-20231130   clang
i386                  randconfig-015-20231201   clang
i386                  randconfig-016-20231130   clang
i386                  randconfig-016-20231201   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20231130   gcc  
loongarch             randconfig-001-20231201   gcc  
loongarch             randconfig-002-20231130   gcc  
loongarch             randconfig-002-20231201   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231130   gcc  
nios2                 randconfig-001-20231201   gcc  
nios2                 randconfig-002-20231130   gcc  
nios2                 randconfig-002-20231201   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231130   gcc  
parisc                randconfig-001-20231201   gcc  
parisc                randconfig-002-20231130   gcc  
parisc                randconfig-002-20231201   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20231130   gcc  
powerpc               randconfig-001-20231201   gcc  
powerpc               randconfig-002-20231130   gcc  
powerpc               randconfig-002-20231201   gcc  
powerpc               randconfig-003-20231130   gcc  
powerpc               randconfig-003-20231201   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     taishan_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
powerpc64             randconfig-001-20231130   gcc  
powerpc64             randconfig-001-20231201   gcc  
powerpc64             randconfig-002-20231130   gcc  
powerpc64             randconfig-002-20231201   gcc  
powerpc64             randconfig-003-20231130   gcc  
powerpc64             randconfig-003-20231201   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231130   gcc  
riscv                 randconfig-001-20231201   gcc  
riscv                 randconfig-002-20231130   gcc  
riscv                 randconfig-002-20231201   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231130   gcc  
sh                    randconfig-001-20231201   gcc  
sh                    randconfig-002-20231130   gcc  
sh                    randconfig-002-20231201   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231130   gcc  
sparc64               randconfig-001-20231201   gcc  
sparc64               randconfig-002-20231130   gcc  
sparc64               randconfig-002-20231201   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231130   gcc  
um                    randconfig-001-20231201   gcc  
um                    randconfig-002-20231130   gcc  
um                    randconfig-002-20231201   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231130   gcc  
x86_64       buildonly-randconfig-001-20231201   gcc  
x86_64       buildonly-randconfig-002-20231130   gcc  
x86_64       buildonly-randconfig-002-20231201   gcc  
x86_64       buildonly-randconfig-003-20231130   gcc  
x86_64       buildonly-randconfig-003-20231201   gcc  
x86_64       buildonly-randconfig-004-20231130   gcc  
x86_64       buildonly-randconfig-004-20231201   gcc  
x86_64       buildonly-randconfig-005-20231130   gcc  
x86_64       buildonly-randconfig-005-20231201   gcc  
x86_64       buildonly-randconfig-006-20231130   gcc  
x86_64       buildonly-randconfig-006-20231201   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231130   gcc  
x86_64                randconfig-011-20231201   gcc  
x86_64                randconfig-012-20231130   gcc  
x86_64                randconfig-012-20231201   gcc  
x86_64                randconfig-013-20231130   gcc  
x86_64                randconfig-013-20231201   gcc  
x86_64                randconfig-014-20231130   gcc  
x86_64                randconfig-014-20231201   gcc  
x86_64                randconfig-015-20231130   gcc  
x86_64                randconfig-015-20231201   gcc  
x86_64                randconfig-016-20231130   gcc  
x86_64                randconfig-016-20231201   gcc  
x86_64                randconfig-071-20231130   gcc  
x86_64                randconfig-071-20231201   gcc  
x86_64                randconfig-072-20231130   gcc  
x86_64                randconfig-072-20231201   gcc  
x86_64                randconfig-073-20231130   gcc  
x86_64                randconfig-073-20231201   gcc  
x86_64                randconfig-074-20231130   gcc  
x86_64                randconfig-074-20231201   gcc  
x86_64                randconfig-075-20231130   gcc  
x86_64                randconfig-075-20231201   gcc  
x86_64                randconfig-076-20231130   gcc  
x86_64                randconfig-076-20231201   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231130   gcc  
xtensa                randconfig-001-20231201   gcc  
xtensa                randconfig-002-20231130   gcc  
xtensa                randconfig-002-20231201   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

