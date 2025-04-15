Return-Path: <linux-gpio+bounces-18908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB73A8AF3B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 06:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4923BF79F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 04:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D1B22A1D1;
	Wed, 16 Apr 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKhqtzHC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362522A1E1
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744778639; cv=none; b=ey4ir9fxvSqGKy4sDD1A4SdbLTFz2UWo1L6jjQnbZKppyUktgQlRecCIDV4TrIRpy6rFxIdsgLUrHbNTTKBaNVvd8izfllfd7y5YINFxRb1E8JUCv/AiN7bkNeNwPWLKZTQLoT2KVgR7bRxGLmr5wlAWe0O4fIg0cPpTzRr80V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744778639; c=relaxed/simple;
	bh=C8pue9fZOyILRGCTFIakxNjXMI/SXZajEJ1kZudMraE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l9LLGKTKZLed6h0hV1ZmR+b+ourdzbsvSx4ay2trJXZ58JZzLxprskHb+ZFV27zI1/rykUlsliAwVcJu7sqO4PHb5uADbxTA+65i4/jupc8usqL/l2YlkFURTzatVJii5OyqQGJEqbzuY0lyPe5Ts7PDlbuCFIT3BHbhZp4moyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKhqtzHC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744778637; x=1776314637;
  h=date:from:to:cc:subject:message-id;
  bh=C8pue9fZOyILRGCTFIakxNjXMI/SXZajEJ1kZudMraE=;
  b=EKhqtzHC2ThQWK98eww268MDmzhaKlNltJyWYohQR+t/jgCb1SYrh0nd
   AWbgUy4JX6wvLH+cxdPQPRhfBatArB0tJWMMpZSovgZbGyW1pi+sMHxzK
   jYa4sluxlOFZ3eoZp44nPMmoMsGRT2QXcpy/wHlug66crxMmOEGjnwYDX
   dUFPtGAwSYeI4dqXzfbJpVee6pi2LlRzMdY6P3oQfIq0OXsaLxCfHIjUz
   RVSiKS0PXEoZu+CN+xyLp4FSCTFkt7TLNj75dRkjGrLIYWsuJNL29QHF5
   8ANQEQOdJWkPBniTFroFIIk78Y+tyNNYALOrKhqvvHoDOU7ALCSTFZ/9l
   w==;
X-CSE-ConnectionGUID: w16+Z4QrQWGPaHQwjryJ3g==
X-CSE-MsgGUID: RFVEr9XqQemcCSxhS/Qkww==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56487269"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56487269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 21:43:57 -0700
X-CSE-ConnectionGUID: 2zYuuUPsT3aHeKMZhk5Szw==
X-CSE-MsgGUID: GCguP6kiQkK2on6TG1sBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131286492"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Apr 2025 21:43:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4liQ-000Gsa-0d;
	Tue, 15 Apr 2025 19:13:02 +0000
Date: Wed, 16 Apr 2025 03:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 b424bb88afb6719b30340f059bf50953424cdd9d
Message-ID: <202504160343.Hk4CGYFf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: b424bb88afb6719b30340f059bf50953424cdd9d  gpiolib: Allow to use setters with return value for output-only gpios

elapsed time: 1447m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250415    gcc-14.2.0
arc                   randconfig-002-20250415    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250415    clang-21
arm                   randconfig-002-20250415    clang-21
arm                   randconfig-003-20250415    gcc-10.5.0
arm                   randconfig-004-20250415    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                 randconfig-001-20250415    clang-16
arm64                 randconfig-002-20250415    gcc-7.5.0
arm64                 randconfig-003-20250415    gcc-9.5.0
arm64                 randconfig-004-20250415    gcc-9.5.0
csky                  randconfig-001-20250415    gcc-13.3.0
csky                  randconfig-002-20250415    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250415    clang-20
hexagon               randconfig-002-20250415    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250415    clang-20
i386        buildonly-randconfig-002-20250415    clang-20
i386        buildonly-randconfig-003-20250415    clang-20
i386        buildonly-randconfig-004-20250415    clang-20
i386        buildonly-randconfig-005-20250415    gcc-12
i386        buildonly-randconfig-006-20250415    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250415    gcc-14.2.0
loongarch             randconfig-002-20250415    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250415    gcc-13.3.0
nios2                 randconfig-002-20250415    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250415    gcc-12.4.0
parisc                randconfig-002-20250415    gcc-10.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc               randconfig-001-20250415    gcc-5.5.0
powerpc               randconfig-002-20250415    clang-17
powerpc               randconfig-003-20250415    gcc-7.5.0
powerpc                     tqm8548_defconfig    clang-21
powerpc64             randconfig-001-20250415    gcc-7.5.0
powerpc64             randconfig-002-20250415    clang-17
powerpc64             randconfig-003-20250415    gcc-10.5.0
riscv                            alldefconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250415    gcc-14.2.0
riscv                 randconfig-002-20250415    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250415    clang-21
s390                  randconfig-002-20250415    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250415    gcc-11.5.0
sh                    randconfig-002-20250415    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250415    gcc-6.5.0
sparc                 randconfig-002-20250415    gcc-12.4.0
sparc64               randconfig-001-20250415    gcc-14.2.0
sparc64               randconfig-002-20250415    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250415    clang-21
um                    randconfig-002-20250415    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250415    clang-20
x86_64      buildonly-randconfig-002-20250415    gcc-11
x86_64      buildonly-randconfig-003-20250415    gcc-12
x86_64      buildonly-randconfig-004-20250415    clang-20
x86_64      buildonly-randconfig-005-20250415    clang-20
x86_64      buildonly-randconfig-006-20250415    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250415    gcc-6.5.0
xtensa                randconfig-002-20250415    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

