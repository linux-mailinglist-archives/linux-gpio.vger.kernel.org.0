Return-Path: <linux-gpio+bounces-23858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1BAB131D3
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 22:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 546327A60D3
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 20:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E318238141;
	Sun, 27 Jul 2025 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II+tMc5j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BE1205E25
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 20:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753648643; cv=none; b=WwyIXmapDJGOYwYqTbanexygUSrofjOKBkWMJJlkh2FRehEwd2l6eh29wAJ+NYQzRCe3KpoaBsjou9yij4omqcfYFakEq/Ww89aGXMZzO+0mt2Z0udfsIIT7wDfDitlvVv9bA9Vjrr/nKwIlqh2WWh7LTSvynSWZp/FFcXwta6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753648643; c=relaxed/simple;
	bh=RnIXCpt+tYx/6FtkLrUjM5888hByJu6llvUsEUCanzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BhUaokRtoyCNZWJQrMdDJtNUhzfr/LDM85HwdJ6R2U073ToJV2YhxDbq+5t1mBs/1ACoSGeHo/RUDbYodovtlI5k121TsQYjmh5XB2MKlOeMzSgX7lKHEHSC44ztNnh3dQRhenrL7kaRR0MwNovfsUIzsz0HYeyTRvTlMiAGPiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II+tMc5j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753648642; x=1785184642;
  h=date:from:to:cc:subject:message-id;
  bh=RnIXCpt+tYx/6FtkLrUjM5888hByJu6llvUsEUCanzE=;
  b=II+tMc5jkgzFCN8L3jpbYvB27MxKiP93yADBIKyk4onHOHz8eXKWwK52
   A1QB6ps15i8FWPoaM/Q7b22+j2OYBaxqf594dVUlgnOZxO6p9+9lVyQzt
   XjCNExx/y5mg95EQ1UmAOpeYYtCHUvtB1q7j+Jiv7/CAtJ7bQKGt6llLf
   oAFQ1B0tFIijItimLYN0ucHSNwr91iq3Ikq4QsN98wCNSfluZ7SN48B1+
   YwXLpG/YZG41qXzs+iEqVHeeSJGHTnIpFiH1LJ950k4nwNQ0ky8rCdd7K
   KTrHtmgtkSFaMYu3UJnyRgc1ivsdvXPVPkl9TIN3jvV88GRBR34xhaKyk
   g==;
X-CSE-ConnectionGUID: JD1AAn3ySGSTQv+ofDggtg==
X-CSE-MsgGUID: WRvPi+2lQdaIznJKd2+E7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56049039"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56049039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 13:37:22 -0700
X-CSE-ConnectionGUID: TIov3yhAQ4iRivxNmitpWA==
X-CSE-MsgGUID: VHYOk38mRfOCYY4OD9gVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="163005791"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2025 13:37:21 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug87S-00001z-2m;
	Sun, 27 Jul 2025 20:37:18 +0000
Date: Mon, 28 Jul 2025 04:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD REGRESSION
 9b3b82c1867fb359385df1e474972a9a2af2d812
Message-ID: <202507280403.fXc5tQSA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: 9b3b82c1867fb359385df1e474972a9a2af2d812  treewide: rename GPIO set callbacks back to their original names

Error/Warning (recently discovered and may have been fixed):

    drivers/gpio/gpio-macsmc.c:264:12: error: no member named 'set_rv' in 'struct gpio_chip'
    drivers/gpio/gpio-macsmc.c:264:18: error: 'struct gpio_chip' has no member named 'set_rv'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- loongarch-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- loongarch-allyesconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- powerpc-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:struct-gpio_chip-has-no-member-named-set_rv
|-- sparc-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:struct-gpio_chip-has-no-member-named-set_rv
|-- um-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- um-allyesconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:struct-gpio_chip-has-no-member-named-set_rv
|-- x86_64-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
`-- x86_64-allyesconfig
    `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip

elapsed time: 722m

configs tested: 130
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250727    gcc-8.5.0
arc                   randconfig-002-20250727    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250727    gcc-11.5.0
arm                   randconfig-002-20250727    gcc-14.3.0
arm                   randconfig-003-20250727    clang-22
arm                   randconfig-004-20250727    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250727    gcc-11.5.0
arm64                 randconfig-002-20250727    clang-18
arm64                 randconfig-003-20250727    clang-17
arm64                 randconfig-004-20250727    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250727    gcc-15.1.0
csky                  randconfig-002-20250727    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250727    clang-22
hexagon               randconfig-002-20250727    clang-22
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
loongarch             randconfig-001-20250727    clang-22
loongarch             randconfig-002-20250727    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250727    gcc-8.5.0
nios2                 randconfig-002-20250727    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250727    gcc-11.5.0
parisc                randconfig-002-20250727    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      bamboo_defconfig    clang-22
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250727    gcc-13.4.0
powerpc               randconfig-002-20250727    clang-22
powerpc               randconfig-003-20250727    clang-22
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-001-20250727    gcc-12.5.0
powerpc64             randconfig-002-20250727    clang-22
powerpc64             randconfig-003-20250727    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250727    clang-22
riscv                 randconfig-002-20250727    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250727    clang-22
s390                  randconfig-002-20250727    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250727    gcc-15.1.0
sh                    randconfig-002-20250727    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250727    gcc-8.5.0
sparc                 randconfig-002-20250727    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250727    gcc-8.5.0
sparc64               randconfig-002-20250727    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250727    clang-22
um                    randconfig-002-20250727    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250727    gcc-12
x86_64      buildonly-randconfig-002-20250727    clang-20
x86_64      buildonly-randconfig-003-20250727    clang-20
x86_64      buildonly-randconfig-004-20250727    clang-20
x86_64      buildonly-randconfig-005-20250727    clang-20
x86_64      buildonly-randconfig-006-20250727    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250727    gcc-8.5.0
xtensa                randconfig-002-20250727    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

