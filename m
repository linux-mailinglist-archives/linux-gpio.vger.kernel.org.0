Return-Path: <linux-gpio+bounces-25694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D06B46741
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 01:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECBC71C87658
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 23:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C04D25A2A1;
	Fri,  5 Sep 2025 23:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYy77u3z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D658315D37
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757115572; cv=none; b=UmxcSTYEDxa4hdCaTm4fdXqTYw0u8o3qISYN/qZtaXBa6rz/GxKbe0hJOG3qcgHvA9TVkIkAzZJMEYuXPWX41Zzq0X2ivpoVGz+Dob0xnNo3rO+1DtBs3GauQStKr/cCzd2VbRYkmeHRBCJ7mK0zeEyGuCOhBMTwDX4JPSsOuwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757115572; c=relaxed/simple;
	bh=Az+eRxsc9Yd8jwjsOKAyGqxAGlA3wHLT0BlpTHrhq9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ufAMxInNBXaXznFt+ZlcVpYK6jJUWYEzkeFmUSpkTGfCsTNOJbEMX7lDb13WQWGCFhbn184VtvlxXDmU6JtQckATmvlc515waC6JfjBrXKhkwF5nkx6++WJcDy9EXRLxvBTi40AP1yhhn+u/dpFgOVw7DDj4sni3sdee2wPFm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYy77u3z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757115570; x=1788651570;
  h=date:from:to:cc:subject:message-id;
  bh=Az+eRxsc9Yd8jwjsOKAyGqxAGlA3wHLT0BlpTHrhq9I=;
  b=bYy77u3zaNHuxu9tVjwpvSnfNmpTxu+tbPWA1WUyR9yNsNVscXnTINjq
   XFRao3gIJHI7JMFHiJx+eBlVXXX58e5xSHOVq2Ng7L8xdRJJd5pe7tAks
   5z1V40xzOX7/dDKAXGBBzWf2ZW78IStLvdP4RdZUmXVwMhzumNkTyHmFB
   i1SavL+nAaqTyPS4MIJ3Wp8w3Zi67oeaSvcQNZsbo+ruNOf7fuucdGa7E
   4K4pHs5f7QZrP1q9SYgVmYUiJ9CNSLrNkeeTvgYsJDDyvpz12SwWLdnYn
   YLAumYfiEJkFyeKR9kr5UDI2VKU8l67IIKrrjsJk9BcPyNCm8TLYDngbK
   w==;
X-CSE-ConnectionGUID: U2J7DaEeTFiyARhjok28yg==
X-CSE-MsgGUID: cOjWHZu5Qa28OtS9QQAK0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58682255"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="58682255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 16:39:30 -0700
X-CSE-ConnectionGUID: 9AVgq/iqSyuOCKpjv7AXPQ==
X-CSE-MsgGUID: L8aU0OzkSfu9k7xbkLbyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="172191084"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2025 16:39:29 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uug1e-00013X-21;
	Fri, 05 Sep 2025 23:39:26 +0000
Date: Sat, 06 Sep 2025 07:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 79d15f23f232f90bfd8823239fd57b964d053548
Message-ID: <202509060713.IKMjx8fW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 79d15f23f232f90bfd8823239fd57b964d053548  gpio: nomadik: wrap a local variable in a necessary ifdef

elapsed time: 2002m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250905    gcc-11.5.0
arc                   randconfig-002-20250905    gcc-13.4.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20250905    clang-22
arm                   randconfig-002-20250905    clang-22
arm                   randconfig-003-20250905    clang-16
arm                   randconfig-004-20250905    gcc-14.3.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250905    clang-22
arm64                 randconfig-002-20250905    clang-17
arm64                 randconfig-003-20250905    clang-17
arm64                 randconfig-004-20250905    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250905    gcc-15.1.0
csky                  randconfig-002-20250905    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250905    clang-22
hexagon               randconfig-002-20250905    clang-22
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250904    clang-20
i386        buildonly-randconfig-002-20250904    gcc-12
i386        buildonly-randconfig-003-20250904    gcc-13
i386        buildonly-randconfig-004-20250904    gcc-13
i386        buildonly-randconfig-005-20250904    clang-20
i386        buildonly-randconfig-006-20250904    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250905    clang-18
loongarch             randconfig-002-20250905    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250905    gcc-10.5.0
nios2                 randconfig-002-20250905    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250905    gcc-15.1.0
parisc                randconfig-002-20250905    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250905    gcc-8.5.0
powerpc               randconfig-002-20250905    clang-22
powerpc               randconfig-003-20250905    gcc-8.5.0
powerpc64             randconfig-001-20250905    clang-22
powerpc64             randconfig-002-20250905    clang-22
powerpc64             randconfig-003-20250905    gcc-14.3.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250904    gcc-8.5.0
riscv                 randconfig-002-20250904    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250904    gcc-10.5.0
s390                  randconfig-002-20250904    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250904    gcc-12.5.0
sh                    randconfig-002-20250904    gcc-10.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250904    gcc-11.5.0
sparc                 randconfig-002-20250904    gcc-15.1.0
sparc64               randconfig-001-20250904    gcc-12.5.0
sparc64               randconfig-002-20250904    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250904    gcc-13
um                    randconfig-002-20250904    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250904    gcc-12
x86_64      buildonly-randconfig-002-20250904    clang-20
x86_64      buildonly-randconfig-003-20250904    gcc-13
x86_64      buildonly-randconfig-004-20250904    gcc-13
x86_64      buildonly-randconfig-005-20250904    gcc-13
x86_64      buildonly-randconfig-006-20250904    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250904    gcc-10.5.0
xtensa                randconfig-002-20250904    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

