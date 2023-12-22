Return-Path: <linux-gpio+bounces-1806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF281C733
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 10:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F9D283502
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 09:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1539D527;
	Fri, 22 Dec 2023 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8QSwJqQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E155F9C8
	for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703236522; x=1734772522;
  h=date:from:to:cc:subject:message-id;
  bh=Z12RqrI/wMng78sDH6lbOjpzHME1r2AxG5AAlZglhvc=;
  b=L8QSwJqQliTvexD0P3Ui6ZUYD+EEunz0DF9WnHV6UzkEw7S7gXpuIfZC
   MfctzmAVFENHx7u72JucaCNEXoiPb/pd2NGZfD8DQwkYNvcFBnuDLVuWv
   cAfxL85w/NecuV7kIite+mShpNcCI/TEYYuNpS6ZG+/mcNXHN3L4Gv6rz
   FTdwaeXWiTz1UWA+vnWNfle89/HwCkal3wshRoKGPN2Q/iHJeATyQSVRc
   TUgyiKuZt7gZSX4UtsXm4nj6QZ1WhqynOhqvji1GizR/nNirMdVgXuJFS
   aM/lxHkl8gssN4XPNd3fqS/YvmZ9ZvqvMpvL9Mf6BW7d2+IjxyPOY1g/5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9491776"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="9491776"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 01:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="805893062"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="805893062"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Dec 2023 01:14:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGbc4-0009G9-1Q;
	Fri, 22 Dec 2023 09:14:46 +0000
Date: Fri, 22 Dec 2023 17:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 14694179e561b5f2f7e56a0f590e2cb49a9cc7ab
Message-ID: <202312221751.swgKoSLT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 14694179e561b5f2f7e56a0f590e2cb49a9cc7ab  pinctrl: at91-pio4: use dedicated lock class for IRQ

elapsed time: 1456m

configs tested: 217
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231221   gcc  
arc                   randconfig-001-20231222   gcc  
arc                   randconfig-002-20231221   gcc  
arc                   randconfig-002-20231222   gcc  
arc                           tb10x_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231222   gcc  
arm                   randconfig-002-20231222   gcc  
arm                   randconfig-003-20231222   gcc  
arm                   randconfig-004-20231222   gcc  
arm                           sama5_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231222   gcc  
arm64                 randconfig-002-20231222   gcc  
arm64                 randconfig-003-20231222   gcc  
arm64                 randconfig-004-20231222   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231221   gcc  
csky                  randconfig-001-20231222   gcc  
csky                  randconfig-002-20231221   gcc  
csky                  randconfig-002-20231222   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231221   gcc  
i386                  randconfig-011-20231222   clang
i386                  randconfig-012-20231221   gcc  
i386                  randconfig-012-20231222   clang
i386                  randconfig-013-20231221   gcc  
i386                  randconfig-013-20231222   clang
i386                  randconfig-014-20231221   gcc  
i386                  randconfig-014-20231222   clang
i386                  randconfig-015-20231221   gcc  
i386                  randconfig-015-20231222   clang
i386                  randconfig-016-20231221   gcc  
i386                  randconfig-016-20231222   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231221   gcc  
loongarch             randconfig-001-20231222   gcc  
loongarch             randconfig-002-20231221   gcc  
loongarch             randconfig-002-20231222   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231221   gcc  
nios2                 randconfig-001-20231222   gcc  
nios2                 randconfig-002-20231221   gcc  
nios2                 randconfig-002-20231222   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231221   gcc  
parisc                randconfig-001-20231222   gcc  
parisc                randconfig-002-20231221   gcc  
parisc                randconfig-002-20231222   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231222   gcc  
powerpc               randconfig-002-20231222   gcc  
powerpc               randconfig-003-20231222   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc64             randconfig-001-20231222   gcc  
powerpc64             randconfig-002-20231222   gcc  
powerpc64             randconfig-003-20231222   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231222   gcc  
riscv                 randconfig-002-20231222   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231221   gcc  
s390                  randconfig-002-20231221   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20231221   gcc  
sh                    randconfig-001-20231222   gcc  
sh                    randconfig-002-20231221   gcc  
sh                    randconfig-002-20231222   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231221   gcc  
sparc64               randconfig-001-20231222   gcc  
sparc64               randconfig-002-20231221   gcc  
sparc64               randconfig-002-20231222   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231222   gcc  
um                    randconfig-002-20231222   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231221   clang
x86_64       buildonly-randconfig-001-20231222   gcc  
x86_64       buildonly-randconfig-002-20231221   clang
x86_64       buildonly-randconfig-002-20231222   gcc  
x86_64       buildonly-randconfig-003-20231221   clang
x86_64       buildonly-randconfig-003-20231222   gcc  
x86_64       buildonly-randconfig-004-20231221   clang
x86_64       buildonly-randconfig-004-20231222   gcc  
x86_64       buildonly-randconfig-005-20231221   clang
x86_64       buildonly-randconfig-005-20231222   gcc  
x86_64       buildonly-randconfig-006-20231221   clang
x86_64       buildonly-randconfig-006-20231222   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231221   clang
x86_64                randconfig-011-20231222   gcc  
x86_64                randconfig-012-20231221   clang
x86_64                randconfig-012-20231222   gcc  
x86_64                randconfig-013-20231221   clang
x86_64                randconfig-013-20231222   gcc  
x86_64                randconfig-014-20231221   clang
x86_64                randconfig-014-20231222   gcc  
x86_64                randconfig-015-20231221   clang
x86_64                randconfig-015-20231222   gcc  
x86_64                randconfig-016-20231221   clang
x86_64                randconfig-016-20231222   gcc  
x86_64                randconfig-071-20231221   clang
x86_64                randconfig-071-20231222   gcc  
x86_64                randconfig-072-20231221   clang
x86_64                randconfig-072-20231222   gcc  
x86_64                randconfig-073-20231221   clang
x86_64                randconfig-073-20231222   gcc  
x86_64                randconfig-074-20231221   clang
x86_64                randconfig-074-20231222   gcc  
x86_64                randconfig-075-20231221   clang
x86_64                randconfig-075-20231222   gcc  
x86_64                randconfig-076-20231221   clang
x86_64                randconfig-076-20231222   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20231221   gcc  
xtensa                randconfig-001-20231222   gcc  
xtensa                randconfig-002-20231221   gcc  
xtensa                randconfig-002-20231222   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

