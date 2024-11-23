Return-Path: <linux-gpio+bounces-13206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20799D6730
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 03:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49891B22405
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 02:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444DE26AE4;
	Sat, 23 Nov 2024 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImKyWhvg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF98489
	for <linux-gpio@vger.kernel.org>; Sat, 23 Nov 2024 02:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329418; cv=none; b=NfBzeHVQ6hUz15bYtOqeczrCumGyDsEkOYBL0W57irED/1MVo5C4RqAgrbUHFAXU7AhUF1HfdYTg4VFtbgZj/OfPDLZlwlDJ4l+1uwM9OT+5TBZ+oV+pmLwcFM7q14fuDE9Ok4IiO0Tv7LXH2stGlvnAEFDk0D3NesPFe/gJ0ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329418; c=relaxed/simple;
	bh=ZVg4a6ZjeLr1hKvIM7O0WnhUDjnRNiQvRxbYm1rikyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q8uM/1uORhZkFu2aMC+FEzx+d4d/tEulHQPt93V7P2kvKnYRbsd1pmlak9OPN8AQlahOIs7jLdut9aR74BmLY8PrhbxgSBpKdnXy/NP5lKST0YHYf79dByyQIFzJNJeQLeoRqqK3iS0ZtwjzSEriirBqQIToSNMXZlrNTtp4Oq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImKyWhvg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732329416; x=1763865416;
  h=date:from:to:cc:subject:message-id;
  bh=ZVg4a6ZjeLr1hKvIM7O0WnhUDjnRNiQvRxbYm1rikyI=;
  b=ImKyWhvg4VzWxL/vMD5o584tbaDM+lJewBe+NvRE8c5EnA74VtokUI5R
   qOwM4qft+/WsYqAWViwEuYBwGFEO3p6OJbQdf8m2MDBGIUFjcBIgc85Sa
   dLqkrE1QvI0RzFPETfZcfzhDzz/W6w2zy/GJk7QkTYrWgYo+uGloE/Zz5
   jFFR2hj+/miIqWKhGIVGQi0a3J03ZD6hPadW3fLTawYZjr+T/Wra2dbN8
   347OafhkXPw1b3DWJ+AyFCbGRp+PwPORxGuht8pU4ve7feYi+XxKai+oc
   +F7uU1litjgPooEvgrPtUadY5EFbdytz4bBTnMQny6mD15lYDfPyF9cDN
   g==;
X-CSE-ConnectionGUID: BCRx30nWSGmCcd9VGroeRg==
X-CSE-MsgGUID: 2w773JPpRHyW3crfLMBpNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20086413"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="20086413"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 18:36:55 -0800
X-CSE-ConnectionGUID: EwZDpP0URsaSuJzRbQgKJg==
X-CSE-MsgGUID: xe3WBTqfT6awoTV8qZ2k1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90657467"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Nov 2024 18:36:54 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEg0x-0004Md-24;
	Sat, 23 Nov 2024 02:36:51 +0000
Date: Sat, 23 Nov 2024 10:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 f57c084928661969a337c731cd05e1da97320829
Message-ID: <202411231047.HPRXqTLo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: f57c084928661969a337c731cd05e1da97320829  gpio: mpsse: Remove usage of the deprecated ida_simple_xx() API

elapsed time: 729m

configs tested: 207
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.1.0
arc                   randconfig-001-20241123    gcc-14.2.0
arc                   randconfig-002-20241123    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                        multi_v5_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-20
arm                        mvebu_v7_defconfig    gcc-14.2.0
arm                             mxs_defconfig    gcc-14.1.0
arm                   randconfig-001-20241123    gcc-14.2.0
arm                   randconfig-002-20241123    gcc-14.2.0
arm                   randconfig-003-20241123    gcc-14.2.0
arm                   randconfig-004-20241123    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.1.0
arm                         socfpga_defconfig    clang-20
arm                       spear13xx_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241123    gcc-14.2.0
arm64                 randconfig-002-20241123    gcc-14.2.0
arm64                 randconfig-003-20241123    gcc-14.2.0
arm64                 randconfig-004-20241123    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241123    gcc-14.2.0
csky                  randconfig-002-20241123    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241123    gcc-14.2.0
hexagon               randconfig-002-20241123    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241123    clang-19
i386        buildonly-randconfig-002-20241123    clang-19
i386        buildonly-randconfig-003-20241123    clang-19
i386        buildonly-randconfig-004-20241123    clang-19
i386        buildonly-randconfig-005-20241123    clang-19
i386        buildonly-randconfig-006-20241123    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241123    clang-19
i386                  randconfig-002-20241123    clang-19
i386                  randconfig-003-20241123    clang-19
i386                  randconfig-004-20241123    clang-19
i386                  randconfig-005-20241123    clang-19
i386                  randconfig-006-20241123    clang-19
i386                  randconfig-011-20241123    clang-19
i386                  randconfig-012-20241123    clang-19
i386                  randconfig-013-20241123    clang-19
i386                  randconfig-014-20241123    clang-19
i386                  randconfig-015-20241123    clang-19
i386                  randconfig-016-20241123    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241123    gcc-14.2.0
loongarch             randconfig-002-20241123    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-20
nios2                         3c120_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241123    gcc-14.2.0
nios2                 randconfig-002-20241123    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-14.1.0
parisc                randconfig-001-20241123    gcc-14.2.0
parisc                randconfig-002-20241123    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                        fsp2_defconfig    clang-20
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241123    gcc-14.2.0
powerpc               randconfig-002-20241123    gcc-14.2.0
powerpc               randconfig-003-20241123    gcc-14.2.0
powerpc                     tqm8541_defconfig    clang-20
powerpc                     tqm8541_defconfig    gcc-14.1.0
powerpc                     tqm8555_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241123    gcc-14.2.0
powerpc64             randconfig-002-20241123    gcc-14.2.0
powerpc64             randconfig-003-20241123    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-20
riscv                 randconfig-001-20241123    gcc-14.2.0
riscv                 randconfig-002-20241123    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241123    gcc-14.2.0
s390                  randconfig-002-20241123    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    clang-20
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    clang-20
sh                    randconfig-001-20241123    gcc-14.2.0
sh                    randconfig-002-20241123    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-20
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.1.0
sh                             shx3_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241123    gcc-14.2.0
sparc64               randconfig-002-20241123    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.2.0
um                    randconfig-001-20241123    gcc-14.2.0
um                    randconfig-002-20241123    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241123    gcc-12
x86_64      buildonly-randconfig-002-20241123    gcc-12
x86_64      buildonly-randconfig-003-20241123    gcc-12
x86_64      buildonly-randconfig-004-20241123    gcc-12
x86_64      buildonly-randconfig-005-20241123    gcc-12
x86_64      buildonly-randconfig-006-20241123    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241123    gcc-12
x86_64                randconfig-002-20241123    gcc-12
x86_64                randconfig-003-20241123    gcc-12
x86_64                randconfig-004-20241123    gcc-12
x86_64                randconfig-005-20241123    gcc-12
x86_64                randconfig-006-20241123    gcc-12
x86_64                randconfig-011-20241123    gcc-12
x86_64                randconfig-012-20241123    gcc-12
x86_64                randconfig-013-20241123    gcc-12
x86_64                randconfig-014-20241123    gcc-12
x86_64                randconfig-015-20241123    gcc-12
x86_64                randconfig-016-20241123    gcc-12
x86_64                randconfig-071-20241123    gcc-12
x86_64                randconfig-072-20241123    gcc-12
x86_64                randconfig-073-20241123    gcc-12
x86_64                randconfig-074-20241123    gcc-12
x86_64                randconfig-075-20241123    gcc-12
x86_64                randconfig-076-20241123    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241123    gcc-14.2.0
xtensa                randconfig-002-20241123    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

