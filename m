Return-Path: <linux-gpio+bounces-21680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C3ADC10F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 06:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310933A550F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 04:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911CA219303;
	Tue, 17 Jun 2025 04:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE2Pas+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875022F852
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 04:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750135669; cv=none; b=twHIf8wkRnoGL/UrdIUvQ7sPRYNJhfk5mgWmh/aPQZ4uQBzUCt9SEqSb6tDTQA5GgdJfCt6vcfaGf9wdXBn49AME5719Cmq/2ap4MIsyqOXXsjSUpWIvTBOuCMgEIvPcGOw24dbNNISCbCJE/5rF2l2UJblVrczIiqBHyq9yQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750135669; c=relaxed/simple;
	bh=XrffUNCyoJTc3GVkXWSVemTl0xNbs0D4NcQk/mAVECk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fRRnG3pWRvMzzE6ptB9o8CzUA0tmbKxsM5dDruSr89COIKOcu6e1WoLkoY+WxpB7jWBb58i2jltvFqI7IkucQex0eK5WfpAC7qqpOJAX8K5Yz5LJsJHo2ZbwxIC0zwuozz/28YEQcSTU2ihdeDWo30nIFJmwD+sy84MScPoDG9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE2Pas+8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750135667; x=1781671667;
  h=date:from:to:cc:subject:message-id;
  bh=XrffUNCyoJTc3GVkXWSVemTl0xNbs0D4NcQk/mAVECk=;
  b=gE2Pas+8Zpklu49Uuj2OM6Y5oKT5Z5lMRy2EUOKDT9ZqgYVB+QdTXuhW
   rczo30kqUJHvpETp7xIdVVsVm5YChQaivPq1NiMZWml06b1ByRyXgq4n4
   aUpa80xWh9qvg2NbSzUAAexfASbefm8YsZs1f6URxWhcP0sVcdynPVDFw
   oLUqcEPkqrgDxfqsEzUFPCYBIrfufR0Jr94KAVNySelkqVi1Jl/RTY0+c
   Zab3i+Lin0Z+3Ilohzf/mbBOrbhB73xKNJJbMbi5/cWl62UCxE+Ojf8eu
   UnAmEymPFEuXcW7+NUB8algZ8wdrDOiQxSNVIYUk3EiUCrrEgBOjtCGTz
   A==;
X-CSE-ConnectionGUID: 7/T/zjKhTcOFxEKnuiBPww==
X-CSE-MsgGUID: KnW2H12nRoS4TeKmJ4AKIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52388273"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="52388273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 21:47:45 -0700
X-CSE-ConnectionGUID: N85YY8HWQZaYTm06qvVC/w==
X-CSE-MsgGUID: SWVmDlUDSxejbGRuVP+pqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="185917867"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jun 2025 21:47:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uROEY-000Fb5-16;
	Tue, 17 Jun 2025 04:47:42 +0000
Date: Tue, 17 Jun 2025 12:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 e6382fcf989074566bb9a54bbd3c514d7bb99397
Message-ID: <202506171251.LQ8tLoBx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: e6382fcf989074566bb9a54bbd3c514d7bb99397  gpio: spacemit: Add missing MODULE_DEVICE_TABLE

elapsed time: 1222m

configs tested: 132
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250616    gcc-15.1.0
arc                   randconfig-002-20250616    gcc-15.1.0
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20250616    gcc-12.4.0
arm                   randconfig-002-20250616    gcc-15.1.0
arm                   randconfig-003-20250616    clang-21
arm                   randconfig-004-20250616    clang-21
arm                           sunxi_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250616    gcc-8.5.0
arm64                 randconfig-002-20250616    gcc-15.1.0
arm64                 randconfig-003-20250616    clang-19
arm64                 randconfig-004-20250616    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250616    gcc-13.3.0
csky                  randconfig-002-20250616    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250616    clang-21
hexagon               randconfig-002-20250616    clang-21
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250616    gcc-12
i386        buildonly-randconfig-002-20250616    gcc-11
i386        buildonly-randconfig-003-20250616    clang-20
i386        buildonly-randconfig-004-20250616    gcc-12
i386        buildonly-randconfig-005-20250616    gcc-12
i386        buildonly-randconfig-006-20250616    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250616    gcc-15.1.0
loongarch             randconfig-002-20250616    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250616    gcc-8.5.0
nios2                 randconfig-002-20250616    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250616    gcc-8.5.0
parisc                randconfig-002-20250616    gcc-9.3.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250616    clang-21
powerpc               randconfig-002-20250616    clang-21
powerpc               randconfig-003-20250616    clang-21
powerpc64             randconfig-001-20250616    gcc-8.5.0
powerpc64             randconfig-002-20250616    clang-21
powerpc64             randconfig-003-20250616    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250616    clang-19
riscv                 randconfig-002-20250616    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250616    gcc-11.5.0
s390                  randconfig-002-20250616    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250616    gcc-12.4.0
sh                    randconfig-002-20250616    gcc-12.4.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250616    gcc-13.3.0
sparc                 randconfig-002-20250616    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250616    gcc-13.3.0
sparc64               randconfig-002-20250616    gcc-8.5.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250616    clang-20
um                    randconfig-002-20250616    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250616    clang-20
x86_64      buildonly-randconfig-002-20250616    clang-20
x86_64      buildonly-randconfig-003-20250616    clang-20
x86_64      buildonly-randconfig-004-20250616    clang-20
x86_64      buildonly-randconfig-005-20250616    gcc-12
x86_64      buildonly-randconfig-006-20250616    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250616    gcc-13.3.0
xtensa                randconfig-002-20250616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

