Return-Path: <linux-gpio+bounces-8595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3F9495A7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 18:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741001F22BA8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 16:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F213BB30;
	Tue,  6 Aug 2024 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9/NEIDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18E2CCB4
	for <linux-gpio@vger.kernel.org>; Tue,  6 Aug 2024 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722962263; cv=none; b=DQXi608py/JjSevINPh5w1A8G9SwM9LM3vfzIE7eYVrnmO0Ml+btCql6TU6sgzOy6koTraYU6IJUrG9wNlWz28AhxS0B/WSvP6Npx/D36umiyl/HdBgDGLw0i05GwsNUwOElMJdT1yJ5Ycyqp1DFS+gXsPFf7GgqiYpHHRVq3ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722962263; c=relaxed/simple;
	bh=E3PfKAD8VDkHhuqVPJgqBME/gt+bW/nG/JeIYPzWb5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UKgI2/vb5D9nS2cut/vUZsSsFUe5QoTbUHzvvhBpnf17dSGUb2vUL0TOuURVpYQiIh0OY1Pq2cNR4b4YZ3EyaI1JlLNvq28rDI4g/x4CBATqgJ1zr2x8Yq3R74OdFcgf07KaDmJzFePeFlB9CeiYSlQweQBtuXgLJjPUcWLpBno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9/NEIDv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722962262; x=1754498262;
  h=date:from:to:cc:subject:message-id;
  bh=E3PfKAD8VDkHhuqVPJgqBME/gt+bW/nG/JeIYPzWb5E=;
  b=d9/NEIDvsozb2ih5mCh7DiN823BQ2n5oHE8SLPue8OZ57A+gBqPt/tD1
   FhhnxQKOFQSWN2AYYtzyf6CsphIDo+AFaLuQNW2vZnsCwbOoJY6Urj4CU
   0FiTFJTCyi9iVImIw1a4q5GBlR6IwNjD/06fCucMPEk9nVWStG0eqrEes
   fT6nNLWhw2zuL/UbW9bqY+hjK9FVttYOvUqyeujVPAXOmRedcrOTKYg5L
   1VerHgoHgKEW+aZSawjE9KaOj5a1bxFpgqI2OVjgKVUwRH5tPfScL07Fo
   Ghyq+Na+x0mdZzdJWqmF54REuVja+6qt1szHZGtcJ7Zy8HhOKAmNDry3H
   A==;
X-CSE-ConnectionGUID: QpnjUWkISdOHDjceQIbbrQ==
X-CSE-MsgGUID: +ShiDU5+RdKM3DpUW4tc2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32398702"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="32398702"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 09:37:39 -0700
X-CSE-ConnectionGUID: Gu8l0caoQL+8bodrOBCB0w==
X-CSE-MsgGUID: 3uNPSLGOTCSqizxuUxdGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61203796"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2024 09:37:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbNBn-0004fa-0P;
	Tue, 06 Aug 2024 16:37:35 +0000
Date: Wed, 07 Aug 2024 00:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/asoc-tas-gpios] BUILD SUCCESS
 bf9530db8cc34c883d854533fa28bc0f014e1ded
Message-ID: <202408070056.3aR3UG3U-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/asoc-tas-gpios
branch HEAD: bf9530db8cc34c883d854533fa28bc0f014e1ded  ASoC: tas*: Drop unused GPIO includes

elapsed time: 1078m

configs tested: 178
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                   randconfig-001-20240806   gcc-13.2.0
arc                   randconfig-002-20240806   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   clang-20
arm                          ixp4xx_defconfig   clang-20
arm                         orion5x_defconfig   gcc-13.2.0
arm                          pxa3xx_defconfig   clang-20
arm                            qcom_defconfig   gcc-13.2.0
arm                   randconfig-001-20240806   gcc-13.2.0
arm                   randconfig-002-20240806   gcc-13.2.0
arm                   randconfig-003-20240806   gcc-13.2.0
arm                   randconfig-004-20240806   gcc-13.2.0
arm                           spitz_defconfig   clang-20
arm64                            alldefconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240806   gcc-13.2.0
arm64                 randconfig-002-20240806   gcc-13.2.0
arm64                 randconfig-003-20240806   gcc-13.2.0
arm64                 randconfig-004-20240806   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240806   gcc-13.2.0
csky                  randconfig-002-20240806   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240806   gcc-11
i386         buildonly-randconfig-002-20240806   gcc-11
i386         buildonly-randconfig-003-20240806   gcc-11
i386         buildonly-randconfig-004-20240806   gcc-11
i386         buildonly-randconfig-005-20240806   gcc-11
i386         buildonly-randconfig-006-20240806   gcc-11
i386                                defconfig   clang-18
i386                  randconfig-001-20240806   gcc-11
i386                  randconfig-002-20240806   gcc-11
i386                  randconfig-003-20240806   gcc-11
i386                  randconfig-004-20240806   gcc-11
i386                  randconfig-005-20240806   gcc-11
i386                  randconfig-006-20240806   gcc-11
i386                  randconfig-011-20240806   gcc-11
i386                  randconfig-012-20240806   gcc-11
i386                  randconfig-013-20240806   gcc-11
i386                  randconfig-014-20240806   gcc-11
i386                  randconfig-015-20240806   gcc-11
i386                  randconfig-016-20240806   gcc-11
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240806   gcc-13.2.0
loongarch             randconfig-002-20240806   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          ath25_defconfig   clang-20
mips                 decstation_r4k_defconfig   clang-20
mips                          eyeq5_defconfig   clang-20
mips                           ip28_defconfig   gcc-13.2.0
nios2                         10m50_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240806   gcc-13.2.0
nios2                 randconfig-002-20240806   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240806   gcc-13.2.0
parisc                randconfig-002-20240806   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        cell_defconfig   clang-20
powerpc                       ebony_defconfig   gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig   clang-20
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240806   gcc-13.2.0
powerpc               randconfig-003-20240806   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                        warp_defconfig   clang-20
powerpc64             randconfig-001-20240806   gcc-13.2.0
powerpc64             randconfig-002-20240806   gcc-13.2.0
powerpc64             randconfig-003-20240806   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240806   gcc-13.2.0
riscv                 randconfig-002-20240806   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240806   gcc-13.2.0
s390                  randconfig-002-20240806   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240806   gcc-13.2.0
sh                    randconfig-002-20240806   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240806   gcc-13.2.0
sparc64               randconfig-002-20240806   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240806   gcc-13.2.0
um                    randconfig-002-20240806   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240806   clang-18
x86_64       buildonly-randconfig-002-20240806   clang-18
x86_64       buildonly-randconfig-003-20240806   clang-18
x86_64       buildonly-randconfig-004-20240806   clang-18
x86_64       buildonly-randconfig-005-20240806   clang-18
x86_64       buildonly-randconfig-006-20240806   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240806   clang-18
x86_64                randconfig-002-20240806   clang-18
x86_64                randconfig-003-20240806   clang-18
x86_64                randconfig-004-20240806   clang-18
x86_64                randconfig-005-20240806   clang-18
x86_64                randconfig-006-20240806   clang-18
x86_64                randconfig-011-20240806   clang-18
x86_64                randconfig-012-20240806   clang-18
x86_64                randconfig-013-20240806   clang-18
x86_64                randconfig-014-20240806   clang-18
x86_64                randconfig-015-20240806   clang-18
x86_64                randconfig-016-20240806   clang-18
x86_64                randconfig-071-20240806   clang-18
x86_64                randconfig-072-20240806   clang-18
x86_64                randconfig-073-20240806   clang-18
x86_64                randconfig-074-20240806   clang-18
x86_64                randconfig-075-20240806   clang-18
x86_64                randconfig-076-20240806   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                           alldefconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240806   gcc-13.2.0
xtensa                randconfig-002-20240806   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

