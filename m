Return-Path: <linux-gpio+bounces-21390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA73AD56D8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CB618957BE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258C2287519;
	Wed, 11 Jun 2025 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkBhvBH5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D62E403
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648048; cv=none; b=MGLzYr58LnnX86941ebQrw89up/YfsF1Gy1NzwZA04Uqiq0QNXaEwh4xErckMvkZf58SOJvPfGbWwAlyp43Vprg/5AIzlcgKZHG2PRYFmtcB1iHz9fgaXXBmnV0FVsuqvdsqbmHu9rp4X124l9xnpHOZuohld2C0BiS9snO06Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648048; c=relaxed/simple;
	bh=bKGgHCVvUr58s/YaOvSpRvVEVpwX8t/lq5qzBZG9JvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gx2kbmvjGrSVQ/puj6UIbzWkVaa/C+chhvzbSa/KXTkZnVjz8IDf5lkx9O/clQEc580x4dnZgEnZ4tstd+ue/Ve1cXbmGIcgu7nShDKo5uu16oLi2DcRniMd3g7mamUPJpb9TlOhBktfEYCGHwn+0f/JUXxZhANjA2ela/x1/Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkBhvBH5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749648047; x=1781184047;
  h=date:from:to:cc:subject:message-id;
  bh=bKGgHCVvUr58s/YaOvSpRvVEVpwX8t/lq5qzBZG9JvM=;
  b=lkBhvBH5bZieogACqt1A1gn1s3MqX/V80Ci69pYwYjl2/YYGziWKmkE5
   gBLg/c6ZXpvUSVPpV6+I4Kou3eKWN/klh0w3JWf+T73CWMxhmdXUgPKKt
   90Nx6tO9XIjbYlHWmaH4+mwBjvvd9lsRPsaVXWhUQ8SCwCsog8uFL4m5G
   dXkA0dntyAR8ksC6+b1Mffg7sqgLzz/VwiP5Vdwpa8VidopkAYDqgCsms
   S55MvxWJeU0aTY7oFR+/OJgPifmosT4TFGH0gyX4d2MBHGuRBUnio43YR
   OA3eH+k+Zk5TKdtF0b5NQSqZh6lMsVd2sWxYu9uHB4X20USkUosUAdzyN
   w==;
X-CSE-ConnectionGUID: CQghuGP4QASJS1Gl1oOGJQ==
X-CSE-MsgGUID: MgmMVkV0QpWClqOPsbl4sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63137367"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="63137367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 06:20:46 -0700
X-CSE-ConnectionGUID: Hyxm5IWBRKiI8HSPnc6aaQ==
X-CSE-MsgGUID: zPhWVONVTvGYu9XmnkVD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="148104919"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2025 06:20:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPLNj-000AUH-2W;
	Wed, 11 Jun 2025 13:20:43 +0000
Date: Wed, 11 Jun 2025 21:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 5558f27a58459a4038ebb23bcb5bd40c1e345c57
Message-ID: <202506112134.X6AM0Boy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 5558f27a58459a4038ebb23bcb5bd40c1e345c57  pinctrl: sunxi: dt: Consider pin base when calculating bank number from pin

elapsed time: 1452m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                   randconfig-001-20250611    gcc-11.5.0
arm                   randconfig-002-20250611    clang-21
arm                   randconfig-003-20250611    gcc-13.3.0
arm                   randconfig-004-20250611    gcc-13.3.0
arm                          sp7021_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250611    gcc-8.5.0
arm64                 randconfig-002-20250611    gcc-9.5.0
arm64                 randconfig-003-20250611    gcc-13.3.0
arm64                 randconfig-004-20250611    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-15.1.0
csky                  randconfig-002-20250611    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250611    clang-21
hexagon               randconfig-002-20250611    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-001-20250611    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-002-20250611    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250610    gcc-12
i386        buildonly-randconfig-004-20250611    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-005-20250611    clang-20
i386        buildonly-randconfig-006-20250610    clang-20
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250611    clang-20
i386                  randconfig-002-20250611    clang-20
i386                  randconfig-003-20250611    clang-20
i386                  randconfig-004-20250611    clang-20
i386                  randconfig-005-20250611    clang-20
i386                  randconfig-006-20250611    clang-20
i386                  randconfig-007-20250611    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-15.1.0
loongarch             randconfig-002-20250611    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250611    gcc-11.5.0
parisc                randconfig-002-20250611    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                       holly_defconfig    clang-21
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-002-20250611    gcc-13.3.0
powerpc               randconfig-003-20250611    clang-21
powerpc64             randconfig-001-20250611    clang-21
powerpc64             randconfig-002-20250611    clang-21
riscv                            alldefconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250611    clang-21
riscv                 randconfig-002-20250611    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250611    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-11.5.0
sparc                 randconfig-002-20250611    gcc-8.5.0
sparc64               randconfig-001-20250611    gcc-8.5.0
sparc64               randconfig-002-20250611    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250611    clang-21
um                    randconfig-002-20250611    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    clang-20
x86_64      buildonly-randconfig-001-20250611    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    gcc-12
x86_64      buildonly-randconfig-005-20250611    clang-20
x86_64      buildonly-randconfig-005-20250611    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250611    clang-20
x86_64                randconfig-002-20250611    clang-20
x86_64                randconfig-003-20250611    clang-20
x86_64                randconfig-004-20250611    clang-20
x86_64                randconfig-005-20250611    clang-20
x86_64                randconfig-006-20250611    clang-20
x86_64                randconfig-007-20250611    clang-20
x86_64                randconfig-008-20250611    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250611    gcc-13.3.0
xtensa                randconfig-002-20250611    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

