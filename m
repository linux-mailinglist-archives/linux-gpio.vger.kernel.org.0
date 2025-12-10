Return-Path: <linux-gpio+bounces-29418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F472CB220C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 07:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E890030133B0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 06:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271F42D8DB0;
	Wed, 10 Dec 2025 06:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDYBNMC8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E07080D
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349870; cv=none; b=X22y7WnaAnfV4iaUSO2XSkPH+Y3WsCvUpvHLUea6R+cJ+5q/wmTAV99ubMaVeyCX7Cuw30G/hsSD1QSGwQkmbPbnMKa+Oge6u/vuzPhwSlrizhqb17AUI4mZuQKACtlUUqNErcS5540UL/Fbs2pFwi7MglOGWjK0v22wCGNPKnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349870; c=relaxed/simple;
	bh=kYWeVOLfxQg0vPLffBLuW2LDeKisMM0Y8X9lfhkkHAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OL4DQeSeC3mQxXRToVNBBRvdahl2eJR/cyatCfFr41pyrmhHrwNjgGddFgVp1qCRnE8Hjwk08ydbzoNK9lashFWmfABkSu5NlzyoOHmSiZR18LtyRgzFr3KUyp24XUGSdCf9lg8Ny2rjswxFEwkJ7poQ51+u25uqb2lxv2EBpiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDYBNMC8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765349869; x=1796885869;
  h=date:from:to:cc:subject:message-id;
  bh=kYWeVOLfxQg0vPLffBLuW2LDeKisMM0Y8X9lfhkkHAY=;
  b=EDYBNMC8wIRpOCES/rbmQWZcrSRgw9gkLonIE2QvKe1SgpFhla86A+7c
   fxZY+TG7HAGwYqGhECLkf339uuutmTT3lHKBjUnjB0nrv1FvKE+nqFYHS
   BktmbiCIkaMb0YYeio7PtHRM9pg3mOcZkWUHDSC3Yeh/k4UshqhILYEW6
   P4XZNsuhqhXk30+peKyky9k4HQwCJt1wJ61O/j18R8n1Q/q9BoSJaSRKo
   7LsLHm4ptVZuy8fbD4rpfxLqB4uQ7iWl7B415/bgk4PU7Ek1CHFsgZ9jw
   axILFZKQGee86X0TNa+vXHFdJfoCN4xmQLEI3o2FDeu/UD17ZiMji+6nh
   g==;
X-CSE-ConnectionGUID: tgXVte0+TOWgc168k+SNaQ==
X-CSE-MsgGUID: I9gLjFX5QiCjvJKqFfEYvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77931160"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="77931160"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 22:57:48 -0800
X-CSE-ConnectionGUID: 3ReZMKmJQbaijmEcEZ7JyQ==
X-CSE-MsgGUID: ArHG3iGQRjqVIFuN8iWDlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="227483385"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 22:57:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTE8u-000000002mb-43MJ;
	Wed, 10 Dec 2025 06:57:44 +0000
Date: Wed, 10 Dec 2025 14:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 ea513dd3c066074b12e788114b45e0f2bda382cc
Message-ID: <202512101443.PGXoK8Kf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: ea513dd3c066074b12e788114b45e0f2bda382cc  gpio: shared: make locking more fine-grained

elapsed time: 1461m

configs tested: 291
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251209    gcc-13.4.0
arc                   randconfig-001-20251210    gcc-11.5.0
arc                   randconfig-002-20251209    gcc-9.5.0
arc                   randconfig-002-20251210    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251209    clang-19
arm                   randconfig-001-20251210    gcc-11.5.0
arm                   randconfig-002-20251209    clang-20
arm                   randconfig-002-20251210    gcc-11.5.0
arm                   randconfig-003-20251209    clang-22
arm                   randconfig-003-20251210    gcc-11.5.0
arm                   randconfig-004-20251209    clang-22
arm                   randconfig-004-20251210    gcc-11.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251209    gcc-8.5.0
arm64                 randconfig-001-20251210    clang-17
arm64                 randconfig-002-20251209    gcc-9.5.0
arm64                 randconfig-002-20251210    clang-17
arm64                 randconfig-003-20251209    clang-22
arm64                 randconfig-003-20251210    clang-17
arm64                 randconfig-004-20251209    gcc-11.5.0
arm64                 randconfig-004-20251210    clang-17
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251209    gcc-15.1.0
csky                  randconfig-001-20251210    clang-17
csky                  randconfig-002-20251209    gcc-15.1.0
csky                  randconfig-002-20251210    clang-17
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251209    clang-22
hexagon               randconfig-001-20251210    gcc-10.5.0
hexagon               randconfig-002-20251209    clang-22
hexagon               randconfig-002-20251210    gcc-10.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251210    clang-20
i386        buildonly-randconfig-002-20251210    clang-20
i386        buildonly-randconfig-003-20251210    clang-20
i386        buildonly-randconfig-004-20251210    clang-20
i386        buildonly-randconfig-005-20251210    clang-20
i386        buildonly-randconfig-006-20251210    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251210    clang-20
i386                  randconfig-001-20251210    gcc-14
i386                  randconfig-002-20251210    clang-20
i386                  randconfig-003-20251210    clang-20
i386                  randconfig-004-20251210    clang-20
i386                  randconfig-005-20251210    clang-20
i386                  randconfig-005-20251210    gcc-12
i386                  randconfig-006-20251210    clang-20
i386                  randconfig-006-20251210    gcc-14
i386                  randconfig-007-20251210    clang-20
i386                  randconfig-007-20251210    gcc-14
i386                  randconfig-011-20251209    clang-20
i386                  randconfig-011-20251210    clang-20
i386                  randconfig-011-20251210    gcc-14
i386                  randconfig-012-20251209    clang-20
i386                  randconfig-012-20251210    clang-20
i386                  randconfig-012-20251210    gcc-14
i386                  randconfig-013-20251209    clang-20
i386                  randconfig-013-20251210    clang-20
i386                  randconfig-013-20251210    gcc-14
i386                  randconfig-014-20251209    clang-20
i386                  randconfig-014-20251210    gcc-14
i386                  randconfig-015-20251210    clang-20
i386                  randconfig-015-20251210    gcc-14
i386                  randconfig-016-20251210    clang-20
i386                  randconfig-016-20251210    gcc-14
i386                  randconfig-017-20251210    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251209    clang-22
loongarch             randconfig-001-20251210    gcc-10.5.0
loongarch             randconfig-002-20251209    clang-22
loongarch             randconfig-002-20251210    gcc-10.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251209    gcc-8.5.0
nios2                 randconfig-001-20251210    gcc-10.5.0
nios2                 randconfig-002-20251209    gcc-11.5.0
nios2                 randconfig-002-20251210    gcc-10.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251209    gcc-8.5.0
parisc                randconfig-001-20251210    clang-19
parisc                randconfig-002-20251209    gcc-13.4.0
parisc                randconfig-002-20251210    clang-19
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251209    gcc-14.3.0
powerpc               randconfig-001-20251210    clang-19
powerpc               randconfig-002-20251209    clang-22
powerpc               randconfig-002-20251210    clang-19
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251209    gcc-14.3.0
powerpc64             randconfig-001-20251210    clang-19
powerpc64             randconfig-002-20251209    gcc-15.1.0
powerpc64             randconfig-002-20251210    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251209    clang-22
riscv                 randconfig-001-20251210    clang-22
riscv                 randconfig-002-20251209    clang-18
riscv                 randconfig-002-20251210    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251209    gcc-12.5.0
s390                  randconfig-001-20251210    clang-22
s390                  randconfig-002-20251209    gcc-12.5.0
s390                  randconfig-002-20251210    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251209    gcc-14.3.0
sh                    randconfig-001-20251210    clang-22
sh                    randconfig-002-20251209    gcc-13.4.0
sh                    randconfig-002-20251210    clang-22
sh                          rsk7264_defconfig    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7705_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251209    gcc-11.5.0
sparc                 randconfig-001-20251210    gcc-15.1.0
sparc                 randconfig-002-20251209    gcc-15.1.0
sparc                 randconfig-002-20251210    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251209    clang-22
sparc64               randconfig-001-20251210    gcc-15.1.0
sparc64               randconfig-002-20251209    clang-20
sparc64               randconfig-002-20251210    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251209    gcc-14
um                    randconfig-001-20251210    gcc-15.1.0
um                    randconfig-002-20251209    gcc-14
um                    randconfig-002-20251210    gcc-15.1.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251209    clang-20
x86_64      buildonly-randconfig-001-20251210    clang-20
x86_64      buildonly-randconfig-002-20251209    gcc-14
x86_64      buildonly-randconfig-002-20251210    clang-20
x86_64      buildonly-randconfig-003-20251209    gcc-14
x86_64      buildonly-randconfig-003-20251210    clang-20
x86_64      buildonly-randconfig-004-20251209    clang-20
x86_64      buildonly-randconfig-004-20251210    clang-20
x86_64      buildonly-randconfig-005-20251209    clang-20
x86_64      buildonly-randconfig-005-20251210    clang-20
x86_64      buildonly-randconfig-006-20251209    clang-20
x86_64      buildonly-randconfig-006-20251210    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251209    clang-20
x86_64                randconfig-001-20251210    gcc-14
x86_64                randconfig-002-20251209    clang-20
x86_64                randconfig-002-20251210    gcc-14
x86_64                randconfig-003-20251209    clang-20
x86_64                randconfig-003-20251210    gcc-14
x86_64                randconfig-004-20251209    gcc-14
x86_64                randconfig-004-20251210    gcc-14
x86_64                randconfig-005-20251209    gcc-14
x86_64                randconfig-005-20251210    gcc-14
x86_64                randconfig-006-20251209    gcc-14
x86_64                randconfig-006-20251210    gcc-14
x86_64                randconfig-011-20251209    gcc-14
x86_64                randconfig-012-20251209    clang-20
x86_64                randconfig-013-20251209    gcc-14
x86_64                randconfig-014-20251209    clang-20
x86_64                randconfig-015-20251209    clang-20
x86_64                randconfig-016-20251209    clang-20
x86_64                randconfig-071-20251209    clang-20
x86_64                randconfig-071-20251210    clang-20
x86_64                randconfig-072-20251209    gcc-14
x86_64                randconfig-072-20251210    clang-20
x86_64                randconfig-073-20251209    gcc-14
x86_64                randconfig-073-20251210    clang-20
x86_64                randconfig-074-20251209    gcc-14
x86_64                randconfig-074-20251210    clang-20
x86_64                randconfig-075-20251209    gcc-14
x86_64                randconfig-075-20251210    clang-20
x86_64                randconfig-076-20251209    clang-20
x86_64                randconfig-076-20251210    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251209    gcc-13.4.0
xtensa                randconfig-001-20251210    gcc-15.1.0
xtensa                randconfig-002-20251209    gcc-10.5.0
xtensa                randconfig-002-20251210    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

