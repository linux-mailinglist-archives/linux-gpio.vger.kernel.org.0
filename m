Return-Path: <linux-gpio+bounces-19052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15EA934A6
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 10:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96BEC8A53B0
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 08:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BD926B2D2;
	Fri, 18 Apr 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/OfDFtz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6944253B50
	for <linux-gpio@vger.kernel.org>; Fri, 18 Apr 2025 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965006; cv=none; b=OWj8w5jy45TWv6hVmJ/n/6jA7c7Vfh5PyD3v7EY6dzxC4TzWWA/GIuROoKZ8fx8irAUyK2Ch6DxWdBup7NMxzSehx2V6o1M66hFzZKkmH5jc/JSpcftn+tbi+94rmHmO99uqCrbkZiadbnvNtyQnCsP9Xb6VpFA7ixllYWV1/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965006; c=relaxed/simple;
	bh=bliSPvF6F945Kvt0XzyfM3xAQOBrwaQ6f3NZNpKUzLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XHRhuzdmqFSNQvUUe2ZCZbpYYY6bmrKQj+FyAF7IM9LEbRv8N6jjiTiY2IypBeMtnE3c3vO45QWq0U+DQb/i+mkvNNMGBKQSo1gSw+lIWLgjHw9VBfSPAZrB2TE5jzYMpShL5xa3mP4Ud/t9lwauNtT/w726TTbrss/LcW/XxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/OfDFtz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744965005; x=1776501005;
  h=date:from:to:cc:subject:message-id;
  bh=bliSPvF6F945Kvt0XzyfM3xAQOBrwaQ6f3NZNpKUzLI=;
  b=n/OfDFtzumsPqj3L3Q3g8d+mJhW/xPznfD2V5CrOBlUm4/hGCVsLAOwP
   RIiS1QLm4/4y1TctNrIcOiYkG8qaENcnQSg13HivFFep33RUL+hLZYq9Q
   2Y4eEb4tSfUrJAvzLV97YGyXrf1rb4ON9wBPkCfIzgY9Xw22QdWw2a/Iz
   EJ31a8ZtcSKD6czKYcnW1KVDS2GKZ4Rw5aONvGUT3LgNhQbVPnvo86ML2
   cCcRUUFCVqJJr9tB8rXpXS9drdKCEg4qgJycyeYGp1N2m1lWbk7h6JzTs
   +eS60enqjdhCYstp9QnQiI6y3GocBhfmMXB8KTdWuDm8B7U/ISK8i86M8
   A==;
X-CSE-ConnectionGUID: m4BtrMpkQDemcAhyLxQmGg==
X-CSE-MsgGUID: nYi5iaYpToSEG77mpkzeMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="63996229"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="63996229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 01:30:04 -0700
X-CSE-ConnectionGUID: eZYm5sIkRvSFfGEvbcvgOw==
X-CSE-MsgGUID: 0n1Y64ySRn2maiJSdz+MIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="131613766"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Apr 2025 01:30:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5h6n-0002gB-09;
	Fri, 18 Apr 2025 08:30:01 +0000
Date: Fri, 18 Apr 2025 16:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/abx500-pinctrl] BUILD REGRESSION
 4fff328b120e7e541076abb58810bb845722e6d0
Message-ID: <202504181625.CUSRSZVX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/abx500-pinctrl
branch HEAD: 4fff328b120e7e541076abb58810bb845722e6d0  pinctr: nomadik: abx500: Restrict compile test

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202504180045.r5xtbS4v-lkp@intel.com

    loongarch64-linux-ld: pinctrl-sx150x.c:(.text+0xf44): undefined reference to `i2c_smbus_write_byte_data'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- loongarch-allmodconfig
    `-- loongarch64-linux-ld:pinctrl-sx15.c:(.text):undefined-reference-to-i2c_smbus_write_byte_data

elapsed time: 1455m

configs tested: 114
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                   randconfig-001-20250417    gcc-13.3.0
arc                   randconfig-002-20250417    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250417    gcc-7.5.0
arm                   randconfig-002-20250417    clang-16
arm                   randconfig-003-20250417    gcc-10.5.0
arm                   randconfig-004-20250417    gcc-6.5.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250417    gcc-7.5.0
arm64                 randconfig-002-20250417    gcc-5.5.0
arm64                 randconfig-003-20250417    clang-21
arm64                 randconfig-004-20250417    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250417    gcc-13.3.0
csky                  randconfig-002-20250417    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250417    clang-21
hexagon               randconfig-002-20250417    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250417    clang-20
i386        buildonly-randconfig-002-20250417    gcc-12
i386        buildonly-randconfig-003-20250417    gcc-12
i386        buildonly-randconfig-004-20250417    gcc-12
i386        buildonly-randconfig-005-20250417    clang-20
i386        buildonly-randconfig-006-20250417    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250417    gcc-14.2.0
loongarch             randconfig-002-20250417    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250417    gcc-11.5.0
nios2                 randconfig-002-20250417    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250417    gcc-12.4.0
parisc                randconfig-002-20250417    gcc-6.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250417    clang-21
powerpc               randconfig-002-20250417    gcc-9.3.0
powerpc               randconfig-003-20250417    gcc-9.3.0
powerpc64             randconfig-001-20250417    clang-21
powerpc64             randconfig-002-20250417    clang-21
powerpc64             randconfig-003-20250417    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250417    gcc-7.5.0
riscv                 randconfig-002-20250417    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250417    gcc-7.5.0
s390                  randconfig-002-20250417    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250417    gcc-13.3.0
sh                    randconfig-002-20250417    gcc-7.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250417    gcc-12.4.0
sparc                 randconfig-002-20250417    gcc-14.2.0
sparc64               randconfig-001-20250417    gcc-14.2.0
sparc64               randconfig-002-20250417    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250417    gcc-12
um                    randconfig-002-20250417    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250417    clang-20
x86_64      buildonly-randconfig-002-20250417    clang-20
x86_64      buildonly-randconfig-003-20250417    gcc-12
x86_64      buildonly-randconfig-004-20250417    clang-20
x86_64      buildonly-randconfig-005-20250417    clang-20
x86_64      buildonly-randconfig-006-20250417    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250417    gcc-8.5.0
xtensa                randconfig-002-20250417    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

