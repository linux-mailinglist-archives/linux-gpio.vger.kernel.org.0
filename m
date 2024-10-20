Return-Path: <linux-gpio+bounces-11695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C79A555D
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 19:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 162521F21A07
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 17:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F0E194C83;
	Sun, 20 Oct 2024 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kvg20dVB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B84320E
	for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2024 17:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729445760; cv=none; b=Dou9mwFWSGVm4sYiyd2jCZAfx9c+0BTEYyz5Z+Jc9j58IcLZ5WgZW/WOUGHvmq6ucVLTFb19AP7KONaXULKnvV+W2kSNUG2YXq6F9SXomzrK891HJ/n0oMR1qdlCSx5M2pagmkfuR4Qqe5zjdJLhnzSLs4lFI0gFKwHMdHxgADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729445760; c=relaxed/simple;
	bh=tq7T6stqMacmgdrh7eDBtfBGFbEQQvzYF5mCuPc0FFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V0nVRMgHt7JFLhHxF/jOUSrcz1X34AVZJbYbNQAyQkB9n3z16F7HTD4KCvFcjFm/q27R0185QmENlg3PkcN2/8vhidGUMNQFKLuWbIOC4s6X/ggwbnjN8qOHQLbS7/0aYz2LOjdzr5HdI1+BL01g8j7taLTcVqn8H85/viWWzgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kvg20dVB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729445758; x=1760981758;
  h=date:from:to:cc:subject:message-id;
  bh=tq7T6stqMacmgdrh7eDBtfBGFbEQQvzYF5mCuPc0FFc=;
  b=Kvg20dVB6wWjGp3anOeBuRJJ0xqfKGOdYySkjgWpCJRekXU4T4clMG+u
   Z+WRYwQaSkmoGb++SYLrwVDr0IkxGVvkUo40KMdSqIijogM1Yr8hlym6c
   CYfCwNoEq5QsoggwxhQTbI7Cr2vcun4xxp9mqMUJmwVaECKWNMbkOCj99
   c8C2xOBivThkhFt2heqCfgyy9d/c7GfnziQjd+9g6lsX0B11iLbh2Cgra
   1xnjUcd8BlJdjthNCiDwqsvDvZLWptNmyi11r6wsn8Qx2Oh3UNvG465L2
   iMT/5cJOwNAZdYRHo+K+sk9BQUSa8sPtfwfGbGfMElcld7izdHR6+mNmN
   A==;
X-CSE-ConnectionGUID: DGEoOeuKQSGXS6dfjbWt7w==
X-CSE-MsgGUID: K/bv+VbbSqWWFC39aMKwGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29045953"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="29045953"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 10:35:57 -0700
X-CSE-ConnectionGUID: Sxb3qdT1TiqJE3/ExOkYfA==
X-CSE-MsgGUID: BJLrMt3eR+ie5eO25Ceo1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="116779009"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 10:35:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2ZqL-000QXp-35;
	Sun, 20 Oct 2024 17:35:53 +0000
Date: Mon, 21 Oct 2024 01:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 fd716bb9e14b88b29c1c37b70f6171531aea8e5a
Message-ID: <202410210128.K3qaiMqm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: fd716bb9e14b88b29c1c37b70f6171531aea8e5a  Merge fixup

elapsed time: 1347m

configs tested: 149
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-20
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsimosci_defconfig    clang-20
arc                        vdk_hs38_defconfig    gcc-14.1.0
arm                              alldefconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       imx_v6_v7_defconfig    gcc-14.1.0
arm                            mmp2_defconfig    gcc-14.1.0
arm                          moxart_defconfig    clang-20
arm                        neponset_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                          pxa910_defconfig    gcc-14.1.0
arm                        shmobile_defconfig    gcc-14.1.0
arm                        spear6xx_defconfig    clang-20
arm                         wpcm450_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241020    gcc-12
i386        buildonly-randconfig-002-20241020    gcc-12
i386        buildonly-randconfig-003-20241020    gcc-12
i386        buildonly-randconfig-004-20241020    gcc-12
i386        buildonly-randconfig-005-20241020    gcc-12
i386        buildonly-randconfig-006-20241020    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241020    gcc-12
i386                  randconfig-002-20241020    gcc-12
i386                  randconfig-003-20241020    gcc-12
i386                  randconfig-004-20241020    gcc-12
i386                  randconfig-005-20241020    gcc-12
i386                  randconfig-006-20241020    gcc-12
i386                  randconfig-011-20241020    gcc-12
i386                  randconfig-012-20241020    gcc-12
i386                  randconfig-013-20241020    gcc-12
i386                  randconfig-014-20241020    gcc-12
i386                  randconfig-015-20241020    gcc-12
i386                  randconfig-016-20241020    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                         bigsur_defconfig    clang-20
mips                         bigsur_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
openrisc                 simple_smp_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    gcc-14.1.0
sh                          rsk7264_defconfig    clang-20
sh                           se7705_defconfig    gcc-14.1.0
sh                           se7712_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241020    gcc-11
x86_64      buildonly-randconfig-002-20241020    gcc-11
x86_64      buildonly-randconfig-003-20241020    gcc-11
x86_64      buildonly-randconfig-004-20241020    gcc-11
x86_64      buildonly-randconfig-005-20241020    gcc-11
x86_64      buildonly-randconfig-006-20241020    gcc-11
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20241020    gcc-11
x86_64                randconfig-002-20241020    gcc-11
x86_64                randconfig-003-20241020    gcc-11
x86_64                randconfig-004-20241020    gcc-11
x86_64                randconfig-005-20241020    gcc-11
x86_64                randconfig-006-20241020    gcc-11
x86_64                randconfig-011-20241020    gcc-11
x86_64                randconfig-012-20241020    gcc-11
x86_64                randconfig-013-20241020    gcc-11
x86_64                randconfig-014-20241020    gcc-11
x86_64                randconfig-015-20241020    gcc-11
x86_64                randconfig-016-20241020    gcc-11
x86_64                randconfig-071-20241020    gcc-11
x86_64                randconfig-072-20241020    gcc-11
x86_64                randconfig-073-20241020    gcc-11
x86_64                randconfig-074-20241020    gcc-11
x86_64                randconfig-075-20241020    gcc-11
x86_64                randconfig-076-20241020    gcc-11
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

