Return-Path: <linux-gpio+bounces-30387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D77BCD0DE61
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 23:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97CDA3006707
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 22:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DE335965;
	Sat, 10 Jan 2026 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1VhvmUT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D20500952
	for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 22:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768083330; cv=none; b=cTNYSgSlpR+znGx7cDrXFprY8hnsEcT0MOaILfqyBTuHkwOitj9cw9PkMzF6GTqWhShDkCb4Y0rsCVWFb+JQPlFH9VKhd7bdSSIrQHoUZBp+E2z0zp/F29AfblCMmkPrvJv16HKFSYkHqZ+haD4xBMZrOfVn3Tk3emUqDJJVNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768083330; c=relaxed/simple;
	bh=gnQ7rkBln88BrCVEkBZg2dXxVnqWTWeiQRJ4TpORA6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WZWYvIcJMVPCqST5sNUvKcjpB+3CzN4H63zmVE33FTqk752LCBqaba9NN+lag+QPTvtm7gNQOxCzSDh9nXHWpJVtC/7V3u+uPUhRTA7hdmNuE8YpjCabELPoJ5krNPdi3KcbihXdDvjam2Xovvd6fyKSPqHZ8lAukGS0Ztu+Tno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1VhvmUT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768083329; x=1799619329;
  h=date:from:to:cc:subject:message-id;
  bh=gnQ7rkBln88BrCVEkBZg2dXxVnqWTWeiQRJ4TpORA6Q=;
  b=F1VhvmUT5nZG2XZo3EN9Tu5JVkVr/2r3/2rTLeu8WoT/RSBgAt4BfjIK
   KEq2ej4wrA+ekwQ1ov/YacCB7oRzdNRlwAlkwvsfXW5t8h1IgGZDrWWSX
   tVht76nR5ccguUAzYbNMASSfv5XCGoHQacJ0JPDKk/v5LfzBdk7ztzN9V
   nTQeA0VNda5Wa3cBexM08od+C1RctgrKKgIwyGcrKyGNX2vsRHKUBuPdG
   s+1E3Ttl3cX/wehdgaqf8NU6r2hPHT5ERg1U2ezbkomapechOp2bNT7XE
   4z64KQ4tUqNPzOzdz3IOVysuf512RoKqZpR7AzlfS33ZQwdED0DbGTuXl
   Q==;
X-CSE-ConnectionGUID: cNQI15GsT1a1wr+H1CNtrw==
X-CSE-MsgGUID: /M0dUJxYS9C8Btxu34Fbcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69153714"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69153714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 14:15:28 -0800
X-CSE-ConnectionGUID: W7iA8PhhRny3WpUkaH4t5Q==
X-CSE-MsgGUID: DQWUM3HZRkGsgVax+bUUMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203672487"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jan 2026 14:15:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vehEz-000000009FI-1JYo;
	Sat, 10 Jan 2026 22:15:25 +0000
Date: Sun, 11 Jan 2026 06:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 e034e058897a12bc856f8b22d1796964c742f732
Message-ID: <202601110620.qx9ICEZz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: e034e058897a12bc856f8b22d1796964c742f732  gpio: line-mux: remove bits already handled by GPIO core

elapsed time: 2227m

configs tested: 164
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
arc                          axs101_defconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260111    clang-22
arc                   randconfig-002-20260111    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                   milbeaut_m10v_defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.2.0
arm                             pxa_defconfig    clang-22
arm                   randconfig-001-20260111    clang-22
arm                   randconfig-002-20260111    clang-22
arm                   randconfig-003-20260111    clang-22
arm                   randconfig-004-20260111    clang-22
arm                             rpc_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260111    gcc-12.5.0
arm64                 randconfig-002-20260111    gcc-12.5.0
arm64                 randconfig-003-20260111    gcc-12.5.0
arm64                 randconfig-004-20260111    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260111    gcc-12.5.0
csky                  randconfig-002-20260111    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260111    clang-22
hexagon               randconfig-002-20260111    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260111    clang-20
i386        buildonly-randconfig-002-20260111    clang-20
i386        buildonly-randconfig-003-20260111    clang-20
i386        buildonly-randconfig-004-20260111    clang-20
i386        buildonly-randconfig-005-20260111    clang-20
i386        buildonly-randconfig-006-20260111    clang-20
i386                                defconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260111    clang-22
loongarch             randconfig-002-20260111    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                           mtx1_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260111    clang-22
nios2                 randconfig-002-20260111    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260111    clang-22
parisc                randconfig-002-20260111    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                        fsp2_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-22
powerpc                      ppc44x_defconfig    gcc-15.2.0
powerpc                      ppc6xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260111    clang-22
powerpc               randconfig-002-20260111    clang-22
powerpc64             randconfig-001-20260111    clang-22
powerpc64             randconfig-002-20260111    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260111    gcc-11.5.0
riscv                 randconfig-002-20260111    gcc-11.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260111    gcc-11.5.0
s390                  randconfig-002-20260111    gcc-11.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    gcc-15.2.0
sh                    randconfig-001-20260111    gcc-11.5.0
sh                    randconfig-002-20260111    gcc-11.5.0
sh                           se7343_defconfig    clang-22
sh                   secureedge5410_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260111    gcc-8.5.0
sparc                 randconfig-002-20260111    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260111    gcc-8.5.0
sparc64               randconfig-002-20260111    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260111    gcc-8.5.0
um                    randconfig-002-20260111    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260111    clang-20
x86_64      buildonly-randconfig-002-20260111    clang-20
x86_64      buildonly-randconfig-003-20260111    clang-20
x86_64      buildonly-randconfig-004-20260111    clang-20
x86_64      buildonly-randconfig-005-20260111    clang-20
x86_64      buildonly-randconfig-006-20260111    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20260111    gcc-14
x86_64                randconfig-072-20260111    gcc-14
x86_64                randconfig-073-20260111    gcc-14
x86_64                randconfig-074-20260111    gcc-14
x86_64                randconfig-075-20260111    gcc-14
x86_64                randconfig-076-20260111    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260111    gcc-8.5.0
xtensa                randconfig-002-20260111    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

