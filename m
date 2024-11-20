Return-Path: <linux-gpio+bounces-13136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D01AD9D3199
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 02:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 852D01F2357F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 01:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB68C8F0;
	Wed, 20 Nov 2024 01:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtullGUD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC99461
	for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732064784; cv=none; b=iHcEwf4lA8LNxkHZbzHPyK6iQ2Eq1a5Zu1dwkhprQjkh6NYyIvHvQp8LoHg6DN55qPOnc9hnBw+RjWeYvzLdGAVddnwl1hG4uPmpov2yIEh+7u5/RMlGOVfa4SDJ5+cEuH7FFWag4GftgTzvEgPCAMyCRwBNFQMz7HdUK/wLxQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732064784; c=relaxed/simple;
	bh=LuY03+uj4gONnvVuf4ftM8SdpLXa+0JQ4DY/CI/FiJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n6fCmf7ixB2UTh8ISMsNznI/hgJqCOjSCZF9AE/wCuvEsPS/riW3P2PMmiVbyEM3C1j6zbR8FEWwFYSlE+jJVmNre+5n0RRr9tVSIoKNUn7ftdSedqv9jY54xcyfB6/17ni7Y3rEYfu6/vmjCJZ/sQMHEzwzD3H9mWkMsaaXDRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtullGUD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732064783; x=1763600783;
  h=date:from:to:cc:subject:message-id;
  bh=LuY03+uj4gONnvVuf4ftM8SdpLXa+0JQ4DY/CI/FiJM=;
  b=RtullGUD1ERSiQhK+9IQgfKFAjSg0bvRwZnTxvfrVycgVUJJl8UngExY
   Xzp40DaGbKcD2fYUoqURsnqmFktaW6ypSHUYTshmloQqabKCCxbIOXSl2
   z7GVHGaO8bifuvoj2VNnGS5SC22247OiVhpiLIB5aso2TL5BFtTKIqxto
   wdBKFLXXDzPaDVjJCweVNTqEnAwMXADEgel2CoATZIkVuiom5mfERmYzp
   +kXNmMVWWFhdi2+Cfp//CjTnchiHXA8Fhrhz0X0q9P3Rs6peqQhyCXcNS
   MkFDMAPQ+yJfEEImyFTh4DEOP9IBusTiu6GfSM1Ovrj17rloAzi9bPmMV
   A==;
X-CSE-ConnectionGUID: CIyb79tnRx+/Rqqkqs7MUw==
X-CSE-MsgGUID: Gf28z6eYTT2WxFCa1Yb3Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49530051"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="49530051"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:06:23 -0800
X-CSE-ConnectionGUID: c1YxajeGSvWX+u9RcHiY4w==
X-CSE-MsgGUID: ZLtgtm5ZRZuKdzTRuFxDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="127289038"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2024 17:06:21 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZAh-0000JN-0I;
	Wed, 20 Nov 2024 01:06:19 +0000
Date: Wed, 20 Nov 2024 09:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 1aa06a2eb27647545a1dcaf0612b5192e2eda653
Message-ID: <202411200900.sHT6xi60-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 1aa06a2eb27647545a1dcaf0612b5192e2eda653  Merge fixup

elapsed time: 1412m

configs tested: 165
configs skipped: 9

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
arc                        nsimosci_defconfig    clang-15
arc                        vdk_hs38_defconfig    clang-20
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                        keystone_defconfig    clang-20
arm                         lpc32xx_defconfig    clang-15
arm                   milbeaut_m10v_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                             pxa_defconfig    clang-20
arm                             rpc_defconfig    clang-20
arm                       spear13xx_defconfig    clang-20
arm                        spear3xx_defconfig    clang-15
arm                        spear6xx_defconfig    clang-20
arm                           u8500_defconfig    clang-20
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
i386        buildonly-randconfig-001-20241119    clang-19
i386        buildonly-randconfig-002-20241119    clang-19
i386        buildonly-randconfig-003-20241119    clang-19
i386        buildonly-randconfig-004-20241119    clang-19
i386        buildonly-randconfig-005-20241119    clang-19
i386        buildonly-randconfig-006-20241119    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241119    clang-19
i386                  randconfig-002-20241119    clang-19
i386                  randconfig-003-20241119    clang-19
i386                  randconfig-004-20241119    clang-19
i386                  randconfig-005-20241119    clang-19
i386                  randconfig-006-20241119    clang-19
i386                  randconfig-011-20241119    clang-19
i386                  randconfig-012-20241119    clang-19
i386                  randconfig-013-20241119    clang-19
i386                  randconfig-014-20241119    clang-19
i386                  randconfig-015-20241119    clang-19
i386                  randconfig-016-20241119    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    clang-15
m68k                       m5208evb_defconfig    clang-20
m68k                       m5249evb_defconfig    clang-20
m68k                       m5275evb_defconfig    clang-15
m68k                        m5307c3_defconfig    clang-20
m68k                            mac_defconfig    clang-20
m68k                            q40_defconfig    clang-20
m68k                          sun3x_defconfig    clang-15
m68k                           virt_defconfig    clang-15
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-20
mips                          eyeq5_defconfig    clang-20
mips                           gcw0_defconfig    clang-15
mips                       rbtx49xx_defconfig    clang-20
mips                        vocore2_defconfig    clang-15
mips                           xway_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    clang-15
powerpc                      mgcoge_defconfig    clang-15
powerpc                 mpc836x_rdk_defconfig    clang-15
powerpc                     ppa8548_defconfig    clang-15
powerpc                     redwood_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    clang-20
sh                           se7722_defconfig    clang-20
sh                           se7724_defconfig    clang-15
sh                        sh7763rdp_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    clang-20
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-15
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241119    gcc-12
x86_64      buildonly-randconfig-002-20241119    gcc-12
x86_64      buildonly-randconfig-003-20241119    gcc-12
x86_64      buildonly-randconfig-004-20241119    gcc-12
x86_64      buildonly-randconfig-005-20241119    gcc-12
x86_64      buildonly-randconfig-006-20241119    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241119    gcc-12
x86_64                randconfig-002-20241119    gcc-12
x86_64                randconfig-003-20241119    gcc-12
x86_64                randconfig-004-20241119    gcc-12
x86_64                randconfig-005-20241119    gcc-12
x86_64                randconfig-006-20241119    gcc-12
x86_64                randconfig-011-20241119    gcc-12
x86_64                randconfig-012-20241119    gcc-12
x86_64                randconfig-013-20241119    gcc-12
x86_64                randconfig-014-20241119    gcc-12
x86_64                randconfig-015-20241119    gcc-12
x86_64                randconfig-016-20241119    gcc-12
x86_64                randconfig-071-20241119    gcc-12
x86_64                randconfig-072-20241119    gcc-12
x86_64                randconfig-073-20241119    gcc-12
x86_64                randconfig-074-20241119    gcc-12
x86_64                randconfig-075-20241119    gcc-12
x86_64                randconfig-076-20241119    gcc-12
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

