Return-Path: <linux-gpio+bounces-14326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 369169FD832
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 00:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B626F1883C93
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 23:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A7D1553B7;
	Fri, 27 Dec 2024 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EofuZYf3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8872312D758
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735340518; cv=none; b=CUsZjgRhmomcbT2MD4Os9nk4lVuxfSMEF5kvJM/1uQ8wgOPXh8YbNjXXFVhs7Fu1xxC4qY6ZjqeGMjObnTCNVch6MlBOtCHePtNRWhLyuIAdNRtgbyd7D5RYWw0blJF0cbhHWfMh0YEi9iWff0jlA++WLJtgy7PfjhEEB3dxnnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735340518; c=relaxed/simple;
	bh=ZC2Z0s9P/1GxvqlNiDzxl3hNOqrWOqzkBTrH+nCZd7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mq1JpNinZwyloZZsHLzLc2Aupi2NxfADkC6biIIPyZ/qEGWG0YL73Z9ocDQVgkM0oWwReG76hRoaAj+r/3ediw/Wyh+OSTaJfkMTuuiF1forWp8PCk1xN5dfrB5VNBJDWUNhzC/xuy8rOqwDoDqLNis9XnJtCW34PSf/igHB9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EofuZYf3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735340517; x=1766876517;
  h=date:from:to:cc:subject:message-id;
  bh=ZC2Z0s9P/1GxvqlNiDzxl3hNOqrWOqzkBTrH+nCZd7s=;
  b=EofuZYf39JxZ2s6qJJkDYmlI6/16Y7NlzXuzfBESjv75nYt2Tl9ySaih
   4DPRrIgUZNivmVIllz7Elca2+DluxXCbjE+NFu0Aar6ZjyZ25CrmAUnfL
   xTOq8pZQ4wZzLcMp3DAEe/RunxKSgVverB2ECX08httrfHX77p19+lHyW
   K7TFC+X5smKSOjbS9vmz9A3LXzXE/v762gKE/vfmbvHEe/0DMF62o+QGh
   donHhVUtbT7sysQitiEdPHgQeA5hrfoyw7xVvVqI8IqUnwwb/d/Y9ohgs
   o2jDQTp9Vm0ddEdReZzezHg00K6whkQB5fd8DtlF+A8EPMi0jEgko9fxO
   w==;
X-CSE-ConnectionGUID: qF9FSy1tTt2nGzoMldqwXA==
X-CSE-MsgGUID: yk0RuDfGQzag91rXg5Kqpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53134983"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="53134983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 15:01:56 -0800
X-CSE-ConnectionGUID: 95J+flcAR7OVJb4te6jDCg==
X-CSE-MsgGUID: tshH7KRkRpe6LwDIG0VAEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105262169"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2024 15:01:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRJL6-0003hs-2F;
	Fri, 27 Dec 2024 23:01:52 +0000
Date: Sat, 28 Dec 2024 07:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 870a6b26f6aba2350aa74fc13fc792646e089a28
Message-ID: <202412280702.MmZ5nk7R-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 870a6b26f6aba2350aa74fc13fc792646e089a28  Merge branch 'devel' into for-next

elapsed time: 850m

configs tested: 193
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241227    gcc-13.2.0
arc                   randconfig-002-20241227    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-20
arm                                 defconfig    clang-20
arm                          pxa3xx_defconfig    clang-20
arm                   randconfig-001-20241227    gcc-14.2.0
arm                   randconfig-002-20241227    gcc-14.2.0
arm                   randconfig-003-20241227    clang-18
arm                   randconfig-004-20241227    clang-16
arm                          sp7021_defconfig    gcc-14.2.0
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241227    clang-16
arm64                 randconfig-002-20241227    clang-18
arm64                 randconfig-003-20241227    gcc-14.2.0
arm64                 randconfig-004-20241227    clang-18
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241227    gcc-14.2.0
csky                  randconfig-002-20241227    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241227    clang-19
hexagon               randconfig-002-20241227    clang-17
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241227    gcc-12
i386        buildonly-randconfig-002-20241227    gcc-12
i386        buildonly-randconfig-003-20241227    gcc-11
i386        buildonly-randconfig-004-20241227    gcc-12
i386        buildonly-randconfig-005-20241227    gcc-12
i386        buildonly-randconfig-006-20241227    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241228    clang-19
i386                  randconfig-002-20241228    clang-19
i386                  randconfig-003-20241228    clang-19
i386                  randconfig-004-20241228    clang-19
i386                  randconfig-005-20241228    clang-19
i386                  randconfig-006-20241228    clang-19
i386                  randconfig-007-20241228    clang-19
i386                  randconfig-011-20241228    clang-19
i386                  randconfig-012-20241228    clang-19
i386                  randconfig-013-20241228    clang-19
i386                  randconfig-014-20241228    clang-19
i386                  randconfig-015-20241228    clang-19
i386                  randconfig-016-20241228    clang-19
i386                  randconfig-017-20241228    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241227    gcc-14.2.0
loongarch             randconfig-002-20241227    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241227    gcc-14.2.0
nios2                 randconfig-002-20241227    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241227    gcc-14.2.0
parisc                randconfig-002-20241227    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      bamboo_defconfig    clang-20
powerpc                        icon_defconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                     mpc5200_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                 mpc837x_rdb_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc               randconfig-001-20241227    gcc-14.2.0
powerpc               randconfig-002-20241227    gcc-14.2.0
powerpc               randconfig-003-20241227    clang-20
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241227    gcc-14.2.0
powerpc64             randconfig-002-20241227    gcc-14.2.0
powerpc64             randconfig-003-20241227    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241227    gcc-14.2.0
riscv                 randconfig-001-20241228    clang-20
riscv                 randconfig-002-20241227    clang-18
riscv                 randconfig-002-20241228    clang-20
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241227    gcc-14.2.0
s390                  randconfig-001-20241228    clang-20
s390                  randconfig-002-20241227    gcc-14.2.0
s390                  randconfig-002-20241228    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241227    gcc-14.2.0
sh                    randconfig-001-20241228    clang-20
sh                    randconfig-002-20241227    gcc-14.2.0
sh                    randconfig-002-20241228    clang-20
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    clang-20
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241227    gcc-14.2.0
sparc                 randconfig-001-20241228    clang-20
sparc                 randconfig-002-20241227    gcc-14.2.0
sparc                 randconfig-002-20241228    clang-20
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241227    gcc-14.2.0
sparc64               randconfig-001-20241228    clang-20
sparc64               randconfig-002-20241227    gcc-14.2.0
sparc64               randconfig-002-20241228    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241227    clang-16
um                    randconfig-001-20241228    clang-20
um                    randconfig-002-20241227    gcc-12
um                    randconfig-002-20241228    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241227    gcc-12
x86_64      buildonly-randconfig-002-20241227    clang-19
x86_64      buildonly-randconfig-003-20241227    gcc-12
x86_64      buildonly-randconfig-004-20241227    clang-19
x86_64      buildonly-randconfig-005-20241227    gcc-12
x86_64      buildonly-randconfig-006-20241227    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241228    clang-19
x86_64                randconfig-002-20241228    clang-19
x86_64                randconfig-003-20241228    clang-19
x86_64                randconfig-004-20241228    clang-19
x86_64                randconfig-005-20241228    clang-19
x86_64                randconfig-006-20241228    clang-19
x86_64                randconfig-007-20241228    clang-19
x86_64                randconfig-008-20241228    clang-19
x86_64                randconfig-071-20241228    gcc-11
x86_64                randconfig-072-20241228    gcc-11
x86_64                randconfig-073-20241228    gcc-11
x86_64                randconfig-074-20241228    gcc-11
x86_64                randconfig-075-20241228    gcc-11
x86_64                randconfig-076-20241228    gcc-11
x86_64                randconfig-077-20241228    gcc-11
x86_64                randconfig-078-20241228    gcc-11
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241227    gcc-14.2.0
xtensa                randconfig-001-20241228    clang-20
xtensa                randconfig-002-20241227    gcc-14.2.0
xtensa                randconfig-002-20241228    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

