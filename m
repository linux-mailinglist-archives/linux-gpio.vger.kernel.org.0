Return-Path: <linux-gpio+bounces-12772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B51429C309E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 03:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44AD7281E1E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 02:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB78843179;
	Sun, 10 Nov 2024 02:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0rtd9xn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6D2563
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 02:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731205992; cv=none; b=pGaf0sktBYG/eNS5lHpFNXHbh1/xroCTakjEft7PwRgS6vq9r3yhNWRFROHYUN0xMEjP0Oh2q1TdjrkoHB2RtRtzz8Qma86xc24NkvSGUbqS129o2MOPn4BrozJ1Qydvt85AK+/SqoiUl4c+IUKVpcy2SejCRlaIh29MHPa7SQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731205992; c=relaxed/simple;
	bh=A5vRAUUwdjI6N80J7fW7Nvb5A1bEjM2d1QqMWfKy4xQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dm8syv3ZYpAnRIJ9kSpkG/PQM6V88l0rX3OxBJULEgaInY8qkWqOSpM5yI46kDyVL/jSdIm8hUAZke/Nbd2oGdxniu95l3rglsswGWDq+ugmS/h/37LzIa/M//sVQjPnVBtivAPAcJWeURrbTATtccCe8di4wpbaacqhMqJevb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0rtd9xn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731205990; x=1762741990;
  h=date:from:to:cc:subject:message-id;
  bh=A5vRAUUwdjI6N80J7fW7Nvb5A1bEjM2d1QqMWfKy4xQ=;
  b=X0rtd9xnVUtdLW4fIiIc1ecFjFneMiCePHBxY1OZgoXgJHKIggSVw59x
   4eiN2p5Yt3VQCn4H2N0sqC+VQxM8LBdzA18PfP+lVU/by/6P8Yqv7i8BX
   M4l6ETRcKpRTLDta0fcSpplsMk3W3OHbBqly1LjIiGDlCpW6ehH+g+VHH
   EnDFt1NrCwZTQP2tBsn95PA4upyYP/1OiAdByK2QeLZnlbiTENVLXP778
   MXnnrg5umgKDtP8wU+JgKgZQ+gWB/Le4XS6KAE7QWE59aWGom/JWjTNLs
   PGSxbrXXfwVK4F9M/jY3rgCmjTk1xA4fbcDdLQ88qqYzOJ9bCEt1V6x3v
   w==;
X-CSE-ConnectionGUID: 7UAaePYEQ2W1M4CDFpJ5tg==
X-CSE-MsgGUID: tDazUSlVRzufjU3X+EfpxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="33910266"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="33910266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 18:33:10 -0800
X-CSE-ConnectionGUID: gfNGHiVqSi+C4fms2h2qEQ==
X-CSE-MsgGUID: k0IhTeUhRNm2P9CBPVxfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="85923183"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2024 18:33:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9xlC-000sqv-2Q;
	Sun, 10 Nov 2024 02:33:06 +0000
Date: Sun, 10 Nov 2024 10:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 fffb9fff12250018a6f4d3e411f9d289210da329
Message-ID: <202411101054.egcJeaD1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: fffb9fff12250018a6f4d3e411f9d289210da329  gpio: Get rid of GPIOF_ACTIVE_LOW

elapsed time: 727m

configs tested: 177
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                           imxrt_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-20
arm                           sama5_defconfig    clang-20
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241110    gcc-11
i386        buildonly-randconfig-002-20241110    gcc-11
i386        buildonly-randconfig-003-20241110    gcc-11
i386        buildonly-randconfig-004-20241110    gcc-11
i386        buildonly-randconfig-005-20241110    gcc-11
i386        buildonly-randconfig-006-20241110    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241110    gcc-11
i386                  randconfig-002-20241110    gcc-11
i386                  randconfig-003-20241110    gcc-11
i386                  randconfig-004-20241110    gcc-11
i386                  randconfig-005-20241110    gcc-11
i386                  randconfig-006-20241110    gcc-11
i386                  randconfig-011-20241110    gcc-11
i386                  randconfig-012-20241110    gcc-11
i386                  randconfig-013-20241110    gcc-11
i386                  randconfig-014-20241110    gcc-11
i386                  randconfig-015-20241110    gcc-11
i386                  randconfig-016-20241110    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    clang-20
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    clang-20
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          rsk7264_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241109    gcc-12
x86_64      buildonly-randconfig-001-20241110    gcc-12
x86_64      buildonly-randconfig-002-20241109    gcc-12
x86_64      buildonly-randconfig-002-20241110    gcc-12
x86_64      buildonly-randconfig-003-20241109    gcc-12
x86_64      buildonly-randconfig-003-20241110    gcc-12
x86_64      buildonly-randconfig-004-20241109    gcc-12
x86_64      buildonly-randconfig-004-20241110    gcc-12
x86_64      buildonly-randconfig-005-20241109    gcc-12
x86_64      buildonly-randconfig-005-20241110    gcc-12
x86_64      buildonly-randconfig-006-20241109    gcc-12
x86_64      buildonly-randconfig-006-20241110    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241109    gcc-12
x86_64                randconfig-001-20241110    gcc-12
x86_64                randconfig-002-20241109    gcc-12
x86_64                randconfig-002-20241110    gcc-12
x86_64                randconfig-003-20241109    gcc-12
x86_64                randconfig-003-20241110    gcc-12
x86_64                randconfig-004-20241109    gcc-12
x86_64                randconfig-004-20241110    gcc-12
x86_64                randconfig-005-20241109    gcc-12
x86_64                randconfig-005-20241110    gcc-12
x86_64                randconfig-006-20241109    gcc-12
x86_64                randconfig-006-20241110    gcc-12
x86_64                randconfig-011-20241109    gcc-12
x86_64                randconfig-011-20241110    gcc-12
x86_64                randconfig-012-20241109    gcc-12
x86_64                randconfig-012-20241110    gcc-12
x86_64                randconfig-013-20241109    gcc-12
x86_64                randconfig-013-20241110    gcc-12
x86_64                randconfig-014-20241109    gcc-12
x86_64                randconfig-014-20241110    gcc-12
x86_64                randconfig-015-20241109    gcc-12
x86_64                randconfig-015-20241110    gcc-12
x86_64                randconfig-016-20241109    gcc-12
x86_64                randconfig-016-20241110    gcc-12
x86_64                randconfig-071-20241109    gcc-12
x86_64                randconfig-071-20241110    gcc-12
x86_64                randconfig-072-20241109    gcc-12
x86_64                randconfig-072-20241110    gcc-12
x86_64                randconfig-073-20241109    gcc-12
x86_64                randconfig-073-20241110    gcc-12
x86_64                randconfig-074-20241109    gcc-12
x86_64                randconfig-074-20241110    gcc-12
x86_64                randconfig-075-20241109    gcc-12
x86_64                randconfig-075-20241110    gcc-12
x86_64                randconfig-076-20241109    gcc-12
x86_64                randconfig-076-20241110    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

