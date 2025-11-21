Return-Path: <linux-gpio+bounces-28934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30EC76D68
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 02:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95CC24E2104
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 01:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE791E5B63;
	Fri, 21 Nov 2025 01:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwDaBGOD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E41C84C0
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763687210; cv=none; b=D/AHCOLvW/3fwx5cIBvlWUackPH78KtN6T9zUDNvfI/0yzNZFTkjdkFty16bloACu1o5qFdU9bAAhGQEal5V1XmknZJBQw///NQuadCEO5QvBUk538RQQAtvaW24YfNbM0PvjJgTnj5+jT/HIjz3N3ZaJ61ETQXLwm/TYxzpRM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763687210; c=relaxed/simple;
	bh=8uwUaY96jfQJySdUw2i2svP4RIHulcQ295DnVru4l7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NRzhmoqqlIkoYfMd9eQ5IzoiNhjYDneEZvsFHiyfbjMepoeo6sI1vhFY8lkRTnRqC1rNbAsfqFMVMoGK+5b547oQZaDkHWdZZaJgG412AGHIVZVYKhQL2+fIy5twGEI/5DUZ4ioSYlmv/88wKhUBAs6aIwhePyYiQWm4pUfn19I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwDaBGOD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763687208; x=1795223208;
  h=date:from:to:cc:subject:message-id;
  bh=8uwUaY96jfQJySdUw2i2svP4RIHulcQ295DnVru4l7M=;
  b=TwDaBGODxKBrr2GagFkIcHEWsOUefAG9kRVyVdfMkShr9/CY3u4rkBFp
   SHZzP0DXeQrE/sI///ooYY0l/FQcICS5DQMImribv6SkAapFd+xal/pV5
   sZYc9hKqAKED4VbeR5mkzzGkdRYHp+/Sh5+fTk9TqoraV3qk4OZH189On
   FCZ6p4uxGIQJMjF4WNw75oswOEYtle6/DHhZ2AjJX2CcoVFeHiSI1OUFv
   WquojT5NhaYgU6d6J6buWrRxwfG5Sqys9gpMAQ/ujPhEoMOgoQcP81oTm
   b0/qZOpAVzc57G/V2HHm6sZ77icDdDPgm+yp9ydGDVww6a5ifrXbtmJR9
   g==;
X-CSE-ConnectionGUID: vfI1uw5iRLGBJzhqiOPTYg==
X-CSE-MsgGUID: yZh/RXN8Tq+P9zZN/FdBgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69390166"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69390166"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 17:06:47 -0800
X-CSE-ConnectionGUID: kMcJ9CE6TEyt0LAPH3Cdgw==
X-CSE-MsgGUID: 9/EyYAKbTR+rgvau4GrZ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="196014582"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2025 17:06:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMFbo-0004nf-0r;
	Fri, 21 Nov 2025 01:06:44 +0000
Date: Fri, 21 Nov 2025 09:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 6010d4d8b55b5d3ae1efb5502c54312e15c14f21
Message-ID: <202511210945.sE8FuMkE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 6010d4d8b55b5d3ae1efb5502c54312e15c14f21  pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()

elapsed time: 2936m

configs tested: 89
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251119    gcc-10.5.0
arc                   randconfig-002-20251119    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20251119    gcc-8.5.0
arm                   randconfig-002-20251119    clang-16
arm                   randconfig-003-20251119    clang-22
arm                   randconfig-004-20251119    gcc-13.4.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251119    clang-22
arm64                 randconfig-002-20251119    gcc-8.5.0
arm64                 randconfig-003-20251119    clang-22
arm64                 randconfig-004-20251119    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251119    gcc-15.1.0
csky                  randconfig-002-20251119    gcc-10.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251120    clang-22
hexagon               randconfig-002-20251120    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251119    gcc-14
i386        buildonly-randconfig-002-20251119    clang-20
i386        buildonly-randconfig-003-20251119    clang-20
i386        buildonly-randconfig-004-20251119    clang-20
i386        buildonly-randconfig-005-20251119    gcc-14
i386        buildonly-randconfig-006-20251119    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-011-20251119    clang-20
i386                  randconfig-012-20251119    clang-20
i386                  randconfig-013-20251119    clang-20
i386                  randconfig-014-20251119    gcc-14
i386                  randconfig-015-20251119    gcc-14
i386                  randconfig-016-20251119    clang-20
i386                  randconfig-017-20251119    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    clang-22
powerpc                      tqm8xx_defconfig    clang-19
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251119    gcc-15.1.0
riscv                 randconfig-002-20251119    gcc-10.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251119    gcc-8.5.0
s390                  randconfig-002-20251119    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20251119    gcc-11.5.0
sh                    randconfig-002-20251119    gcc-9.5.0
sh                           sh2007_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251120    gcc-8.5.0
sparc                 randconfig-002-20251120    gcc-8.5.0
sparc64               randconfig-001-20251120    clang-20
sparc64               randconfig-002-20251120    clang-22
um                                allnoconfig    clang-22
um                    randconfig-001-20251120    gcc-14
um                    randconfig-002-20251120    clang-22
x86_64                            allnoconfig    clang-20
x86_64                randconfig-001-20251120    gcc-14
x86_64                randconfig-002-20251120    clang-20
x86_64                randconfig-003-20251120    clang-20
x86_64                randconfig-004-20251120    gcc-14
x86_64                randconfig-005-20251120    gcc-12
x86_64                randconfig-006-20251120    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251120    gcc-15.1.0
xtensa                randconfig-002-20251120    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

