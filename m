Return-Path: <linux-gpio+bounces-12546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C239BBEED
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 21:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106BD1F235B3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 20:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233931F5851;
	Mon,  4 Nov 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/RHHYud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF121CC159
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 20:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730752962; cv=none; b=pO/s657GvpE1fpGqwE7Bk+tdy5MLiRFkMBkCHG5tVTWI2A+WQ2hG7EuutbqxjUAf7ogftU6N5CPc7woz4m6tnmRqbH7837RTToB8yT9Zi078pVfzqnax8z0LnF8H2gDQO9Hx9ygiKuOmXYJIyp1EEpStSL9zr0fdqWoTI7fRpzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730752962; c=relaxed/simple;
	bh=54rIQ7DqEPiYg3BsqCAJKY1hcTBnqrt9BCIMSAWvEV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AyoXOpZ1BCQ63I5K0NKdpdQxGxMjcPjjeVOrR2x32JuXDUy0GjiNqlFsYdlugfL4vGJpxZ8VVXi2wyhKx5hnAkLJhjND1LEwzABUShh2JiUWpbglgqQb32w6DSxXxKoJ3T3dTzmAl5CUs+LA6WuJIZih8zdoeRe2+B/lPDkIMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/RHHYud; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730752961; x=1762288961;
  h=date:from:to:cc:subject:message-id;
  bh=54rIQ7DqEPiYg3BsqCAJKY1hcTBnqrt9BCIMSAWvEV8=;
  b=X/RHHYudSpeTS18f5RnVazU6FIQjQgtvGdrmYdL0ZjG6tJsVZBpUAxCr
   47MVTTX9JeW2uwBBXidr2G1w91DTP5sIIFibZDEgCKmG42vNBQV9UsaMX
   jtLjTQgQpfGYTlYlZM3SW3j9rQ1Y0VroSCo83bAshpQoKbNiTtTz2aYdB
   U+UfOswia1PAjlNZYigDhMSOg76MJYYOkYrvd3nWj+EpsjwHkfCEd6Jwt
   rwPP1gguCSLkMM9L5hw613b74HrfveryOowR094oGhejxRfXyorM436HX
   oVS7SW9g925lvqjV3cIIBFTcROD4eSMjiwGhDV3Y//Km2hMp2bQA0FHyS
   Q==;
X-CSE-ConnectionGUID: zUGRtosyRm6VLaY1aSkGiQ==
X-CSE-MsgGUID: XS/wLgcOQx62dAMeTBPz1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29898337"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="29898337"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 12:42:40 -0800
X-CSE-ConnectionGUID: rpIJ9YdISyScM/poAxgaOw==
X-CSE-MsgGUID: Q4C29zFjQiiLs+3Q2QAW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84109240"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 12:42:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t83uF-000lGf-1R;
	Mon, 04 Nov 2024 20:42:35 +0000
Date: Tue, 05 Nov 2024 04:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 50dded8d9d62b6291c91b43d4c73500b07fbd157
Message-ID: <202411050421.jdzDDuOz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 50dded8d9d62b6291c91b43d4c73500b07fbd157  gpio: altera: Drop legacy-of-mm-gpiochip.h header

elapsed time: 735m

configs tested: 156
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsim_700_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                     davinci_all_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-20
arm                       imx_v6_v7_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                        multi_v7_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                          pxa3xx_defconfig    clang-20
arm                         vf610m4_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241104    gcc-12
i386        buildonly-randconfig-002-20241104    gcc-12
i386        buildonly-randconfig-003-20241104    gcc-12
i386        buildonly-randconfig-004-20241104    gcc-12
i386        buildonly-randconfig-005-20241104    gcc-12
i386        buildonly-randconfig-006-20241104    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241104    gcc-12
i386                  randconfig-002-20241104    gcc-12
i386                  randconfig-003-20241104    gcc-12
i386                  randconfig-004-20241104    gcc-12
i386                  randconfig-005-20241104    gcc-12
i386                  randconfig-006-20241104    gcc-12
i386                  randconfig-011-20241104    gcc-12
i386                  randconfig-012-20241104    gcc-12
i386                  randconfig-013-20241104    gcc-12
i386                  randconfig-014-20241104    gcc-12
i386                  randconfig-015-20241104    gcc-12
i386                  randconfig-016-20241104    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-14.1.0
powerpc                    gamecube_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    gcc-14.1.0
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-20
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    gcc-14.1.0
sh                     magicpanelr2_defconfig    clang-20
sh                   sh7724_generic_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    clang-20
sh                              ul2_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                          alldefconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241104    gcc-12
x86_64      buildonly-randconfig-002-20241104    gcc-12
x86_64      buildonly-randconfig-003-20241104    gcc-12
x86_64      buildonly-randconfig-004-20241104    gcc-12
x86_64      buildonly-randconfig-005-20241104    gcc-12
x86_64      buildonly-randconfig-006-20241104    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241104    gcc-12
x86_64                randconfig-002-20241104    gcc-12
x86_64                randconfig-003-20241104    gcc-12
x86_64                randconfig-004-20241104    gcc-12
x86_64                randconfig-005-20241104    gcc-12
x86_64                randconfig-006-20241104    gcc-12
x86_64                randconfig-011-20241104    gcc-12
x86_64                randconfig-012-20241104    gcc-12
x86_64                randconfig-013-20241104    gcc-12
x86_64                randconfig-014-20241104    gcc-12
x86_64                randconfig-015-20241104    gcc-12
x86_64                randconfig-016-20241104    gcc-12
x86_64                randconfig-071-20241104    gcc-12
x86_64                randconfig-072-20241104    gcc-12
x86_64                randconfig-073-20241104    gcc-12
x86_64                randconfig-074-20241104    gcc-12
x86_64                randconfig-075-20241104    gcc-12
x86_64                randconfig-076-20241104    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

