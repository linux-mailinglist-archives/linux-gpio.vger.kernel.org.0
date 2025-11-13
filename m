Return-Path: <linux-gpio+bounces-28453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B40C59780
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 19:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23EE3A465B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 18:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7F826FA5E;
	Thu, 13 Nov 2025 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alqLWkE4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F590342514
	for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763058294; cv=none; b=W2J67jiCyXoANRYr67vgLP5z2jyYqr+pDU3c8Gt3B0Xtv9dcEbBSVRTp2YEqjBbPZB7CrwEApr9vXOKBtitKUSAcb+dLxFcwCShMLEkkh2Kav18lgLGhxEblILDY43HhEE9wFYRvYXRpfWBqUa1ITH0bYliEtw+9B8Xg98QPmpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763058294; c=relaxed/simple;
	bh=aOpJFTgQY5642x6dcDfmq6DGqqWqSR/LKxaF4q3ssgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fzUJ4JMmvMnzGKDvx+uvANV6nNJ/tfIlPYRbdH0wz/OLiI0WjQc9FWuGWUvJrZadhMXIRGSnQ47Q/8aY+HJg5Bpb5AI+sZfg3P4rR7G1Lkbt+uOBTZqTV71Tuq0gSbFaBFCcAjkXfTFES04DiuewwmQfUTZec9bGKgvGvMN25eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alqLWkE4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763058292; x=1794594292;
  h=date:from:to:cc:subject:message-id;
  bh=aOpJFTgQY5642x6dcDfmq6DGqqWqSR/LKxaF4q3ssgQ=;
  b=alqLWkE4nA0ypIn16IDKXEF+blzSk4tkw/QTv+o+w98ua/QgcAXKxQUX
   d1qw74zt89TxH9fiXWAtIc0eut7tNxJf2QqBPDg7YCL26SPj2iQUkJjQk
   UoqJaix8cqDGTwVEvox+P1zoEvHzqtcicsZzrA68WVjQPPtlPG+ziRzV2
   AMQ2pCF6BH5fYWWd14jw25A7MxNfzp1gvPsKMwzXtBARfxTuSfWkr/jBb
   nK3fM27hmAd47Xcr3X0zqNBAsNTdTacIM7ZjqsGlr/Uo4FzlK32td9nfN
   SnHq0DeMSYAukWqLuW6dkOkVe/rKTjDHGrL4HALWZ4NMCI9t0cfD08lKG
   A==;
X-CSE-ConnectionGUID: cKpk5TrzQyqHl+NgAc24oQ==
X-CSE-MsgGUID: 01hugEuHT/eSzTWw1+cDDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64352411"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="64352411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 10:24:52 -0800
X-CSE-ConnectionGUID: ZoQsSJr3TuO4E+jR7D9eUQ==
X-CSE-MsgGUID: Yi/IhtGsR6msGna3HI7+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="190344442"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 10:24:50 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJc00-0005jH-0Q;
	Thu, 13 Nov 2025 18:24:48 +0000
Date: Fri, 14 Nov 2025 02:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 bef5a1b01bdf83c0cba7f1eb817deae90cab33ca
Message-ID: <202511140259.J6ElQgNE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: bef5a1b01bdf83c0cba7f1eb817deae90cab33ca  gpio: virtuser: avoid strlen() in gpio_virtuser_direction_do_read()

elapsed time: 1991m

configs tested: 97
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251113    gcc-8.5.0
arc                   randconfig-002-20251113    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20251113    gcc-10.5.0
arm                   randconfig-002-20251113    clang-22
arm                   randconfig-003-20251113    clang-22
arm                   randconfig-004-20251113    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251113    clang-16
arm64                 randconfig-002-20251113    clang-22
arm64                 randconfig-003-20251113    gcc-8.5.0
arm64                 randconfig-004-20251113    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251113    gcc-9.5.0
csky                  randconfig-002-20251113    gcc-14.3.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251113    clang-22
hexagon               randconfig-002-20251113    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251113    clang-20
i386        buildonly-randconfig-002-20251113    gcc-14
i386        buildonly-randconfig-003-20251113    gcc-14
i386        buildonly-randconfig-004-20251113    gcc-12
i386        buildonly-randconfig-005-20251113    gcc-14
i386        buildonly-randconfig-006-20251113    clang-20
i386                  randconfig-001-20251113    gcc-14
i386                  randconfig-002-20251113    clang-20
i386                  randconfig-003-20251113    clang-20
i386                  randconfig-004-20251113    gcc-14
i386                  randconfig-005-20251113    clang-20
i386                  randconfig-006-20251113    clang-20
i386                  randconfig-007-20251113    gcc-14
i386                  randconfig-011-20251113    clang-20
i386                  randconfig-012-20251113    gcc-14
i386                  randconfig-014-20251113    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251113    gcc-15.1.0
loongarch             randconfig-002-20251113    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251113    gcc-8.5.0
nios2                 randconfig-002-20251113    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251113    gcc-8.5.0
parisc                randconfig-002-20251113    gcc-14.3.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20251113    clang-22
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20251113    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251113    gcc-8.5.0
riscv                 randconfig-002-20251113    gcc-11.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251113    clang-22
s390                  randconfig-002-20251113    clang-17
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251113    gcc-15.1.0
sh                    randconfig-002-20251113    gcc-11.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251113    gcc-8.5.0
sparc                 randconfig-002-20251113    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251113    clang-20
sparc64               randconfig-002-20251113    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251113    gcc-14
um                    randconfig-002-20251113    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251113    gcc-14
x86_64      buildonly-randconfig-002-20251113    clang-20
x86_64      buildonly-randconfig-003-20251113    clang-20
x86_64      buildonly-randconfig-004-20251113    gcc-14
x86_64      buildonly-randconfig-005-20251113    gcc-12
x86_64      buildonly-randconfig-006-20251113    gcc-14
x86_64                              defconfig    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251113    gcc-15.1.0
xtensa                randconfig-002-20251113    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

