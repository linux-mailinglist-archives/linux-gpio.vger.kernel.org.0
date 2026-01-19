Return-Path: <linux-gpio+bounces-30735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D20D3AA85
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 14:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D9C53072753
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 13:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2913659F3;
	Mon, 19 Jan 2026 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5ZuKDzk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DA32D8387
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 13:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829926; cv=none; b=tiPpH5y8BJlyQUR1EBWaBSEaUVXctSq07Err7bDZxVJl8XPUjx+UhiQxqTYpqKyrstYFy4T6KWqEuXPCxL94e5oe8GXx1TsNuCmhAwy49LkYbs0l8/hdh51sGxLMOf58kmE9UspTw5dLQfTDCL36GIenJAbtj40iE3RCoKJQSmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829926; c=relaxed/simple;
	bh=lJ8TEieKL+P376IGrfhHIDvEGKSGJ5r5hgRFOA4V5Pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D5nJ5MK/4VXS9CJfBVT2HEQxxg20yuzA6vITgbAC/1KYhiQTYdltMbEn8r65NwXu5c9RAKGdsD5+LFq7mjQf3xUommEGXvu5ILj71hk3ivT/XPqmFGjCVCqvw7sh9CBhBxhorwz23YbwsqqIkCmAhFxhEEp/0rIBDqP28v5RLqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5ZuKDzk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768829925; x=1800365925;
  h=date:from:to:cc:subject:message-id;
  bh=lJ8TEieKL+P376IGrfhHIDvEGKSGJ5r5hgRFOA4V5Pw=;
  b=n5ZuKDzk3XISB+MPYfBZ+HkDpFUeT84/32efnx/fLMvpIkl3/CyfETrD
   1b/Eh+EYu4RWK4KIMZMN8SH3Jp3NXyOsy0ZVSwLaIxRxemY9X4r/9HQ+Z
   KiJxiwceEoPUFaRvhNwNV/b5Qu7+XJTdbN4ite+/cno1aYlhosLHVSO3R
   2V+wTN/i//GFu91yJI4YSfp+qHmbDEADmGX8JpHAspmnMT3D1Yqxj+g/n
   /g7BUUCwlZszzDyyqfLhBs7HDQLhjBmzRDaL42VwQXFWg9NAhGE+SgwI8
   BHByd8Pe7gzbnlQ9aVF7glX1UYTJKZVIOJZeAtEhByx64DnSv32l2hzIg
   g==;
X-CSE-ConnectionGUID: uMS/YtaIRcyciSW7Q9f/Kw==
X-CSE-MsgGUID: BNpVbXxZTXCZHyFsLDcSUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73669467"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="73669467"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:38:44 -0800
X-CSE-ConnectionGUID: /4cxo5LLSSqHi+erqHda6A==
X-CSE-MsgGUID: N2Rk8dhRQ3q25j1ipv95hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237142454"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 05:38:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhpSp-00000000NqD-3N1I;
	Mon, 19 Jan 2026 13:38:39 +0000
Date: Mon, 19 Jan 2026 21:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 e4607d0d1de5c432ad8cb732bc02c0179c7cc335
Message-ID: <202601192109.vyPPQlSO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: e4607d0d1de5c432ad8cb732bc02c0179c7cc335  Merge branch 'devel' into for-next

elapsed time: 756m

configs tested: 258
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                          axs103_defconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260119    gcc-14.3.0
arc                   randconfig-002-20260119    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    gcc-14
arm                         bcm2835_defconfig    clang-16
arm                        clps711x_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                            mps2_defconfig    clang-22
arm                            mps2_defconfig    gcc-15.2.0
arm                        multi_v5_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                           omap1_defconfig    gcc-14
arm                       omap2plus_defconfig    clang-18
arm                             pxa_defconfig    clang-18
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20260119    gcc-14.3.0
arm                   randconfig-002-20260119    gcc-14.3.0
arm                   randconfig-003-20260119    gcc-14.3.0
arm                   randconfig-004-20260119    gcc-14.3.0
arm                             rpc_defconfig    clang-22
arm                          sp7021_defconfig    clang-16
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm                           tegra_defconfig    gcc-15.2.0
arm                           u8500_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260119    clang-19
arm64                 randconfig-002-20260119    clang-19
arm64                 randconfig-003-20260119    clang-19
arm64                 randconfig-004-20260119    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260119    clang-19
csky                  randconfig-002-20260119    clang-19
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260119    clang-18
hexagon               randconfig-002-20260119    clang-18
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260119    clang-20
i386        buildonly-randconfig-002-20260119    clang-20
i386        buildonly-randconfig-003-20260119    clang-20
i386        buildonly-randconfig-004-20260119    clang-20
i386        buildonly-randconfig-005-20260119    clang-20
i386        buildonly-randconfig-006-20260119    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260119    gcc-13
i386                  randconfig-001-20260119    gcc-14
i386                  randconfig-002-20260119    gcc-13
i386                  randconfig-003-20260119    clang-20
i386                  randconfig-003-20260119    gcc-13
i386                  randconfig-004-20260119    gcc-13
i386                  randconfig-004-20260119    gcc-14
i386                  randconfig-005-20260119    clang-20
i386                  randconfig-005-20260119    gcc-13
i386                  randconfig-006-20260119    clang-20
i386                  randconfig-006-20260119    gcc-13
i386                  randconfig-007-20260119    clang-20
i386                  randconfig-007-20260119    gcc-13
i386                  randconfig-011-20260119    gcc-14
i386                  randconfig-012-20260119    gcc-14
i386                  randconfig-013-20260119    gcc-14
i386                  randconfig-014-20260119    gcc-14
i386                  randconfig-015-20260119    gcc-14
i386                  randconfig-016-20260119    gcc-14
i386                  randconfig-017-20260119    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    clang-16
loongarch             randconfig-001-20260119    clang-18
loongarch             randconfig-002-20260119    clang-18
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          multi_defconfig    clang-22
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq6_defconfig    clang-18
mips                           gcw0_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           ip22_defconfig    clang-16
mips                       lemote2f_defconfig    clang-16
mips                          malta_defconfig    clang-22
mips                  maltasmvp_eva_defconfig    gcc-15.2.0
mips                          rb532_defconfig    clang-22
mips                         rt305x_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260119    clang-18
nios2                 randconfig-002-20260119    clang-18
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                    or1ksim_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260119    clang-22
parisc                randconfig-002-20260119    clang-22
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    clang-18
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                       eiger_defconfig    clang-16
powerpc                      ep88xc_defconfig    gcc-15.2.0
powerpc                  iss476-smp_defconfig    clang-22
powerpc                   microwatt_defconfig    gcc-15.2.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                  mpc885_ads_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc                      ppc44x_defconfig    clang-18
powerpc                      ppc6xx_defconfig    gcc-14
powerpc                     rainier_defconfig    clang-22
powerpc               randconfig-001-20260119    clang-22
powerpc               randconfig-002-20260119    clang-22
powerpc                    sam440ep_defconfig    gcc-14
powerpc                  storcenter_defconfig    clang-16
powerpc                     stx_gp3_defconfig    clang-22
powerpc                     tqm8560_defconfig    clang-18
powerpc64                        alldefconfig    gcc-15.2.0
powerpc64             randconfig-001-20260119    clang-22
powerpc64             randconfig-002-20260119    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260119    gcc-15.2.0
riscv                 randconfig-001-20260119    gcc-8.5.0
riscv                 randconfig-002-20260119    clang-22
riscv                 randconfig-002-20260119    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-14
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260119    gcc-15.2.0
s390                  randconfig-001-20260119    gcc-9.5.0
s390                  randconfig-002-20260119    clang-22
s390                  randconfig-002-20260119    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260119    gcc-15.2.0
sh                    randconfig-002-20260119    gcc-12.5.0
sh                    randconfig-002-20260119    gcc-15.2.0
sh                           se7712_defconfig    gcc-15.2.0
sh                           se7724_defconfig    gcc-14
sh                        sh7763rdp_defconfig    gcc-15.2.0
sh                   sh7770_generic_defconfig    clang-22
sh                  sh7785lcr_32bit_defconfig    gcc-15.2.0
sh                            shmin_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260119    gcc-14.3.0
sparc                 randconfig-002-20260119    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260119    gcc-14.3.0
sparc64               randconfig-002-20260119    gcc-14.3.0
um                               alldefconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260119    gcc-14.3.0
um                    randconfig-002-20260119    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260119    gcc-14
x86_64      buildonly-randconfig-002-20260119    gcc-14
x86_64      buildonly-randconfig-003-20260119    gcc-14
x86_64      buildonly-randconfig-004-20260119    gcc-14
x86_64      buildonly-randconfig-005-20260119    gcc-14
x86_64      buildonly-randconfig-006-20260119    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260119    gcc-14
x86_64                randconfig-002-20260119    gcc-14
x86_64                randconfig-003-20260119    gcc-14
x86_64                randconfig-004-20260119    gcc-14
x86_64                randconfig-005-20260119    gcc-14
x86_64                randconfig-006-20260119    gcc-14
x86_64                randconfig-011-20260119    clang-20
x86_64                randconfig-012-20260119    clang-20
x86_64                randconfig-013-20260119    clang-20
x86_64                randconfig-014-20260119    clang-20
x86_64                randconfig-015-20260119    clang-20
x86_64                randconfig-016-20260119    clang-20
x86_64                randconfig-071-20260119    clang-20
x86_64                randconfig-072-20260119    clang-20
x86_64                randconfig-073-20260119    clang-20
x86_64                randconfig-074-20260119    clang-20
x86_64                randconfig-075-20260119    clang-20
x86_64                randconfig-076-20260119    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                  audio_kc705_defconfig    clang-22
xtensa                  nommu_kc705_defconfig    clang-18
xtensa                randconfig-001-20260119    gcc-14.3.0
xtensa                randconfig-002-20260119    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

