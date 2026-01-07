Return-Path: <linux-gpio+bounces-30229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE2CFEEFB
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 17:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 774383121BE3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 16:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC51935BDBE;
	Wed,  7 Jan 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ago3jqCm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A535BDB7
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797815; cv=none; b=Bncg8bOtU/Ddtjh21hOHZbznyomMRoFv1MOuY0il0SstvZW54NamvbBUPk6Esys9a4BcEvPrcPTtsxkToeVoNHq36fwbHIyBvpet8zsUEnh7UjStpQYEk3bfaYVBfpx9B2MeCUaIpJq+iBt/4I+P5PLyWlOnMeQzdSICkiSXQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797815; c=relaxed/simple;
	bh=O+ZG1CgFXcEkxOmbmQFSMCg/Z+dQVb2hxK5xcWnAZV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D+iVE2+ieViZuQJosRxjqqwkwvwoAhLNbAuXR/RynZcifckScPANL8ia5VcZ7Ih7jsM4DkJ4CBmgrGY8ftWHhht6Jpg2fhBhsrKNHF3/cf2F1zwuNPlBYc8kgcn5PinzqwajTRtBTicgfuam6pacXKn2juHudrM+SEC9sbQhC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ago3jqCm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767797814; x=1799333814;
  h=date:from:to:cc:subject:message-id;
  bh=O+ZG1CgFXcEkxOmbmQFSMCg/Z+dQVb2hxK5xcWnAZV8=;
  b=Ago3jqCmV380PPz0vr2Ujri6/mA0v3PcgpjE1FeqsUJK6sNqwJlKHJU6
   ugLdJYtFNkTv1gAyqcEuUBJkA9mM5G3vZv9E9gMHemForhFOon06L9kKj
   q3gayyccYN7Ds67OtPo4Oio3OcRpunVYiF9c28Qs26R2TQDArqN1jXQDd
   IewwVGgHX+GyqEzOehFXuum7Kbozqq1o8Iw7c2szbSlCG9jEfJJkiKqt2
   YyjuVnD/DYKvTdlDlw00OmmQGjcQrV8XGnGQCAp4sirp6MabGhn7SvGtY
   r8b8m7ZhLlfzsErph0ypHZJnT079KfV3dB6uztvrZDnwEFcw2N2o7yehQ
   w==;
X-CSE-ConnectionGUID: fzuSvXA9RiKVzYwgTYEXqA==
X-CSE-MsgGUID: ratdlPJeRtKBbxFEer7xmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79470757"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="79470757"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 06:56:54 -0800
X-CSE-ConnectionGUID: L6LcJ7ZWRzOlA3WS5TWwUg==
X-CSE-MsgGUID: zkmLlHhKQVehIawPkp/bnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="207411599"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jan 2026 06:56:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdUxt-000000003uT-2XPi;
	Wed, 07 Jan 2026 14:56:49 +0000
Date: Wed, 07 Jan 2026 22:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 da64eb51595bc6073b2fb69c2a3859bba93ed75a
Message-ID: <202601072218.oWCmzGOq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: da64eb51595bc6073b2fb69c2a3859bba93ed75a  gpio: spacemit: Add GPIO support for K3 SoC

elapsed time: 1567m

configs tested: 221
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260107    gcc-14.3.0
arc                   randconfig-002-20260107    gcc-14.3.0
arc                   randconfig-002-20260107    gcc-8.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20260107    gcc-10.5.0
arm                   randconfig-001-20260107    gcc-14.3.0
arm                   randconfig-002-20260107    clang-22
arm                   randconfig-002-20260107    gcc-14.3.0
arm                   randconfig-003-20260107    clang-22
arm                   randconfig-003-20260107    gcc-14.3.0
arm                   randconfig-004-20260107    gcc-10.5.0
arm                   randconfig-004-20260107    gcc-14.3.0
arm                        vexpress_defconfig    clang-18
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260107    clang-22
arm64                 randconfig-002-20260107    clang-22
arm64                 randconfig-003-20260107    gcc-8.5.0
arm64                 randconfig-004-20260107    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260107    gcc-15.1.0
csky                  randconfig-002-20260107    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20260107    clang-22
hexagon               randconfig-001-20260107    gcc-8.5.0
hexagon               randconfig-002-20260107    clang-22
hexagon               randconfig-002-20260107    gcc-8.5.0
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260107    gcc-14
i386        buildonly-randconfig-002-20260107    gcc-14
i386        buildonly-randconfig-003-20260107    clang-20
i386        buildonly-randconfig-003-20260107    gcc-14
i386        buildonly-randconfig-004-20260107    gcc-14
i386        buildonly-randconfig-005-20260107    clang-20
i386        buildonly-randconfig-005-20260107    gcc-14
i386        buildonly-randconfig-006-20260107    clang-20
i386        buildonly-randconfig-006-20260107    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20260107    clang-20
i386                  randconfig-001-20260107    gcc-14
i386                  randconfig-002-20260107    clang-20
i386                  randconfig-002-20260107    gcc-14
i386                  randconfig-003-20260107    clang-20
i386                  randconfig-003-20260107    gcc-14
i386                  randconfig-004-20260107    clang-20
i386                  randconfig-004-20260107    gcc-14
i386                  randconfig-005-20260107    clang-20
i386                  randconfig-005-20260107    gcc-14
i386                  randconfig-006-20260107    clang-20
i386                  randconfig-006-20260107    gcc-14
i386                  randconfig-007-20260107    clang-20
i386                  randconfig-011-20260107    clang-20
i386                  randconfig-011-20260107    gcc-13
i386                  randconfig-012-20260107    clang-20
i386                  randconfig-012-20260107    gcc-14
i386                  randconfig-013-20260107    clang-20
i386                  randconfig-014-20260107    clang-20
i386                  randconfig-014-20260107    gcc-14
i386                  randconfig-015-20260107    clang-20
i386                  randconfig-016-20260107    clang-20
i386                  randconfig-017-20260107    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260107    gcc-15.1.0
loongarch             randconfig-001-20260107    gcc-8.5.0
loongarch             randconfig-002-20260107    gcc-15.1.0
loongarch             randconfig-002-20260107    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-18
mips                          rb532_defconfig    clang-18
mips                         rt305x_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260107    gcc-8.5.0
nios2                 randconfig-002-20260107    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260107    clang-22
parisc                randconfig-001-20260107    gcc-8.5.0
parisc                randconfig-002-20260107    clang-22
parisc                randconfig-002-20260107    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                          g5_defconfig    clang-18
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    clang-18
powerpc                   lite5200b_defconfig    clang-22
powerpc                     powernv_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260107    clang-22
powerpc               randconfig-002-20260107    clang-22
powerpc               randconfig-002-20260107    gcc-8.5.0
powerpc64             randconfig-001-20260107    clang-22
powerpc64             randconfig-001-20260107    gcc-14.3.0
powerpc64             randconfig-002-20260107    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260107    clang-22
riscv                 randconfig-002-20260107    clang-22
riscv                 randconfig-002-20260107    gcc-9.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260107    clang-22
s390                  randconfig-002-20260107    clang-22
sh                               alldefconfig    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20260107    clang-22
sh                    randconfig-001-20260107    gcc-12.5.0
sh                    randconfig-002-20260107    clang-22
sh                    randconfig-002-20260107    gcc-12.5.0
sh                           se7619_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260107    gcc-15.1.0
sparc                 randconfig-001-20260107    gcc-8.5.0
sparc                 randconfig-002-20260107    gcc-11.5.0
sparc                 randconfig-002-20260107    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260107    clang-22
sparc64               randconfig-001-20260107    gcc-15.1.0
sparc64               randconfig-002-20260107    gcc-10.5.0
sparc64               randconfig-002-20260107    gcc-15.1.0
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    clang-18
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260107    clang-16
um                    randconfig-001-20260107    gcc-15.1.0
um                    randconfig-002-20260107    clang-22
um                    randconfig-002-20260107    gcc-15.1.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260107    gcc-14
x86_64      buildonly-randconfig-002-20260107    gcc-14
x86_64      buildonly-randconfig-003-20260107    gcc-14
x86_64      buildonly-randconfig-004-20260107    clang-20
x86_64      buildonly-randconfig-004-20260107    gcc-14
x86_64      buildonly-randconfig-005-20260107    gcc-14
x86_64      buildonly-randconfig-006-20260107    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260107    clang-20
x86_64                randconfig-002-20260107    clang-20
x86_64                randconfig-003-20260107    clang-20
x86_64                randconfig-004-20260107    clang-20
x86_64                randconfig-004-20260107    gcc-13
x86_64                randconfig-005-20260107    clang-20
x86_64                randconfig-006-20260107    clang-20
x86_64                randconfig-011-20260107    clang-20
x86_64                randconfig-011-20260107    gcc-12
x86_64                randconfig-012-20260107    clang-20
x86_64                randconfig-012-20260107    gcc-14
x86_64                randconfig-013-20260107    clang-20
x86_64                randconfig-014-20260107    clang-20
x86_64                randconfig-015-20260107    clang-20
x86_64                randconfig-016-20260107    clang-20
x86_64                randconfig-071-20260107    clang-20
x86_64                randconfig-071-20260107    gcc-14
x86_64                randconfig-072-20260107    clang-20
x86_64                randconfig-073-20260107    clang-20
x86_64                randconfig-073-20260107    gcc-14
x86_64                randconfig-074-20260107    clang-20
x86_64                randconfig-074-20260107    gcc-14
x86_64                randconfig-075-20260107    clang-20
x86_64                randconfig-076-20260107    clang-20
x86_64                randconfig-076-20260107    gcc-14
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  nommu_kc705_defconfig    clang-18
xtensa                randconfig-001-20260107    gcc-15.1.0
xtensa                randconfig-001-20260107    gcc-8.5.0
xtensa                randconfig-002-20260107    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

