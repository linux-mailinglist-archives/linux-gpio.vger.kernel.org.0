Return-Path: <linux-gpio+bounces-27872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67126C1FDCF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 12:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E19F2342E68
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 11:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1B933F8A2;
	Thu, 30 Oct 2025 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcCdBBET"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D652E7167
	for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761824559; cv=none; b=LNsTUgkwJyhhvbPvEv7a29vYkC8k7J0kbGInqJ+pN1EUMe8XmMLJ5AxxeCOuMRh3L2s0x98P+YquThbrjbe1LMKs8mjM/BV1Aa4ygyMCDgzd4NnqDwkWDCX4BEjjJXCpLXsXn5BIE+5twBfM5LQ6ol60bxFV/Vwd24zjy3wuhsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761824559; c=relaxed/simple;
	bh=na9EL3jBllwKhpnMguCsLIszMaUDHf4AAZbSB3fbp6E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IUYnNsU0SRHTpAuOTR4PTiIVSI3yio1ikBGVuiKJanFtzUWk5iv93QgXGNCgYmbNvHdf5kGukpUwqfRp6prGFw2jktR6Q7xOMKac6aNUoHD2+BlRJUYrBUm2q6mf7Iq4LfzXXgm3zQtShkOLF2Vg6uMpRwWj/NpyXmEmYbsUmco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcCdBBET; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761824557; x=1793360557;
  h=date:from:to:cc:subject:message-id;
  bh=na9EL3jBllwKhpnMguCsLIszMaUDHf4AAZbSB3fbp6E=;
  b=BcCdBBETtsmzj+MIDoQy/7JSFa+OfHQX/ozbIU6HbHrwKHqDEO5drK7p
   DyLMuzx/2DaDN5BRgAxZs4TOHFhndZFmnVmzomtp47gvaoMu6Svy03XDW
   mIUKJeZRg8TuFmhxJ366bKE5qCThbuLaJpiGZyzr2qDtRgvxkQ9DLDQC2
   BqmxDiyyuKSbh3FB0ClqTNoS/5nPRO38ZHaUpo8tkuJW5CJqYQIwwt+2a
   wkV8+BkK2NnnqVK2+ly2/2ac2x86yFSsmIFgOborPionol83itwWD2NfI
   /7ume5QGxxq9njbEdBwIT+MqwQ+I7apTnohDvNleNXbr2l6al6MchrGYO
   g==;
X-CSE-ConnectionGUID: X76xb9J+QiemuCx5JaeZOg==
X-CSE-MsgGUID: TlGvpnDyQc66xlLeSvrcqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="66578283"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="66578283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 04:42:36 -0700
X-CSE-ConnectionGUID: OlTzonhqSTmVeFDwQYtQdA==
X-CSE-MsgGUID: FL2W/zlTSWW0tV4g7FHAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="190006955"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Oct 2025 04:42:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vER32-000Lvc-2x;
	Thu, 30 Oct 2025 11:42:32 +0000
Date: Thu, 30 Oct 2025 19:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 aef72ebe9c86b516c6e126d4b453c96496547f0b
Message-ID: <202510301910.rrGnAVJw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: aef72ebe9c86b516c6e126d4b453c96496547f0b  dt-bindings: eeprom: at24: Add compatible for Belling BL24S64

elapsed time: 1458m

configs tested: 225
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251029    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251029    gcc-15.1.0
arc                   randconfig-002-20251030    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251029    gcc-8.5.0
arm                   randconfig-001-20251030    gcc-11.5.0
arm                   randconfig-002-20251029    clang-22
arm                   randconfig-002-20251030    gcc-11.5.0
arm                   randconfig-003-20251029    clang-22
arm                   randconfig-003-20251030    gcc-11.5.0
arm                   randconfig-004-20251029    clang-22
arm                   randconfig-004-20251030    gcc-11.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251030    clang-17
arm64                 randconfig-001-20251030    gcc-12.5.0
arm64                 randconfig-002-20251030    clang-17
arm64                 randconfig-002-20251030    gcc-8.5.0
arm64                 randconfig-003-20251030    clang-17
arm64                 randconfig-004-20251030    clang-17
arm64                 randconfig-004-20251030    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251030    clang-17
csky                  randconfig-001-20251030    gcc-13.4.0
csky                  randconfig-002-20251030    clang-17
csky                  randconfig-002-20251030    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251029    clang-20
hexagon               randconfig-001-20251030    clang-22
hexagon               randconfig-002-20251029    clang-22
hexagon               randconfig-002-20251030    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251030    clang-20
i386        buildonly-randconfig-001-20251030    gcc-14
i386        buildonly-randconfig-002-20251030    gcc-14
i386        buildonly-randconfig-003-20251030    clang-20
i386        buildonly-randconfig-003-20251030    gcc-14
i386        buildonly-randconfig-004-20251030    clang-20
i386        buildonly-randconfig-004-20251030    gcc-14
i386        buildonly-randconfig-005-20251030    gcc-14
i386        buildonly-randconfig-006-20251030    clang-20
i386        buildonly-randconfig-006-20251030    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251030    clang-20
i386                  randconfig-002-20251030    clang-20
i386                  randconfig-003-20251030    clang-20
i386                  randconfig-004-20251030    clang-20
i386                  randconfig-005-20251030    clang-20
i386                  randconfig-006-20251030    clang-20
i386                  randconfig-007-20251030    clang-20
i386                  randconfig-011-20251030    gcc-14
i386                  randconfig-012-20251030    gcc-14
i386                  randconfig-013-20251030    gcc-14
i386                  randconfig-014-20251030    gcc-14
i386                  randconfig-015-20251030    gcc-14
i386                  randconfig-016-20251030    gcc-14
i386                  randconfig-017-20251030    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251029    clang-22
loongarch             randconfig-001-20251030    clang-22
loongarch             randconfig-002-20251029    clang-22
loongarch             randconfig-002-20251030    clang-22
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251029    gcc-11.5.0
nios2                 randconfig-001-20251030    clang-22
nios2                 randconfig-002-20251029    gcc-9.5.0
nios2                 randconfig-002-20251030    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251030    clang-22
parisc                randconfig-001-20251030    gcc-8.5.0
parisc                randconfig-002-20251030    clang-22
parisc                randconfig-002-20251030    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251030    clang-22
powerpc               randconfig-002-20251030    clang-22
powerpc                     redwood_defconfig    gcc-15.1.0
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251030    clang-22
powerpc64             randconfig-001-20251030    gcc-8.5.0
powerpc64             randconfig-002-20251030    clang-22
powerpc64             randconfig-002-20251030    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251029    clang-20
riscv                 randconfig-001-20251030    gcc-15.1.0
riscv                 randconfig-002-20251029    clang-19
riscv                 randconfig-002-20251030    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251029    gcc-11.5.0
s390                  randconfig-001-20251030    gcc-15.1.0
s390                  randconfig-002-20251029    gcc-8.5.0
s390                  randconfig-002-20251030    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          lboxre2_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251029    gcc-11.5.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-002-20251029    gcc-15.1.0
sh                    randconfig-002-20251030    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251030    gcc-11.5.0
sparc                 randconfig-001-20251030    gcc-8.5.0
sparc                 randconfig-002-20251030    gcc-11.5.0
sparc                 randconfig-002-20251030    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251030    gcc-11.5.0
sparc64               randconfig-002-20251030    clang-20
sparc64               randconfig-002-20251030    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251030    gcc-11.5.0
um                    randconfig-001-20251030    gcc-14
um                    randconfig-002-20251030    clang-22
um                    randconfig-002-20251030    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251030    clang-20
x86_64      buildonly-randconfig-002-20251030    clang-20
x86_64      buildonly-randconfig-003-20251030    clang-20
x86_64      buildonly-randconfig-004-20251030    clang-20
x86_64      buildonly-randconfig-005-20251030    clang-20
x86_64      buildonly-randconfig-006-20251030    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251030    clang-20
x86_64                randconfig-002-20251030    clang-20
x86_64                randconfig-003-20251030    clang-20
x86_64                randconfig-004-20251030    clang-20
x86_64                randconfig-005-20251030    clang-20
x86_64                randconfig-006-20251030    clang-20
x86_64                randconfig-011-20251030    clang-20
x86_64                randconfig-012-20251030    clang-20
x86_64                randconfig-013-20251030    clang-20
x86_64                randconfig-014-20251030    clang-20
x86_64                randconfig-015-20251030    clang-20
x86_64                randconfig-016-20251030    clang-20
x86_64                randconfig-071-20251030    gcc-14
x86_64                randconfig-072-20251030    gcc-14
x86_64                randconfig-073-20251030    gcc-14
x86_64                randconfig-074-20251030    gcc-14
x86_64                randconfig-075-20251030    gcc-14
x86_64                randconfig-076-20251030    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251030    gcc-10.5.0
xtensa                randconfig-001-20251030    gcc-11.5.0
xtensa                randconfig-002-20251030    gcc-11.5.0
xtensa                randconfig-002-20251030    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

