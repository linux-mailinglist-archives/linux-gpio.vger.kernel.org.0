Return-Path: <linux-gpio+bounces-12658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EADFF9C00AB
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 09:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA911F23942
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 08:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B7B1DD529;
	Thu,  7 Nov 2024 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwqotkPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF311DD866
	for <linux-gpio@vger.kernel.org>; Thu,  7 Nov 2024 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969887; cv=none; b=s/SJ+V4mMdOimMak0MWJGQCFk9qyOAk4HegZf010ivg+sdA48u0mBmpENQnjoUD5u9y6vcLZ4Sg6kusFGfMipRueFC0IqTCgBeGK8C+N468ihFijIsPjN53wt6FL5MNfNohCF4iEvG4yFmb31PY9FBPdBdSW3ATWjmzl3aO8azY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969887; c=relaxed/simple;
	bh=TNhYrCtdBHEm9TyNtout9mqI5TNcYpe16F5h2gxnxy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PqNgn/j8BD/5zMZMHoE2O8APW1kWPSiWsQJMB0mDiTy7fHZ3vJGNf+RoqPUYEANO5Rmijq4j3BdfhCobuZbDanlQNRg7l1ZwZmv1FDp5rzsOyrbCJsRdgEGpgPLQy4z5gSfg22eC3Hg92aTJSguMyIo1yTMY5ZN4nssAlPgtr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwqotkPF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730969886; x=1762505886;
  h=date:from:to:cc:subject:message-id;
  bh=TNhYrCtdBHEm9TyNtout9mqI5TNcYpe16F5h2gxnxy4=;
  b=fwqotkPFkew9FCLA4oc9nRGjKf9pT82ei9vATOp5XASnYEH/pwncBf5a
   6avSdvqyUmYg6Eeghn8d0zfBNEzU9Rzh7k6Rt7NlitcKsQzGfeBnsgfnv
   ShffS54Sl1qjWTD+yrpU95D2qSsdXDZly2uYcZ+ebdH2HovnEKwsCTIbt
   85MkvrIXthtpvOVI7EvkMp9p55FFGrxRdxyKjmq1i66i9KWiQLJke+Veh
   ltUsNUWL1qy+SO8fpdiUL/Lyt/XcMRJzHAaGAkJCZQEQdxUEtbYc+UPH0
   WpVSm+XvIxReQ45OYEvn0KAmBaeJfFO0aMiftKe8CZFsIeAsPUKTnOY1F
   A==;
X-CSE-ConnectionGUID: /Ao+NgOVR4ap3e5z8+GOaQ==
X-CSE-MsgGUID: LL3QjfsKRjOQz7acbOWUAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30962218"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30962218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:58:05 -0800
X-CSE-ConnectionGUID: LAvUPyHtT3ahrRwT25HkxA==
X-CSE-MsgGUID: zSpPGKl9RN2kReXa2kqw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84549615"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 00:58:03 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8yL3-000q1e-2O;
	Thu, 07 Nov 2024 08:58:01 +0000
Date: Thu, 07 Nov 2024 16:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 c6789170ddef58d28cfbc3342933713ce1e2c860
Message-ID: <202411071637.01aK0Q5A-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c6789170ddef58d28cfbc3342933713ce1e2c860  gpio: Use of_property_present() for non-boolean properties

elapsed time: 1120m

configs tested: 252
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241107    gcc-13.2.0
arc                   randconfig-001-20241107    gcc-14.2.0
arc                   randconfig-002-20241107    gcc-13.2.0
arc                   randconfig-002-20241107    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                            hisi_defconfig    clang-20
arm                           imxrt_defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    clang-20
arm                             mxs_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241107    clang-16
arm                   randconfig-001-20241107    gcc-14.2.0
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-004-20241107    clang-20
arm                   randconfig-004-20241107    gcc-14.2.0
arm                             rpc_defconfig    clang-20
arm                             rpc_defconfig    gcc-14.2.0
arm                       spear13xx_defconfig    clang-20
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-003-20241107    clang-20
arm64                 randconfig-003-20241107    gcc-14.2.0
arm64                 randconfig-004-20241107    clang-20
arm64                 randconfig-004-20241107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241107    clang-20
hexagon               randconfig-001-20241107    gcc-14.2.0
hexagon               randconfig-002-20241107    clang-20
hexagon               randconfig-002-20241107    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241107    clang-19
i386        buildonly-randconfig-001-20241107    gcc-12
i386        buildonly-randconfig-002-20241107    clang-19
i386        buildonly-randconfig-002-20241107    gcc-12
i386        buildonly-randconfig-003-20241107    clang-19
i386        buildonly-randconfig-003-20241107    gcc-12
i386        buildonly-randconfig-004-20241107    clang-19
i386        buildonly-randconfig-004-20241107    gcc-12
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-006-20241107    clang-19
i386        buildonly-randconfig-006-20241107    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-002-20241107    clang-19
i386                  randconfig-002-20241107    gcc-12
i386                  randconfig-003-20241107    clang-19
i386                  randconfig-003-20241107    gcc-12
i386                  randconfig-004-20241107    clang-19
i386                  randconfig-004-20241107    gcc-12
i386                  randconfig-005-20241107    clang-19
i386                  randconfig-005-20241107    gcc-12
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-011-20241107    clang-19
i386                  randconfig-011-20241107    gcc-12
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-014-20241107    clang-19
i386                  randconfig-014-20241107    gcc-12
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-016-20241107    clang-19
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                          amiga_defconfig    clang-20
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    clang-20
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
mips                         bigsur_defconfig    clang-20
mips                         db1xxx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    clang-20
powerpc                        icon_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      pcm030_defconfig    clang-20
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241107    clang-16
powerpc               randconfig-001-20241107    gcc-14.2.0
powerpc               randconfig-002-20241107    clang-20
powerpc               randconfig-002-20241107    gcc-14.2.0
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc                     sequoia_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-002-20241107    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241107    clang-20
s390                  randconfig-001-20241107    gcc-14.2.0
s390                  randconfig-002-20241107    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    clang-20
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-20
sh                          lboxre2_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    clang-20
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sh                           se7721_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc                       sparc64_defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241107    clang-20
um                    randconfig-001-20241107    gcc-14.2.0
um                    randconfig-002-20241107    gcc-12
um                    randconfig-002-20241107    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-002-20241107    clang-19
x86_64      buildonly-randconfig-002-20241107    gcc-12
x86_64      buildonly-randconfig-003-20241107    clang-19
x86_64      buildonly-randconfig-003-20241107    gcc-12
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-005-20241107    clang-19
x86_64      buildonly-randconfig-005-20241107    gcc-12
x86_64      buildonly-randconfig-006-20241107    clang-19
x86_64      buildonly-randconfig-006-20241107    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-004-20241107    clang-19
x86_64                randconfig-004-20241107    gcc-12
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-011-20241107    clang-19
x86_64                randconfig-011-20241107    gcc-12
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-013-20241107    clang-19
x86_64                randconfig-013-20241107    gcc-12
x86_64                randconfig-014-20241107    clang-19
x86_64                randconfig-014-20241107    gcc-12
x86_64                randconfig-015-20241107    clang-19
x86_64                randconfig-015-20241107    gcc-12
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-074-20241107    clang-19
x86_64                randconfig-074-20241107    gcc-12
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-076-20241107    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

