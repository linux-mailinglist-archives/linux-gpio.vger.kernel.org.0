Return-Path: <linux-gpio+bounces-28656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C6C69467
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 8BA892B283
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76416304BDD;
	Tue, 18 Nov 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNsQ14LB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8640028751D
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467707; cv=none; b=kpdYlYJvYAZbcUYq7RdjPgf0L088zCCX9qP+jEEBtzkvimq42lk/kaezva5KayqzUciE1Ng5/wgu+wcnym7OndQ+dTlBS4i3PGr+SEiXvu5YTrMTPZ3XB7dWOMGUyy8Iin0D05jLRFN/0H9NjzcXvgjnWxOahx1yJ9KFq4BHOAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467707; c=relaxed/simple;
	bh=YMj505PqD7vlZ7BAyEFXaaoyCuhEpT+K7EW0xG3t+V8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nSwpTcnK7TpVaA+N1e7krDxqNv4Y2izQTy92+9IfbJyG60Gb9ZV6TVnI0hQ2H+HzdLaJh5C9dJg4kZNRNPG+zMGctfpBwD9BQQ6vDX5CewR87ZJe4PwnRc0KOUn2DXKwi2I6lKA86/R8C+AOk2Jf8p8D0WMCrvG9z7BC0oPDJm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNsQ14LB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763467706; x=1795003706;
  h=date:from:to:cc:subject:message-id;
  bh=YMj505PqD7vlZ7BAyEFXaaoyCuhEpT+K7EW0xG3t+V8=;
  b=PNsQ14LBQHcQ/JLGXt1kRbSxDo7qF3OiOpaQmAX5reOdwfyagM9CTgj3
   zMkvkvjU9R6awZycnmnX2KuOPVJIpcEhAaxkyHcqgSTWa1KRflZxdr9kl
   ns/aUXE3CTwCx6ltVojZEmTBBamdS2928FLGyTolhlsKDfABEn1xIEXdA
   dWwpg64CYsfmbtKz1TgkkU8GMD6tTE7/vCYWhZwPlxxFNanQ0Q2BhQmmP
   XaJTgP0FIb6zWGswXXh5N1REqdEw9mOz8C7Z603aKnkcy3LqApqDi03xR
   xsL5VdsXuD6QM59f4P1ee+tKNYfYYXoh9FnMFnPz5PJAn0pAmtvZnnG49
   g==;
X-CSE-ConnectionGUID: V4ETXrWnT0OHpfGooChi7Q==
X-CSE-MsgGUID: eL5WK82vSY+nxwk5/aS1MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="88137175"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="88137175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:08:25 -0800
X-CSE-ConnectionGUID: lfjFE+KnSaayKgQw0jzleA==
X-CSE-MsgGUID: To1ySbOPTbiMLucE5oAoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195655651"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2025 04:08:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLKVR-0001hq-2g;
	Tue, 18 Nov 2025 12:08:21 +0000
Date: Tue, 18 Nov 2025 20:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:ib-shared-gpios-for-v6.19-rc1] BUILD SUCCESS
 e511d484cbe44fe48a1b9f621f6a947c72503f9e
Message-ID: <202511182008.fBuPEQvi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git ib-shared-gpios-for-v6.19-rc1
branch HEAD: e511d484cbe44fe48a1b9f621f6a947c72503f9e  arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM

elapsed time: 1580m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251117    gcc-14.3.0
arc                   randconfig-002-20251117    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251117    clang-22
arm                   randconfig-002-20251117    gcc-14.3.0
arm                   randconfig-003-20251117    gcc-12.5.0
arm                   randconfig-004-20251117    gcc-10.5.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251117    clang-22
arm64                 randconfig-002-20251117    gcc-15.1.0
arm64                 randconfig-003-20251117    gcc-8.5.0
arm64                 randconfig-004-20251117    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251117    gcc-12.5.0
csky                  randconfig-002-20251117    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251118    clang-16
hexagon               randconfig-002-20251118    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251118    clang-20
i386        buildonly-randconfig-002-20251118    clang-20
i386        buildonly-randconfig-003-20251118    clang-20
i386        buildonly-randconfig-004-20251118    clang-20
i386        buildonly-randconfig-005-20251118    gcc-13
i386        buildonly-randconfig-006-20251118    clang-20
i386                  randconfig-001-20251118    clang-20
i386                  randconfig-002-20251118    clang-20
i386                  randconfig-003-20251118    gcc-14
i386                  randconfig-004-20251118    gcc-14
i386                  randconfig-005-20251118    clang-20
i386                  randconfig-006-20251118    gcc-14
i386                  randconfig-007-20251118    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-002-20251118    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                           gcw0_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251118    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251118    gcc-14.3.0
parisc                randconfig-002-20251118    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251118    clang-22
powerpc               randconfig-002-20251118    clang-22
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251118    gcc-13.4.0
powerpc64             randconfig-002-20251118    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251117    gcc-12.5.0
riscv                 randconfig-002-20251117    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251117    gcc-14.3.0
s390                  randconfig-002-20251117    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251117    gcc-15.1.0
sh                    randconfig-002-20251117    gcc-15.1.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251118    gcc-8.5.0
sparc                 randconfig-002-20251118    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251118    clang-22
sparc64               randconfig-002-20251118    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251118    clang-22
um                    randconfig-002-20251118    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251118    clang-20
x86_64      buildonly-randconfig-002-20251118    gcc-14
x86_64      buildonly-randconfig-003-20251118    clang-20
x86_64      buildonly-randconfig-004-20251118    clang-20
x86_64      buildonly-randconfig-005-20251118    clang-20
x86_64      buildonly-randconfig-006-20251118    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251118    clang-20
x86_64                randconfig-002-20251118    gcc-12
x86_64                randconfig-003-20251118    gcc-14
x86_64                randconfig-004-20251118    gcc-14
x86_64                randconfig-005-20251118    clang-20
x86_64                randconfig-006-20251118    clang-20
x86_64                randconfig-071-20251118    gcc-13
x86_64                randconfig-072-20251118    clang-20
x86_64                randconfig-073-20251118    gcc-14
x86_64                randconfig-074-20251118    gcc-13
x86_64                randconfig-075-20251118    gcc-14
x86_64                randconfig-076-20251118    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251118    gcc-9.5.0
xtensa                randconfig-002-20251118    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

