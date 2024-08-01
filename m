Return-Path: <linux-gpio+bounces-8510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970EE94468D
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 10:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9F961C2275C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 08:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB8B16DC20;
	Thu,  1 Aug 2024 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gxk4r4/o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B312E1D9
	for <linux-gpio@vger.kernel.org>; Thu,  1 Aug 2024 08:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500788; cv=none; b=nN2uljXIax/U+UETUocpA4TcAzkw7cmREaMKruyRBu8UpOatqNIs4pPadRGjCHRkQaH70bhmPOhPtkZhnHHery8Z+aG9k7Hv233bfnl13NoUzN5pqQX/P4eh5ZzYmjLDiTa06z7zpMBBhj8bhlg2w+veP4/dWsUYOwDnc8xB668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500788; c=relaxed/simple;
	bh=ZKmkHdX6PYhGEDHLJ0QhU8FZfKpqT0eeLalDD0QJqAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QKJuHojS8qPAADPsvSBwMalpdgk7B1spdBK5FFfagDZzYSLgI7vagP0krQVM11DtVWajtxyPI7uDW8VUTfLbU3geEOfHMz1F0V5yQdonqjfZoUKc0virNjPMGavM5ZapbHgn3QgmIJnnabytzeilXMRl7eOOFU167LLyqIcjNes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gxk4r4/o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722500786; x=1754036786;
  h=date:from:to:cc:subject:message-id;
  bh=ZKmkHdX6PYhGEDHLJ0QhU8FZfKpqT0eeLalDD0QJqAc=;
  b=Gxk4r4/oQsSsy34yVy5UbWAl5J3nkGMb41KoHpJ8ZgoxOgWEkzCrPt8X
   1/+iSfkNGR8xtPTJndehguHDqY31anYF3DRhS3nbiY0TmxCsKDNayL66Q
   f/oxab1i4PbznxQrIm5lB0iTJBnYjGUP79jFCxsEJ2Z9z7IBSYrvQKTHI
   UmUxhN1+OkGwavMvNYfC8/K7zlKRTXwKS79DkjYiAngU0e8KI4FatqLXy
   WeHL5ebSMnJ8Xoq38JOiAPyKoi2M4BuPL/31bZIOfGP5lq8+Mx53T+nNo
   M6WgysSFB7/CJdIX7fkKfn222lvkY88AM1fsThhuAd26QuqEyM33DEHDW
   g==;
X-CSE-ConnectionGUID: 6sPYxTb2Sjm0zCO10gk+Ug==
X-CSE-MsgGUID: mVJbkv6xR1iUj5VAzA35Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="42960496"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="42960496"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 01:26:25 -0700
X-CSE-ConnectionGUID: SAer0L3jQqONrEy7wPcaTA==
X-CSE-MsgGUID: bZtmVqB5RnKLAhGY9FGsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="78264968"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Aug 2024 01:26:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZR8f-000vNR-13;
	Thu, 01 Aug 2024 08:26:21 +0000
Date: Thu, 01 Aug 2024 16:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 ac93ca125b5409df56c5139648bbe10fd1ea989b
Message-ID: <202408011647.wcVMOJ0v-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: ac93ca125b5409df56c5139648bbe10fd1ea989b  tools: gpio: Fix the wrong format specifier

elapsed time: 1462m

configs tested: 228
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240801   gcc-13.2.0
arc                   randconfig-002-20240801   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-14.1.0
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240801   gcc-13.2.0
arm                   randconfig-002-20240801   gcc-13.2.0
arm                   randconfig-003-20240801   gcc-13.2.0
arm                   randconfig-004-20240801   gcc-13.2.0
arm                          sp7021_defconfig   clang-20
arm                          sp7021_defconfig   gcc-13.2.0
arm                        spear3xx_defconfig   clang-16
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240801   gcc-13.2.0
arm64                 randconfig-002-20240801   gcc-13.2.0
arm64                 randconfig-003-20240801   gcc-13.2.0
arm64                 randconfig-004-20240801   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240801   gcc-13.2.0
csky                  randconfig-002-20240801   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-001-20240801   gcc-9
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-002-20240801   gcc-9
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-003-20240801   gcc-9
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-004-20240801   gcc-9
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-005-20240801   gcc-9
i386         buildonly-randconfig-006-20240731   clang-18
i386         buildonly-randconfig-006-20240801   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-001-20240801   gcc-9
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-002-20240801   gcc-9
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-003-20240801   gcc-9
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-004-20240801   gcc-9
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-005-20240801   gcc-9
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-006-20240801   gcc-9
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-011-20240801   gcc-9
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-012-20240801   gcc-9
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-013-20240801   gcc-9
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-014-20240801   gcc-9
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-015-20240801   gcc-9
i386                  randconfig-016-20240731   clang-18
i386                  randconfig-016-20240801   gcc-9
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240801   gcc-13.2.0
loongarch             randconfig-002-20240801   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                          atari_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        bcm47xx_defconfig   clang-16
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-14.1.0
mips                     loongson1b_defconfig   clang-16
mips                     loongson1c_defconfig   clang-20
mips                          malta_defconfig   clang-20
mips                        maltaup_defconfig   gcc-14.1.0
mips                           mtx1_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240801   gcc-13.2.0
nios2                 randconfig-002-20240801   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240801   gcc-13.2.0
parisc                randconfig-002-20240801   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                       holly_defconfig   gcc-13.2.0
powerpc                  iss476-smp_defconfig   clang-20
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig   clang-16
powerpc                  mpc866_ads_defconfig   clang-16
powerpc                      pcm030_defconfig   clang-16
powerpc                      pcm030_defconfig   gcc-14.1.0
powerpc                         ps3_defconfig   clang-16
powerpc               randconfig-001-20240801   gcc-13.2.0
powerpc               randconfig-002-20240801   gcc-13.2.0
powerpc               randconfig-003-20240801   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                  storcenter_defconfig   clang-16
powerpc                  storcenter_defconfig   clang-20
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8548_defconfig   clang-20
powerpc                         wii_defconfig   clang-16
powerpc64             randconfig-001-20240801   gcc-13.2.0
powerpc64             randconfig-002-20240801   gcc-13.2.0
powerpc64             randconfig-003-20240801   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-16
riscv                    nommu_virt_defconfig   clang-16
riscv                 randconfig-001-20240801   gcc-13.2.0
riscv                 randconfig-002-20240801   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240801   gcc-13.2.0
s390                  randconfig-002-20240801   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                    randconfig-001-20240801   gcc-13.2.0
sh                    randconfig-002-20240801   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                           se7751_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240801   gcc-13.2.0
sparc64               randconfig-002-20240801   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240801   gcc-13.2.0
um                    randconfig-002-20240801   gcc-13.2.0
um                           x86_64_defconfig   clang-20
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240801   clang-18
x86_64       buildonly-randconfig-002-20240801   clang-18
x86_64       buildonly-randconfig-003-20240801   clang-18
x86_64       buildonly-randconfig-004-20240801   clang-18
x86_64       buildonly-randconfig-005-20240801   clang-18
x86_64       buildonly-randconfig-006-20240801   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240801   clang-18
x86_64                randconfig-002-20240801   clang-18
x86_64                randconfig-003-20240801   clang-18
x86_64                randconfig-004-20240801   clang-18
x86_64                randconfig-005-20240801   clang-18
x86_64                randconfig-006-20240801   clang-18
x86_64                randconfig-011-20240801   clang-18
x86_64                randconfig-012-20240801   clang-18
x86_64                randconfig-013-20240801   clang-18
x86_64                randconfig-014-20240801   clang-18
x86_64                randconfig-015-20240801   clang-18
x86_64                randconfig-016-20240801   clang-18
x86_64                randconfig-071-20240801   clang-18
x86_64                randconfig-072-20240801   clang-18
x86_64                randconfig-073-20240801   clang-18
x86_64                randconfig-074-20240801   clang-18
x86_64                randconfig-075-20240801   clang-18
x86_64                randconfig-076-20240801   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                           alldefconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240801   gcc-13.2.0
xtensa                randconfig-002-20240801   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

