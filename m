Return-Path: <linux-gpio+bounces-18996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5955A91341
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13DB31898DE4
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 05:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB371E492D;
	Thu, 17 Apr 2025 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+O4+Ln4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4F1DE4C8
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868948; cv=none; b=edmO9LU+tQkLyLT2/oGotHPPRLIc3pssrOcg3aqrUZuvvuBV3PsRUsRy+7jPCh3Nt28d89PU+sPdx/fBY+cc7f4FtHbzRtJk5KVQiF3Q59h5T7O5KWgLcvWzMPbcy6XktPwp5eJA0mKw4dx0lTmSixaGVALrOXcFb5rHAEyWLso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868948; c=relaxed/simple;
	bh=bBb0t84JQYZa6YNpST6A1L5GEpd5sSn75iCvgHLC9Hc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C1SqUszECDaFco4O+coLlvyYTP2Ds7Hk025qlm1D0SfPLZoBGYpmIdvSYoEVmJ0c2QvFc9rnkRnzg/d4cs0mj7HoAOkdzn9USlx3DdiSzh4lM7p7pDP38m25t2cWOyz0kD8Mef67J10F5O6jC2QQrZjuNP7QGK2HaPmUVUietMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+O4+Ln4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744868947; x=1776404947;
  h=date:from:to:cc:subject:message-id;
  bh=bBb0t84JQYZa6YNpST6A1L5GEpd5sSn75iCvgHLC9Hc=;
  b=G+O4+Ln4j32uP3dE/P0CVtOL3HgKw6WSYyBCZoeMPtdADH/lVCueJW7P
   GRim5Al1O7KVPB/JiLCl60aCaDiwku1dG17+vZa0gRcG54E8AiHdBiX6+
   spD4X9P3cf4SPhjRBigcT6zIlIJKg9Ub7cK+XLQqsb2hGZSq6ghH9WJLc
   kMmeAPgUdWhSVq7lswyFXCjQjI/fxE8GZX58Ry6R2O/c/kP55fVKKaAvS
   Ys0OWB1F7QJ+hCiTFMj3q1y0VNamrEaYk4t6V0mxYhX1kSIKlH1ZWiXL+
   4kvq4TSGa4S8Yl3cYUY17/k8BQDLxk4yYxB2aXlxxjZLjHvmwccNUl/WU
   g==;
X-CSE-ConnectionGUID: rK5xw6YvSNCffvl17UF0Yg==
X-CSE-MsgGUID: kqXXw2C6SbuejSm0hJowiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68932296"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="68932296"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 22:49:05 -0700
X-CSE-ConnectionGUID: ZMvYR0cFQ62El5vS0kF1tg==
X-CSE-MsgGUID: GD9BjJl0RT+1QVlT0pOUQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131678304"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 22:49:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5I7R-000LS0-3B;
	Thu, 17 Apr 2025 05:49:01 +0000
Date: Thu, 17 Apr 2025 13:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 10988ba91e111d3cb967128e55d9597815c6e07d
Message-ID: <202504171310.xGYZUKvy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 10988ba91e111d3cb967128e55d9597815c6e07d  pinctrl: qcom: ssbi-mpp: use new GPIO line value setter callbacks

elapsed time: 1470m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250416    gcc-12.4.0
arc                   randconfig-002-20250416    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                      jornada720_defconfig    clang-21
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250416    clang-17
arm                   randconfig-002-20250416    gcc-7.5.0
arm                   randconfig-003-20250416    clang-21
arm                   randconfig-004-20250416    clang-19
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250416    gcc-8.5.0
arm64                 randconfig-002-20250416    clang-21
arm64                 randconfig-003-20250416    gcc-6.5.0
arm64                 randconfig-004-20250416    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250416    gcc-14.2.0
csky                  randconfig-002-20250416    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250416    clang-21
hexagon               randconfig-002-20250416    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250416    gcc-12
i386        buildonly-randconfig-003-20250416    gcc-12
i386        buildonly-randconfig-004-20250416    gcc-11
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-14.2.0
loongarch             randconfig-002-20250416    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250416    gcc-6.5.0
nios2                 randconfig-002-20250416    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250416    gcc-11.5.0
parisc                randconfig-002-20250416    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250416    gcc-8.5.0
powerpc               randconfig-002-20250416    clang-21
powerpc               randconfig-003-20250416    clang-21
powerpc64             randconfig-001-20250416    clang-21
powerpc64             randconfig-002-20250416    clang-21
powerpc64             randconfig-003-20250416    gcc-6.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250416    clang-20
riscv                 randconfig-002-20250416    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250416    clang-21
s390                  randconfig-002-20250416    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250416    gcc-14.2.0
sh                    randconfig-002-20250416    gcc-6.5.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250416    gcc-11.5.0
sparc                 randconfig-002-20250416    gcc-11.5.0
sparc64               randconfig-001-20250416    gcc-5.5.0
sparc64               randconfig-002-20250416    gcc-11.5.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250416    clang-21
um                    randconfig-002-20250416    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250416    gcc-12
x86_64      buildonly-randconfig-002-20250416    gcc-12
x86_64      buildonly-randconfig-003-20250416    gcc-12
x86_64      buildonly-randconfig-004-20250416    clang-20
x86_64      buildonly-randconfig-005-20250416    clang-20
x86_64      buildonly-randconfig-006-20250416    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250416    gcc-7.5.0
xtensa                randconfig-002-20250416    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

