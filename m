Return-Path: <linux-gpio+bounces-26989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F4BCF25A
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 10:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 245D034C8F6
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 08:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124C9238C1B;
	Sat, 11 Oct 2025 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6OyzIUy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B632C8B
	for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760171620; cv=none; b=LdFot6PZb31DsQ8WBCf6MSIGj2jVBQ9hb78Hn9UpRBqKoqFC2UpmonFeFCXsA7J5ILdBYQNaihT4tu/FcrCuqKZWAt8W30cI3Hj7jVNWenPUaMWF47zMgslC4tJTZk67GP3rjZHcJKzqguedp+vr4dzG4PoOv6Ybzrfky2cXXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760171620; c=relaxed/simple;
	bh=SmXmLu1SBNwY0PQ1aFMdjk+uMHmrVZwkaCmc7y01nCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d8iniDTYamIogwtiUFKJNy0zriBXAoyrojuL4OIRz3BZM256LD9ERk+s8fCiaXcwvTqZaiGyogysx81S/+tmJ6qP+Z1XHiMdvnT+447xqPndp+hhzUc4Jf1hOBcVqcPaOVQoqGC53M8oSMZG1mQvlDrltJAjklMCTljAK2b5Zp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6OyzIUy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760171615; x=1791707615;
  h=date:from:to:cc:subject:message-id;
  bh=SmXmLu1SBNwY0PQ1aFMdjk+uMHmrVZwkaCmc7y01nCo=;
  b=T6OyzIUyCwPve1XAiefGlDWZ57lqPJAycLIyOjqX8NmJi39bfVf8IMGN
   X68bobXQVN1sv0T39Y8LgRonoHQeSmQfbpfl1OA8c879OtMz91j/KaquQ
   fZXZyOM0ONTq8XDvvrD7KTdk3IZugIMsl71rglvcXJ9e10MsVaigf25kU
   H/nc6zrH/HXBa5+ICxYrvUq1lIGy/SgqSs2hDJMzo1T3J0lLEbtyZIbx6
   TSaEACQLpjn6WAYc+av+1n9Cqu9QOWnaVXvA/A4LSC4y9oYcOxfnoKiM/
   P81q4hPlWMb9c6T1E2L12/lgWIbS6tcSrFEuM1pRFNyuVBtXAQlMFwLFL
   Q==;
X-CSE-ConnectionGUID: au2VA/GBS7CQ2s08v+aw/g==
X-CSE-MsgGUID: sc3CBvt8SXWYC1ua12/ZOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62082315"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62082315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 01:33:34 -0700
X-CSE-ConnectionGUID: /RsptpiwTkexQMNoZbWMUA==
X-CSE-MsgGUID: /+9O5nCHRQS3d6UMRpLAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180746147"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Oct 2025 01:33:32 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7V2f-0003e5-2n;
	Sat, 11 Oct 2025 08:33:29 +0000
Date: Sat, 11 Oct 2025 16:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 b5f8aa8d4bde0cf3e4595af5a536da337e5f1c78
Message-ID: <202510111615.SJS1c6NE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: b5f8aa8d4bde0cf3e4595af5a536da337e5f1c78  gpio: wcd934x: mark the GPIO controller as sleeping

elapsed time: 1448m

configs tested: 251
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    clang-22
arc                                 defconfig    clang-19
arc                   randconfig-001-20251010    gcc-12.5.0
arc                   randconfig-001-20251011    clang-22
arc                   randconfig-002-20251010    gcc-8.5.0
arc                   randconfig-002-20251011    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          moxart_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20251010    gcc-8.5.0
arm                   randconfig-001-20251011    clang-22
arm                   randconfig-002-20251010    gcc-13.4.0
arm                   randconfig-002-20251011    clang-22
arm                   randconfig-003-20251010    gcc-8.5.0
arm                   randconfig-003-20251011    clang-22
arm                   randconfig-004-20251010    gcc-8.5.0
arm                   randconfig-004-20251011    clang-22
arm                           stm32_defconfig    clang-22
arm                           tegra_defconfig    clang-22
arm                         wpcm450_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251010    gcc-14.3.0
arm64                 randconfig-001-20251011    clang-22
arm64                 randconfig-002-20251010    clang-19
arm64                 randconfig-002-20251011    clang-22
arm64                 randconfig-003-20251010    clang-17
arm64                 randconfig-003-20251011    clang-22
arm64                 randconfig-004-20251010    gcc-15.1.0
arm64                 randconfig-004-20251011    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251010    gcc-15.1.0
csky                  randconfig-001-20251011    gcc-8.5.0
csky                  randconfig-002-20251010    gcc-10.5.0
csky                  randconfig-002-20251011    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251010    clang-22
hexagon               randconfig-001-20251011    gcc-8.5.0
hexagon               randconfig-002-20251010    clang-18
hexagon               randconfig-002-20251011    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251010    gcc-14
i386        buildonly-randconfig-001-20251011    clang-20
i386        buildonly-randconfig-002-20251010    clang-20
i386        buildonly-randconfig-002-20251011    clang-20
i386        buildonly-randconfig-003-20251010    clang-20
i386        buildonly-randconfig-003-20251011    clang-20
i386        buildonly-randconfig-004-20251010    gcc-14
i386        buildonly-randconfig-004-20251011    clang-20
i386        buildonly-randconfig-005-20251010    gcc-14
i386        buildonly-randconfig-005-20251011    clang-20
i386        buildonly-randconfig-006-20251010    gcc-14
i386        buildonly-randconfig-006-20251011    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251011    gcc-14
i386                  randconfig-002-20251011    gcc-14
i386                  randconfig-003-20251011    gcc-14
i386                  randconfig-004-20251011    gcc-14
i386                  randconfig-005-20251011    gcc-14
i386                  randconfig-006-20251011    gcc-14
i386                  randconfig-007-20251011    gcc-14
i386                  randconfig-011-20251011    clang-20
i386                  randconfig-012-20251011    clang-20
i386                  randconfig-013-20251011    clang-20
i386                  randconfig-014-20251011    clang-20
i386                  randconfig-015-20251011    clang-20
i386                  randconfig-016-20251011    clang-20
i386                  randconfig-017-20251011    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251010    clang-22
loongarch             randconfig-001-20251011    gcc-8.5.0
loongarch             randconfig-002-20251010    gcc-15.1.0
loongarch             randconfig-002-20251011    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251010    gcc-11.5.0
nios2                 randconfig-001-20251011    gcc-8.5.0
nios2                 randconfig-002-20251010    gcc-9.5.0
nios2                 randconfig-002-20251011    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251010    gcc-8.5.0
parisc                randconfig-001-20251011    gcc-8.5.0
parisc                randconfig-002-20251010    gcc-12.5.0
parisc                randconfig-002-20251011    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-19
powerpc                         ps3_defconfig    clang-22
powerpc               randconfig-001-20251010    clang-22
powerpc               randconfig-001-20251011    gcc-8.5.0
powerpc               randconfig-002-20251010    gcc-15.1.0
powerpc               randconfig-002-20251011    gcc-8.5.0
powerpc               randconfig-003-20251010    clang-22
powerpc               randconfig-003-20251011    gcc-8.5.0
powerpc64             randconfig-001-20251010    clang-22
powerpc64             randconfig-001-20251011    gcc-8.5.0
powerpc64             randconfig-002-20251010    gcc-14.3.0
powerpc64             randconfig-002-20251011    gcc-8.5.0
powerpc64             randconfig-003-20251010    gcc-13.4.0
powerpc64             randconfig-003-20251011    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251010    clang-22
riscv                 randconfig-001-20251011    clang-22
riscv                 randconfig-002-20251010    gcc-9.5.0
riscv                 randconfig-002-20251011    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251010    gcc-14.3.0
s390                  randconfig-001-20251011    clang-22
s390                  randconfig-002-20251010    clang-22
s390                  randconfig-002-20251011    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20251010    gcc-15.1.0
sh                    randconfig-001-20251011    clang-22
sh                    randconfig-002-20251010    gcc-15.1.0
sh                    randconfig-002-20251011    clang-22
sh                           se7750_defconfig    clang-22
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251010    gcc-11.5.0
sparc                 randconfig-001-20251011    clang-22
sparc                 randconfig-002-20251010    gcc-8.5.0
sparc                 randconfig-002-20251011    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251010    clang-20
sparc64               randconfig-001-20251011    clang-22
sparc64               randconfig-002-20251010    gcc-10.5.0
sparc64               randconfig-002-20251011    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251010    gcc-14
um                    randconfig-001-20251011    clang-22
um                    randconfig-002-20251010    gcc-14
um                    randconfig-002-20251011    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251010    clang-20
x86_64      buildonly-randconfig-001-20251011    clang-20
x86_64      buildonly-randconfig-002-20251010    clang-20
x86_64      buildonly-randconfig-002-20251011    clang-20
x86_64      buildonly-randconfig-003-20251010    clang-20
x86_64      buildonly-randconfig-003-20251011    clang-20
x86_64      buildonly-randconfig-004-20251010    clang-20
x86_64      buildonly-randconfig-004-20251011    clang-20
x86_64      buildonly-randconfig-005-20251010    gcc-14
x86_64      buildonly-randconfig-005-20251011    clang-20
x86_64      buildonly-randconfig-006-20251010    gcc-14
x86_64      buildonly-randconfig-006-20251011    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251011    gcc-14
x86_64                randconfig-002-20251011    gcc-14
x86_64                randconfig-003-20251011    gcc-14
x86_64                randconfig-004-20251011    gcc-14
x86_64                randconfig-005-20251011    gcc-14
x86_64                randconfig-006-20251011    gcc-14
x86_64                randconfig-007-20251011    gcc-14
x86_64                randconfig-008-20251011    gcc-14
x86_64                randconfig-071-20251011    clang-20
x86_64                randconfig-072-20251011    clang-20
x86_64                randconfig-073-20251011    clang-20
x86_64                randconfig-074-20251011    clang-20
x86_64                randconfig-075-20251011    clang-20
x86_64                randconfig-076-20251011    clang-20
x86_64                randconfig-077-20251011    clang-20
x86_64                randconfig-078-20251011    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251010    gcc-8.5.0
xtensa                randconfig-001-20251011    clang-22
xtensa                randconfig-002-20251010    gcc-9.5.0
xtensa                randconfig-002-20251011    clang-22
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

