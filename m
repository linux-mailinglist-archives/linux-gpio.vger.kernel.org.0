Return-Path: <linux-gpio+bounces-14497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4CA011E6
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 03:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 128B9163ECA
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 02:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039DDF9D9;
	Sat,  4 Jan 2025 02:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6rCWPHx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D32914
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jan 2025 02:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735957069; cv=none; b=rItmUhtflRuu2mScmq1Ezs9ateF1JwFUIB7FJSQjso9vDppKOb711MVWMbVlDtBRTfRYPEIb7mZBTF/zKU/NRon2g7ayvgpSNVse3O9Iryqj2LDKJRhB02X1O4d/rCpWlezXZOmM+W3Cdjh83mHQUPD/V/uXcugEQHWYDdMImjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735957069; c=relaxed/simple;
	bh=2jzoz65vmiHsbbwEoN2a3w/wf85fYrvWH4rw1w+etcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kIvLq+CB98ZNeTeuI2Fa8F6CH9Vjevl5hDSBObU/WVf3eDqX6TOalmH5TKfyep/pCJaINwaJMamXfoR+VOZ9LxYbju9IDlU1OWBSXoExZGmk8Lb2erGLPEwTeWNtbCgjNnBJ6MqWU/evW+p8cOgmqOGf51pQQC8gBiysoFsxp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6rCWPHx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735957067; x=1767493067;
  h=date:from:to:cc:subject:message-id;
  bh=2jzoz65vmiHsbbwEoN2a3w/wf85fYrvWH4rw1w+etcY=;
  b=C6rCWPHx8BHjJL3om2ndbZZLp2A+JLvNccQ4ZDjy1T1qSzMfyQWrW4So
   HWRnrAF31mvSTlAakb6mZwb/aBbXiCnzwwDcztz9YaXo8NW+kku8eMN09
   M97IQd/uErggMmkj5eBklVlnLTJhkwkJTl3KYkNVJnLQ26lgFPfVLkPyl
   5FxgDd7N6j3FgKjv07IeqazczkNyLeB9ouUGZgiOYPnqEhI1Uy5sjTnMu
   w8ewujdgONchlZuFJU6VQbGL/hzx58ibmDGkipxxSnVimdZvpUhW9P0jk
   AkhwD40Te85B/o7JO9vaMxOPHvnJcykcbudNU3qBFk5SL5WmC7QujQQPp
   Q==;
X-CSE-ConnectionGUID: 2F+dcSvESaCewIC2dUNoCw==
X-CSE-MsgGUID: 4lMOz1fqRqKGHv/oRf6PZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="40129009"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="40129009"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 18:17:46 -0800
X-CSE-ConnectionGUID: BSnf45sWS1mBBwM7xlDTbQ==
X-CSE-MsgGUID: 0FCe/cstTGqbhfdD0sH/ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102426923"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 18:17:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTtjS-000AYZ-2a;
	Sat, 04 Jan 2025 02:17:42 +0000
Date: Sat, 04 Jan 2025 10:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 e5fc03a0d7c648952c20caa4bdfa43d784b61bb4
Message-ID: <202501041008.KNfrMZbx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: e5fc03a0d7c648952c20caa4bdfa43d784b61bb4  Merge branch 'devel' into for-next

elapsed time: 1446m

configs tested: 319
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-20
arc                   randconfig-001-20250103    clang-20
arc                   randconfig-001-20250103    gcc-13.2.0
arc                   randconfig-001-20250104    clang-16
arc                   randconfig-002-20250103    clang-20
arc                   randconfig-002-20250103    gcc-13.2.0
arc                   randconfig-002-20250104    clang-16
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-20
arm                   randconfig-001-20250103    clang-20
arm                   randconfig-001-20250104    clang-16
arm                   randconfig-002-20250103    clang-15
arm                   randconfig-002-20250103    clang-20
arm                   randconfig-002-20250104    clang-16
arm                   randconfig-003-20250103    clang-20
arm                   randconfig-003-20250103    gcc-14.2.0
arm                   randconfig-003-20250104    clang-16
arm                   randconfig-004-20250103    clang-20
arm                   randconfig-004-20250104    clang-16
arm                           stm32_defconfig    clang-20
arm                           sunxi_defconfig    gcc-13.2.0
arm                           u8500_defconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250103    clang-19
arm64                 randconfig-001-20250103    clang-20
arm64                 randconfig-001-20250104    clang-16
arm64                 randconfig-002-20250103    clang-20
arm64                 randconfig-002-20250104    clang-16
arm64                 randconfig-003-20250103    clang-19
arm64                 randconfig-003-20250103    clang-20
arm64                 randconfig-003-20250104    clang-16
arm64                 randconfig-004-20250103    clang-20
arm64                 randconfig-004-20250104    clang-16
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250103    gcc-14.2.0
csky                  randconfig-001-20250104    gcc-14.2.0
csky                  randconfig-002-20250103    gcc-14.2.0
csky                  randconfig-002-20250104    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250103    clang-20
hexagon               randconfig-001-20250103    gcc-14.2.0
hexagon               randconfig-001-20250104    gcc-14.2.0
hexagon               randconfig-002-20250103    clang-20
hexagon               randconfig-002-20250103    gcc-14.2.0
hexagon               randconfig-002-20250104    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250103    clang-19
i386        buildonly-randconfig-001-20250104    clang-19
i386        buildonly-randconfig-002-20250103    clang-19
i386        buildonly-randconfig-002-20250104    clang-19
i386        buildonly-randconfig-003-20250103    gcc-12
i386        buildonly-randconfig-003-20250104    clang-19
i386        buildonly-randconfig-004-20250103    clang-19
i386        buildonly-randconfig-004-20250104    clang-19
i386        buildonly-randconfig-005-20250103    clang-19
i386        buildonly-randconfig-005-20250104    clang-19
i386        buildonly-randconfig-006-20250103    gcc-12
i386        buildonly-randconfig-006-20250104    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250103    clang-19
i386                  randconfig-001-20250104    gcc-12
i386                  randconfig-002-20250103    clang-19
i386                  randconfig-002-20250104    gcc-12
i386                  randconfig-003-20250103    clang-19
i386                  randconfig-003-20250104    gcc-12
i386                  randconfig-004-20250103    clang-19
i386                  randconfig-004-20250104    gcc-12
i386                  randconfig-005-20250103    clang-19
i386                  randconfig-005-20250104    gcc-12
i386                  randconfig-006-20250103    clang-19
i386                  randconfig-006-20250104    gcc-12
i386                  randconfig-007-20250103    clang-19
i386                  randconfig-007-20250104    gcc-12
i386                  randconfig-011-20250103    gcc-12
i386                  randconfig-011-20250104    gcc-12
i386                  randconfig-012-20250103    gcc-12
i386                  randconfig-012-20250104    gcc-12
i386                  randconfig-013-20250103    gcc-12
i386                  randconfig-013-20250104    gcc-12
i386                  randconfig-014-20250103    gcc-12
i386                  randconfig-014-20250104    gcc-12
i386                  randconfig-015-20250103    gcc-12
i386                  randconfig-015-20250104    gcc-12
i386                  randconfig-016-20250103    gcc-12
i386                  randconfig-016-20250104    gcc-12
i386                  randconfig-017-20250103    gcc-12
i386                  randconfig-017-20250104    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250103    gcc-14.2.0
loongarch             randconfig-001-20250104    gcc-14.2.0
loongarch             randconfig-002-20250103    gcc-14.2.0
loongarch             randconfig-002-20250104    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-13.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                         db1xxx_defconfig    gcc-13.2.0
mips                           ip22_defconfig    clang-20
mips                     loongson1b_defconfig    clang-20
mips                      maltaaprp_defconfig    clang-20
mips                       rbtx49xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250103    gcc-14.2.0
nios2                 randconfig-001-20250104    gcc-14.2.0
nios2                 randconfig-002-20250103    gcc-14.2.0
nios2                 randconfig-002-20250104    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250103    gcc-14.2.0
parisc                randconfig-001-20250104    gcc-14.2.0
parisc                randconfig-002-20250103    gcc-14.2.0
parisc                randconfig-002-20250104    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                     ksi8560_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    gcc-13.2.0
powerpc                      ppc6xx_defconfig    clang-20
powerpc               randconfig-001-20250103    clang-17
powerpc               randconfig-001-20250103    gcc-14.2.0
powerpc               randconfig-001-20250104    gcc-14.2.0
powerpc               randconfig-002-20250103    clang-19
powerpc               randconfig-002-20250103    gcc-14.2.0
powerpc               randconfig-002-20250104    gcc-14.2.0
powerpc               randconfig-003-20250103    gcc-14.2.0
powerpc               randconfig-003-20250104    gcc-14.2.0
powerpc                    socrates_defconfig    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc64             randconfig-001-20250103    clang-19
powerpc64             randconfig-001-20250103    gcc-14.2.0
powerpc64             randconfig-001-20250104    gcc-14.2.0
powerpc64             randconfig-002-20250103    gcc-14.2.0
powerpc64             randconfig-002-20250104    gcc-14.2.0
powerpc64             randconfig-003-20250103    clang-19
powerpc64             randconfig-003-20250103    gcc-14.2.0
powerpc64             randconfig-003-20250104    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250103    clang-20
riscv                 randconfig-001-20250104    gcc-11
riscv                 randconfig-002-20250103    clang-20
riscv                 randconfig-002-20250104    gcc-11
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250103    clang-20
s390                  randconfig-001-20250103    gcc-14.2.0
s390                  randconfig-001-20250104    gcc-11
s390                  randconfig-002-20250103    clang-20
s390                  randconfig-002-20250103    gcc-14.2.0
s390                  randconfig-002-20250104    gcc-11
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                            hp6xx_defconfig    clang-20
sh                          r7780mp_defconfig    clang-20
sh                    randconfig-001-20250103    clang-20
sh                    randconfig-001-20250103    gcc-14.2.0
sh                    randconfig-001-20250104    gcc-11
sh                    randconfig-002-20250103    clang-20
sh                    randconfig-002-20250103    gcc-14.2.0
sh                    randconfig-002-20250104    gcc-11
sh                          rsk7264_defconfig    gcc-13.2.0
sh                          sdk7786_defconfig    gcc-13.2.0
sh                           se7343_defconfig    clang-20
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250103    clang-20
sparc                 randconfig-001-20250103    gcc-14.2.0
sparc                 randconfig-001-20250104    gcc-11
sparc                 randconfig-002-20250103    clang-20
sparc                 randconfig-002-20250103    gcc-14.2.0
sparc                 randconfig-002-20250104    gcc-11
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250103    clang-20
sparc64               randconfig-001-20250103    gcc-14.2.0
sparc64               randconfig-001-20250104    gcc-11
sparc64               randconfig-002-20250103    clang-20
sparc64               randconfig-002-20250103    gcc-14.2.0
sparc64               randconfig-002-20250104    gcc-11
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250103    clang-20
um                    randconfig-001-20250103    gcc-11
um                    randconfig-001-20250104    gcc-11
um                    randconfig-002-20250103    clang-20
um                    randconfig-002-20250104    gcc-11
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250103    clang-19
x86_64      buildonly-randconfig-001-20250103    gcc-12
x86_64      buildonly-randconfig-002-20250103    clang-19
x86_64      buildonly-randconfig-003-20250103    clang-19
x86_64      buildonly-randconfig-003-20250103    gcc-12
x86_64      buildonly-randconfig-004-20250103    clang-19
x86_64      buildonly-randconfig-005-20250103    clang-19
x86_64      buildonly-randconfig-006-20250103    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250103    gcc-12
x86_64                randconfig-001-20250104    clang-19
x86_64                randconfig-002-20250103    gcc-12
x86_64                randconfig-002-20250104    clang-19
x86_64                randconfig-003-20250103    gcc-12
x86_64                randconfig-003-20250104    clang-19
x86_64                randconfig-004-20250103    gcc-12
x86_64                randconfig-004-20250104    clang-19
x86_64                randconfig-005-20250103    gcc-12
x86_64                randconfig-005-20250104    clang-19
x86_64                randconfig-006-20250103    gcc-12
x86_64                randconfig-006-20250104    clang-19
x86_64                randconfig-007-20250103    gcc-12
x86_64                randconfig-007-20250104    clang-19
x86_64                randconfig-008-20250103    gcc-12
x86_64                randconfig-008-20250104    clang-19
x86_64                randconfig-071-20250103    clang-19
x86_64                randconfig-071-20250104    gcc-11
x86_64                randconfig-072-20250103    clang-19
x86_64                randconfig-072-20250104    gcc-11
x86_64                randconfig-073-20250103    clang-19
x86_64                randconfig-073-20250104    gcc-11
x86_64                randconfig-074-20250103    clang-19
x86_64                randconfig-074-20250104    gcc-11
x86_64                randconfig-075-20250103    clang-19
x86_64                randconfig-075-20250104    gcc-11
x86_64                randconfig-076-20250103    clang-19
x86_64                randconfig-076-20250104    gcc-11
x86_64                randconfig-077-20250103    clang-19
x86_64                randconfig-077-20250104    gcc-11
x86_64                randconfig-078-20250103    clang-19
x86_64                randconfig-078-20250104    gcc-11
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250103    clang-20
xtensa                randconfig-001-20250103    gcc-14.2.0
xtensa                randconfig-001-20250104    gcc-11
xtensa                randconfig-002-20250103    clang-20
xtensa                randconfig-002-20250103    gcc-14.2.0
xtensa                randconfig-002-20250104    gcc-11
xtensa                         virt_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

