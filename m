Return-Path: <linux-gpio+bounces-13079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624289D1042
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 12:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21E34282316
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 11:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25788194A73;
	Mon, 18 Nov 2024 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/yTXJJO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05570176AA9
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731931049; cv=none; b=DQbERc7zKvoBHAOayWNN5FpmekdRfRu8nqWrTv9Y0EufJFnGFRqbbd7gO4x8mUylTm4eIiSVShfRnuOb/RrgkZQhaFGpBPlFqzwcBaQikFs9anVGAGEpwK8nuZmJC7iJtSQQFrNYzzO0PthbJ0HJjS42GFLMmx5C7zf7P2nbdu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731931049; c=relaxed/simple;
	bh=kV+X1ziy5+rRI00O+70E6Wa8MrcDbWzh4gbrsY6dAC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kig3QfYvQILYuIkPMDujG1CYCPWtjPjyrRty7/btSF/+x05ytuCRd6Tg5UcufFeQ45q3FlFieLDUwSxUG7mMLmXL1CmP2PPyta9qn6G8k8ce1Pvh8va6zar8X5aGKg3ej8uicD8BAqNxdSiO4P2So6CogtjThrYxGQZhtsc11AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/yTXJJO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731931047; x=1763467047;
  h=date:from:to:cc:subject:message-id;
  bh=kV+X1ziy5+rRI00O+70E6Wa8MrcDbWzh4gbrsY6dAC0=;
  b=A/yTXJJOiB7l+e0UPp4XLBjdvqZ60KjUT/rETrJEtoKkazetMv/VoNCn
   lNmKt1lYCo3PyycbiivzdmLt0kU2M4VXVvnyr9o3nWC4/tWy+T5BiFzaC
   R5OvUyUIXnIRhKinskTaBvtgXnFI8ngkZfNnv9hNpAhLP8mWM6mlN4Hhc
   e57Djc2Fx9wmW+TwTIR71GvsLhvkvLOMaGc0j5ULz9NPq33PG6stI1iMU
   QUFBCrrk/7JL+Z4wz4nl/0biMnbMKC8LDlzkL03YsjsU34WlywqEjC+k5
   Ec6I0xoj9GTUqVB++37aXvpc405MkFPakHPGY4XQNWR6ZtvhtZniX+QAL
   A==;
X-CSE-ConnectionGUID: NGaBC0GaSV+N31sxO4P7jQ==
X-CSE-MsgGUID: XFIZnjjXR/a/WseC7yoiwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35657423"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="35657423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 03:57:26 -0800
X-CSE-ConnectionGUID: fiKPaLIORU6pSdpxsIysjQ==
X-CSE-MsgGUID: 7s2T9cghS+WaE69GjS53Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="88770300"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2024 03:57:25 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD0Ne-0002PZ-2q;
	Mon, 18 Nov 2024 11:57:22 +0000
Date: Mon, 18 Nov 2024 19:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 d40b69c93650aac1b3ee8d83ef11c94e18f0c610
Message-ID: <202411181929.iblpYokF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: d40b69c93650aac1b3ee8d83ef11c94e18f0c610  pinctrl: qcom: spmi: fix debugfs drive strength

elapsed time: 724m

configs tested: 164
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    clang-20
arm                         axm55xx_defconfig    clang-20
arm                         bcm2835_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm                      footbridge_defconfig    clang-20
arm                           h3600_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-20
arm                        realview_defconfig    clang-20
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241118    gcc-12
i386        buildonly-randconfig-002-20241118    gcc-12
i386        buildonly-randconfig-003-20241118    gcc-12
i386        buildonly-randconfig-004-20241118    gcc-12
i386        buildonly-randconfig-005-20241118    gcc-12
i386        buildonly-randconfig-006-20241118    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241118    gcc-12
i386                  randconfig-002-20241118    gcc-12
i386                  randconfig-003-20241118    gcc-12
i386                  randconfig-004-20241118    gcc-12
i386                  randconfig-005-20241118    gcc-12
i386                  randconfig-006-20241118    gcc-12
i386                  randconfig-011-20241118    gcc-12
i386                  randconfig-012-20241118    gcc-12
i386                  randconfig-013-20241118    gcc-12
i386                  randconfig-014-20241118    gcc-12
i386                  randconfig-015-20241118    gcc-12
i386                  randconfig-016-20241118    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    clang-20
m68k                       m5475evb_defconfig    clang-20
m68k                          multi_defconfig    clang-20
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                         db1xxx_defconfig    clang-20
mips                           ip27_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-20
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc                    sam440ep_defconfig    clang-20
powerpc                         wii_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-20
sh                         ecovec24_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-20
sh                           se7750_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sh                            shmin_defconfig    clang-20
sparc                            alldefconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241118    gcc-12
x86_64      buildonly-randconfig-002-20241118    gcc-12
x86_64      buildonly-randconfig-003-20241118    gcc-12
x86_64      buildonly-randconfig-004-20241118    gcc-12
x86_64      buildonly-randconfig-005-20241118    gcc-12
x86_64      buildonly-randconfig-006-20241118    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241118    gcc-12
x86_64                randconfig-002-20241118    gcc-12
x86_64                randconfig-003-20241118    gcc-12
x86_64                randconfig-004-20241118    gcc-12
x86_64                randconfig-005-20241118    gcc-12
x86_64                randconfig-006-20241118    gcc-12
x86_64                randconfig-011-20241118    gcc-12
x86_64                randconfig-012-20241118    gcc-12
x86_64                randconfig-013-20241118    gcc-12
x86_64                randconfig-014-20241118    gcc-12
x86_64                randconfig-015-20241118    gcc-12
x86_64                randconfig-016-20241118    gcc-12
x86_64                randconfig-071-20241118    gcc-12
x86_64                randconfig-072-20241118    gcc-12
x86_64                randconfig-073-20241118    gcc-12
x86_64                randconfig-074-20241118    gcc-12
x86_64                randconfig-075-20241118    gcc-12
x86_64                randconfig-076-20241118    gcc-12
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                         virt_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

