Return-Path: <linux-gpio+bounces-27790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC91C19EB1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB063A7A27
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5332FFFA3;
	Wed, 29 Oct 2025 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q933DuxS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E395C96
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735803; cv=none; b=ILaJO2U6dCYa54ID/3vdhNakJpsGUAXWqf+sC5MFWLUSxdZ+lubqpsf5b5OjZKzHLDiX555Iri+78J9W/JIK8W5nzyxQz5AFHV+3MMPAfHTTlYXWMeX5fWFtt8w6qvOf4KyJWq7TWwd5Egoz3hGSqskWO7ycfiR/XtPkzgalvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735803; c=relaxed/simple;
	bh=aP4RY5fT1ITB+UlkYrVJCNe2xFTnWWQag4n+QmI/FIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BCRBthAA/KY1A2TAbj5dVHTACfsQPDKDZnS1j8YizSva+8My7mYb9hael8E1JNSdCdoB7+2+2nuYmIIdMgledtLHwquL+qfaHkgZ0AkBzu8/byi4D+Fy8xPriDM1k3Kk7X7l/4Xsa4J/gQbG2X1edM3wgR0TFxURL7zfnpPF+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q933DuxS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761735801; x=1793271801;
  h=date:from:to:cc:subject:message-id;
  bh=aP4RY5fT1ITB+UlkYrVJCNe2xFTnWWQag4n+QmI/FIo=;
  b=Q933DuxSeZeq+QfTq96dKVktfKhZAtc30lCjY0q6Ywj9n4KGMkNVTEee
   qWn1Ns8so3cvbFvU9t8Wyjc2x8PHSuW9WfmL84yf8Se3U0DRggQvc7hvh
   THql3pWcBYU8hCVRMY52q7WRstJ4Xkcfs0RlrkWiPxGfTYXlqcYzw5lqr
   X8DDzopCcdz66cHyYU5JjMR3h0r2hPYLl9cB1ihgMwIopkUY5p3yVGGiC
   8FvxeRYdyiLRCWYRzBZUurQlnmKVS3U4YN6PGgCQpitMqAq+MXcAO1Agb
   +aMVZ5Xna3XhHuOTqCKFCCT9amw3iDYweuK16o2FMtPO3ivaikT6Yhegu
   Q==;
X-CSE-ConnectionGUID: v0WI4AoxRYOQpV5vkyQgfA==
X-CSE-MsgGUID: PBwod2VOSb6EQGhXnYHBAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="74451558"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74451558"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:03:21 -0700
X-CSE-ConnectionGUID: fA169JdyTyahur8hxvov8w==
X-CSE-MsgGUID: Kzx5JNpPQUiIjRyW7FiF1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185704226"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2025 04:03:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE3xV-000KXJ-2l;
	Wed, 29 Oct 2025 11:03:17 +0000
Date: Wed, 29 Oct 2025 19:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 a730bf753eae64c6e7dcaf5d4a5c5d0ac0f76f95
Message-ID: <202510291944.6eVOiept-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: a730bf753eae64c6e7dcaf5d4a5c5d0ac0f76f95  dt-bindings: pinctrl: stm32: Support I/O synchronization parameters

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202510281347.vx7j6b7v-lkp@intel.com

    drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is not a compile-time constant

Error/Warning ids grouped by kconfigs:

recent_errors
|-- powerpc-randconfig-r051-20251028
|   `-- drivers-pinctrl-pinctrl-mpfs-iomux0.c:error:initializer-element-is-not-a-compile-time-constant
`-- riscv-allyesconfig
    `-- drivers-pinctrl-pinctrl-mpfs-iomux0.c:error:initializer-element-is-not-a-compile-time-constant

elapsed time: 1452m

configs tested: 120
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251028    gcc-8.5.0
arc                   randconfig-002-20251028    gcc-13.4.0
arm                               allnoconfig    clang-22
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                   randconfig-001-20251028    clang-22
arm                   randconfig-002-20251028    clang-22
arm                   randconfig-003-20251028    clang-22
arm                   randconfig-004-20251028    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251028    gcc-14
i386        buildonly-randconfig-002-20251028    gcc-14
i386        buildonly-randconfig-003-20251028    gcc-14
i386        buildonly-randconfig-004-20251028    gcc-14
i386        buildonly-randconfig-005-20251028    gcc-14
i386        buildonly-randconfig-006-20251028    gcc-14
i386                  randconfig-011-20251029    gcc-14
i386                  randconfig-012-20251029    clang-20
i386                  randconfig-013-20251029    gcc-14
i386                  randconfig-014-20251029    gcc-14
i386                  randconfig-015-20251029    gcc-14
i386                  randconfig-016-20251029    gcc-14
i386                  randconfig-017-20251029    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251028    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc                     mpc83xx_defconfig    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-002-20251028    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251028    clang-22
s390                  randconfig-002-20251028    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251028    gcc-15.1.0
sh                    randconfig-002-20251028    gcc-13.4.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251028    gcc-14
x86_64      buildonly-randconfig-002-20251028    gcc-14
x86_64      buildonly-randconfig-003-20251028    clang-20
x86_64      buildonly-randconfig-004-20251028    clang-20
x86_64      buildonly-randconfig-005-20251028    clang-20
x86_64      buildonly-randconfig-006-20251028    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251029    gcc-14
x86_64                randconfig-002-20251029    gcc-14
x86_64                randconfig-003-20251029    clang-20
x86_64                randconfig-004-20251029    gcc-14
x86_64                randconfig-005-20251029    gcc-12
x86_64                randconfig-006-20251029    gcc-14
x86_64                randconfig-011-20251028    gcc-14
x86_64                randconfig-012-20251028    gcc-14
x86_64                randconfig-013-20251028    gcc-12
x86_64                randconfig-014-20251028    clang-20
x86_64                randconfig-015-20251028    clang-20
x86_64                randconfig-016-20251028    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

