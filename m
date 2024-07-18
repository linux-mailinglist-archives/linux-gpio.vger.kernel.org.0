Return-Path: <linux-gpio+bounces-8282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6338934C84
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 13:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A32E282C23
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7424613A89B;
	Thu, 18 Jul 2024 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eexkhyfr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19513C8E5
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721302060; cv=none; b=CzYZpbTs2RAQg34z7cxlWlzDtPJLGyG2htJIiHeFkdnWMzQpE8bBPmnR0DBgTKo2OlMJbbyx0JBC5SNq020QSTXRgGxwer7QpvTnkgzaMS9n5E3W0sbwjlRjDFKjruiZCgH8wKYKzk0K/YEGnt6J1HhA7GdaYTd+asREBY81ZmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721302060; c=relaxed/simple;
	bh=wYEq8nSDSvSIXLKGN2WRZSgh82cfJLVCK2TDwfFuk2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m7Ok332dF7w6t14+a+1DCXxBlGDEOc96GNAFSE1MBNoChnDuajZRXGMomoksyf/rYYAGMHB3qu+8gi0880e6qQgFq3wNEvm6xLfi0L1dee/KIq+ftXY0WiaFVnfNOjTxdPw0ww3q9Sq7IXn6qdoYjZiM4QAG14r9D9q7s07zTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eexkhyfr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721302057; x=1752838057;
  h=date:from:to:cc:subject:message-id;
  bh=wYEq8nSDSvSIXLKGN2WRZSgh82cfJLVCK2TDwfFuk2I=;
  b=eexkhyfrtsMtYqsEryPq9iBPfp5hLfivOelGb6jvMN6F6EQ+/eLzssZB
   rljcwWymq54Rm1+3CuYVfFifncBliUZGfWUKJrojRrarCxQqJ08t4Uqcc
   o0/rzeF/X3OBW7mTTI8rP7lweJay2cEzZN0Kr43u4SgiHt17/boJykqcm
   fDV6zBuI6KxAAs3Xq4vk7fGSGxBikw4/mBrrNSU20tesug8x4mrtvdRDH
   Of7ogKR8EiAO2kZ4yQ9KETc16XUjJvtMlWCiHVEEDRlauu9Xkp6lJGaMX
   52BQruyv55+TtZ0zh/Rry1H2+hrUMMz9iHdhSXL7d9O/Adv+SZ/JfrtKg
   Q==;
X-CSE-ConnectionGUID: 3JIhzwUWSMOLMnS0NIzR1g==
X-CSE-MsgGUID: +KkzgKzJRgeFzq3m+2cEJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18706857"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18706857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:27:37 -0700
X-CSE-ConnectionGUID: d3Ge92GcSOeYXQxvf1QwSw==
X-CSE-MsgGUID: ql1c0YLERMGhybAdoSsAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="55574514"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jul 2024 04:27:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUPIL-000hBm-2L;
	Thu, 18 Jul 2024 11:27:33 +0000
Date: Thu, 18 Jul 2024 19:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-current] BUILD SUCCESS
 a19ce320c379e0519b68178c596e43d1d5dda03b
Message-ID: <202407181906.usb6WWdA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: a19ce320c379e0519b68178c596e43d1d5dda03b  power: sequencing: fix an invalid pointer dereference in error path

elapsed time: 1206m

configs tested: 214
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240718   gcc-13.2.0
arc                   randconfig-002-20240718   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                          gemini_defconfig   gcc-13.2.0
arm                   randconfig-001-20240718   gcc-13.2.0
arm                   randconfig-002-20240718   gcc-13.2.0
arm                   randconfig-003-20240718   gcc-13.2.0
arm                   randconfig-004-20240718   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240718   gcc-13.2.0
arm64                 randconfig-002-20240718   gcc-13.2.0
arm64                 randconfig-003-20240718   gcc-13.2.0
arm64                 randconfig-004-20240718   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240718   gcc-13.2.0
csky                  randconfig-002-20240718   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240718   gcc-11
i386         buildonly-randconfig-002-20240718   gcc-11
i386         buildonly-randconfig-003-20240718   gcc-11
i386         buildonly-randconfig-004-20240718   gcc-11
i386         buildonly-randconfig-005-20240718   gcc-11
i386         buildonly-randconfig-006-20240718   gcc-11
i386                                defconfig   clang-18
i386                  randconfig-001-20240718   gcc-11
i386                  randconfig-002-20240718   gcc-11
i386                  randconfig-003-20240718   gcc-11
i386                  randconfig-004-20240718   gcc-11
i386                  randconfig-005-20240718   gcc-11
i386                  randconfig-006-20240718   gcc-11
i386                  randconfig-011-20240718   gcc-11
i386                  randconfig-012-20240718   gcc-11
i386                  randconfig-013-20240718   gcc-11
i386                  randconfig-014-20240718   gcc-11
i386                  randconfig-015-20240718   gcc-11
i386                  randconfig-016-20240718   gcc-11
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240718   gcc-13.2.0
loongarch             randconfig-002-20240718   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                           xway_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240718   gcc-13.2.0
nios2                 randconfig-002-20240718   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240718   gcc-13.2.0
parisc                randconfig-002-20240718   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       ebony_defconfig   gcc-13.2.0
powerpc                    gamecube_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240718   gcc-13.2.0
powerpc               randconfig-002-20240718   gcc-13.2.0
powerpc               randconfig-003-20240718   gcc-13.2.0
powerpc64             randconfig-001-20240718   gcc-13.2.0
powerpc64             randconfig-002-20240718   gcc-13.2.0
powerpc64             randconfig-003-20240718   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240718   gcc-13.2.0
riscv                 randconfig-002-20240718   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240718   gcc-13.2.0
s390                  randconfig-002-20240718   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        dreamcast_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-13.2.0
sh                    randconfig-001-20240718   gcc-13.2.0
sh                    randconfig-002-20240718   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240718   gcc-13.2.0
sparc64               randconfig-002-20240718   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240718   gcc-13.2.0
um                    randconfig-002-20240718   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240718   gcc-11
x86_64       buildonly-randconfig-002-20240718   clang-18
x86_64       buildonly-randconfig-002-20240718   gcc-11
x86_64       buildonly-randconfig-003-20240718   clang-18
x86_64       buildonly-randconfig-003-20240718   gcc-11
x86_64       buildonly-randconfig-004-20240718   clang-18
x86_64       buildonly-randconfig-004-20240718   gcc-11
x86_64       buildonly-randconfig-005-20240718   clang-18
x86_64       buildonly-randconfig-005-20240718   gcc-11
x86_64       buildonly-randconfig-006-20240718   clang-18
x86_64       buildonly-randconfig-006-20240718   gcc-11
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240718   gcc-11
x86_64                randconfig-001-20240718   gcc-13
x86_64                randconfig-002-20240718   gcc-11
x86_64                randconfig-002-20240718   gcc-13
x86_64                randconfig-003-20240718   clang-18
x86_64                randconfig-003-20240718   gcc-11
x86_64                randconfig-004-20240718   gcc-11
x86_64                randconfig-004-20240718   gcc-13
x86_64                randconfig-005-20240718   clang-18
x86_64                randconfig-005-20240718   gcc-11
x86_64                randconfig-006-20240718   clang-18
x86_64                randconfig-006-20240718   gcc-11
x86_64                randconfig-011-20240718   clang-18
x86_64                randconfig-011-20240718   gcc-11
x86_64                randconfig-012-20240718   gcc-11
x86_64                randconfig-012-20240718   gcc-9
x86_64                randconfig-013-20240718   clang-18
x86_64                randconfig-013-20240718   gcc-11
x86_64                randconfig-014-20240718   clang-18
x86_64                randconfig-014-20240718   gcc-11
x86_64                randconfig-015-20240718   clang-18
x86_64                randconfig-015-20240718   gcc-11
x86_64                randconfig-016-20240718   clang-18
x86_64                randconfig-016-20240718   gcc-11
x86_64                randconfig-071-20240718   clang-18
x86_64                randconfig-071-20240718   gcc-11
x86_64                randconfig-072-20240718   clang-18
x86_64                randconfig-072-20240718   gcc-11
x86_64                randconfig-073-20240718   clang-18
x86_64                randconfig-073-20240718   gcc-11
x86_64                randconfig-074-20240718   gcc-11
x86_64                randconfig-074-20240718   gcc-9
x86_64                randconfig-075-20240718   clang-18
x86_64                randconfig-075-20240718   gcc-11
x86_64                randconfig-076-20240718   clang-18
x86_64                randconfig-076-20240718   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240718   gcc-13.2.0
xtensa                randconfig-002-20240718   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

