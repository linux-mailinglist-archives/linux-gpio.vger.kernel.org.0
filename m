Return-Path: <linux-gpio+bounces-19057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255DFA93847
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 16:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3619516497D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 14:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1686152E02;
	Fri, 18 Apr 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGACX5RY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0514BF89
	for <linux-gpio@vger.kernel.org>; Fri, 18 Apr 2025 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985375; cv=none; b=uUZo/NjrUhYiU9ELHqWHuBIOzxrdW0Yxy7qiJzg/yOxKtKDrKDxeOT0H9WSW7gIZIvwN1uwv6UGDKlSUSuMDBfkjK8g/wFoq7/0xgSOiwQn3spRHanzaiNDWwgxHk+DllUuT/xbgrS8fKvgyItM8NKI6p/JmQIrxYwgUgnTirA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985375; c=relaxed/simple;
	bh=rfamlQxYm4cgTyH6VobpeL8n4zT1QaphLpYysJ2CmtU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ozR9/n5LP0KQVFVChT5MTanc2VqOA2yHgYgtWcbYd35qg6NDarY7mMc2sAKIbgpsfLn/HMgDFgmRQSQxVe5AfhNdJnHTe0RF72GB5AUKpE+f7l4/ls3+zl4UlfHzO8DjxO6rxHNuUsqair+BPAo5JVmgd3UYBV2aWuGGtKjqrd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGACX5RY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744985374; x=1776521374;
  h=date:from:to:cc:subject:message-id;
  bh=rfamlQxYm4cgTyH6VobpeL8n4zT1QaphLpYysJ2CmtU=;
  b=dGACX5RYmquanRtqaZP7VdtWkmPF6mOM0+29jmX8oFiIH7WN9EiN3gRL
   RjYHci2Wr/MrGLlAdWE7I4x08IjECG+YXp4aLJB0pM9C1M9QYycpuUd75
   wyIoQiun2NWeYcGNXDY/mfJIaKhB8ErHHLO9LPX8PSyElOZcBsKtbiIap
   DhACREIPynvRuFVsgmvB7Do9OHa9k155HOZDW9+tOuywQS3AhAMfr0gwo
   oLiN6LTYYtUTnEs7Pi04x6NlCkmjurpCrmmKG1oUENVkSMLHNm1Hk07D3
   18mEG4oDbrkV5seSviJAothntVgTsWXv1xtJ/AhMD2Ft1f5xHHwYM1Hfj
   A==;
X-CSE-ConnectionGUID: cSBoxLc8Rje/OAqGKiha+A==
X-CSE-MsgGUID: nXI0dKd2S/KmL9f4cHe4/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57274727"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="57274727"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 07:09:33 -0700
X-CSE-ConnectionGUID: ZBQHmCLuTSStR334mUQxaw==
X-CSE-MsgGUID: zF3TaCFgR0+DXxSI44bzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="131661272"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Apr 2025 07:09:32 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5mPK-0002vd-0K;
	Fri, 18 Apr 2025 14:09:30 +0000
Date: Fri, 18 Apr 2025 22:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 550300b9a295a591e0721a31f8c964a4bc08d51c
Message-ID: <202504182213.OstkgWJi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 550300b9a295a591e0721a31f8c964a4bc08d51c  gpiolib: Remove redundant assignment of return variable

elapsed time: 1450m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250417    gcc-13.3.0
arc                   randconfig-002-20250417    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250417    gcc-7.5.0
arm                   randconfig-002-20250417    clang-16
arm                   randconfig-003-20250417    gcc-10.5.0
arm                   randconfig-004-20250417    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250417    gcc-7.5.0
arm64                 randconfig-002-20250417    gcc-5.5.0
arm64                 randconfig-003-20250417    clang-21
arm64                 randconfig-004-20250417    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250417    gcc-13.3.0
csky                  randconfig-002-20250417    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250417    clang-21
hexagon               randconfig-002-20250417    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250417    clang-20
i386        buildonly-randconfig-002-20250417    gcc-12
i386        buildonly-randconfig-003-20250417    gcc-12
i386        buildonly-randconfig-004-20250417    gcc-12
i386        buildonly-randconfig-005-20250417    clang-20
i386        buildonly-randconfig-006-20250417    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250417    gcc-14.2.0
loongarch             randconfig-002-20250417    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250417    gcc-11.5.0
nios2                 randconfig-002-20250417    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250417    gcc-12.4.0
parisc                randconfig-002-20250417    gcc-6.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc               randconfig-001-20250417    clang-21
powerpc               randconfig-002-20250417    gcc-9.3.0
powerpc               randconfig-003-20250417    gcc-9.3.0
powerpc64             randconfig-001-20250417    clang-21
powerpc64             randconfig-002-20250417    clang-21
powerpc64             randconfig-003-20250417    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250418    clang-21
riscv                 randconfig-002-20250418    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250418    gcc-7.5.0
s390                  randconfig-002-20250418    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250418    gcc-12.4.0
sh                    randconfig-002-20250418    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250418    gcc-10.3.0
sparc                 randconfig-002-20250418    gcc-7.5.0
sparc64               randconfig-001-20250418    gcc-9.3.0
sparc64               randconfig-002-20250418    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250418    clang-21
um                    randconfig-002-20250418    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250417    clang-20
x86_64      buildonly-randconfig-002-20250417    clang-20
x86_64      buildonly-randconfig-003-20250417    gcc-12
x86_64      buildonly-randconfig-004-20250417    clang-20
x86_64      buildonly-randconfig-005-20250417    clang-20
x86_64      buildonly-randconfig-006-20250417    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250418    gcc-7.5.0
xtensa                randconfig-002-20250418    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

