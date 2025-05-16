Return-Path: <linux-gpio+bounces-20254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A47AB99F2
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 12:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6633AB0D1
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 10:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773A523504B;
	Fri, 16 May 2025 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlYJUQBc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CFE1C862B
	for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390652; cv=none; b=RCuQBtlDxsxlx87N+N2NG0g1e2SSqrOAQs74nayvUXHVkXMb3y3QcTXcT8eHhMOIPcTLQyiii7p25KDi2xX0vFbovx3VorTwCsY8kC9GVRud9hdkMnGK7vjyqJBX0kbGjAJtk5uz2mSkIYfAZuDnt3DVF3OyXtWz0cUn3eeNr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390652; c=relaxed/simple;
	bh=5rYFmNGesKVASyK3TymwR5DluNLH3DiS2Sg+Xr5g5H4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WO8MKG7/MCH1D8PD0vuZIc63J9n+3mLQ+w1nXNWLKuPlYb+Qi+VGRS2DHCrZnymaWIBERbMGKEMUMUtTQAEjPbvEgM5MJfZ2uBa6GBV0dudDIHzsW2z58eNO8pJf/bHQptaYDyzD9kdh5eeNLd8nOOvll6EVu5YfvdSTp7+oRf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlYJUQBc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747390650; x=1778926650;
  h=date:from:to:cc:subject:message-id;
  bh=5rYFmNGesKVASyK3TymwR5DluNLH3DiS2Sg+Xr5g5H4=;
  b=NlYJUQBcqKN5FtXk8uz6efp0fu5L4I0CKykEbd20i5LmRx5Ix2kT4jvL
   rGBSqimDlKaT+PAmglokQ77GLfwwgAUNizvKSTTShTTK/q3R82ErxeSVm
   6mF7/nh9MFHKLhcee3OSQgjiJ9pHSBIVWxVXiVZqkv/vU1t8vQmhncUOr
   s3IWG2LG2N5b60S6/Y9wMjv/TZ6MXZqipYjrFJBMedTvE+/zanGBNrpBr
   tzT23sxuBc6oDJW8kIfxJlWCGYbvca+R41iV83vi5TGtISWhzaJZQn2rB
   ePel/AqJkbp065lZkYJmDJBNOzadSImkrPBDSS5/ha+0PY5hUDv5r2BtU
   g==;
X-CSE-ConnectionGUID: MkfjWOn/Te+p1HxwaT3/dA==
X-CSE-MsgGUID: xM+nVbhuQT6A/d1Ex+ORrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53172715"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53172715"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 03:17:29 -0700
X-CSE-ConnectionGUID: lz4Dp3p3QtO8OJqXSo061g==
X-CSE-MsgGUID: Hi1OfC9gS8WIgPycpWQtww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138567366"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2025 03:17:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFs86-000JEp-2Y;
	Fri, 16 May 2025 10:17:26 +0000
Date: Fri, 16 May 2025 18:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 09fac5c576bbff764dddf2baca0038b359376fd8
Message-ID: <202505161810.mLKz8oh8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 09fac5c576bbff764dddf2baca0038b359376fd8  Merge branch 'devel' into for-next

elapsed time: 1452m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250515    gcc-12.4.0
arc                   randconfig-002-20250515    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250515    clang-21
arm                   randconfig-002-20250515    gcc-8.5.0
arm                   randconfig-003-20250515    gcc-8.5.0
arm                   randconfig-004-20250515    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250515    clang-21
arm64                 randconfig-002-20250515    clang-21
arm64                 randconfig-003-20250515    clang-20
arm64                 randconfig-004-20250515    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250515    gcc-14.2.0
csky                  randconfig-002-20250515    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250515    clang-16
hexagon               randconfig-002-20250515    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250515    gcc-11
i386        buildonly-randconfig-002-20250515    gcc-12
i386        buildonly-randconfig-003-20250515    clang-20
i386        buildonly-randconfig-004-20250515    clang-20
i386        buildonly-randconfig-005-20250515    gcc-12
i386        buildonly-randconfig-006-20250515    gcc-11
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250515    gcc-12.4.0
loongarch             randconfig-002-20250515    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250515    gcc-12.4.0
nios2                 randconfig-002-20250515    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250515    gcc-13.3.0
parisc                randconfig-002-20250515    gcc-13.3.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                     mpc83xx_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250515    gcc-8.5.0
powerpc               randconfig-002-20250515    gcc-6.5.0
powerpc               randconfig-003-20250515    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250515    clang-21
powerpc64             randconfig-002-20250515    gcc-8.5.0
powerpc64             randconfig-003-20250515    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250515    gcc-8.5.0
riscv                 randconfig-002-20250515    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250515    clang-21
s390                  randconfig-002-20250515    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250515    gcc-14.2.0
sh                    randconfig-002-20250515    gcc-10.5.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250515    gcc-6.5.0
sparc                 randconfig-002-20250515    gcc-10.3.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250515    gcc-9.3.0
sparc64               randconfig-002-20250515    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250515    gcc-12
um                    randconfig-002-20250515    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250515    clang-20
x86_64      buildonly-randconfig-002-20250515    clang-20
x86_64      buildonly-randconfig-003-20250515    clang-20
x86_64      buildonly-randconfig-004-20250515    clang-20
x86_64      buildonly-randconfig-005-20250515    clang-20
x86_64      buildonly-randconfig-006-20250515    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-14.2.0
xtensa                randconfig-002-20250515    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

