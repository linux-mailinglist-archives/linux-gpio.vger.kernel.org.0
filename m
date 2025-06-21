Return-Path: <linux-gpio+bounces-21947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD1AE27C6
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 09:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405243BCA90
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 07:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90A81A315C;
	Sat, 21 Jun 2025 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sf5qPLDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1A4A23
	for <linux-gpio@vger.kernel.org>; Sat, 21 Jun 2025 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750491266; cv=none; b=sz7NpOg0e2XpDOxRMCds9h09QQmIoEXtySztGB7OVn8VofU/Y8YkDABjqnfxOLdOlTztf3oCWdpJHYClgZfiViDrLE1oWOzapOLuxwmMFAlO4AFTxMiIKuGaSEKIUP+UnZhpQY49807wFHblsCsNlFzsUHpOVohJRKUvRhHVsDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750491266; c=relaxed/simple;
	bh=faFMAuO0yuROT0gv8uL3SdkFDKidyQX7SGzqHnOZJRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fhXU06IGSIEnmJevGGXQYWRWvIKlELTe5Zaj5H1l3BhdwCI9LUM2UqB5rdnPkbXIUlfp6QaBI9EPnrLTe5sMB4ZUrDYNMkzWr5TitBjI7FRtmgj02cCUo+nKy0YyFXhxloAkowqspra6R2mtImv7n0jEG3XXCkI7tBlE2h7f1aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sf5qPLDn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750491265; x=1782027265;
  h=date:from:to:cc:subject:message-id;
  bh=faFMAuO0yuROT0gv8uL3SdkFDKidyQX7SGzqHnOZJRc=;
  b=Sf5qPLDnsOLR9UT5SWgD5HYO2kcjPl2ef5po/VwxVW8YyvDqmW5/yqB+
   l208Y5i6KUK4Z42fAFy42xPX/tuVPgH2sMr/A2m5mn1Saielsu7Aq8eCr
   OiJLWTfufIpHi3VarlJ/voeqOid9E35abcSj9YqRi4zBOg9ubDxV/5Jbl
   kHuu29yoQbk5itOSrH5CQlcUQZSuZiF1yBugkudciwjNr+MN9ZlLvUuZy
   hW5Fi62oczPCWyNu33iDH8rwjej1Uw8ylnLIHjtnm/AaGyrUsGAR+bFNq
   uUGuUFuzjRzWPUw2H01AhwyWFztYWRbz4BtbJq04ygnO5sOvAUw5bX0aH
   A==;
X-CSE-ConnectionGUID: FX4qKuaORw++Eta6cF152Q==
X-CSE-MsgGUID: QeAv4VIZQ2SmPtf7XFNvFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52718438"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="52718438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 00:34:24 -0700
X-CSE-ConnectionGUID: P10NMdCTQhGYfwTDoJ4BOw==
X-CSE-MsgGUID: Kk+olWGKSY2wRkbMyTAzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="174714437"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jun 2025 00:34:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSsk0-000MSK-2i;
	Sat, 21 Jun 2025 07:34:20 +0000
Date: Sat, 21 Jun 2025 15:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 fd19792851db77e74cff4e2dc772d25a83cdc34d
Message-ID: <202506211537.idrOMEun-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: fd19792851db77e74cff4e2dc772d25a83cdc34d  gpio: sysfs: remove the mockdev pointer from struct gpio_device

elapsed time: 1410m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250620    gcc-8.5.0
arc                   randconfig-002-20250620    gcc-11.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250620    clang-21
arm                   randconfig-002-20250620    clang-21
arm                   randconfig-003-20250620    clang-21
arm                   randconfig-004-20250620    clang-21
arm                           sama7_defconfig    clang-21
arm                           tegra_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250620    gcc-9.5.0
arm64                 randconfig-002-20250620    gcc-8.5.0
arm64                 randconfig-003-20250620    gcc-11.5.0
arm64                 randconfig-004-20250620    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250620    gcc-13.3.0
csky                  randconfig-002-20250620    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250620    clang-21
hexagon               randconfig-002-20250620    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250620    clang-20
i386        buildonly-randconfig-002-20250620    clang-20
i386        buildonly-randconfig-003-20250620    clang-20
i386        buildonly-randconfig-004-20250620    clang-20
i386        buildonly-randconfig-005-20250620    clang-20
i386        buildonly-randconfig-006-20250620    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250620    gcc-14.3.0
loongarch             randconfig-002-20250620    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250620    gcc-8.5.0
nios2                 randconfig-002-20250620    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250620    gcc-10.5.0
parisc                randconfig-002-20250620    gcc-12.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250620    clang-21
powerpc               randconfig-002-20250620    gcc-11.5.0
powerpc               randconfig-003-20250620    clang-21
powerpc64             randconfig-001-20250620    gcc-14.3.0
powerpc64             randconfig-002-20250620    clang-21
powerpc64             randconfig-003-20250620    clang-19
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250620    gcc-14.3.0
riscv                 randconfig-002-20250620    clang-21
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250620    gcc-9.3.0
s390                  randconfig-002-20250620    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250620    gcc-15.1.0
sh                    randconfig-002-20250620    gcc-15.1.0
sh                          sdk7780_defconfig    gcc-15.1.0
sh                           se7705_defconfig    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250620    gcc-8.5.0
sparc                 randconfig-002-20250620    gcc-10.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250620    gcc-13.3.0
sparc64               randconfig-002-20250620    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250620    clang-21
um                    randconfig-002-20250620    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250620    gcc-12
x86_64      buildonly-randconfig-002-20250620    gcc-12
x86_64      buildonly-randconfig-003-20250620    clang-20
x86_64      buildonly-randconfig-004-20250620    gcc-12
x86_64      buildonly-randconfig-005-20250620    gcc-12
x86_64      buildonly-randconfig-006-20250620    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250620    gcc-8.5.0
xtensa                randconfig-002-20250620    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

