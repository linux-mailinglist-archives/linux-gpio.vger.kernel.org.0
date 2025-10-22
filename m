Return-Path: <linux-gpio+bounces-27423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E12ECBFAB7C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 09:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C9864F745F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 07:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231D82F363B;
	Wed, 22 Oct 2025 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgXMP8oi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D97A2F28F2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 07:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119882; cv=none; b=Z36oo7LupSU+WZZAt+iB2fqu6PHzGU0KJ95LBfGGBHRHEEgDUxnQ17UwdpNiiALAen4TXlKr5jLNUXisVpb3eqvVmcXtM0Ge2nBATcWQoF2SFoq/ORjvFT99mkgJEEIFe/u3ZxrKUEezQUQEWIGUD/n1FC33kJ+d+XrjZjf4yYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119882; c=relaxed/simple;
	bh=VnNG+je4Lg3LmZw8AWVpXwp/KZFby0hE6gSZ6AqLHjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cGh3dnTLO19gl2CqO8HRPelfvjpu6d0Gjq2BD+Z+ub3Tpue31CsuvJ6HQeTQVkH/XOm0Un6/YYhfBRD+MLkO+dkMv3McFMwuRbIuHNl2kmhKnwDY3h3IVH7n1suBKJ8suUVMoOkcpvnUVTwYDwbsCB8k0vpwB1oGfoatlCb8P14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgXMP8oi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761119881; x=1792655881;
  h=date:from:to:cc:subject:message-id;
  bh=VnNG+je4Lg3LmZw8AWVpXwp/KZFby0hE6gSZ6AqLHjc=;
  b=QgXMP8oih/cT4AGxZnxaw7tV/qPoNu4NZrwnStqa/oqnNacGMTwcKBgG
   KkFaZRLsAoqs/DtMLscrq+W3JKLQIty9f83j7hEY1WEREDDkeKDxEInis
   C3ZJuIJtCIYDcGjv6pxN60KJZZb5Si21nrdYLFaC2ZCtxpnmgFEWbWO9O
   8IXCa23nn3Jbfz0XsYSVv9BTSsqBqbeqw8E67EdoltetgovzPJEFevLX5
   10ehAtZKl1Q3dytzKhqNXJHvTJJwtNPALYency91GvsZsTrXHrS1iq5DG
   pIXrCZ6h0aUM1uKmBUFTNDmRbKSIBAhrwvlH5U3mXimhcLWxzAVj71At0
   Q==;
X-CSE-ConnectionGUID: NRCZik6gRR2sqo8wcjmATw==
X-CSE-MsgGUID: 354Iag1oST2E7w8lgEv89Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63355673"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63355673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:58:00 -0700
X-CSE-ConnectionGUID: bKNTcIMzSfyK47nD1GFMDw==
X-CSE-MsgGUID: kZCv3OgJRECOFRFGUVgk/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183694482"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2025 00:57:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBTj0-000C7r-1h;
	Wed, 22 Oct 2025 07:57:44 +0000
Date: Wed, 22 Oct 2025 15:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 ca575f89d70b11fab3d2997ab990179024497987
Message-ID: <202510221520.alVGymcu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: ca575f89d70b11fab3d2997ab990179024497987  Merge branch 'devel' into for-next

elapsed time: 1459m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251021    gcc-8.5.0
arc                   randconfig-002-20251021    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20251021    clang-22
arm                   randconfig-002-20251021    clang-22
arm                   randconfig-003-20251021    clang-22
arm                   randconfig-004-20251021    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251021    gcc-15.1.0
arm64                 randconfig-002-20251021    clang-22
arm64                 randconfig-003-20251021    gcc-12.5.0
arm64                 randconfig-004-20251021    clang-18
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251021    gcc-15.1.0
csky                  randconfig-002-20251021    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251021    clang-22
hexagon               randconfig-002-20251021    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251021    clang-20
i386        buildonly-randconfig-002-20251021    clang-20
i386        buildonly-randconfig-003-20251021    clang-20
i386        buildonly-randconfig-004-20251021    gcc-14
i386        buildonly-randconfig-005-20251021    gcc-14
i386        buildonly-randconfig-006-20251021    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                 loongson3_defconfig    clang-22
loongarch             randconfig-001-20251021    clang-22
loongarch             randconfig-002-20251021    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251021    gcc-10.5.0
nios2                 randconfig-002-20251021    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251021    gcc-8.5.0
parisc                randconfig-002-20251021    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20251021    clang-22
powerpc               randconfig-002-20251021    clang-19
powerpc               randconfig-003-20251021    clang-22
powerpc                     redwood_defconfig    clang-22
powerpc64             randconfig-001-20251021    clang-22
powerpc64             randconfig-002-20251021    gcc-12.5.0
powerpc64             randconfig-003-20251021    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251021    gcc-8.5.0
riscv                 randconfig-002-20251021    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251021    clang-22
s390                  randconfig-002-20251021    gcc-11.5.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251021    gcc-9.5.0
sh                    randconfig-002-20251021    gcc-10.5.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251021    gcc-8.5.0
sparc                 randconfig-002-20251021    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251021    gcc-8.5.0
sparc64               randconfig-002-20251021    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251021    gcc-14
um                    randconfig-002-20251021    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251021    gcc-13
x86_64      buildonly-randconfig-002-20251021    clang-20
x86_64      buildonly-randconfig-003-20251021    clang-20
x86_64      buildonly-randconfig-004-20251021    clang-20
x86_64      buildonly-randconfig-005-20251021    gcc-14
x86_64      buildonly-randconfig-006-20251021    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251021    gcc-8.5.0
xtensa                randconfig-002-20251021    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

