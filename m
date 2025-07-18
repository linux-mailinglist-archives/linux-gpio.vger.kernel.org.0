Return-Path: <linux-gpio+bounces-23453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A61FB09D55
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E9C83B03D0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB172192E5;
	Fri, 18 Jul 2025 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJmO0RQN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7DD1D7E42
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825820; cv=none; b=QMcePgeEtJ4OlfU7Vj2i7LCDkffyt2rXaagkdZ9U1BbcGf3rsY8XD0UkWgeCg4Lm7XnRlMUfmY0P6tiFL4lceZsOx8TjhjLj6IzqiB8zi21vLoOEorU6GOW3LeIs6F/03PNuGoSpYA1UOjoo6zKi23oz3y0uXe1ARIfmfRnkCdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825820; c=relaxed/simple;
	bh=TMotjGGxGQ2/nKXUuDjgmfI7+w6vSeAFtfhyJGDz5qI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H/a+IGQDdT32pPl5yqUmTUgS+jvn7z/7SNhUURxBNW+Q2STQUGxvHryFeA7HLTmA2k5gZwqraFATzkoUiPPfu0uGQ3vOeGp0FAKt8UavmEeCYh66pJB1T8UZoVsQCrLtxrg8lh0siXApNUm2IqfjW8+nmukzbffvPEqPh1fis2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJmO0RQN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752825818; x=1784361818;
  h=date:from:to:cc:subject:message-id;
  bh=TMotjGGxGQ2/nKXUuDjgmfI7+w6vSeAFtfhyJGDz5qI=;
  b=jJmO0RQNgmjf385Mc3uAYUPSU1V5fHll7pRzHwTNDa3BTlXI17J3vTPr
   Mmf/A5p92KlMHVNCYsvEJbGfCpkt01njWNquCX9z+c8w43r2biADa39eW
   2jjCLueP+GRvzs4XPe7bh+Ed+hiDlwNmm9R+8IA9SlasvEFi9p+eKjmuz
   t1HG2BP62j98se+uVDDHov384R48x+dKHzxiJTI+03pr+5UcNPjltVLJK
   pNEiIZh21Yga5XTv8o2CSKXpzxuXX5VAuw0z6IswMGq6euVQAknBTiudS
   zw2kJMs7RGnPOx90YUjdMVYk++PlvC59V7KibmpEfyE3fAJLd3Lfr/Z4x
   A==;
X-CSE-ConnectionGUID: ddgd0lu3SVSLKWXgXI1qfA==
X-CSE-MsgGUID: bqVwhGWoTdCE5CUa7Y/8yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72566602"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="72566602"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:03:37 -0700
X-CSE-ConnectionGUID: dVMY08u5Qmei4+XMYDTGSA==
X-CSE-MsgGUID: Ia6pZO/FReuuqYrtnbUBcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="162307606"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2025 01:03:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucg45-000EQN-2r;
	Fri, 18 Jul 2025 08:03:33 +0000
Date: Fri, 18 Jul 2025 16:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 11ff5e06e02326a7c87aaa73dbffaed94918261d
Message-ID: <202507181655.1UDYIF0V-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 11ff5e06e02326a7c87aaa73dbffaed94918261d  gpiolib: devres: release GPIOs in devm_gpiod_put_array()

elapsed time: 1451m

configs tested: 132
configs skipped: 3

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
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250717    gcc-8.5.0
arc                   randconfig-002-20250717    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                                 defconfig    clang-21
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250717    clang-21
arm                   randconfig-002-20250717    gcc-8.5.0
arm                   randconfig-003-20250717    gcc-8.5.0
arm                   randconfig-004-20250717    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250717    clang-18
arm64                 randconfig-002-20250717    clang-18
arm64                 randconfig-003-20250717    gcc-10.5.0
arm64                 randconfig-004-20250717    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250717    gcc-15.1.0
csky                  randconfig-002-20250717    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250717    clang-20
hexagon               randconfig-002-20250717    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250717    gcc-12
i386        buildonly-randconfig-002-20250717    gcc-12
i386        buildonly-randconfig-003-20250717    clang-20
i386        buildonly-randconfig-004-20250717    clang-20
i386        buildonly-randconfig-005-20250717    clang-20
i386        buildonly-randconfig-006-20250717    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250717    gcc-15.1.0
loongarch             randconfig-002-20250717    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250717    gcc-8.5.0
nios2                 randconfig-002-20250717    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250717    gcc-9.3.0
parisc                randconfig-002-20250717    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    clang-21
powerpc                      ppc44x_defconfig    clang-21
powerpc               randconfig-001-20250717    clang-21
powerpc               randconfig-002-20250717    gcc-13.4.0
powerpc               randconfig-003-20250717    clang-21
powerpc64             randconfig-001-20250717    clang-21
powerpc64             randconfig-002-20250717    clang-18
powerpc64             randconfig-003-20250717    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250717    gcc-14.3.0
riscv                 randconfig-002-20250717    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250717    gcc-8.5.0
s390                  randconfig-002-20250717    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250717    gcc-14.3.0
sh                    randconfig-002-20250717    gcc-9.3.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250717    gcc-14.3.0
sparc                 randconfig-002-20250717    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250717    gcc-12.4.0
sparc64               randconfig-002-20250717    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250717    gcc-12
um                    randconfig-002-20250717    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250717    clang-20
x86_64      buildonly-randconfig-002-20250717    clang-20
x86_64      buildonly-randconfig-003-20250717    clang-20
x86_64      buildonly-randconfig-004-20250717    gcc-12
x86_64      buildonly-randconfig-005-20250717    gcc-12
x86_64      buildonly-randconfig-006-20250717    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250717    gcc-13.4.0
xtensa                randconfig-002-20250717    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

