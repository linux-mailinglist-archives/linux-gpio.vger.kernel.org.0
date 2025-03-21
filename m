Return-Path: <linux-gpio+bounces-17861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04464A6BCC3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 15:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780A3480497
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 14:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC0C19938D;
	Fri, 21 Mar 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lznfImBk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139F155333
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566528; cv=none; b=O4O7UPhqY6geNF8iFtMTxdVGqhcqQdUD5qPJGtBtVUHpdeSF3V167/Y8k4W7qIlODSXbVqggRbhKsdmXD3DtmNMG2sr8xLdJnV7HYF/stsHLxmPY/DckgdMy+JqHLaFnjnTCes/rLxk3RT/YqRNJWe3Xa8AVF2wRDEl3W3LODCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566528; c=relaxed/simple;
	bh=ijSb5VKLnSKGNGmYvPBkbyCOP/Brz4hzpjAlSNi/N+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pAotB/oBw4XFcMTIQe3/NFctFjV5UtvAc8+eLrTGp840o6v4xwN+JgiGDIThD5sE8kLZ9Bao06dkLge41xps+ItSU1haSX8/6UO+3zuNzsFTANDUdj6WIwRu4nCm0mQgFNwUUxcYuYWm4gXx3Z2u9i2ykOoZT1mPYC14o1VnBhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lznfImBk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742566526; x=1774102526;
  h=date:from:to:cc:subject:message-id;
  bh=ijSb5VKLnSKGNGmYvPBkbyCOP/Brz4hzpjAlSNi/N+Q=;
  b=lznfImBk4uqmqEejkSxwzpZIiJmREphipumRfPFtkDW2AzS1F4Vchv6V
   lROVm7bZKaqIC64eA2/Qa11qDSXJxicEJpvE0b+025P6zGE6M+Q7n4sEV
   6bgXdB5X/UnyKr1JBQYfRQmAAgt7ypjkOF3Aeqi+WIeMyXepJJ99rLn9g
   R66J7X/ikq4BrdV8DK5O22SCCPRezkeLMYi+8zCEwupxcdG8YvQ7011UY
   u9+Ay/s2EuOY+hZV6UN8Cu9NQm9LPBTXPw3THE/9UuQKIe0l6sjPsdve6
   LwEjPpQYOqRKfFnsgnLVdCJXnQ2DekoBCCZ4xKvBAuH/kT5NGe39YXPHb
   g==;
X-CSE-ConnectionGUID: zppbj0SDRJS+0A1OSn9VLg==
X-CSE-MsgGUID: KNx2Wv4sSpix6ax3dYq1ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="44022695"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="44022695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 07:15:25 -0700
X-CSE-ConnectionGUID: 5v+ohfxoSrGGTC7atQ3+RQ==
X-CSE-MsgGUID: fujEhuaFRwGUWzpLO36vrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="124358143"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Mar 2025 07:15:24 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvd9E-0001ND-2e;
	Fri, 21 Mar 2025 14:15:02 +0000
Date: Fri, 21 Mar 2025 22:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 c746ff4a67f4842e90fe232d2c9fc983f4034848
Message-ID: <202503212242.V6ct18RE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: c746ff4a67f4842e90fe232d2c9fc983f4034848  pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to y unconditionally

elapsed time: 1448m

configs tested: 140
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250320    gcc-10.5.0
arc                   randconfig-002-20250320    gcc-8.5.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-18
arm                                 defconfig    clang-14
arm                            dove_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-15
arm                         nhk8815_defconfig    clang-21
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250320    clang-20
arm                   randconfig-002-20250320    clang-16
arm                   randconfig-003-20250320    gcc-8.5.0
arm                   randconfig-004-20250320    gcc-7.5.0
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250320    clang-21
arm64                 randconfig-002-20250320    clang-21
arm64                 randconfig-003-20250320    clang-19
arm64                 randconfig-004-20250320    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250320    gcc-10.5.0
csky                  randconfig-002-20250320    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250320    clang-18
hexagon               randconfig-002-20250320    clang-21
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250320    gcc-12
i386        buildonly-randconfig-002-20250320    clang-20
i386        buildonly-randconfig-003-20250320    clang-20
i386        buildonly-randconfig-004-20250320    clang-20
i386        buildonly-randconfig-005-20250320    gcc-12
i386        buildonly-randconfig-006-20250320    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250320    gcc-14.2.0
loongarch             randconfig-002-20250320    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250320    gcc-6.5.0
nios2                 randconfig-002-20250320    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250320    gcc-13.3.0
parisc                randconfig-002-20250320    gcc-11.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250320    gcc-6.5.0
powerpc               randconfig-002-20250320    clang-21
powerpc               randconfig-003-20250320    clang-21
powerpc64             randconfig-001-20250320    clang-21
powerpc64             randconfig-002-20250320    gcc-8.5.0
powerpc64             randconfig-003-20250320    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250320    clang-21
riscv                 randconfig-002-20250320    gcc-8.5.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250320    gcc-6.5.0
s390                  randconfig-002-20250320    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250320    gcc-14.2.0
sh                    randconfig-002-20250320    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250320    gcc-7.5.0
sparc                 randconfig-002-20250320    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250320    gcc-5.5.0
sparc64               randconfig-002-20250320    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250320    gcc-12
um                    randconfig-002-20250320    clang-16
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250320    clang-20
x86_64      buildonly-randconfig-002-20250320    gcc-12
x86_64      buildonly-randconfig-003-20250320    clang-20
x86_64      buildonly-randconfig-004-20250320    clang-20
x86_64      buildonly-randconfig-005-20250320    clang-20
x86_64      buildonly-randconfig-006-20250320    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250320    gcc-9.3.0
xtensa                randconfig-002-20250320    gcc-11.5.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

