Return-Path: <linux-gpio+bounces-5799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9098B0149
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 07:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86A8DB23709
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Apr 2024 05:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1411C15689D;
	Wed, 24 Apr 2024 05:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMkFy1IN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABCA156891
	for <linux-gpio@vger.kernel.org>; Wed, 24 Apr 2024 05:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713937621; cv=none; b=C8vdm994dXh9Iwn8Xz/yCuKtH1QGxPzFFYehv5rt4l2h7wicidg6GW+EACspvIoU/bqWDhTPta18AZkGJuhOHoHJbztYDDnpbnzSwA7VIvcrG9ttf5ckdJKCIdkfXpBB2WfbEelE1MhOpfkC9BFZ/Mw9pP87aJStFIQ2HJDDw3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713937621; c=relaxed/simple;
	bh=GuIaj2WLeyKFaPz/FVwW2RI4Gmv3d11JIanGWRDK8Ps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bPvMm3v6cdEInfcT+qTqy3Ut6jtEv5l9oyruTeeZvbPwiJoa2ZIm81iU8jP2QPfR4rTVTBAsv/jzxidXCF+mfoHxdZgQWqnjuo3XwxOMT/VyrZnaesfaRna8nStiNpXbahbZw76fjnN7xFBayJoH8ErsUswDRiVmxvYpvYTqY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMkFy1IN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713937620; x=1745473620;
  h=date:from:to:cc:subject:message-id;
  bh=GuIaj2WLeyKFaPz/FVwW2RI4Gmv3d11JIanGWRDK8Ps=;
  b=bMkFy1IN3aYsuT6oze4pRVi+mAwraAIZQ7rlSNc5yyYuu+knv8KAxVbK
   5giZU/zOqcLxOHJNMnXAXCLw30Yz/zrMbG/2Q50xX0wEGQMnF8KXtJ+zq
   nIsYVmRtaD7FOHCWWA64l7514zcHeGvfxoy9uqQ+9kszv7lWl8ag6iPZG
   0vf2GoAgrwtynPoU8LB12/DiskipjAHPmOO1odsLZMeqpgYSudn3vM9aa
   OOMDYSPyZs4vnVw046DG2JU2V1hnFFhq3foHjEthciFIOUIo4KxWaEE7p
   bRx0MiO0fmaRdEfkEYAZVFEDp4wmBiR6e0DeX84XjU+vaqevJKEEzGIB0
   Q==;
X-CSE-ConnectionGUID: dOWoXw5UTLCgaq1Q39dfqQ==
X-CSE-MsgGUID: OQOxyi8pRcKBqOo5m2xx6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27064543"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27064543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 22:46:59 -0700
X-CSE-ConnectionGUID: tmmRP6QIQ3O+HR0D3xPdXg==
X-CSE-MsgGUID: EDTm5KczTNeQnkJ8gN90sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="24631877"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2024 22:46:58 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzVT6-0000uG-0n;
	Wed, 24 Apr 2024 05:46:56 +0000
Date: Wed, 24 Apr 2024 13:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/gpio-leds] BUILD SUCCESS
 cdd5a14fcaea5ff9649fcf830212324f814195a1
Message-ID: <202404241329.PwBeZ1xl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/gpio-leds
branch HEAD: cdd5a14fcaea5ff9649fcf830212324f814195a1  ARM: orion5x: Convert TS409 board to GPIO descriptors for LEDs

elapsed time: 945m

configs tested: 119
configs skipped: 124

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240424   gcc  
arc                   randconfig-002-20240424   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          gemini_defconfig   clang
arm                       imx_v6_v7_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240424   gcc  
arm                   randconfig-002-20240424   gcc  
arm                   randconfig-003-20240424   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240424   gcc  
arm64                 randconfig-003-20240424   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240424   gcc  
csky                  randconfig-002-20240424   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                  randconfig-004-20240424   clang
i386                  randconfig-011-20240424   clang
i386                  randconfig-013-20240424   clang
i386                  randconfig-014-20240424   clang
i386                  randconfig-015-20240424   clang
i386                  randconfig-016-20240424   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240424   gcc  
loongarch             randconfig-002-20240424   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                          malta_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240424   gcc  
nios2                 randconfig-002-20240424   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240424   gcc  
parisc                randconfig-002-20240424   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                       holly_defconfig   clang
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-002-20240424   gcc  
powerpc               randconfig-003-20240424   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240424   gcc  
powerpc64             randconfig-002-20240424   gcc  
powerpc64             randconfig-003-20240424   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                 randconfig-001-20240424   gcc  
s390                  randconfig-001-20240424   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240424   gcc  
sh                    randconfig-002-20240424   gcc  
sh                           se7705_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240424   gcc  
sparc64               randconfig-002-20240424   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240424   gcc  
x86_64       buildonly-randconfig-001-20240424   clang
x86_64       buildonly-randconfig-002-20240424   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                randconfig-001-20240424   clang
x86_64                randconfig-002-20240424   clang
x86_64                randconfig-005-20240424   clang
x86_64                randconfig-006-20240424   clang
x86_64                randconfig-011-20240424   clang
x86_64                randconfig-015-20240424   clang
x86_64                randconfig-071-20240424   clang
x86_64                randconfig-072-20240424   clang
x86_64                randconfig-074-20240424   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240424   gcc  
xtensa                randconfig-002-20240424   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

