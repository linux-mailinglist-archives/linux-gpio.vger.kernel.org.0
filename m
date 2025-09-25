Return-Path: <linux-gpio+bounces-26578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA07B9F7B0
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02FD53BB135
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 13:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5272248AE;
	Thu, 25 Sep 2025 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvBmUu9U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC631D5CDE
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806212; cv=none; b=ck/F8fsUhQymV9BjBxAGl0+lh2V4jdKkXHzQ5RnRPFHuq/RRzSziZE9dlt63O/ajSTy3P7LcX4SMsndrQusGM7Td8zizIIo+lOdXVorNFgxTHMe4gY3Kop2z2p93f62QwAQa+sX9+tPDA/F3k30cro3TM3lrXlVBHJjg7LzWk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806212; c=relaxed/simple;
	bh=T6CDU0tHWMQR9Cxl7jJdoSELTV7H0QijLV7TaxyLIo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qjCE2j9d4wkcE1ViuESCjzTmxdEoVcVgnfFaR4FeaEiFT61DZafkwbcNgWRSdPKj7/KaTQ7WC6GPBmI/GO7MoXJ0RXYn+GnpzdZ9t6LooVR89M3ChM6I9M7vlK1cYAlHN5z0qyhIhzcySstdZfW15wLO+xGozWL1ADNh7nvyVpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvBmUu9U; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758806210; x=1790342210;
  h=date:from:to:cc:subject:message-id;
  bh=T6CDU0tHWMQR9Cxl7jJdoSELTV7H0QijLV7TaxyLIo4=;
  b=EvBmUu9UAOqTrZiq8SRaJQflHapbd9gC5BF83Fn3SDcmBDI/a//Ahwt1
   Aa2QCIB1Cwc0L1TPMnHr8EIYroS95wv7fJPjssJYuk5DyqVsmE6VXdXmo
   Ug7+tTTyN3FosQp9VfYrZ/gGb6iaSw4LWyVrmf29AyNRlsKE0RR4zyasz
   uGCtH2+2giZErNJcLhWMRNEyEO9oUX479zSI0n4PYgIXVYTaayvMsNM66
   VzJjAJ45rQarWode+HVNfG6mDwlvqudlaPZHazLk/H6P0SdIN2iss9REk
   xPAykGfOMre7FoEsrJbdpW0KA0ynxZgKmN9+Zgii7r5GJJI+IS/KtGlvS
   g==;
X-CSE-ConnectionGUID: WsNRY4XIQY2888iJdH3vxw==
X-CSE-MsgGUID: bvjNWefTSQmOfbE58Y9QjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60336039"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="60336039"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 06:16:50 -0700
X-CSE-ConnectionGUID: 2jk/SKj9Ttqhg+CdIphIEg==
X-CSE-MsgGUID: 6ISW2QB1RdW0NmIHSz7n4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="208260020"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2025 06:16:49 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1lq1-0005FR-0u;
	Thu, 25 Sep 2025 13:16:46 +0000
Date: Thu, 25 Sep 2025 21:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 2235b26c1b25daf253748acff501af3ea85faaa8
Message-ID: <202509252126.uypPvyc6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 2235b26c1b25daf253748acff501af3ea85faaa8  gpio: generic: move GPIO_GENERIC_ flags to the correct header

elapsed time: 1448m

configs tested: 117
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250924    gcc-11.5.0
arc                   randconfig-002-20250924    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20250924    clang-22
arm                   randconfig-002-20250924    clang-22
arm                   randconfig-003-20250924    clang-22
arm                   randconfig-004-20250924    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250924    gcc-14.3.0
arm64                 randconfig-002-20250924    clang-18
arm64                 randconfig-003-20250924    gcc-12.5.0
arm64                 randconfig-004-20250924    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250924    gcc-14.3.0
csky                  randconfig-002-20250924    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250924    clang-22
hexagon               randconfig-002-20250924    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250924    gcc-14
i386        buildonly-randconfig-002-20250924    clang-20
i386        buildonly-randconfig-003-20250924    gcc-13
i386        buildonly-randconfig-004-20250924    gcc-14
i386        buildonly-randconfig-005-20250924    clang-20
i386        buildonly-randconfig-006-20250924    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250924    gcc-15.1.0
loongarch             randconfig-002-20250924    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250924    gcc-11.5.0
nios2                 randconfig-002-20250924    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250924    gcc-12.5.0
parisc                randconfig-002-20250924    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250924    clang-18
powerpc               randconfig-002-20250924    clang-18
powerpc               randconfig-003-20250924    clang-22
powerpc64             randconfig-001-20250924    clang-22
powerpc64             randconfig-002-20250924    gcc-15.1.0
powerpc64             randconfig-003-20250924    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250924    gcc-8.5.0
riscv                 randconfig-002-20250924    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250924    gcc-8.5.0
s390                  randconfig-002-20250924    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250924    gcc-15.1.0
sh                    randconfig-002-20250924    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250924    gcc-15.1.0
sparc                 randconfig-002-20250924    gcc-8.5.0
sparc64               randconfig-001-20250924    gcc-8.5.0
sparc64               randconfig-002-20250924    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250924    clang-16
um                    randconfig-002-20250924    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250924    clang-20
x86_64      buildonly-randconfig-002-20250924    clang-20
x86_64      buildonly-randconfig-003-20250924    clang-20
x86_64      buildonly-randconfig-004-20250924    gcc-14
x86_64      buildonly-randconfig-005-20250924    clang-20
x86_64      buildonly-randconfig-006-20250924    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250924    gcc-13.4.0
xtensa                randconfig-002-20250924    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

