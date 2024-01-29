Return-Path: <linux-gpio+bounces-2719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FC841738
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 01:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD48D1C236DF
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 00:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4011653E3D;
	Mon, 29 Jan 2024 23:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zekc31AQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4542853E3A
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jan 2024 23:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706572702; cv=none; b=g0XJWKdnWawStx9a9FXJNtRJjdNE0gxLJJK1yMTlxQerazGUxtHIS+fqQs2vfISk30ASsdRYxodmq5BZZRZ3+IrHHNb0mb5yxP0Y46hqSsX6O14oFDYjsfbjpAO0YNDG0h4SJ3xVSX1C/D4hsOt8EPP52Eu8ye0LciEvylz4HOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706572702; c=relaxed/simple;
	bh=AQCfZKoVUwouIKI+eYldQxUXDCvR2C4K/faQTJdlQ1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VNbHKej+el/bSqFXC8DRVe5vGL3+OtF+flKWAZXLISzArGimDpNIvmpYDXM5YIcW+IEScj4/YzbxEU4lrVAXZCGsVPVyEnh6mBFAy8Wjv9/qSBzenHI6mj3RpM7xbQMsfUeGJfQr2gx20Hrlh6jDv5vPvOrlo6JTKNBR9LfVRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zekc31AQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706572700; x=1738108700;
  h=date:from:to:cc:subject:message-id;
  bh=AQCfZKoVUwouIKI+eYldQxUXDCvR2C4K/faQTJdlQ1I=;
  b=Zekc31AQm7lrvQIhhStbLQRjRwBuYP+CNOXQPxIkDbbPQV84LoYpzJ8e
   oH9fNXWznNV7pyjueA+a+1QSBDBhwlFlZB6IHcJVDaGjfQAAybzyyeFE7
   XwHO24LOEqqczs0PcknonldEhtFRmmV+wUy0byASYXIZgQvWx+lI7u0iW
   oa4/UMyE7ykEM6CngyEgkMVRtPIa8G3SIbhbK3pXqyHAxoD3kshvwwXA7
   1aJfqa2XrtTxBdb5DjIIXHi4Ef1LjHUzZtm9K6K7QZCFVWmEpKt4DgyhA
   suq7QIAGwaZfOU0Nr15eCZUwuVH3isbjxNxxWAUuN89v96bjzxdx4kOcd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21639606"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="21639606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 15:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3625033"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jan 2024 15:58:19 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUbW4-0004j2-0P;
	Mon, 29 Jan 2024 23:58:16 +0000
Date: Tue, 30 Jan 2024 07:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 6933ba529d06afdd3faf5501855e410b46b77160
Message-ID: <202401300701.foviuKAU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 6933ba529d06afdd3faf5501855e410b46b77160  gpio: improve the API contract for setting direction

elapsed time: 722m

configs tested: 220
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240129   gcc  
arc                   randconfig-001-20240130   gcc  
arc                   randconfig-002-20240129   gcc  
arc                   randconfig-002-20240130   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20240129   gcc  
arm                   randconfig-001-20240130   gcc  
arm                   randconfig-002-20240129   gcc  
arm                   randconfig-002-20240130   gcc  
arm                   randconfig-003-20240129   gcc  
arm                   randconfig-003-20240130   gcc  
arm                   randconfig-004-20240129   gcc  
arm                   randconfig-004-20240130   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240129   gcc  
arm64                 randconfig-001-20240130   gcc  
arm64                 randconfig-002-20240129   gcc  
arm64                 randconfig-002-20240130   gcc  
arm64                 randconfig-003-20240129   gcc  
arm64                 randconfig-003-20240130   gcc  
arm64                 randconfig-004-20240129   gcc  
arm64                 randconfig-004-20240130   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240129   gcc  
csky                  randconfig-001-20240130   gcc  
csky                  randconfig-002-20240129   gcc  
csky                  randconfig-002-20240130   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240129   gcc  
i386         buildonly-randconfig-002-20240129   gcc  
i386         buildonly-randconfig-003-20240129   gcc  
i386         buildonly-randconfig-004-20240129   gcc  
i386         buildonly-randconfig-005-20240129   gcc  
i386         buildonly-randconfig-006-20240129   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240129   gcc  
i386                  randconfig-002-20240129   gcc  
i386                  randconfig-003-20240129   gcc  
i386                  randconfig-004-20240129   gcc  
i386                  randconfig-005-20240129   gcc  
i386                  randconfig-006-20240129   gcc  
i386                  randconfig-011-20240129   clang
i386                  randconfig-012-20240129   clang
i386                  randconfig-013-20240129   clang
i386                  randconfig-014-20240129   clang
i386                  randconfig-015-20240129   clang
i386                  randconfig-016-20240129   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240129   gcc  
loongarch             randconfig-001-20240130   gcc  
loongarch             randconfig-002-20240129   gcc  
loongarch             randconfig-002-20240130   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                          rm200_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240129   gcc  
nios2                 randconfig-001-20240130   gcc  
nios2                 randconfig-002-20240129   gcc  
nios2                 randconfig-002-20240130   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240129   gcc  
parisc                randconfig-001-20240130   gcc  
parisc                randconfig-002-20240129   gcc  
parisc                randconfig-002-20240130   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc               randconfig-001-20240129   gcc  
powerpc               randconfig-001-20240130   gcc  
powerpc               randconfig-002-20240129   gcc  
powerpc               randconfig-002-20240130   gcc  
powerpc               randconfig-003-20240129   gcc  
powerpc               randconfig-003-20240130   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240129   gcc  
powerpc64             randconfig-001-20240130   gcc  
powerpc64             randconfig-002-20240129   gcc  
powerpc64             randconfig-002-20240130   gcc  
powerpc64             randconfig-003-20240129   gcc  
powerpc64             randconfig-003-20240130   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240129   gcc  
riscv                 randconfig-001-20240130   gcc  
riscv                 randconfig-002-20240129   gcc  
riscv                 randconfig-002-20240130   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240129   gcc  
sh                    randconfig-001-20240130   gcc  
sh                    randconfig-002-20240129   gcc  
sh                    randconfig-002-20240130   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240129   gcc  
sparc64               randconfig-001-20240130   gcc  
sparc64               randconfig-002-20240129   gcc  
sparc64               randconfig-002-20240130   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240129   gcc  
um                    randconfig-001-20240130   gcc  
um                    randconfig-002-20240129   gcc  
um                    randconfig-002-20240130   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240130   gcc  
x86_64       buildonly-randconfig-002-20240130   gcc  
x86_64       buildonly-randconfig-003-20240130   gcc  
x86_64       buildonly-randconfig-004-20240130   gcc  
x86_64       buildonly-randconfig-005-20240130   gcc  
x86_64       buildonly-randconfig-006-20240130   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240130   gcc  
x86_64                randconfig-012-20240130   gcc  
x86_64                randconfig-013-20240130   gcc  
x86_64                randconfig-014-20240130   gcc  
x86_64                randconfig-015-20240130   gcc  
x86_64                randconfig-016-20240130   gcc  
x86_64                randconfig-071-20240130   gcc  
x86_64                randconfig-072-20240130   gcc  
x86_64                randconfig-073-20240130   gcc  
x86_64                randconfig-074-20240130   gcc  
x86_64                randconfig-075-20240130   gcc  
x86_64                randconfig-076-20240130   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240129   gcc  
xtensa                randconfig-001-20240130   gcc  
xtensa                randconfig-002-20240129   gcc  
xtensa                randconfig-002-20240130   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

