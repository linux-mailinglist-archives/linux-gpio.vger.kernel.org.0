Return-Path: <linux-gpio+bounces-13573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F09E6519
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 04:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144851884AF3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 03:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E920418D63C;
	Fri,  6 Dec 2024 03:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUOxUiFM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7329155333
	for <linux-gpio@vger.kernel.org>; Fri,  6 Dec 2024 03:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733456321; cv=none; b=lZo3nv/bh4Ukby7nulE45Ai9QBhS2lfkIg5SwEmUPLtxlFHcPDIiO3oek25vLb33thzPZ9etMknzntncP42hBsPKFja9YGaV6EIRnRJ/b6nhaOS+3zkUri+iGITSpC7xMCnOw1xVc0+eWdmmumOdCh45Y35d1Y77M0vrjWGLAoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733456321; c=relaxed/simple;
	bh=WdVWr8ZuDIgQmP0z9ZZY6FEa+pvLTuS1R6vfu6cP1po=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ea7GeKFpsEKD0FQBkC55sKAOM/zskBMRUK9vc7avcRfHwyqkG0mTsL0PehD+qR4B2jFlZXf8OH2dlxJdyIz7ENcCOv7AQM07IAL7UwreWbDwYpQ98CNHnBwVWDWowGzR2t/6t1ZBL1JhWGlXIK+X558KG9oAWcy/A4HB17f0ers=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUOxUiFM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733456319; x=1764992319;
  h=date:from:to:cc:subject:message-id;
  bh=WdVWr8ZuDIgQmP0z9ZZY6FEa+pvLTuS1R6vfu6cP1po=;
  b=DUOxUiFM/w/By+P5pVrl0dPgUhgak9y1uXYKD//CMzi2wW0NfgGAv5hp
   OajMIGIKb9vUQDp8DlC12XYBM2eVfDDEHw1uiAnFI8UfhBOdrCOBRc9mu
   s88W8l0dPHcqmtnzxKypjQksQxiEJ0PJRe3H2UR5ltzzGK2+8CfnpuiiU
   AAMYxL22C2PWS/YKw8XIm06QBuVB6OQg6WBxa2nY4I4nsvrwdC8P1PNmE
   h4asmOsAOSdWCBvdPkoQIOUU/9Qb5WPugqHcl6G+/d1iWSR/U2OtayUU0
   IHvdG/9Ll2umm+bqH/w4YjtfVdAKT/x4Jtz5+H1xm4f3BFIsSt+h6RFwk
   w==;
X-CSE-ConnectionGUID: bJh7jXBKSjOqoZ2ceZ6P7g==
X-CSE-MsgGUID: sgialLY/R6WMXxr5VbB7bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33118830"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="33118830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 19:38:39 -0800
X-CSE-ConnectionGUID: Xn/wmoSPR4SndQan/rAleA==
X-CSE-MsgGUID: kK4mNXYLSjuNbNimBEjzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94735840"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2024 19:38:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJPAp-0000fP-19;
	Fri, 06 Dec 2024 03:38:35 +0000
Date: Fri, 06 Dec 2024 11:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 d4216a10e8b6f15b5e47663abd6c21d1149bb5d0
Message-ID: <202412061139.iD1cSnfi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: d4216a10e8b6f15b5e47663abd6c21d1149bb5d0  gpio: ljca: Initialize num before accessing item in ljca_gpio_config

elapsed time: 830m

configs tested: 228
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                         haps_hs_defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    clang-20
arc                            randconfig-001    clang-20
arc                   randconfig-001-20241205    clang-20
arc                   randconfig-001-20241206    gcc-14.2.0
arc                            randconfig-002    clang-20
arc                   randconfig-002-20241205    clang-20
arc                   randconfig-002-20241206    gcc-14.2.0
arc                           tb10x_defconfig    clang-20
arc                        vdk_hs38_defconfig    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-15
arm                         at91_dt_defconfig    gcc-14.1.0
arm                          collie_defconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-20
arm                           imxrt_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                        mvebu_v7_defconfig    gcc-14.2.0
arm                           omap1_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                            randconfig-001    clang-20
arm                   randconfig-001-20241205    clang-20
arm                   randconfig-001-20241206    gcc-14.2.0
arm                            randconfig-002    clang-20
arm                   randconfig-002-20241205    clang-20
arm                   randconfig-002-20241206    gcc-14.2.0
arm                            randconfig-003    clang-20
arm                   randconfig-003-20241205    clang-20
arm                   randconfig-003-20241206    gcc-14.2.0
arm                            randconfig-004    clang-20
arm                   randconfig-004-20241205    clang-20
arm                   randconfig-004-20241206    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-13.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                          randconfig-001    clang-20
arm64                 randconfig-001-20241205    clang-20
arm64                 randconfig-001-20241206    gcc-14.2.0
arm64                          randconfig-002    clang-20
arm64                 randconfig-002-20241205    clang-20
arm64                 randconfig-002-20241206    gcc-14.2.0
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20241205    clang-20
arm64                 randconfig-003-20241206    gcc-14.2.0
arm64                          randconfig-004    clang-20
arm64                 randconfig-004-20241205    clang-20
arm64                 randconfig-004-20241206    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241206    clang-19
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241206    clang-19
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241206    clang-19
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241206    clang-19
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241206    clang-19
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241206    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    clang-20
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                         bigsur_defconfig    gcc-14.2.0
mips                           ci20_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                           ip27_defconfig    gcc-14.2.0
mips                           ip28_defconfig    clang-20
mips                           jazz_defconfig    clang-20
mips                      maltaaprp_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    clang-20
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc64                         alldefconfig    clang-20
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-13.2.0
powerpc                      cm5200_defconfig    gcc-14.2.0
powerpc                       ebony_defconfig    clang-18
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-13.2.0
powerpc                       holly_defconfig    clang-20
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    clang-20
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    clang-20
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    clang-20
powerpc                       ppc64_defconfig    clang-18
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc                     redwood_defconfig    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    clang-20
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-20
powerpc                     tqm8555_defconfig    clang-20
powerpc                     tqm8560_defconfig    clang-20
powerpc64                        alldefconfig    clang-18
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-13.2.0
riscv                    nommu_virt_defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    clang-18
sh                ecovec24-romimage_defconfig    gcc-13.2.0
sh                         ecovec24_defconfig    clang-20
sh                        edosk7705_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    clang-20
sh                        edosk7760_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.1.0
sh                          r7780mp_defconfig    clang-18
sh                          rsk7269_defconfig    clang-18
sh                          sdk7786_defconfig    clang-20
sh                           se7206_defconfig    clang-20
sh                           se7343_defconfig    clang-20
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-18
sh                             sh03_defconfig    clang-20
sh                           sh2007_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    clang-20
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                             shx3_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                           x86_64_defconfig    gcc-13.2.0
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20241205    clang-19
x86_64      buildonly-randconfig-001-20241206    clang-19
x86_64               buildonly-randconfig-002    gcc-12
x86_64      buildonly-randconfig-002-20241205    clang-19
x86_64      buildonly-randconfig-002-20241206    clang-19
x86_64               buildonly-randconfig-003    gcc-12
x86_64      buildonly-randconfig-003-20241205    clang-19
x86_64      buildonly-randconfig-003-20241206    clang-19
x86_64               buildonly-randconfig-004    gcc-12
x86_64      buildonly-randconfig-004-20241205    clang-19
x86_64      buildonly-randconfig-004-20241206    clang-19
x86_64               buildonly-randconfig-005    gcc-12
x86_64      buildonly-randconfig-005-20241205    clang-19
x86_64      buildonly-randconfig-005-20241206    clang-19
x86_64               buildonly-randconfig-006    gcc-12
x86_64      buildonly-randconfig-006-20241205    clang-19
x86_64      buildonly-randconfig-006-20241206    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    clang-20
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

