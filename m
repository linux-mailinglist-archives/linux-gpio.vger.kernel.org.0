Return-Path: <linux-gpio+bounces-18634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6BA83D3B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3EAA466A9F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 08:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0BB20B804;
	Thu, 10 Apr 2025 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zu13ZQiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E2320B7F7
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274428; cv=none; b=WoXCDF+Scc7gCKS3y8gL54VDr4GBFWPjm5zOj5bM8iEgi8BUF0FP7r9T6JCZor8qQArowwMsmqxSCS9VvLh7Vp6kdV9PCbptg2ZITYYlbQ3BdcOhG9eXqmYLk+BaYCkLJ2DvlBotutVbB8HUEsLQmmQ73tnhxNB7FDhx881s4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274428; c=relaxed/simple;
	bh=vOSWBLv7JfcTP0yOzSTGqNEJ2c9UpUhhMXGy4A9Hh0Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qLCvLJqra5CRNSRYg7i7NgkmjjZAtVImGTqUibLj3k+zSa4USfXfDK7CjZdWlzKwzZ6rSHzXnigqQ4Vvys+boqJ+UkLXDCwUNdV9p2T46n9LlOpaLF00/yokiiRMOVs52WmxfFso3Emi5QY2TfXeyNNC/OTjMDrXqGqGhORr++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zu13ZQiB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744274426; x=1775810426;
  h=date:from:to:cc:subject:message-id;
  bh=vOSWBLv7JfcTP0yOzSTGqNEJ2c9UpUhhMXGy4A9Hh0Q=;
  b=Zu13ZQiBZhiTITk6vPtQrdW2mm1qLRs2lb8Kv24kuCwa7i9EMHXBvM9q
   cAs8ofyqhaSTQK5dtlI6hNL4cCbD5yU8Bds8dOezIKl7a2oiuT0tb1x/C
   tM4WhUJDAH9zDekckw2NYpZIdu0G2PhiPNxNvObTsUMrWaFvMfYSZAKGz
   3DU6cUj7QdLgXCaqK4fVL8QA901K0J1qiTzZweUkvqylf39iRetxROWXh
   xGZwXmqo6WpLGoGtM4ZinYZXRa4p09vLehb30kAy5wS3JJg2QR+0kUIls
   PbDdxHHpzMCl1l/LgKRW77wI2miYpw5Zm95GR2XxiDV8rg3xKDZxOeRpi
   Q==;
X-CSE-ConnectionGUID: uawR4aqQQn+gm8qafpb0EA==
X-CSE-MsgGUID: Xcmv7/s1SiCj7Ig2IHrsNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="63322807"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="63322807"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 01:40:25 -0700
X-CSE-ConnectionGUID: YEVx236/TyCSpWNd4iIsaQ==
X-CSE-MsgGUID: vp6qszRASge3Ce8Nl72J0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="132968220"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2025 01:40:24 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2nSQ-0009pj-0x;
	Thu, 10 Apr 2025 08:40:22 +0000
Date: Thu, 10 Apr 2025 16:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/gpiod-is-equal] BUILD SUCCESS
 265daffe788aa1cc5925d0afcde4fe6e99c66638
Message-ID: <202504101617.eMBUVu6N-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/gpiod-is-equal
branch HEAD: 265daffe788aa1cc5925d0afcde4fe6e99c66638  gpio: provide gpiod_is_equal()

elapsed time: 1462m

configs tested: 122
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250409    gcc-12.4.0
arc                   randconfig-002-20250409    gcc-10.5.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-19
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250409    gcc-7.5.0
arm                   randconfig-002-20250409    gcc-7.5.0
arm                   randconfig-003-20250409    gcc-7.5.0
arm                   randconfig-004-20250409    clang-14
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250409    clang-21
arm64                 randconfig-004-20250409    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250409    gcc-14.2.0
csky                  randconfig-002-20250409    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250409    clang-21
hexagon               randconfig-002-20250409    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250409    gcc-12
i386        buildonly-randconfig-002-20250409    clang-20
i386        buildonly-randconfig-003-20250409    gcc-11
i386        buildonly-randconfig-004-20250409    clang-20
i386        buildonly-randconfig-005-20250409    gcc-12
i386        buildonly-randconfig-006-20250409    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250409    gcc-14.2.0
loongarch             randconfig-002-20250409    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250409    gcc-10.5.0
nios2                 randconfig-002-20250409    gcc-8.5.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250409    gcc-13.3.0
parisc                randconfig-002-20250409    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                      chrp32_defconfig    clang-19
powerpc               randconfig-001-20250409    gcc-6.5.0
powerpc               randconfig-002-20250409    clang-21
powerpc               randconfig-003-20250409    clang-21
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250409    clang-21
powerpc64             randconfig-002-20250409    gcc-8.5.0
powerpc64             randconfig-003-20250409    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250409    clang-21
riscv                 randconfig-002-20250409    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250409    gcc-9.3.0
s390                  randconfig-002-20250409    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250409    gcc-12.4.0
sh                    randconfig-002-20250409    gcc-12.4.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250409    gcc-13.3.0
sparc                 randconfig-002-20250409    gcc-7.5.0
sparc64               randconfig-001-20250409    gcc-11.5.0
sparc64               randconfig-002-20250409    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250409    gcc-12
um                    randconfig-002-20250409    clang-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250409    clang-20
x86_64      buildonly-randconfig-002-20250409    gcc-12
x86_64      buildonly-randconfig-003-20250409    clang-20
x86_64      buildonly-randconfig-004-20250409    clang-20
x86_64      buildonly-randconfig-005-20250409    gcc-12
x86_64      buildonly-randconfig-006-20250409    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250409    gcc-11.5.0
xtensa                randconfig-002-20250409    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

