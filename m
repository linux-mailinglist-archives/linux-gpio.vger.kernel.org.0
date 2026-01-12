Return-Path: <linux-gpio+bounces-30465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E017DD15C93
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 00:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 643BB3004E3E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 23:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057F5279908;
	Mon, 12 Jan 2026 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvS4gK2V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FCC1E1A3D
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768260206; cv=none; b=Pw0LphdCywkEp2G1BhJjmRsHTdVVXoDE7XitjgjaPKmq1jkWu/jSY1wrb7JYGKWkmkstsuVv7r3vV05ebSvkd6tlQXYe3rqyWDukpwJEHn+3JwgKTZOZoYjQg3g891Sl4eM8sJzwQ6WnjGoD0L6lDcJWmWaC7v5AstbYZSrvXy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768260206; c=relaxed/simple;
	bh=kbJV02mMrm9gUCM7OWE5UpZ7EUqfYUyO1jf5BpqyPJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=idqL1W7BSoVX6VOwZKm90iLV5a2gO2iIlrl9e0cjqfY4AE62qhdkEdUuJLuG10fxohZ9c1Hs1pvcTnbuRGXqNDo5BdozVs853Aghah0TmqVHlr8w/Swbmdp7YDGd1dyntHlcaE8V6YIt9uZSL1XNvlweOtQt0IcOQLhLfah1fiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvS4gK2V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768260204; x=1799796204;
  h=date:from:to:cc:subject:message-id;
  bh=kbJV02mMrm9gUCM7OWE5UpZ7EUqfYUyO1jf5BpqyPJE=;
  b=GvS4gK2VT76cH3jaseVgaaGAZ2DFygNWe6CPW4GCrbVZLivlu3OqsWXg
   13gLJqqxSuUCwXv404ekWXJxiZzIVPLe0CNpcQ+ovnFZTD6J4fJTh2LGt
   MA5PyMQJ/Z8JA22QrnP9Ph8mQ8Tz3U/zCqf/jPJ9TGQDMw4nHIUeVB6IA
   D67oMHvb3z7/ZxQgWE7TQURHNzpL+XXP261gdfM0bBVlw3kXiWPuy4ABB
   6WLo5Xakz8e69LdJ9fX/kRMnSwvSLxg0YtkWB28IT88FyvZkgpCPFXHLK
   SfTKcVuoeEbE/+DgFhA40xnxjcbC6lqJF/F6SMoA+7U68xNmNFq5UWfd/
   g==;
X-CSE-ConnectionGUID: tzP8gTagTcWkY6oqXVcFLA==
X-CSE-MsgGUID: rMmnl09gTPme/KzdlFQF8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68547740"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68547740"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 15:23:24 -0800
X-CSE-ConnectionGUID: wwh/wBkaSzuSUr2L8dM+xw==
X-CSE-MsgGUID: m6pl0q6JQZOtnBgVNaz30w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227459935"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 15:23:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfRFo-00000000DyW-1AOJ;
	Mon, 12 Jan 2026 23:23:20 +0000
Date: Tue, 13 Jan 2026 07:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 43f37d44f2b8a75a896e218bac1e43d75063f8d3
Message-ID: <202601130740.DqCcbCVQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 43f37d44f2b8a75a896e218bac1e43d75063f8d3  gpio: cadence: Add support for edge-triggered interrupts

elapsed time: 752m

configs tested: 305
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260112    gcc-8.5.0
arc                   randconfig-001-20260113    clang-22
arc                   randconfig-002-20260112    gcc-8.5.0
arc                   randconfig-002-20260113    clang-22
arc                           tb10x_defconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            hisi_defconfig    clang-22
arm                        keystone_defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.2.0
arm                            mps2_defconfig    clang-22
arm                         orion5x_defconfig    gcc-15.2.0
arm                          pxa910_defconfig    clang-22
arm                   randconfig-001-20260112    gcc-8.5.0
arm                   randconfig-001-20260113    clang-22
arm                   randconfig-002-20260112    gcc-8.5.0
arm                   randconfig-002-20260113    clang-22
arm                   randconfig-003-20260112    gcc-8.5.0
arm                   randconfig-003-20260113    clang-22
arm                   randconfig-004-20260112    gcc-8.5.0
arm                   randconfig-004-20260113    clang-22
arm                           sama7_defconfig    clang-22
arm                           stm32_defconfig    clang-18
arm                           tegra_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260112    gcc-8.5.0
arm64                 randconfig-001-20260113    clang-22
arm64                 randconfig-002-20260112    gcc-8.5.0
arm64                 randconfig-002-20260113    clang-22
arm64                 randconfig-003-20260112    gcc-8.5.0
arm64                 randconfig-003-20260113    clang-22
arm64                 randconfig-004-20260112    gcc-8.5.0
arm64                 randconfig-004-20260113    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260112    gcc-8.5.0
csky                  randconfig-001-20260113    clang-22
csky                  randconfig-002-20260112    gcc-8.5.0
csky                  randconfig-002-20260113    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260112    clang-22
hexagon               randconfig-001-20260113    clang-22
hexagon               randconfig-002-20260112    clang-22
hexagon               randconfig-002-20260113    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260112    gcc-14
i386        buildonly-randconfig-001-20260113    clang-20
i386        buildonly-randconfig-002-20260112    gcc-14
i386        buildonly-randconfig-002-20260113    clang-20
i386        buildonly-randconfig-003-20260112    gcc-14
i386        buildonly-randconfig-003-20260113    clang-20
i386        buildonly-randconfig-004-20260112    gcc-14
i386        buildonly-randconfig-004-20260113    clang-20
i386        buildonly-randconfig-005-20260112    gcc-14
i386        buildonly-randconfig-005-20260113    clang-20
i386        buildonly-randconfig-006-20260112    gcc-14
i386        buildonly-randconfig-006-20260113    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260112    clang-20
i386                  randconfig-001-20260113    clang-20
i386                  randconfig-002-20260112    clang-20
i386                  randconfig-002-20260113    clang-20
i386                  randconfig-003-20260112    clang-20
i386                  randconfig-003-20260113    clang-20
i386                  randconfig-004-20260112    clang-20
i386                  randconfig-004-20260113    clang-20
i386                  randconfig-005-20260112    clang-20
i386                  randconfig-005-20260113    clang-20
i386                  randconfig-006-20260112    clang-20
i386                  randconfig-006-20260113    clang-20
i386                  randconfig-007-20260112    clang-20
i386                  randconfig-007-20260113    clang-20
i386                  randconfig-011-20260112    clang-20
i386                  randconfig-011-20260113    gcc-14
i386                  randconfig-012-20260112    clang-20
i386                  randconfig-012-20260113    gcc-14
i386                  randconfig-013-20260112    clang-20
i386                  randconfig-013-20260113    gcc-14
i386                  randconfig-014-20260112    clang-20
i386                  randconfig-014-20260113    gcc-14
i386                  randconfig-015-20260112    clang-20
i386                  randconfig-015-20260113    gcc-14
i386                  randconfig-016-20260112    clang-20
i386                  randconfig-016-20260113    gcc-14
i386                  randconfig-017-20260112    clang-20
i386                  randconfig-017-20260113    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260112    clang-22
loongarch             randconfig-001-20260113    clang-22
loongarch             randconfig-002-20260112    clang-22
loongarch             randconfig-002-20260113    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    clang-18
m68k                          amiga_defconfig    clang-22
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    clang-22
m68k                        m5272c3_defconfig    clang-22
m68k                        m5272c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           ip30_defconfig    clang-22
mips                      maltaaprp_defconfig    clang-22
mips                         rt305x_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260112    clang-22
nios2                 randconfig-001-20260113    clang-22
nios2                 randconfig-002-20260112    clang-22
nios2                 randconfig-002-20260113    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
openrisc                    or1ksim_defconfig    clang-22
parisc                           alldefconfig    clang-18
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260112    gcc-10.5.0
parisc                randconfig-001-20260113    clang-19
parisc                randconfig-002-20260112    gcc-10.5.0
parisc                randconfig-002-20260113    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-22
powerpc                 linkstation_defconfig    clang-22
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                     mpc5200_defconfig    clang-22
powerpc                       ppc64_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    clang-22
powerpc               randconfig-001-20260112    gcc-10.5.0
powerpc               randconfig-001-20260113    clang-19
powerpc               randconfig-002-20260112    gcc-10.5.0
powerpc               randconfig-002-20260113    clang-19
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc                      tqm8xx_defconfig    clang-22
powerpc                        warp_defconfig    clang-22
powerpc64             randconfig-001-20260112    gcc-10.5.0
powerpc64             randconfig-001-20260113    clang-19
powerpc64             randconfig-002-20260112    gcc-10.5.0
powerpc64             randconfig-002-20260113    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260112    gcc-15.2.0
riscv                 randconfig-001-20260113    gcc-15.2.0
riscv                 randconfig-002-20260112    gcc-15.2.0
riscv                 randconfig-002-20260113    gcc-15.2.0
s390                             alldefconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    clang-18
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260112    gcc-15.2.0
s390                  randconfig-001-20260113    gcc-15.2.0
s390                  randconfig-002-20260112    gcc-15.2.0
s390                  randconfig-002-20260113    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.2.0
sh                               j2_defconfig    clang-22
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260112    gcc-15.2.0
sh                    randconfig-001-20260113    gcc-15.2.0
sh                    randconfig-002-20260112    gcc-15.2.0
sh                    randconfig-002-20260113    gcc-15.2.0
sh                      rts7751r2d1_defconfig    clang-22
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sh                   rts7751r2dplus_defconfig    clang-18
sh                          sdk7780_defconfig    clang-18
sh                           se7724_defconfig    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sh                        sh7757lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260112    clang-20
sparc                 randconfig-001-20260113    gcc-14.3.0
sparc                 randconfig-002-20260112    clang-20
sparc                 randconfig-002-20260113    gcc-14.3.0
sparc                       sparc32_defconfig    clang-18
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260112    clang-20
sparc64               randconfig-001-20260113    gcc-14.3.0
sparc64               randconfig-002-20260112    clang-20
sparc64               randconfig-002-20260113    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260112    clang-20
um                    randconfig-001-20260113    gcc-14.3.0
um                    randconfig-002-20260112    clang-20
um                    randconfig-002-20260113    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260112    gcc-14
x86_64      buildonly-randconfig-001-20260113    clang-20
x86_64      buildonly-randconfig-002-20260112    gcc-14
x86_64      buildonly-randconfig-002-20260113    clang-20
x86_64      buildonly-randconfig-003-20260112    gcc-14
x86_64      buildonly-randconfig-003-20260113    clang-20
x86_64      buildonly-randconfig-004-20260112    gcc-14
x86_64      buildonly-randconfig-004-20260113    clang-20
x86_64      buildonly-randconfig-005-20260112    gcc-14
x86_64      buildonly-randconfig-005-20260113    clang-20
x86_64      buildonly-randconfig-006-20260112    gcc-14
x86_64      buildonly-randconfig-006-20260113    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260112    gcc-13
x86_64                randconfig-001-20260113    gcc-14
x86_64                randconfig-002-20260112    clang-20
x86_64                randconfig-002-20260112    gcc-13
x86_64                randconfig-002-20260113    gcc-14
x86_64                randconfig-003-20260112    gcc-13
x86_64                randconfig-003-20260113    gcc-14
x86_64                randconfig-004-20260112    gcc-13
x86_64                randconfig-004-20260113    gcc-14
x86_64                randconfig-005-20260112    clang-20
x86_64                randconfig-005-20260112    gcc-13
x86_64                randconfig-005-20260113    gcc-14
x86_64                randconfig-006-20260112    clang-20
x86_64                randconfig-006-20260112    gcc-13
x86_64                randconfig-006-20260113    gcc-14
x86_64                randconfig-011-20260112    clang-20
x86_64                randconfig-011-20260113    clang-20
x86_64                randconfig-012-20260112    clang-20
x86_64                randconfig-012-20260113    clang-20
x86_64                randconfig-013-20260112    clang-20
x86_64                randconfig-013-20260113    clang-20
x86_64                randconfig-014-20260112    clang-20
x86_64                randconfig-014-20260113    clang-20
x86_64                randconfig-015-20260112    clang-20
x86_64                randconfig-015-20260113    clang-20
x86_64                randconfig-016-20260112    clang-20
x86_64                randconfig-016-20260113    clang-20
x86_64                randconfig-071-20260112    gcc-14
x86_64                randconfig-071-20260113    clang-20
x86_64                randconfig-072-20260112    gcc-14
x86_64                randconfig-072-20260113    clang-20
x86_64                randconfig-073-20260112    gcc-14
x86_64                randconfig-073-20260113    clang-20
x86_64                randconfig-074-20260112    gcc-14
x86_64                randconfig-074-20260113    clang-20
x86_64                randconfig-075-20260112    gcc-14
x86_64                randconfig-075-20260113    clang-20
x86_64                randconfig-076-20260112    gcc-14
x86_64                randconfig-076-20260113    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.2.0
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  audio_kc705_defconfig    clang-22
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                          iss_defconfig    clang-22
xtensa                randconfig-001-20260112    clang-20
xtensa                randconfig-001-20260113    gcc-14.3.0
xtensa                randconfig-002-20260112    clang-20
xtensa                randconfig-002-20260113    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

