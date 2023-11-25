Return-Path: <linux-gpio+bounces-511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F27F8A76
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 13:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A98BB211E8
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 12:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB31E569;
	Sat, 25 Nov 2023 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M53gU+Sc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951C510E4
	for <linux-gpio@vger.kernel.org>; Sat, 25 Nov 2023 04:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700913888; x=1732449888;
  h=date:from:to:cc:subject:message-id;
  bh=vkBYm6FI3IKP/+tScIbM3KajOAd+1WLpBgoyfhxgPVU=;
  b=M53gU+Scxl3g+7KvH5CqIB0uJeIDM/wTv23/I9ZxxI90ahIZ6U8TMlSA
   qtadNjAG/KN6wXZhQuCOSwhTL0548TkeUS0yK7N3km2FRO6sfCWFfidjb
   yKa+SMGRF/7yeo6HfYaIvUoIJ2A6FYyAE9Hq1T0cc+cZ0qKrW7sbSJtPl
   C2V/nrlWdFLlRb3k6+fnlbLHPIWb6lUv3HkexLkark3sg+rodtnKabfXM
   fUKha5QAwpZLgB6LtPbEKNI20LBThcg80ZtgUkfCB1OdtcwAwqR76qKlS
   VB6/mOBVRcq14P63Bcr/aDBBjJzk2h3ff5vQDtCl3pIzdU4xy3xNiYW2F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395330870"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="395330870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 04:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858580375"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="858580375"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2023 04:04:14 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6rOO-0003xm-0B;
	Sat, 25 Nov 2023 12:04:12 +0000
Date: Sat, 25 Nov 2023 20:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 c3c63e66527c18b598bbf9d77f0849852cd32ff9
Message-ID: <202311252037.QxUBK1Ei-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c3c63e66527c18b598bbf9d77f0849852cd32ff9  pinctrl: as3722: Use devm_gpiochip_add_data() to simplify remove path

elapsed time: 1451m

configs tested: 258
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
arc                   randconfig-001-20231124   gcc  
arc                   randconfig-001-20231125   gcc  
arc                   randconfig-002-20231124   gcc  
arc                   randconfig-002-20231125   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   clang
arm                      integrator_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231124   clang
arm                   randconfig-001-20231125   gcc  
arm                   randconfig-002-20231124   clang
arm                   randconfig-002-20231125   gcc  
arm                   randconfig-003-20231124   clang
arm                   randconfig-003-20231125   gcc  
arm                   randconfig-004-20231124   clang
arm                   randconfig-004-20231125   gcc  
arm                        spear3xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231124   clang
arm64                 randconfig-001-20231125   gcc  
arm64                 randconfig-002-20231124   clang
arm64                 randconfig-002-20231125   gcc  
arm64                 randconfig-003-20231124   clang
arm64                 randconfig-003-20231125   gcc  
arm64                 randconfig-004-20231124   clang
arm64                 randconfig-004-20231125   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231124   gcc  
csky                  randconfig-001-20231125   gcc  
csky                  randconfig-002-20231124   gcc  
csky                  randconfig-002-20231125   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231124   clang
hexagon               randconfig-002-20231124   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231124   clang
i386         buildonly-randconfig-002-20231124   clang
i386         buildonly-randconfig-003-20231124   clang
i386         buildonly-randconfig-004-20231124   clang
i386         buildonly-randconfig-005-20231124   clang
i386         buildonly-randconfig-006-20231124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231124   clang
i386                  randconfig-002-20231124   clang
i386                  randconfig-003-20231124   clang
i386                  randconfig-004-20231124   clang
i386                  randconfig-005-20231124   clang
i386                  randconfig-006-20231124   clang
i386                  randconfig-011-20231124   gcc  
i386                  randconfig-011-20231125   clang
i386                  randconfig-012-20231124   gcc  
i386                  randconfig-012-20231125   clang
i386                  randconfig-013-20231124   gcc  
i386                  randconfig-013-20231125   clang
i386                  randconfig-014-20231124   gcc  
i386                  randconfig-014-20231125   clang
i386                  randconfig-015-20231124   gcc  
i386                  randconfig-015-20231125   clang
i386                  randconfig-016-20231124   gcc  
i386                  randconfig-016-20231125   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231124   gcc  
loongarch             randconfig-001-20231125   gcc  
loongarch             randconfig-002-20231124   gcc  
loongarch             randconfig-002-20231125   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                      pic32mzda_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231124   gcc  
nios2                 randconfig-001-20231125   gcc  
nios2                 randconfig-002-20231124   gcc  
nios2                 randconfig-002-20231125   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231124   gcc  
parisc                randconfig-001-20231125   gcc  
parisc                randconfig-002-20231124   gcc  
parisc                randconfig-002-20231125   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc               randconfig-001-20231124   clang
powerpc               randconfig-001-20231125   gcc  
powerpc               randconfig-002-20231124   clang
powerpc               randconfig-002-20231125   gcc  
powerpc               randconfig-003-20231124   clang
powerpc               randconfig-003-20231125   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231124   clang
powerpc64             randconfig-001-20231125   gcc  
powerpc64             randconfig-002-20231124   clang
powerpc64             randconfig-002-20231125   gcc  
powerpc64             randconfig-003-20231124   clang
powerpc64             randconfig-003-20231125   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231124   clang
riscv                 randconfig-001-20231125   gcc  
riscv                 randconfig-002-20231124   clang
riscv                 randconfig-002-20231125   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231124   gcc  
s390                  randconfig-002-20231124   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20231124   gcc  
sh                    randconfig-001-20231125   gcc  
sh                    randconfig-002-20231124   gcc  
sh                    randconfig-002-20231125   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231124   gcc  
sparc64               randconfig-001-20231125   gcc  
sparc64               randconfig-002-20231124   gcc  
sparc64               randconfig-002-20231125   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231124   clang
um                    randconfig-001-20231125   gcc  
um                    randconfig-002-20231124   clang
um                    randconfig-002-20231125   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231124   clang
x86_64       buildonly-randconfig-001-20231125   gcc  
x86_64       buildonly-randconfig-002-20231124   clang
x86_64       buildonly-randconfig-002-20231125   gcc  
x86_64       buildonly-randconfig-003-20231124   clang
x86_64       buildonly-randconfig-003-20231125   gcc  
x86_64       buildonly-randconfig-004-20231124   clang
x86_64       buildonly-randconfig-004-20231125   gcc  
x86_64       buildonly-randconfig-005-20231124   clang
x86_64       buildonly-randconfig-005-20231125   gcc  
x86_64       buildonly-randconfig-006-20231124   clang
x86_64       buildonly-randconfig-006-20231125   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231124   gcc  
x86_64                randconfig-002-20231124   gcc  
x86_64                randconfig-003-20231124   gcc  
x86_64                randconfig-004-20231124   gcc  
x86_64                randconfig-005-20231124   gcc  
x86_64                randconfig-006-20231124   gcc  
x86_64                randconfig-011-20231124   clang
x86_64                randconfig-011-20231125   gcc  
x86_64                randconfig-012-20231124   clang
x86_64                randconfig-012-20231125   gcc  
x86_64                randconfig-013-20231124   clang
x86_64                randconfig-013-20231125   gcc  
x86_64                randconfig-014-20231124   clang
x86_64                randconfig-014-20231125   gcc  
x86_64                randconfig-015-20231124   clang
x86_64                randconfig-015-20231125   gcc  
x86_64                randconfig-016-20231124   clang
x86_64                randconfig-016-20231125   gcc  
x86_64                randconfig-071-20231124   clang
x86_64                randconfig-071-20231125   gcc  
x86_64                randconfig-072-20231124   clang
x86_64                randconfig-072-20231125   gcc  
x86_64                randconfig-073-20231124   clang
x86_64                randconfig-073-20231125   gcc  
x86_64                randconfig-074-20231124   clang
x86_64                randconfig-074-20231125   gcc  
x86_64                randconfig-075-20231124   clang
x86_64                randconfig-075-20231125   gcc  
x86_64                randconfig-076-20231124   clang
x86_64                randconfig-076-20231125   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20231124   gcc  
xtensa                randconfig-001-20231125   gcc  
xtensa                randconfig-002-20231124   gcc  
xtensa                randconfig-002-20231125   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

