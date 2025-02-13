Return-Path: <linux-gpio+bounces-15901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6387A33CEC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 11:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D173A608A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 10:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3B72080D4;
	Thu, 13 Feb 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJvDjiyL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5145190477
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739443641; cv=none; b=ZDBX0EPBDqPDNKuCvMS6K6rbrEAItxSJfsyIIV8I0oGr2bsHPUSUwQ9MX6bRte6lQ19y9OHpS1ENxWUXq5Hi1dAZxI6/7Z4n3u6Rbf5Iajlvi0pPGp1M85qjXTOJp8XGkTtJvJ02Bco7XXEAzxZ/cCXFO3MGydWSVaa0kgc+mxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739443641; c=relaxed/simple;
	bh=IqFSOlhSK/xFLCTwcUnwZ1UAgx+cfboXuUgQNHC6kIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O2FRrnJHQoIfhTvRi69fwXrSXIdpMEN66VQhqUa3DfxzbA1XDINxxtA/HGXztKdXRjBQSlNfmcZWHuzIUTV2qwQljsn4hNwaEHhBNTzozn/0XQkzEKGh64vMPigEBH1BYKBI4nDs+dJVpmSFw1jYQRlvbVvAuYxFcha6l6hEUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJvDjiyL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739443639; x=1770979639;
  h=date:from:to:cc:subject:message-id;
  bh=IqFSOlhSK/xFLCTwcUnwZ1UAgx+cfboXuUgQNHC6kIo=;
  b=VJvDjiyLnkiIdWchA6QRl/vG4Y9rWttY1JJQ6Mx3J/tvxKveuUMDMc/z
   hK6t47OKLXK8gIA9pwRkslaNOir8Ghm8XuW3zQpv2H4jJ7RY+P125Jisx
   6UIWQ1MvBfNaD0Xa/PjRCbjiYkbD8d3Ef6A3Yw9TXRaBiReOPi4yYySoJ
   nHalNdUhuseL/tY5O+0mvMv9T7W1hoFFJ+0Z75YGG+OfA7zv3PN4VFggu
   FMKYh8VWiPQHqGHy9h10Ouv2KQMEip6gNGjvzMKsbkxTQLg5Ox/EeiBnH
   J1oDG3+i8SAH0ZduQP/tEtOquFb2Px/+ATzEsePPcMVc3nOHlA7x6sk4P
   A==;
X-CSE-ConnectionGUID: YCWBDkGMS6SnC9vcrNrUCQ==
X-CSE-MsgGUID: 4IgU4JodTPqmhCweUjW/fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62607521"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="62607521"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 02:47:18 -0800
X-CSE-ConnectionGUID: WCBHBXtmRFCW3xQ2E5s4jA==
X-CSE-MsgGUID: uLlMJy9PSW+cpxoBn7eClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113090087"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 02:47:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiWkU-0016vn-1p;
	Thu, 13 Feb 2025 10:47:14 +0000
Date: Thu, 13 Feb 2025 18:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 b9644fbfbcab13da7f8b37bef7c51e5b8407d031
Message-ID: <202502131851.fE5QNuo1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: b9644fbfbcab13da7f8b37bef7c51e5b8407d031  gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock

elapsed time: 1444m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                            hsdk_defconfig    gcc-13.2.0
arc                   randconfig-001-20250212    gcc-13.2.0
arc                   randconfig-002-20250212    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250212    clang-18
arm                   randconfig-002-20250212    clang-16
arm                   randconfig-003-20250212    clang-21
arm                   randconfig-004-20250212    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250212    gcc-14.2.0
arm64                 randconfig-002-20250212    gcc-14.2.0
arm64                 randconfig-003-20250212    clang-16
arm64                 randconfig-004-20250212    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250212    gcc-14.2.0
csky                  randconfig-002-20250212    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250212    clang-21
hexagon               randconfig-002-20250212    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250212    clang-19
i386        buildonly-randconfig-002-20250212    gcc-12
i386        buildonly-randconfig-003-20250212    gcc-12
i386        buildonly-randconfig-004-20250212    gcc-12
i386        buildonly-randconfig-005-20250212    gcc-12
i386        buildonly-randconfig-006-20250212    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250212    gcc-14.2.0
loongarch             randconfig-002-20250212    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250212    gcc-14.2.0
nios2                 randconfig-002-20250212    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250212    gcc-14.2.0
parisc                randconfig-002-20250212    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-19
powerpc               randconfig-001-20250212    gcc-14.2.0
powerpc               randconfig-002-20250212    clang-16
powerpc               randconfig-003-20250212    gcc-14.2.0
powerpc64             randconfig-001-20250212    clang-16
powerpc64             randconfig-002-20250212    gcc-14.2.0
powerpc64             randconfig-003-20250212    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250212    clang-21
riscv                 randconfig-002-20250212    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250212    clang-15
s390                  randconfig-002-20250212    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250212    gcc-14.2.0
sh                    randconfig-002-20250212    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250212    gcc-14.2.0
sparc                 randconfig-002-20250212    gcc-14.2.0
sparc64               randconfig-001-20250212    gcc-14.2.0
sparc64               randconfig-002-20250212    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250212    clang-16
um                    randconfig-002-20250212    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250212    gcc-11
x86_64      buildonly-randconfig-002-20250212    clang-19
x86_64      buildonly-randconfig-003-20250212    clang-19
x86_64      buildonly-randconfig-004-20250212    clang-19
x86_64      buildonly-randconfig-005-20250212    gcc-12
x86_64      buildonly-randconfig-006-20250212    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250212    gcc-14.2.0
xtensa                randconfig-002-20250212    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

