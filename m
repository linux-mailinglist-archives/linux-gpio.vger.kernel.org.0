Return-Path: <linux-gpio+bounces-10810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF598FCFA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0C051F21FF4
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 05:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D6477F01;
	Fri,  4 Oct 2024 05:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MV3mavj7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484105336B
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 05:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728019390; cv=none; b=ZExyRdJQzEvTjbM0ehd2qQcCLGECq4aVrIy2sQZxa06g6ozusK/cabufnMEihXCo/d/zcLEj/nVL59UP9/0twhgmLP1rGUzz6SniZSRlTfRW4R/2nm6cE8KM6vcwAGHOiSx4hBpFe0JXqN4DrakG1nN+5iAteD3iTYK/0K4RtUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728019390; c=relaxed/simple;
	bh=8ARZaeAJ5PmR+h7uao7rUvYNCadcrudB1FyrAkS6wMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t58qngA08xAoVNi1Y5k7klKk87/W35Vg7s1YbTlvr22Wou11OO/ATPFgAAUzUITq6alNafax1rsztkEzcozDJz/cxSg6uB64AhFQzG4/9eqWuxRh539QsMtPhfhNwyTFwxBWpiD2BmNfPzPmWIMrEOFOIOe0TTMQlXHL6dxWW4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MV3mavj7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728019388; x=1759555388;
  h=date:from:to:cc:subject:message-id;
  bh=8ARZaeAJ5PmR+h7uao7rUvYNCadcrudB1FyrAkS6wMM=;
  b=MV3mavj7y37s+Vc9khFdZw0DATG8qJ7WVIzldNBSjaYGrhcuWQ/WWoGy
   lTixACRLv/ljwlF8qX8pmejL9z4p/tp2lF9wt1Bm1eIRWfCi7UOesL4DW
   jHebGASgsoh3UVsRDLalsyyZronDteHZrvtKM+PgyMSQqgGPBupwlOrbt
   vZorUoJhp+QYPEWDOOJYdEOd1qBa6cdAT9seOCcfk87Ox+/zkpin7JUb0
   k2Unddj6pMPBm0f2y2RyoL0dlU5h89RR4SCO9YXbVKJ65l2Iez+CTmyGB
   i7ghvKfjhWqcEFGRAHedKNuNSH7JHwKTSGCoduxBNAaNpImba57EuEiAn
   Q==;
X-CSE-ConnectionGUID: Ob4g9L1cTVCH/3JaJMnbBA==
X-CSE-MsgGUID: CZWdqbyeQU+m1HfBH/fWhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27363385"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27363385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 22:23:07 -0700
X-CSE-ConnectionGUID: SmHjpzqCRqSiccaZq+CmvA==
X-CSE-MsgGUID: Y4YCEUHZScSnoyL82HsiMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74904670"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 22:23:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swamN-0001GG-2B;
	Fri, 04 Oct 2024 05:23:03 +0000
Date: Fri, 04 Oct 2024 13:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 58414a31c5713afb5449fd74a26a843d34cc62e8
Message-ID: <202410041305.xA9G3gdh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 58414a31c5713afb5449fd74a26a843d34cc62e8  pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU

elapsed time: 800m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241004    gcc-14.1.0
arc                   randconfig-002-20241004    gcc-14.1.0
arm                              alldefconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          gemini_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                   randconfig-001-20241004    gcc-14.1.0
arm                   randconfig-002-20241004    gcc-14.1.0
arm                   randconfig-003-20241004    gcc-14.1.0
arm                   randconfig-004-20241004    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241004    gcc-14.1.0
arm64                 randconfig-002-20241004    gcc-14.1.0
arm64                 randconfig-003-20241004    gcc-14.1.0
arm64                 randconfig-004-20241004    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241004    gcc-14.1.0
csky                  randconfig-002-20241004    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241004    gcc-14.1.0
hexagon               randconfig-002-20241004    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241004    clang-18
i386        buildonly-randconfig-002-20241004    clang-18
i386        buildonly-randconfig-003-20241004    clang-18
i386        buildonly-randconfig-004-20241004    clang-18
i386        buildonly-randconfig-005-20241004    clang-18
i386        buildonly-randconfig-006-20241004    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241004    clang-18
i386                  randconfig-002-20241004    clang-18
i386                  randconfig-003-20241004    clang-18
i386                  randconfig-004-20241004    clang-18
i386                  randconfig-005-20241004    clang-18
i386                  randconfig-006-20241004    clang-18
i386                  randconfig-011-20241004    clang-18
i386                  randconfig-012-20241004    clang-18
i386                  randconfig-013-20241004    clang-18
i386                  randconfig-014-20241004    clang-18
i386                  randconfig-015-20241004    clang-18
i386                  randconfig-016-20241004    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241004    gcc-14.1.0
loongarch             randconfig-002-20241004    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           jazz_defconfig    clang-20
mips                    maltaup_xpa_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241004    gcc-14.1.0
nios2                 randconfig-002-20241004    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241004    gcc-14.1.0
parisc                randconfig-002-20241004    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc               randconfig-001-20241004    gcc-14.1.0
powerpc               randconfig-002-20241004    gcc-14.1.0
powerpc               randconfig-003-20241004    gcc-14.1.0
powerpc                     tqm8560_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241004    gcc-14.1.0
powerpc64             randconfig-002-20241004    gcc-14.1.0
powerpc64             randconfig-003-20241004    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241004    gcc-14.1.0
riscv                 randconfig-002-20241004    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241004    gcc-14.1.0
s390                  randconfig-002-20241004    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    clang-20
sh                    randconfig-001-20241004    gcc-14.1.0
sh                    randconfig-002-20241004    gcc-14.1.0
sh                          rsk7264_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                           se7751_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241004    gcc-14.1.0
sparc64               randconfig-002-20241004    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241004    gcc-14.1.0
um                    randconfig-002-20241004    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241004    clang-18
x86_64      buildonly-randconfig-002-20241004    clang-18
x86_64      buildonly-randconfig-003-20241004    clang-18
x86_64      buildonly-randconfig-004-20241004    clang-18
x86_64      buildonly-randconfig-005-20241004    clang-18
x86_64      buildonly-randconfig-006-20241004    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241004    clang-18
x86_64                randconfig-002-20241004    clang-18
x86_64                randconfig-003-20241004    clang-18
x86_64                randconfig-004-20241004    clang-18
x86_64                randconfig-005-20241004    clang-18
x86_64                randconfig-006-20241004    clang-18
x86_64                randconfig-011-20241004    clang-18
x86_64                randconfig-012-20241004    clang-18
x86_64                randconfig-013-20241004    clang-18
x86_64                randconfig-014-20241004    clang-18
x86_64                randconfig-015-20241004    clang-18
x86_64                randconfig-016-20241004    clang-18
x86_64                randconfig-071-20241004    clang-18
x86_64                randconfig-072-20241004    clang-18
x86_64                randconfig-073-20241004    clang-18
x86_64                randconfig-074-20241004    clang-18
x86_64                randconfig-075-20241004    clang-18
x86_64                randconfig-076-20241004    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241004    gcc-14.1.0
xtensa                randconfig-002-20241004    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

