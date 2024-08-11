Return-Path: <linux-gpio+bounces-8701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517C94E0EF
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 13:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14FBAB20FBC
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2024 11:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071F43C062;
	Sun, 11 Aug 2024 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOT0g2Nh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A12595
	for <linux-gpio@vger.kernel.org>; Sun, 11 Aug 2024 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723375259; cv=none; b=b+G8RxdC83gC9z12CPKfLdQNtpRhmaRN6r8xuTvKOHjNeOyK4a/DPMTEf9vzIJOtksFOpSthoJT2zI4Ft9/t/WwwhbNUUWfUc+j8ZVqw8Y1o8UA5LK974wJ70YF2C5l50KrNXVWINK5SODAEZY6+UdujVQ3lQY04MZfETbv5mEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723375259; c=relaxed/simple;
	bh=ve4JIdZTyoFebaX8/5PaDMAom9CbELRBWbrSoiBQ0xA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WBADlqw2/KKZ/9NX0ziou2MUGRilYRxSvCXp2R6rsJkYvf11uWKVd92iwviS1HWviB6tN8SVfcLPOGDvmi06PADfevc2d18pSg7RaIJlDIasJkarlbm0ykJgmesiotikcTJ0uyaAOEBAa5474m81BpTVxaUezsiSPRBKrsTVS8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOT0g2Nh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723375257; x=1754911257;
  h=date:from:to:cc:subject:message-id;
  bh=ve4JIdZTyoFebaX8/5PaDMAom9CbELRBWbrSoiBQ0xA=;
  b=dOT0g2NhBmBp+IJsnDBePyTx0an5coP7ROJWH/c4tg+mhAoI+LcEFRLy
   ckq8uU+aEhFxO8T8xsKxXSluXf218ZIz42Mv/Di/ZAxBa+TFWv2v/V0P4
   zoN/qY2CDFgVZqkD63abSz0vZYpie8Uj6lBJQCRVetOVWmz9XVV3spPF6
   BmaDLGFezuJ+713lL+6tKls+os56OBIoULAf2xcFBg981MtJQ/1/R0qk+
   AR9EFQZq64cOfby8hK3RevcRTO/O7UVcjpr0QBWzi+CC72THdaJcKSGBk
   R7AgJ2N7zojuCbvhVX4mYXCJGHtXQuAiZ9SDyEkN8oqDSkqJXBCMbJjME
   g==;
X-CSE-ConnectionGUID: SQ5m+1t1SbOa/pZ7eD91bA==
X-CSE-MsgGUID: ExD0xZ7oQxqxYTXr9+mbjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32644312"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="32644312"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 04:20:56 -0700
X-CSE-ConnectionGUID: bdMVOdX8R3eBxjcbc0MUAw==
X-CSE-MsgGUID: Ja1OdabSRoySkJ2pg2XL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="81226546"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Aug 2024 04:20:54 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd6d2-000AnB-2v;
	Sun, 11 Aug 2024 11:20:52 +0000
Date: Sun, 11 Aug 2024 19:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 aad41832326723627ad8ac9ee8a543b6dca4454d
Message-ID: <202408111955.FfhzMfHW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: aad41832326723627ad8ac9ee8a543b6dca4454d  gpio: mlxbf3: Support shutdown() function

elapsed time: 937m

configs tested: 230
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240811   gcc-13.2.0
arc                   randconfig-002-20240811   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         at91_dt_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-14.1.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   clang-20
arm                        mvebu_v7_defconfig   clang-15
arm                             mxs_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-14.1.0
arm                   randconfig-001-20240811   clang-14
arm                   randconfig-002-20240811   clang-20
arm                   randconfig-003-20240811   gcc-14.1.0
arm                   randconfig-004-20240811   gcc-14.1.0
arm                        shmobile_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240811   clang-20
arm64                 randconfig-002-20240811   gcc-14.1.0
arm64                 randconfig-003-20240811   gcc-14.1.0
arm64                 randconfig-004-20240811   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240811   gcc-14.1.0
csky                  randconfig-002-20240811   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240811   clang-20
hexagon               randconfig-002-20240811   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240811   gcc-12
i386         buildonly-randconfig-002-20240811   gcc-12
i386         buildonly-randconfig-003-20240811   gcc-12
i386         buildonly-randconfig-004-20240811   clang-18
i386         buildonly-randconfig-004-20240811   gcc-12
i386         buildonly-randconfig-005-20240811   gcc-12
i386         buildonly-randconfig-006-20240811   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240811   clang-18
i386                  randconfig-001-20240811   gcc-12
i386                  randconfig-002-20240811   clang-18
i386                  randconfig-002-20240811   gcc-12
i386                  randconfig-003-20240811   clang-18
i386                  randconfig-003-20240811   gcc-12
i386                  randconfig-004-20240811   clang-18
i386                  randconfig-004-20240811   gcc-12
i386                  randconfig-005-20240811   gcc-12
i386                  randconfig-006-20240811   gcc-12
i386                  randconfig-011-20240811   gcc-11
i386                  randconfig-011-20240811   gcc-12
i386                  randconfig-012-20240811   gcc-12
i386                  randconfig-013-20240811   clang-18
i386                  randconfig-013-20240811   gcc-12
i386                  randconfig-014-20240811   gcc-12
i386                  randconfig-015-20240811   clang-18
i386                  randconfig-015-20240811   gcc-12
i386                  randconfig-016-20240811   clang-18
i386                  randconfig-016-20240811   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240811   gcc-14.1.0
loongarch             randconfig-002-20240811   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          atari_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         bigsur_defconfig   gcc-14.1.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   clang-15
mips                        maltaup_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240811   gcc-14.1.0
nios2                 randconfig-002-20240811   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240811   gcc-14.1.0
parisc                randconfig-002-20240811   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                      ep88xc_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                     powernv_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240811   clang-20
powerpc               randconfig-003-20240811   clang-20
powerpc                  storcenter_defconfig   gcc-13.2.0
powerpc64                        alldefconfig   clang-17
powerpc64             randconfig-001-20240811   clang-14
powerpc64             randconfig-002-20240811   gcc-14.1.0
powerpc64             randconfig-003-20240811   clang-20
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240811   gcc-14.1.0
riscv                 randconfig-002-20240811   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240811   clang-20
s390                  randconfig-002-20240811   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                    randconfig-001-20240811   gcc-14.1.0
sh                    randconfig-002-20240811   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                           se7705_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240811   gcc-14.1.0
sparc64               randconfig-002-20240811   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240811   gcc-12
um                    randconfig-002-20240811   clang-20
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240811   gcc-12
x86_64       buildonly-randconfig-002-20240811   clang-18
x86_64       buildonly-randconfig-002-20240811   gcc-12
x86_64       buildonly-randconfig-003-20240811   gcc-12
x86_64       buildonly-randconfig-004-20240811   gcc-12
x86_64       buildonly-randconfig-005-20240811   gcc-12
x86_64       buildonly-randconfig-006-20240811   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240811   clang-18
x86_64                randconfig-001-20240811   gcc-12
x86_64                randconfig-002-20240811   clang-18
x86_64                randconfig-002-20240811   gcc-12
x86_64                randconfig-003-20240811   clang-18
x86_64                randconfig-003-20240811   gcc-12
x86_64                randconfig-004-20240811   clang-18
x86_64                randconfig-004-20240811   gcc-12
x86_64                randconfig-005-20240811   gcc-12
x86_64                randconfig-006-20240811   clang-18
x86_64                randconfig-006-20240811   gcc-12
x86_64                randconfig-011-20240811   gcc-12
x86_64                randconfig-012-20240811   clang-18
x86_64                randconfig-012-20240811   gcc-12
x86_64                randconfig-013-20240811   gcc-12
x86_64                randconfig-014-20240811   gcc-12
x86_64                randconfig-015-20240811   clang-18
x86_64                randconfig-015-20240811   gcc-12
x86_64                randconfig-016-20240811   clang-18
x86_64                randconfig-016-20240811   gcc-12
x86_64                randconfig-071-20240811   clang-18
x86_64                randconfig-071-20240811   gcc-12
x86_64                randconfig-072-20240811   clang-18
x86_64                randconfig-072-20240811   gcc-12
x86_64                randconfig-073-20240811   clang-18
x86_64                randconfig-073-20240811   gcc-12
x86_64                randconfig-074-20240811   gcc-12
x86_64                randconfig-075-20240811   clang-18
x86_64                randconfig-075-20240811   gcc-12
x86_64                randconfig-076-20240811   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240811   gcc-14.1.0
xtensa                randconfig-002-20240811   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

