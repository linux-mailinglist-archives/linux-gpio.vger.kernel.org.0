Return-Path: <linux-gpio+bounces-30194-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE8CF800A
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 12:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37FE73009FDD
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 11:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4D71D9663;
	Tue,  6 Jan 2026 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpcsNkIN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88722F12CB
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767698220; cv=none; b=e6gxWvnY6+gUQMCaYbak1uke7iI586O5kYhafb9Y/DqKBABEppfncbwij1hrFYgjcP8wLY7cRF2cIW8nFGqIdZTmT+U/gDqKVuOGbVWgDEG/pKbEkBOaX/mSG2yYij17OL2wBpudkZG4qgMVAl2v4/8qdC540C12U3kPGfAjuec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767698220; c=relaxed/simple;
	bh=9O5LKno0qCBmNFW/2WTTsBqKGHU6mRWsUZTmYY/auW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eZk2xzWHaK5sTsWt1RsC2w1H7FMvt0xsOPzhbStAP6iFyBZbOUZ+l6JjpWvuvaDcsBMSn7t4Do3206r2Q40IzG6H1xzBeiK5v4Z0jY+7pjuqe0iFLYcpyBcD0AgiAoeiR6oDEENq6mYTiHuJs6P/vPI0rOqGpGLBB0AD8yTJpmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpcsNkIN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767698218; x=1799234218;
  h=date:from:to:cc:subject:message-id;
  bh=9O5LKno0qCBmNFW/2WTTsBqKGHU6mRWsUZTmYY/auW8=;
  b=mpcsNkINdtltqvpXCmPcjM9a0XEjkpq3HdCcata+kNh3lWKCI1bTp92L
   y/2RYLAV/ZRlE0uTQIN69i/kmNlm5t331YPeXMm3KUz1cBEhNijjE8mTA
   +qxSaSl18hvmDSUeGaCZkIrOtOd/BcC56i1ZDZAPWUlVguuYENVVW8aml
   5UoFGoxhQxbWzwuTkU4eZj5F6Uri3N2VTQx83aOzvHYy5CmyS9wFpyLWE
   1PbeJxba969uKpyES8WxEf9B0Hxj1RUuPcK0Ot3aG85nh7woJ8ttiBiUw
   B6TQ94k0JxiFkbF7QMbbuTj5qbSMTjObmmAI4SYO66Tqgwc88M8jB2J8K
   w==;
X-CSE-ConnectionGUID: VdeCf1HLQ3CL6zsDc4pkFw==
X-CSE-MsgGUID: Gcn1t02qTxCUZjXwGCxzkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69043326"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69043326"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 03:16:58 -0800
X-CSE-ConnectionGUID: Tx1gmmtdRS+YrVsz/CHtog==
X-CSE-MsgGUID: ZtE1i33FSCCZo06VQKVTvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202254939"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2026 03:16:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd53W-000000001t3-2sIp;
	Tue, 06 Jan 2026 11:16:54 +0000
Date: Tue, 06 Jan 2026 19:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 98d78c06f54da101c1f2eb79af378cee9e07e102
Message-ID: <202601061932.ti9wsuhV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 98d78c06f54da101c1f2eb79af378cee9e07e102  gpio: swnode: restore the name of the undefined software node

elapsed time: 1536m

configs tested: 141
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260106    gcc-13.4.0
arc                   randconfig-002-20260106    gcc-13.4.0
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                   randconfig-001-20260106    gcc-13.4.0
arm                   randconfig-002-20260106    gcc-13.4.0
arm                   randconfig-003-20260106    gcc-13.4.0
arm                   randconfig-004-20260106    gcc-13.4.0
arm                         s5pv210_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260106    gcc-10.5.0
arm64                 randconfig-002-20260106    gcc-10.5.0
arm64                 randconfig-003-20260106    gcc-10.5.0
arm64                 randconfig-004-20260106    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260106    gcc-10.5.0
csky                  randconfig-002-20260106    gcc-10.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20260106    gcc-8.5.0
hexagon               randconfig-002-20260106    gcc-8.5.0
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20260106    clang-20
i386        buildonly-randconfig-002-20260106    clang-20
i386        buildonly-randconfig-003-20260106    clang-20
i386        buildonly-randconfig-004-20260106    clang-20
i386        buildonly-randconfig-005-20260106    clang-20
i386        buildonly-randconfig-006-20260106    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20260106    clang-20
i386                  randconfig-002-20260106    clang-20
i386                  randconfig-003-20260106    clang-20
i386                  randconfig-004-20260106    clang-20
i386                  randconfig-005-20260106    clang-20
i386                  randconfig-006-20260106    clang-20
i386                  randconfig-007-20260106    clang-20
i386                  randconfig-011-20260106    gcc-14
i386                  randconfig-012-20260106    gcc-14
i386                  randconfig-013-20260106    gcc-14
i386                  randconfig-014-20260106    gcc-14
i386                  randconfig-015-20260106    gcc-14
i386                  randconfig-016-20260106    gcc-14
i386                  randconfig-017-20260106    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260106    gcc-8.5.0
loongarch             randconfig-002-20260106    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       alldefconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260106    gcc-8.5.0
nios2                 randconfig-002-20260106    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    clang-22
parisc                            allnoconfig    clang-22
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260106    gcc-8.5.0
parisc                randconfig-002-20260106    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20260106    gcc-8.5.0
powerpc               randconfig-002-20260106    gcc-8.5.0
powerpc64             randconfig-001-20260106    gcc-8.5.0
powerpc64             randconfig-002-20260106    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20260106    gcc-8.5.0
riscv                 randconfig-002-20260106    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20260106    gcc-8.5.0
s390                  randconfig-002-20260106    gcc-8.5.0
sh                                allnoconfig    clang-22
sh                                  defconfig    gcc-14
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260106    gcc-8.5.0
sh                    randconfig-002-20260106    gcc-8.5.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260106    gcc-8.5.0
sparc                 randconfig-002-20260106    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260106    gcc-8.5.0
sparc64               randconfig-002-20260106    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260106    gcc-8.5.0
um                    randconfig-002-20260106    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20260106    clang-20
x86_64      buildonly-randconfig-002-20260106    clang-20
x86_64      buildonly-randconfig-003-20260106    clang-20
x86_64      buildonly-randconfig-004-20260106    clang-20
x86_64      buildonly-randconfig-005-20260106    clang-20
x86_64      buildonly-randconfig-006-20260106    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260106    clang-20
x86_64                randconfig-002-20260106    clang-20
x86_64                randconfig-003-20260106    clang-20
x86_64                randconfig-004-20260106    clang-20
x86_64                randconfig-005-20260106    clang-20
x86_64                randconfig-006-20260106    clang-20
x86_64                randconfig-011-20260106    gcc-14
x86_64                randconfig-012-20260106    gcc-14
x86_64                randconfig-013-20260106    gcc-14
x86_64                randconfig-014-20260106    gcc-14
x86_64                randconfig-015-20260106    gcc-14
x86_64                randconfig-016-20260106    gcc-14
x86_64                randconfig-071-20260106    clang-20
x86_64                randconfig-072-20260106    clang-20
x86_64                randconfig-073-20260106    clang-20
x86_64                randconfig-074-20260106    clang-20
x86_64                randconfig-075-20260106    clang-20
x86_64                randconfig-076-20260106    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20260106    gcc-8.5.0
xtensa                randconfig-002-20260106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

