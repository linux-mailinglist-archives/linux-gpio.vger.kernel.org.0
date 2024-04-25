Return-Path: <linux-gpio+bounces-5840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3749E8B1D30
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 10:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B0641C2099F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5B782D9D;
	Thu, 25 Apr 2024 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKDw6e7h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168828EB
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714035535; cv=none; b=t8AZ3EKLuEb7+H1JfPRXN+h0vkuFo5ywPd9bzpt0euL/bF2zpV+r6Ua5LSz6OXZrv1mo5iNaGnbroyhLSYHXulPyAc+TsrTV8ieFcot/IUNFIO+R0KHNPaSEyKeF9jE+JcGp4oTpFXL+eHPofCdVjdZ9F6ZOKDIh9IdR7t8rm9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714035535; c=relaxed/simple;
	bh=mIUUx5Ynhr2YZLL3Q82s4hWRpix2ZFhhGAapWAQEGso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNQ0gBAX1HdP8H4qdl/CxFkGOcVuZNo1K9sRtDJVfe2HheRqmhXB2o9g7AtFMBQlJl6mclJlXean7DIzVc6th5eturxKeoXBI8DHjNYYpauUL9DqttrtevcV11hQbYOSQAJ9+fDgynxmmRtQMhRR91M7hOahejME55pc4+r1dGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKDw6e7h; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714035531; x=1745571531;
  h=date:from:to:cc:subject:message-id;
  bh=mIUUx5Ynhr2YZLL3Q82s4hWRpix2ZFhhGAapWAQEGso=;
  b=FKDw6e7h+tOGKkw2vwSLqDSkAhdyECIdU0BlQ3/WOSIW1Gxw3/fcGtF8
   uKM95GzJlrmuT41gRCbPdp9+VCQR8bKVF4v37poUrjCtx01zbjxNBKv8M
   f9R6evk9I6fDml+3RnJtE0o+4Af57GxeUdX8/CeTUn+dICpV47FOfuX0S
   +6pAEyX1VPqbEJtwhaUrG7PVU/0ssusPd3xhRIOZUuXwl6rVSUunapZNV
   2b7CJuTki6TZY5NuIALna5AYi/dkHm623i4zOCnzx4qG6spgJp3FCqloY
   Fz1kaoCkdnqY2QIzT0LfomxDgrvBU0MTZgpOK/TvOx+HzKYAR3WFd2mwF
   Q==;
X-CSE-ConnectionGUID: 7FdNqnEwR/G7fQBBBkrhHw==
X-CSE-MsgGUID: /HnxDyN9QHWXpMsm11XbFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12641237"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="12641237"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 01:58:51 -0700
X-CSE-ConnectionGUID: Y+IW9LGBSZONrakcDA4+UQ==
X-CSE-MsgGUID: 3pvVV91ARU696+8ScZcLVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="29784999"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Apr 2024 01:58:50 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzuwK-0002C5-1R;
	Thu, 25 Apr 2024 08:58:48 +0000
Date: Thu, 25 Apr 2024 16:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 ec37529e544c59bb8ba35fd950c7bec28e5d54ee
Message-ID: <202404251603.mDeGr3AI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: ec37529e544c59bb8ba35fd950c7bec28e5d54ee  gpio: brcmstb: Use dynamic GPIO base numbers

elapsed time: 1458m

configs tested: 190
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
arc                     nsimosci_hs_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240424   gcc  
arc                   randconfig-001-20240425   gcc  
arc                   randconfig-002-20240424   gcc  
arc                   randconfig-002-20240425   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240424   gcc  
arm                   randconfig-002-20240424   gcc  
arm                   randconfig-003-20240424   gcc  
arm                         socfpga_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240425   gcc  
arm64                 randconfig-002-20240424   gcc  
arm64                 randconfig-002-20240425   gcc  
arm64                 randconfig-003-20240424   gcc  
arm64                 randconfig-003-20240425   gcc  
arm64                 randconfig-004-20240425   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240424   gcc  
csky                  randconfig-001-20240425   gcc  
csky                  randconfig-002-20240424   gcc  
csky                  randconfig-002-20240425   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240425   gcc  
i386         buildonly-randconfig-003-20240425   gcc  
i386         buildonly-randconfig-006-20240425   gcc  
i386                  randconfig-004-20240424   clang
i386                  randconfig-004-20240425   gcc  
i386                  randconfig-011-20240424   clang
i386                  randconfig-013-20240424   clang
i386                  randconfig-013-20240425   gcc  
i386                  randconfig-014-20240424   clang
i386                  randconfig-014-20240425   gcc  
i386                  randconfig-015-20240424   clang
i386                  randconfig-015-20240425   gcc  
i386                  randconfig-016-20240424   clang
i386                  randconfig-016-20240425   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240424   gcc  
loongarch             randconfig-001-20240425   gcc  
loongarch             randconfig-002-20240424   gcc  
loongarch             randconfig-002-20240425   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip28_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240424   gcc  
nios2                 randconfig-001-20240425   gcc  
nios2                 randconfig-002-20240424   gcc  
nios2                 randconfig-002-20240425   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240424   gcc  
parisc                randconfig-001-20240425   gcc  
parisc                randconfig-002-20240424   gcc  
parisc                randconfig-002-20240425   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20240425   gcc  
powerpc               randconfig-002-20240424   gcc  
powerpc               randconfig-002-20240425   gcc  
powerpc               randconfig-003-20240424   gcc  
powerpc64             randconfig-001-20240424   gcc  
powerpc64             randconfig-001-20240425   gcc  
powerpc64             randconfig-002-20240424   gcc  
powerpc64             randconfig-002-20240425   gcc  
powerpc64             randconfig-003-20240424   gcc  
powerpc64             randconfig-003-20240425   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240424   gcc  
riscv                 randconfig-001-20240425   gcc  
riscv                 randconfig-002-20240425   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240424   gcc  
s390                  randconfig-001-20240425   gcc  
s390                  randconfig-002-20240425   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20240424   gcc  
sh                    randconfig-001-20240425   gcc  
sh                    randconfig-002-20240424   gcc  
sh                    randconfig-002-20240425   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240424   gcc  
sparc64               randconfig-001-20240425   gcc  
sparc64               randconfig-002-20240424   gcc  
sparc64               randconfig-002-20240425   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240424   gcc  
um                    randconfig-001-20240425   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64       buildonly-randconfig-002-20240425   gcc  
x86_64       buildonly-randconfig-006-20240425   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                randconfig-004-20240425   gcc  
x86_64                randconfig-005-20240425   gcc  
x86_64                randconfig-011-20240425   gcc  
x86_64                randconfig-014-20240425   gcc  
x86_64                randconfig-072-20240425   gcc  
x86_64                randconfig-073-20240425   gcc  
x86_64                randconfig-076-20240425   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240424   gcc  
xtensa                randconfig-001-20240425   gcc  
xtensa                randconfig-002-20240424   gcc  
xtensa                randconfig-002-20240425   gcc  
xtensa                    smp_lx200_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

