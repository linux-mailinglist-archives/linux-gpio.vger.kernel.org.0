Return-Path: <linux-gpio+bounces-23867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA55B14230
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 20:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BCF317EC3B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 18:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E27321CC57;
	Mon, 28 Jul 2025 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4eys/LW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CBA4A01
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753728391; cv=none; b=USUaF3ybp8sYtvESrHARLfBQ1Z80m/WOI4ETzTZd6mbOqVyOAEZN48rOr6o3X+aEJOQXROJ4JDHboa64KSengQDSupxkTfOyDDBY4txLg4JvDmK1NPNYeXNJftToo5wSb6rCyfGEUoXZJD4P01uByycEJN5/bpFGd5s0bj1dMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753728391; c=relaxed/simple;
	bh=qfJZD97Jc3nECON5HBdGz+zVRnKwgK/DjGmk/brWo3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g8kwCHzYfmVqiiImtkBv2s/ieOe54IeKrJFKqojxtDTYBaVxMD8iW155YYVOzr9WxkjnB1/eXAIGP5WQ33A3w662fxueyVGqyapaJnHOywbj4VTvie3TWLG5p5jk2jI1av10+t5c/hULOFU4HzJtn892k3coI3FAiuepuHBiDRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4eys/LW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753728390; x=1785264390;
  h=date:from:to:cc:subject:message-id;
  bh=qfJZD97Jc3nECON5HBdGz+zVRnKwgK/DjGmk/brWo3c=;
  b=Z4eys/LWUgSZeLwxC67ivlYBo0ssRe7MZFwwkGiQTHKqStCy5GZEnPHL
   tU59tEK3XzsJpqUKwOoBBW92RgUVFw8k0BC4387PmZbomFlWMGTd7xmlD
   3gY54Hkn+XxUkfhmp9G8WYU1rmx9U6H8aFF67q2m1DeTtEDMno+K5GzRH
   pxOSnXrkFZZfiVtZmw3PaKRu0QkSsJadYDs3n6M/FT4PhWYecyBW3IgTy
   oiIYY1lzT9LYCGrkrnePyXBD12YyW1PTl9ssuP1cnjvYdWWvApgIoz6s+
   s87N3Goc9bnpTQTBPAFgOMdilE3qo14RwbdVEzjYinYmCtycbDf4GR8u2
   Q==;
X-CSE-ConnectionGUID: cfvW9DayTmKqhJxg0RJCoA==
X-CSE-MsgGUID: mgEhOkOuRr+2/ai3ASBXWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55845068"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55845068"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 11:46:30 -0700
X-CSE-ConnectionGUID: yjHjEB3pSjqFPj+CJVV/gg==
X-CSE-MsgGUID: +StX0HL+RFGis/AHVA/XFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162947400"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jul 2025 11:46:28 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugSrh-0000gZ-3B;
	Mon, 28 Jul 2025 18:46:25 +0000
Date: Tue, 29 Jul 2025 02:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD SUCCESS
 d95cc7b82e0d2bf79102f0a1b4263b2e6d299e17
Message-ID: <202507290224.91wazD5F-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: d95cc7b82e0d2bf79102f0a1b4263b2e6d299e17  treewide: rename GPIO set callbacks back to their original names

elapsed time: 743m

configs tested: 136
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
arc                   randconfig-001-20250728    gcc-13.4.0
arc                   randconfig-002-20250728    gcc-12.5.0
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250728    clang-22
arm                   randconfig-002-20250728    clang-22
arm                   randconfig-003-20250728    clang-22
arm                   randconfig-004-20250728    gcc-8.5.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250728    clang-22
arm64                 randconfig-002-20250728    clang-20
arm64                 randconfig-003-20250728    gcc-11.5.0
arm64                 randconfig-004-20250728    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250728    gcc-10.5.0
csky                  randconfig-002-20250728    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250728    clang-22
hexagon               randconfig-002-20250728    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250728    gcc-12
i386        buildonly-randconfig-002-20250728    gcc-12
i386        buildonly-randconfig-003-20250728    gcc-12
i386        buildonly-randconfig-004-20250728    clang-20
i386        buildonly-randconfig-005-20250728    gcc-12
i386        buildonly-randconfig-006-20250728    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250728    clang-22
loongarch             randconfig-002-20250728    clang-20
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
mips                           xway_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250728    gcc-11.5.0
nios2                 randconfig-002-20250728    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250728    gcc-9.5.0
parisc                randconfig-002-20250728    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250728    gcc-10.5.0
powerpc               randconfig-002-20250728    gcc-13.4.0
powerpc               randconfig-003-20250728    gcc-8.5.0
powerpc64             randconfig-001-20250728    clang-22
powerpc64             randconfig-002-20250728    clang-22
powerpc64             randconfig-003-20250728    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250728    clang-22
riscv                 randconfig-002-20250728    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250728    clang-22
s390                  randconfig-002-20250728    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250728    gcc-14.3.0
sh                    randconfig-002-20250728    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250728    gcc-8.5.0
sparc                 randconfig-002-20250728    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250728    clang-20
sparc64               randconfig-002-20250728    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250728    clang-22
um                    randconfig-002-20250728    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250728    clang-20
x86_64      buildonly-randconfig-002-20250728    clang-20
x86_64      buildonly-randconfig-003-20250728    clang-20
x86_64      buildonly-randconfig-004-20250728    clang-20
x86_64      buildonly-randconfig-005-20250728    clang-20
x86_64      buildonly-randconfig-006-20250728    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250728    gcc-8.5.0
xtensa                randconfig-002-20250728    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

