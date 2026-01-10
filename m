Return-Path: <linux-gpio+bounces-30383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2BD0D526
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 12:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F10003008C45
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 11:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1773382CB;
	Sat, 10 Jan 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Le/7CrTg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27F338904
	for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768043213; cv=none; b=WhUTs0NuKJXQZhb/I/TuCoLfA7SmIPKKmQTQ8iu9svyR5Fx7tYIQEI5m2lS57oTD/d/qWN+NbsvOJFVvt44mt/UcoWNsFdK9zGdN6F1l8iPAcnYMY4IHlssC6+DmL2+Q5RhVbCD7t2ZD4Qt0fDIpLFGnTCvBQT+iCNXtZDA21VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768043213; c=relaxed/simple;
	bh=LsvLNcv/PZLctgP46b1SB89b2PrDmqtNjMT3dQj7nh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dIrf8csS8fx8vqm2emxubibBESptaFGMHI7mOo3dYkUmekFs04BMFGuUgQFiXbuej9fbEU3wK3fh/MkLM+cRjKQGH60vl7+swxnjsOzcwXaOfIMFpoXM++eL+xIptj2B6OZc93nn4o9QP25JBdvqumO/Kbo88PBkxPt2RDttcq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Le/7CrTg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768043211; x=1799579211;
  h=date:from:to:cc:subject:message-id;
  bh=LsvLNcv/PZLctgP46b1SB89b2PrDmqtNjMT3dQj7nh0=;
  b=Le/7CrTgMppFLllJ1KNOeVEcXfXVAR6r/HBfD/iUJflXcXy/UkdiKDvr
   AFu0Tesn6pWfxYpH4oy03ccCLIE/vwNoaIPxvfIye2ouHK+FND57J6Jrc
   sT42rWh/AvvU7vp8XuLxGLV1Q7kgu5L9z9XTn09E1vHmewz5G1gbN04KY
   SWXcNJP5GdnrZvw6tTDdws5lA7fwEcbPdhBhPxD0cUyDAULpPC61unpza
   E+qyDM7uDAi2kxlNCd+0KBmu0YuAXe8w0DroQiA8dt/ccoNpz2BG4U5Md
   dyNNZuKxQBca3bzW72HtGG7s8+3leHeyN9bOwXVpSGSrTog/W2XT4z481
   A==;
X-CSE-ConnectionGUID: bheZYmKwS32t6gP2KuCEPg==
X-CSE-MsgGUID: ZayXniW0R7O7cYoYQgunUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80856139"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80856139"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 03:06:51 -0800
X-CSE-ConnectionGUID: abE8FCecQ3yMjJIjBssA/Q==
X-CSE-MsgGUID: fMOKeQNsRXuhr9TB4U3uSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="227011615"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2026 03:06:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veWnv-000000008Zn-0Jtr;
	Sat, 10 Jan 2026 11:06:47 +0000
Date: Sat, 10 Jan 2026 19:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 d578b31856cec31315f27b3ba97b212e4c6989b3
Message-ID: <202601101939.6zZcwPhk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: d578b31856cec31315f27b3ba97b212e4c6989b3  gpio: shared: fix a false-positive sharing detection with reset-gpios

elapsed time: 1560m

configs tested: 286
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20260109    gcc-13.4.0
arc                   randconfig-001-20260110    clang-22
arc                   randconfig-002-20260109    gcc-9.5.0
arc                   randconfig-002-20260110    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-22
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20260109    gcc-10.5.0
arm                   randconfig-001-20260110    clang-22
arm                   randconfig-002-20260109    gcc-15.2.0
arm                   randconfig-002-20260110    clang-22
arm                   randconfig-003-20260109    gcc-8.5.0
arm                   randconfig-003-20260110    clang-22
arm                   randconfig-004-20260109    gcc-11.5.0
arm                   randconfig-004-20260110    clang-22
arm                        spear6xx_defconfig    clang-22
arm                        vexpress_defconfig    gcc-15.2.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260109    clang-22
arm64                 randconfig-001-20260110    gcc-10.5.0
arm64                 randconfig-002-20260109    clang-22
arm64                 randconfig-002-20260110    gcc-10.5.0
arm64                 randconfig-003-20260109    gcc-11.5.0
arm64                 randconfig-003-20260110    gcc-10.5.0
arm64                 randconfig-004-20260109    gcc-8.5.0
arm64                 randconfig-004-20260110    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260109    gcc-9.5.0
csky                  randconfig-001-20260110    gcc-10.5.0
csky                  randconfig-002-20260109    gcc-15.2.0
csky                  randconfig-002-20260110    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260109    clang-22
hexagon               randconfig-001-20260110    clang-22
hexagon               randconfig-002-20260109    clang-17
hexagon               randconfig-002-20260110    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260109    clang-20
i386        buildonly-randconfig-001-20260110    gcc-14
i386        buildonly-randconfig-002-20260109    gcc-14
i386        buildonly-randconfig-002-20260110    gcc-14
i386        buildonly-randconfig-003-20260109    gcc-14
i386        buildonly-randconfig-003-20260110    gcc-14
i386        buildonly-randconfig-004-20260109    clang-20
i386        buildonly-randconfig-004-20260110    gcc-14
i386        buildonly-randconfig-005-20260109    gcc-12
i386        buildonly-randconfig-005-20260110    gcc-14
i386        buildonly-randconfig-006-20260109    clang-20
i386        buildonly-randconfig-006-20260110    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260109    gcc-14
i386                  randconfig-001-20260110    gcc-14
i386                  randconfig-002-20260109    gcc-14
i386                  randconfig-002-20260110    gcc-14
i386                  randconfig-003-20260109    gcc-12
i386                  randconfig-003-20260110    gcc-14
i386                  randconfig-004-20260109    gcc-14
i386                  randconfig-004-20260110    gcc-14
i386                  randconfig-005-20260109    gcc-14
i386                  randconfig-005-20260110    gcc-14
i386                  randconfig-006-20260109    clang-20
i386                  randconfig-006-20260110    gcc-14
i386                  randconfig-007-20260109    gcc-14
i386                  randconfig-007-20260110    gcc-14
i386                  randconfig-011-20260109    clang-20
i386                  randconfig-011-20260110    gcc-14
i386                  randconfig-012-20260109    gcc-14
i386                  randconfig-012-20260110    gcc-14
i386                  randconfig-013-20260109    clang-20
i386                  randconfig-013-20260110    gcc-14
i386                  randconfig-014-20260109    gcc-14
i386                  randconfig-014-20260110    gcc-14
i386                  randconfig-015-20260109    clang-20
i386                  randconfig-015-20260110    gcc-14
i386                  randconfig-016-20260109    clang-20
i386                  randconfig-016-20260110    gcc-14
i386                  randconfig-017-20260109    clang-20
i386                  randconfig-017-20260110    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260109    clang-22
loongarch             randconfig-001-20260110    clang-22
loongarch             randconfig-002-20260109    gcc-15.2.0
loongarch             randconfig-002-20260110    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260109    gcc-8.5.0
nios2                 randconfig-001-20260110    clang-22
nios2                 randconfig-002-20260109    gcc-8.5.0
nios2                 randconfig-002-20260110    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    clang-22
parisc                randconfig-001-20260109    gcc-12.5.0
parisc                randconfig-001-20260110    gcc-14.3.0
parisc                randconfig-002-20260109    gcc-15.2.0
parisc                randconfig-002-20260110    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                       eiger_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                      katmai_defconfig    clang-22
powerpc               randconfig-001-20260109    clang-22
powerpc               randconfig-001-20260110    gcc-14.3.0
powerpc               randconfig-002-20260109    clang-22
powerpc               randconfig-002-20260110    gcc-14.3.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260109    gcc-15.2.0
powerpc64             randconfig-001-20260110    gcc-14.3.0
powerpc64             randconfig-002-20260109    gcc-8.5.0
powerpc64             randconfig-002-20260110    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260109    gcc-14.3.0
riscv                 randconfig-001-20260110    gcc-15.2.0
riscv                 randconfig-002-20260109    gcc-8.5.0
riscv                 randconfig-002-20260110    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260109    clang-22
s390                  randconfig-001-20260110    gcc-15.2.0
s390                  randconfig-002-20260109    clang-22
s390                  randconfig-002-20260110    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260109    gcc-14.3.0
sh                    randconfig-001-20260110    gcc-15.2.0
sh                    randconfig-002-20260109    gcc-13.4.0
sh                    randconfig-002-20260110    gcc-15.2.0
sh                   rts7751r2dplus_defconfig    clang-22
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           se7750_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                            titan_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260109    gcc-8.5.0
sparc                 randconfig-001-20260110    clang-22
sparc                 randconfig-002-20260109    gcc-13.4.0
sparc                 randconfig-002-20260110    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260109    gcc-8.5.0
sparc64               randconfig-001-20260110    clang-22
sparc64               randconfig-002-20260109    clang-20
sparc64               randconfig-002-20260110    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260109    gcc-14
um                    randconfig-001-20260110    clang-22
um                    randconfig-002-20260109    gcc-14
um                    randconfig-002-20260110    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260109    clang-20
x86_64      buildonly-randconfig-001-20260110    gcc-14
x86_64      buildonly-randconfig-002-20260109    gcc-14
x86_64      buildonly-randconfig-002-20260110    gcc-14
x86_64      buildonly-randconfig-003-20260109    gcc-14
x86_64      buildonly-randconfig-003-20260110    gcc-14
x86_64      buildonly-randconfig-004-20260109    gcc-14
x86_64      buildonly-randconfig-004-20260110    gcc-14
x86_64      buildonly-randconfig-005-20260109    gcc-14
x86_64      buildonly-randconfig-005-20260110    gcc-14
x86_64      buildonly-randconfig-006-20260109    gcc-14
x86_64      buildonly-randconfig-006-20260110    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260109    clang-20
x86_64                randconfig-001-20260110    clang-20
x86_64                randconfig-002-20260109    clang-20
x86_64                randconfig-002-20260110    clang-20
x86_64                randconfig-003-20260109    gcc-14
x86_64                randconfig-003-20260110    clang-20
x86_64                randconfig-004-20260109    clang-20
x86_64                randconfig-004-20260110    clang-20
x86_64                randconfig-005-20260109    clang-20
x86_64                randconfig-005-20260110    clang-20
x86_64                randconfig-006-20260109    gcc-14
x86_64                randconfig-006-20260110    clang-20
x86_64                randconfig-011-20260109    gcc-12
x86_64                randconfig-011-20260110    clang-20
x86_64                randconfig-012-20260109    clang-20
x86_64                randconfig-012-20260110    clang-20
x86_64                randconfig-013-20260109    gcc-14
x86_64                randconfig-013-20260110    clang-20
x86_64                randconfig-014-20260109    gcc-14
x86_64                randconfig-014-20260110    clang-20
x86_64                randconfig-015-20260109    gcc-12
x86_64                randconfig-015-20260110    clang-20
x86_64                randconfig-016-20260109    gcc-14
x86_64                randconfig-016-20260110    clang-20
x86_64                randconfig-071-20260109    gcc-14
x86_64                randconfig-071-20260110    clang-20
x86_64                randconfig-072-20260109    clang-20
x86_64                randconfig-072-20260110    clang-20
x86_64                randconfig-073-20260109    gcc-14
x86_64                randconfig-073-20260110    clang-20
x86_64                randconfig-074-20260109    gcc-14
x86_64                randconfig-074-20260110    clang-20
x86_64                randconfig-075-20260109    gcc-14
x86_64                randconfig-075-20260110    clang-20
x86_64                randconfig-076-20260109    gcc-12
x86_64                randconfig-076-20260110    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260109    gcc-12.5.0
xtensa                randconfig-001-20260110    clang-22
xtensa                randconfig-002-20260109    gcc-14.3.0
xtensa                randconfig-002-20260110    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

