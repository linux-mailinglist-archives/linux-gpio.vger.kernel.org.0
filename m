Return-Path: <linux-gpio+bounces-30753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC011D3BD84
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 03:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CDE0302651C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 02:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA5415B998;
	Tue, 20 Jan 2026 02:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cn9Ce6rG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBC22097
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768876354; cv=none; b=pGY3GcOy0+qbomI7/rVYxyg4Di1z0AatG3iFr3AKAIt/AHmQ/bPi3lVJHHcysqcIVyOp8ydN0z0uxuQrxY8pbA4GFgzl59PZ4b50CCeEqixKKnHkQp9c3r+XPIMcNRMtRA8SUaLVCbVbY5jEd7PhmeB8LIk2H/d5UYEYWIEwIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768876354; c=relaxed/simple;
	bh=Py81amTh6kLnQ9hFUixXXQ0u60B7T5ZWNviritu0XUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=exp1hmY6imyBaD2rid4MIkgYPX9DoKqSXqZ4tzbxlepWtP7bKtd0MsP6cEH+RR5Hku78CCqvxutIOZZFR38/CxUqtjd3jdN8lFUjzyBX3Ckbi3mESV/VO1Wx7tsXZU6x2tj9qHWLL3keMXjnBZYqsxK8l7dukY0tL7GRG66dX88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cn9Ce6rG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768876352; x=1800412352;
  h=date:from:to:cc:subject:message-id;
  bh=Py81amTh6kLnQ9hFUixXXQ0u60B7T5ZWNviritu0XUs=;
  b=Cn9Ce6rGEqhUSgqe1DaKmPRNEpTnVqWX1b2ZWeQUhK1jGmbVBDz0VjSH
   i+2t2SaAg6u+g0hzT0rg2+7NwrR+TFbCMnwbPU6AhhKJAeo2wmdrpHTjR
   S4rxgLgf522gbzG1un5d0zrXxrG5a1f4PVTlEVhgynabo0lklH7+oYAr4
   34EtGJNEkriluoyzEimlG84Z9+j1GVbrXLFiAuis/NPVEq+KfdzIK6TPN
   ZaBmtL/29jjdlm4BaowrS6h/enJ+dp276ZbhIXv6mvw4bJ3tSZGgpabtK
   D3qpfaJkrEtnTBof0tiqj2yynahGV1zKToAbSXPu+W5DeQUr2UUEPGzqZ
   w==;
X-CSE-ConnectionGUID: 1byQlfrMS/uE1Pm8gTnhnQ==
X-CSE-MsgGUID: k2bn7kYUR+uMhHrdBw97JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69978615"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="69978615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 18:32:31 -0800
X-CSE-ConnectionGUID: 695dI8L+QO6NnsnU4/6S4Q==
X-CSE-MsgGUID: M7A0ZMAtQqi8PqOxhtmd/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="210500080"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2026 18:32:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi1Xf-00000000OU3-3EGQ;
	Tue, 20 Jan 2026 02:32:27 +0000
Date: Tue, 20 Jan 2026 10:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD REGRESSION
 c7843298bf973d4bc7f4346140661e117186decc
Message-ID: <202601201012.TPjWHpPz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: c7843298bf973d4bc7f4346140661e117186decc  gpio: cdev: Correct return code on memory allocation failure

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202601200022.ZFwz8K6u-lkp@intel.com

    drivers/gpio/gpiolib-cdev.c:2800:3: error: cannot jump from this goto statement to its label

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-davinci_all_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-exynos_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-multi_v4t_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-mvebu_v7_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-pxa3xx_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-randconfig-001-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-randconfig-003-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-randconfig-004-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm-randconfig-r063-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm64-allmodconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm64-randconfig-002-20260119
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- arm64-randconfig-003-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- hexagon-allmodconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- hexagon-randconfig-001-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- hexagon-randconfig-r054-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- hexagon-randconfig-r123-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-003-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-004-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-005-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-006-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-011-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-017-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-054-20260119
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-r073-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- loongarch-allmodconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- loongarch-allnoconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- loongarch-defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- mips-gpr_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- mips-randconfig-r064-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- mips-randconfig-r112-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- mips-randconfig-r123-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- mips-rb532_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- mips-xway_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- powerpc-mpc83xx_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- powerpc-mpc885_ads_defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- powerpc-randconfig-001-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- powerpc64-randconfig-002-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- powerpc64-randconfig-r064-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- powerpc64-randconfig-r131-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- riscv-allmodconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- riscv-defconfig
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- sparc64-randconfig-002-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- sparc64-randconfig-r061-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- um-randconfig-001-20260119
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-buildonly-randconfig-004-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-kexec
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-011-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-015-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-073-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-075-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-102-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-121-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-122-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- x86_64-randconfig-123-20260120
|   `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label
`-- x86_64-rhel-9.4-rust
    `-- drivers-gpio-gpiolib-cdev.c:error:cannot-jump-from-this-goto-statement-to-its-label

elapsed time: 728m

configs tested: 243
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260119    gcc-14.3.0
arc                   randconfig-001-20260120    clang-22
arc                   randconfig-002-20260119    gcc-14.3.0
arc                   randconfig-002-20260120    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    clang-18
arm                     davinci_all_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-18
arm                            hisi_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20260119    gcc-14.3.0
arm                   randconfig-001-20260120    clang-22
arm                   randconfig-002-20260119    gcc-14.3.0
arm                   randconfig-002-20260120    clang-22
arm                   randconfig-003-20260119    gcc-14.3.0
arm                   randconfig-003-20260120    clang-22
arm                   randconfig-004-20260119    gcc-14.3.0
arm                   randconfig-004-20260120    clang-22
arm                         socfpga_defconfig    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260119    clang-19
arm64                 randconfig-001-20260120    gcc-15.2.0
arm64                 randconfig-002-20260119    clang-19
arm64                 randconfig-002-20260120    gcc-15.2.0
arm64                 randconfig-003-20260119    clang-19
arm64                 randconfig-003-20260120    gcc-15.2.0
arm64                 randconfig-004-20260119    clang-19
arm64                 randconfig-004-20260120    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260119    clang-19
csky                  randconfig-001-20260120    gcc-15.2.0
csky                  randconfig-002-20260119    clang-19
csky                  randconfig-002-20260120    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260120    gcc-12.5.0
hexagon               randconfig-002-20260120    gcc-12.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260120    gcc-14
i386        buildonly-randconfig-002-20260120    gcc-14
i386        buildonly-randconfig-003-20260120    gcc-14
i386        buildonly-randconfig-004-20260120    gcc-14
i386        buildonly-randconfig-005-20260120    gcc-14
i386        buildonly-randconfig-006-20260120    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260120    clang-20
i386                  randconfig-002-20260120    clang-20
i386                  randconfig-003-20260120    clang-20
i386                  randconfig-004-20260120    clang-20
i386                  randconfig-005-20260120    clang-20
i386                  randconfig-006-20260120    clang-20
i386                  randconfig-007-20260120    clang-20
i386                  randconfig-011-20260120    clang-20
i386                  randconfig-012-20260120    clang-20
i386                  randconfig-013-20260120    clang-20
i386                  randconfig-014-20260120    clang-20
i386                  randconfig-015-20260120    clang-20
i386                  randconfig-016-20260120    clang-20
i386                  randconfig-017-20260120    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260120    gcc-12.5.0
loongarch             randconfig-002-20260120    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           ip22_defconfig    clang-22
mips                      loongson3_defconfig    clang-22
mips                    maltaup_xpa_defconfig    gcc-15.2.0
mips                          rb532_defconfig    clang-22
mips                           xway_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260120    gcc-12.5.0
nios2                 randconfig-002-20260120    gcc-12.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260120    gcc-8.5.0
parisc                randconfig-002-20260120    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    amigaone_defconfig    clang-22
powerpc                     asp8347_defconfig    clang-22
powerpc                      bamboo_defconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    gcc-15.2.0
powerpc                      katmai_defconfig    clang-18
powerpc                   motionpro_defconfig    clang-22
powerpc                     mpc83xx_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20260120    gcc-8.5.0
powerpc               randconfig-002-20260120    gcc-8.5.0
powerpc                     tqm5200_defconfig    clang-22
powerpc                     tqm8548_defconfig    clang-22
powerpc                         wii_defconfig    clang-18
powerpc64             randconfig-001-20260120    gcc-8.5.0
powerpc64             randconfig-002-20260120    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20260120    gcc-13.4.0
riscv                 randconfig-002-20260120    gcc-13.4.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260120    gcc-13.4.0
s390                  randconfig-002-20260120    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260120    gcc-13.4.0
sh                    randconfig-002-20260120    gcc-13.4.0
sh                          rsk7201_defconfig    clang-22
sh                           se7722_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260119    gcc-14.3.0
sparc                 randconfig-001-20260120    gcc-8.5.0
sparc                 randconfig-002-20260119    gcc-14.3.0
sparc                 randconfig-002-20260120    gcc-8.5.0
sparc                       sparc32_defconfig    clang-18
sparc64                          alldefconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260119    gcc-14.3.0
sparc64               randconfig-001-20260120    gcc-8.5.0
sparc64               randconfig-002-20260119    gcc-14.3.0
sparc64               randconfig-002-20260120    gcc-8.5.0
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260119    gcc-14.3.0
um                    randconfig-001-20260120    gcc-8.5.0
um                    randconfig-002-20260119    gcc-14.3.0
um                    randconfig-002-20260120    gcc-8.5.0
um                           x86_64_defconfig    clang-18
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260120    gcc-14
x86_64      buildonly-randconfig-002-20260120    gcc-14
x86_64      buildonly-randconfig-003-20260120    gcc-14
x86_64      buildonly-randconfig-004-20260120    gcc-14
x86_64      buildonly-randconfig-005-20260120    gcc-14
x86_64      buildonly-randconfig-006-20260120    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260120    gcc-14
x86_64                randconfig-002-20260120    gcc-14
x86_64                randconfig-003-20260120    gcc-14
x86_64                randconfig-004-20260120    gcc-14
x86_64                randconfig-005-20260120    gcc-14
x86_64                randconfig-006-20260120    gcc-14
x86_64                randconfig-011-20260120    gcc-14
x86_64                randconfig-012-20260120    gcc-14
x86_64                randconfig-013-20260120    gcc-14
x86_64                randconfig-014-20260120    gcc-14
x86_64                randconfig-015-20260120    gcc-14
x86_64                randconfig-016-20260120    gcc-14
x86_64                randconfig-071-20260120    gcc-14
x86_64                randconfig-072-20260120    gcc-14
x86_64                randconfig-073-20260120    gcc-14
x86_64                randconfig-074-20260120    gcc-14
x86_64                randconfig-075-20260120    gcc-14
x86_64                randconfig-076-20260120    gcc-14
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
xtensa                randconfig-001-20260119    gcc-14.3.0
xtensa                randconfig-001-20260120    gcc-8.5.0
xtensa                randconfig-002-20260119    gcc-14.3.0
xtensa                randconfig-002-20260120    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

