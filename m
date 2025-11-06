Return-Path: <linux-gpio+bounces-28161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D43CDC3AE1F
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 13:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59EA54EE06B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 12:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3622316917;
	Thu,  6 Nov 2025 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhZktsXZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B02D9ED9
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762431866; cv=none; b=PumMl0inOUT11u1Nl+Cnd4AZDadBsTDne3+oaWT2YCRdJMDAot5bCa1sG+oi2uD2ByzrxahyLJXx80dBZQsQqmu2hhSU4/JRDChQJg2q7QpfIm8W3oinNs3nbOUItXWtBmDTif+9DKsunxngKOq7sHycZ/qfFmlehxnwfVeWSBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762431866; c=relaxed/simple;
	bh=D/tTxOCs1Uo3L3PFnChZQWHOmtVWm2Wx9aquk5VLaPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jD/aYqi5Xoo+FAlLXE/rn+wKRGPlT6wMop2suwA0gV7c+XVUkE4N4L+41xx9XZQrNi5vE2Is4uGNng61BLwqb0M4Y11FrqFOsh+BAHl0KbZ1Svs4CdAqfhFz4XosmwT0GSN87voaQ1sTO0SqPMXAH0h6Hkqy4fSBmU1Ri9AqmH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhZktsXZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762431864; x=1793967864;
  h=date:from:to:cc:subject:message-id;
  bh=D/tTxOCs1Uo3L3PFnChZQWHOmtVWm2Wx9aquk5VLaPA=;
  b=XhZktsXZxtUxT644f7+C/fExuiQij6vHGygE6brPZkWDnjKkccQ+eQSy
   RQ1/kbGkB5JWbFHzWJsPE4ecpVNXWzPNwxG5oL6wF5smuAY/T23x4/wsb
   fefuUD04sjBo6G9J3LMRucc4h/nNmHSjHJKJ38TyF35RfI6/f3d+UhTMH
   gwkngG8WlBIB8Dn6f2rK8+QET2Q3a3ClhGe8Mh1uOLhdqHigqzSklF92d
   JAjUmC0YtTazWj18WdtyXZmrvvqX28hxS5pEGS86KdRJWIs9/s/UERpAy
   epVAkhNBLEghlsj695ADp2Rn03Monk54JHRy6nbie6Tp8f1E5CNiUYRJi
   g==;
X-CSE-ConnectionGUID: 9vVtJYm/SCm7Q6XmufSnpQ==
X-CSE-MsgGUID: 07Li5aidSm+JkrNQ+z93OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64660785"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64660785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 04:24:23 -0800
X-CSE-ConnectionGUID: 0Hkqd3iETcWp9jNtcdn0hg==
X-CSE-MsgGUID: fad7q+r7TcOkHcfP38Avmg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2025 04:24:23 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGz2K-000Tug-2G;
	Thu, 06 Nov 2025 12:24:20 +0000
Date: Thu, 06 Nov 2025 20:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 5232334baec371a3c9d9192ba7d2da2d88a85333
Message-ID: <202511062037.caekAwuV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 5232334baec371a3c9d9192ba7d2da2d88a85333  gpio: aggregator: restore the set_config operation

elapsed time: 1534m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20251106    gcc-12.5.0
arc                   randconfig-002-20251106    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251106    gcc-11.5.0
arm                   randconfig-002-20251106    clang-22
arm                   randconfig-003-20251106    gcc-10.5.0
arm                   randconfig-004-20251106    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251106    gcc-11.5.0
arm64                 randconfig-002-20251106    clang-19
arm64                 randconfig-003-20251106    gcc-14.3.0
arm64                 randconfig-004-20251106    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251106    gcc-12.5.0
csky                  randconfig-002-20251106    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251105    clang-22
hexagon               randconfig-002-20251105    clang-20
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251106    clang-20
i386        buildonly-randconfig-002-20251106    clang-20
i386        buildonly-randconfig-003-20251106    gcc-14
i386        buildonly-randconfig-004-20251106    clang-20
i386        buildonly-randconfig-005-20251106    gcc-14
i386        buildonly-randconfig-006-20251106    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251105    clang-18
loongarch             randconfig-002-20251105    clang-20
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251105    gcc-9.5.0
nios2                 randconfig-002-20251105    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251106    gcc-10.5.0
parisc                randconfig-002-20251106    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    clang-22
powerpc               randconfig-001-20251106    gcc-14.3.0
powerpc               randconfig-002-20251106    clang-22
powerpc64             randconfig-002-20251106    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251105    gcc-8.5.0
riscv                 randconfig-002-20251105    clang-18
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251105    gcc-8.5.0
s390                  randconfig-002-20251105    gcc-14.3.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251105    gcc-10.5.0
sh                    randconfig-002-20251105    gcc-11.5.0
sh                             sh03_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251106    gcc-15.1.0
sparc                 randconfig-002-20251106    gcc-15.1.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251106    gcc-13.4.0
sparc64               randconfig-002-20251106    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251106    gcc-14
um                    randconfig-002-20251106    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251106    gcc-12
x86_64      buildonly-randconfig-002-20251106    gcc-14
x86_64      buildonly-randconfig-003-20251106    gcc-14
x86_64      buildonly-randconfig-004-20251106    gcc-14
x86_64      buildonly-randconfig-005-20251106    clang-20
x86_64      buildonly-randconfig-006-20251106    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251106    clang-20
x86_64                randconfig-012-20251106    clang-20
x86_64                randconfig-013-20251106    clang-20
x86_64                randconfig-014-20251106    gcc-14
x86_64                randconfig-015-20251106    gcc-14
x86_64                randconfig-016-20251106    gcc-12
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251106    gcc-9.5.0
xtensa                randconfig-002-20251106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

