Return-Path: <linux-gpio+bounces-17036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF2A4DD97
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28593B0ABC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF569201246;
	Tue,  4 Mar 2025 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtIxrbXQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE7201100
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090366; cv=none; b=pJcnldlhplnScZ7QtPdLlqf/FMBwceXJ+4RG55HpeE7VrGQuP8VmNX8rURo/mGDmmxc8+tQoZ9uBLJ82jidBg2wstJEIrDbqJhLWskRbpQ0JcyDoQl8ISMFnNax5rySaW9HjOl21YTpfu9CmQo5nWw0cB4id4XESwlzTfuJqNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090366; c=relaxed/simple;
	bh=9xpsBSHU4E4bxRG96L6ggoe+gOy9Ff9LCKqCPOyptD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C33fUXtO6sFWV0RcMKwyMm4TIVRfl1eWyjkVsUDWulMA/evHqkfaWIHGQmGg+KrsQD1VLwt7V92O7nwXzkr/soXzaSDE2zWZRzFI7m7lfeKEOVdnjVP/XwYpIo2nzwBObff0zC6SGNPopkdW9tJje91H+0kTlkcs9mCude8oC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtIxrbXQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741090365; x=1772626365;
  h=date:from:to:cc:subject:message-id;
  bh=9xpsBSHU4E4bxRG96L6ggoe+gOy9Ff9LCKqCPOyptD0=;
  b=mtIxrbXQkuN4swzVteUAcQM9oIk8VQlE2f175SKETR1xe2+ojtb5miUh
   G1Ut4RKSecZOw4a9+Jh/jSHYDLScJxtAhdEqGt7JCovbqN3CbVuhop1co
   YMPexOPGW1jirJzCKwa5ZUxfvFrhkcZ2spXBdExN+scXu0teeL/I82Cw6
   OmyzcnN7zGDCl0+eePCVlsUIl889YQjnFsll0FM26onGAbHxpDnTOQKIW
   q9RvMb8a8Bho4iCxVMLm0S01fyCzLjU/AJ7q/N+uiPJSDbSh05pxcIDZG
   hP4FpE0rTgFouoKzGL6ZDUZB7qonAUaXjw3ga2VfWCypHT2gNqsbQMsPA
   Q==;
X-CSE-ConnectionGUID: za7P6FBBSC2Wxg7OQRpTUA==
X-CSE-MsgGUID: chFEDiS0StOSz+BGJTrecA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41181763"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41181763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:12:44 -0800
X-CSE-ConnectionGUID: vQaOxY2gRp69kuIlFEZ0TA==
X-CSE-MsgGUID: ZJ/4xZ/TTiKKQsN+LLrK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="123364504"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2025 04:12:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpR8a-000JkO-1p;
	Tue, 04 Mar 2025 12:12:40 +0000
Date: Tue, 04 Mar 2025 20:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 f25f405d250fdc7e2e67be8d1732cbbc7cd782d0
Message-ID: <202503042038.0DJdxMJy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: f25f405d250fdc7e2e67be8d1732cbbc7cd782d0  eeprom: at24: Drop of_match_ptr() and ACPI_PTR() protections

elapsed time: 1426m

configs tested: 133
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250303    gcc-13.2.0
arc                   randconfig-002-20250303    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-21
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250303    clang-15
arm                   randconfig-002-20250303    gcc-14.2.0
arm                   randconfig-003-20250303    gcc-14.2.0
arm                   randconfig-004-20250302    clang-21
arm                   randconfig-004-20250303    clang-17
arm                         socfpga_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250303    clang-21
arm64                 randconfig-002-20250303    clang-19
arm64                 randconfig-003-20250303    gcc-14.2.0
arm64                 randconfig-004-20250303    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250303    gcc-14.2.0
csky                  randconfig-002-20250303    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250303    clang-21
hexagon               randconfig-002-20250303    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250303    gcc-12
i386        buildonly-randconfig-002-20250303    clang-19
i386        buildonly-randconfig-003-20250303    clang-19
i386        buildonly-randconfig-004-20250303    gcc-12
i386        buildonly-randconfig-005-20250303    gcc-12
i386        buildonly-randconfig-006-20250303    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250303    gcc-14.2.0
loongarch             randconfig-002-20250303    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
mips                        maltaup_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250303    gcc-14.2.0
nios2                 randconfig-002-20250303    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250303    gcc-14.2.0
parisc                randconfig-002-20250303    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     mpc512x_defconfig    clang-21
powerpc               randconfig-001-20250303    clang-15
powerpc               randconfig-002-20250303    clang-21
powerpc               randconfig-003-20250303    clang-21
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-002-20250303    gcc-14.2.0
powerpc64             randconfig-003-20250303    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250303    gcc-14.2.0
riscv                 randconfig-002-20250303    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250303    clang-18
s390                  randconfig-002-20250303    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250303    gcc-14.2.0
sh                    randconfig-002-20250303    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250303    gcc-14.2.0
sparc                 randconfig-002-20250303    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250303    gcc-14.2.0
sparc64               randconfig-002-20250303    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250303    gcc-12
um                    randconfig-002-20250303    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250303    clang-19
x86_64      buildonly-randconfig-002-20250303    gcc-12
x86_64      buildonly-randconfig-003-20250303    clang-19
x86_64      buildonly-randconfig-004-20250303    gcc-12
x86_64      buildonly-randconfig-005-20250303    gcc-12
x86_64      buildonly-randconfig-006-20250303    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250303    gcc-14.2.0
xtensa                randconfig-002-20250303    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

