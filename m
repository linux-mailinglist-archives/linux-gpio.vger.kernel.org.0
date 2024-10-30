Return-Path: <linux-gpio+bounces-12291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD56B9B5A06
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 03:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E43E2840D9
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 02:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54466193075;
	Wed, 30 Oct 2024 02:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJoP1nwb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA07489
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 02:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730256169; cv=none; b=brYMgD/hZC1smwv6lXEoma8dkiFIifxMK1m/KtV6fW3Cf+voWetKI8ZVIhZRwfZsFaLeyNGWM3VrxkjUgjQ7TXeleR91c0XmfJEn3h+NRy8ahUNqsosNUf7vIYlpvNg8PQlsfnM3PmFSCTK8U/XCmP7y5w0XdIxhsy5359gUlDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730256169; c=relaxed/simple;
	bh=hmLKtuTfmQSfU20n+hw6GXKI+LuR/90km3z/hU21Ojw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IUI6eNv9JXduwEFr1RYluvIOP0ghvqUU8l5qOcqAbDBrW4uzu9NgC6IgJqPqp/V5RxB42nThEXVEzLuyMOKf9dEKFRYC4ox0wytEab5Frad/QISOpdCqTB8I3RVVfHcx2u4aO8ZBknS7gZPhDPxMjp6fvpur1Ai8ImhU/U2q+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJoP1nwb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730256166; x=1761792166;
  h=date:from:to:cc:subject:message-id;
  bh=hmLKtuTfmQSfU20n+hw6GXKI+LuR/90km3z/hU21Ojw=;
  b=GJoP1nwbZvFP/8spo9/MVuVxb9zq8SkcKlbdXLuuNKDcJKbhxe678Si2
   Ru23FLm8mrbZUSmcjRRgKiLD+4yNSXVitpeMhAUNy3ctCKM8ictyMxM9/
   gsp9n5HJrfbzJYm9bcoqgPTm/reDHCWfwRtX+ZFNXXCI2uBiY5/Ql+rRV
   5mMD62g2vkUfRij9IxsfA45JU46U6ac9mACS9CfRYVGE6OPJgveyCv3Ij
   3B64OH34Lrodmqr49GM+8m42QtCJ/VKXpeuf1wAMW1NFJT8zOmx13dytz
   32YtKdR74mA2qHLpwWoRZ69Mj9wOLOnFi+YEdJ5kPZI927RXrWAMkWGi6
   A==;
X-CSE-ConnectionGUID: cfJ23YFjRdmyzfZ4QZT8qg==
X-CSE-MsgGUID: MA7ohBFoTduCL9+IHEEmxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30135709"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30135709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 19:42:45 -0700
X-CSE-ConnectionGUID: epKo4FsvTb+OQlw7uy/W6A==
X-CSE-MsgGUID: yHahwaqRTCivjR6eqcBFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82977896"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Oct 2024 19:42:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5yfR-000eQm-2m;
	Wed, 30 Oct 2024 02:42:41 +0000
Date: Wed, 30 Oct 2024 10:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 ef15f683aa18579c4591450836107ceda3da3239
Message-ID: <202410301017.I3JL0VU2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: ef15f683aa18579c4591450836107ceda3da3239  Merge tag 'samsung-pinctrl-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into devel

elapsed time: 979m

configs tested: 215
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241029    gcc-14.1.0
arc                   randconfig-002-20241029    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    gcc-14.1.0
arm                      integrator_defconfig    gcc-14.1.0
arm                        keystone_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    clang-20
arm                   randconfig-001-20241029    gcc-14.1.0
arm                   randconfig-002-20241029    gcc-14.1.0
arm                   randconfig-003-20241029    gcc-14.1.0
arm                   randconfig-004-20241029    gcc-14.1.0
arm                             rpc_defconfig    clang-20
arm                         s5pv210_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                           sama7_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241029    gcc-14.1.0
arm64                 randconfig-002-20241029    gcc-14.1.0
arm64                 randconfig-003-20241029    gcc-14.1.0
arm64                 randconfig-004-20241029    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241029    gcc-14.1.0
csky                  randconfig-002-20241029    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241029    gcc-14.1.0
hexagon               randconfig-002-20241029    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241029    clang-19
i386        buildonly-randconfig-001-20241030    gcc-12
i386        buildonly-randconfig-002-20241029    clang-19
i386        buildonly-randconfig-002-20241030    gcc-12
i386        buildonly-randconfig-003-20241029    clang-19
i386        buildonly-randconfig-003-20241030    gcc-12
i386        buildonly-randconfig-004-20241029    clang-19
i386        buildonly-randconfig-004-20241030    gcc-12
i386        buildonly-randconfig-005-20241029    clang-19
i386        buildonly-randconfig-005-20241030    gcc-12
i386        buildonly-randconfig-006-20241029    clang-19
i386        buildonly-randconfig-006-20241030    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241029    clang-19
i386                  randconfig-001-20241030    gcc-12
i386                  randconfig-002-20241029    clang-19
i386                  randconfig-002-20241030    gcc-12
i386                  randconfig-003-20241029    clang-19
i386                  randconfig-003-20241030    gcc-12
i386                  randconfig-004-20241029    clang-19
i386                  randconfig-004-20241030    gcc-12
i386                  randconfig-005-20241029    clang-19
i386                  randconfig-005-20241030    gcc-12
i386                  randconfig-006-20241029    clang-19
i386                  randconfig-006-20241030    gcc-12
i386                  randconfig-011-20241029    clang-19
i386                  randconfig-011-20241030    gcc-12
i386                  randconfig-012-20241029    clang-19
i386                  randconfig-012-20241030    gcc-12
i386                  randconfig-013-20241029    clang-19
i386                  randconfig-013-20241030    gcc-12
i386                  randconfig-014-20241029    clang-19
i386                  randconfig-014-20241030    gcc-12
i386                  randconfig-015-20241029    clang-19
i386                  randconfig-015-20241030    gcc-12
i386                  randconfig-016-20241029    clang-19
i386                  randconfig-016-20241030    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241029    gcc-14.1.0
loongarch             randconfig-002-20241029    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    clang-20
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241029    gcc-14.1.0
nios2                 randconfig-002-20241029    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241029    gcc-14.1.0
parisc                randconfig-002-20241029    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   lite5200b_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    gcc-14.1.0
powerpc                       ppc64_defconfig    clang-20
powerpc               randconfig-001-20241029    gcc-14.1.0
powerpc               randconfig-002-20241029    gcc-14.1.0
powerpc               randconfig-003-20241029    gcc-14.1.0
powerpc                     tqm8541_defconfig    clang-20
powerpc64             randconfig-001-20241029    gcc-14.1.0
powerpc64             randconfig-002-20241029    gcc-14.1.0
riscv                            alldefconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241029    gcc-14.1.0
riscv                 randconfig-002-20241029    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241029    gcc-14.1.0
s390                  randconfig-002-20241029    gcc-14.1.0
sh                               alldefconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                    randconfig-001-20241029    gcc-14.1.0
sh                    randconfig-002-20241029    gcc-14.1.0
sh                          rsk7264_defconfig    clang-20
sh                   rts7751r2dplus_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    clang-20
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241029    gcc-14.1.0
sparc64               randconfig-002-20241029    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241029    gcc-14.1.0
um                    randconfig-002-20241029    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241030    gcc-12
x86_64      buildonly-randconfig-002-20241030    gcc-12
x86_64      buildonly-randconfig-003-20241030    gcc-12
x86_64      buildonly-randconfig-004-20241030    gcc-12
x86_64      buildonly-randconfig-005-20241030    gcc-12
x86_64      buildonly-randconfig-006-20241030    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241030    gcc-12
x86_64                randconfig-002-20241030    gcc-12
x86_64                randconfig-003-20241030    gcc-12
x86_64                randconfig-004-20241030    gcc-12
x86_64                randconfig-005-20241030    gcc-12
x86_64                randconfig-006-20241030    gcc-12
x86_64                randconfig-011-20241030    gcc-12
x86_64                randconfig-012-20241030    gcc-12
x86_64                randconfig-013-20241030    gcc-12
x86_64                randconfig-014-20241030    gcc-12
x86_64                randconfig-015-20241030    gcc-12
x86_64                randconfig-016-20241030    gcc-12
x86_64                randconfig-071-20241030    gcc-12
x86_64                randconfig-072-20241030    gcc-12
x86_64                randconfig-073-20241030    gcc-12
x86_64                randconfig-074-20241030    gcc-12
x86_64                randconfig-075-20241030    gcc-12
x86_64                randconfig-076-20241030    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    clang-20
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20241029    gcc-14.1.0
xtensa                randconfig-002-20241029    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

