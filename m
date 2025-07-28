Return-Path: <linux-gpio+bounces-23869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10810B14376
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 22:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2869518C2700
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 20:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDD11EA7C9;
	Mon, 28 Jul 2025 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjdJPyAh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC280B
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753735541; cv=none; b=SQSGVHT+Sb41h34I8TFpTHHfLOFRZNIGwUAZXNajFWJ7Wm973CPV6wisZdTEqvmbP/0dVdvgHwFOZMKb5tla/X8MBKeyVq8pYrBUFK52RdjV5mdJI6mG9kKoI7SxZctLS0Mcxn9YRHd+ixHnazfDS+jnbj+EVceehIhUScLwLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753735541; c=relaxed/simple;
	bh=4E8VY70wTVBwfpAxcAsU7a0DTNRyAOX+l+cPndhlp5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HDCuIc6GeqEFXKUD6fUvhXN47FVRL9GAOcl9aeIXDndR6Jq3EYpDxYJOPNg/fIhdRPUYle+m1TqLroJ8zD/NZC6j3jvC73ZlbgGpdq+5Eg1LYykMUwNYLCqHHjH/UNW8RfK+kXo28e6wsLp6Txs4D++0GAUNSeP9kXh4BxOj9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjdJPyAh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753735539; x=1785271539;
  h=date:from:to:cc:subject:message-id;
  bh=4E8VY70wTVBwfpAxcAsU7a0DTNRyAOX+l+cPndhlp5g=;
  b=GjdJPyAh7A+s3k70EBhxOzHVrd0CV9lwhMMryH2q1ZIPWWL4ElF5iIPt
   fPyByjYtDWLNBUaRl9loUk88PZtiiiT3SdvpInC72FAxAsb8iVPdWzAXU
   wwretB5d3xLICzpsDD7JO5csYgTlcP1BYfeHJgykdFpyCrTjhevOrl2//
   JhGV1nQpKqfz2IjJ8uk+FsHKouWeu/2hehqWCaZxge6a9uotx8nl/+2cL
   4zWYRM5tlDjjrWOSau2++1VFtix1Ur93TcSg6c4TAX55qzkNRVMOqKeTE
   iAxcRVNRTe+IULqwp94yhQ3sOIMvU6udfALsyipPJzUHZucsz9rsuRESA
   w==;
X-CSE-ConnectionGUID: xEtoOXEYSxqoVHRDAYgHPQ==
X-CSE-MsgGUID: 7xdgzNNiRE6iPZX12C37KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58615529"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58615529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 13:45:39 -0700
X-CSE-ConnectionGUID: ubTx5gNKSTWwnjo+GME/Pw==
X-CSE-MsgGUID: WnVPldoHQJWM/nYyvpUjZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193496644"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2025 13:45:38 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugUj1-0000kd-1e;
	Mon, 28 Jul 2025 20:45:35 +0000
Date: Tue, 29 Jul 2025 04:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 6b94bf976f9f9e6d4a6bf3218968a506c049702e
Message-ID: <202507290426.3VTFWYbC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 6b94bf976f9f9e6d4a6bf3218968a506c049702e  MIPS: alchemy: gpio: use new GPIO line value setter callbacks for the remaining chips

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250728
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-052-20250728
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-053-20250728
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-054-20250728
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
`-- arm-randconfig-055-20250728
    `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long

elapsed time: 862m

configs tested: 134
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250728    gcc-13.4.0
arc                   randconfig-002-20250728    gcc-12.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20250728    clang-22
arm                   randconfig-002-20250728    clang-22
arm                   randconfig-003-20250728    clang-22
arm                   randconfig-004-20250728    gcc-8.5.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250728    clang-22
arm64                 randconfig-002-20250728    clang-20
arm64                 randconfig-003-20250728    gcc-11.5.0
arm64                 randconfig-004-20250728    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250728    gcc-10.5.0
csky                  randconfig-002-20250728    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250728    clang-22
hexagon               randconfig-002-20250728    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250728    gcc-12
i386        buildonly-randconfig-002-20250728    gcc-12
i386        buildonly-randconfig-003-20250728    gcc-12
i386        buildonly-randconfig-004-20250728    clang-20
i386        buildonly-randconfig-005-20250728    gcc-12
i386        buildonly-randconfig-006-20250728    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250728    clang-22
loongarch             randconfig-002-20250728    clang-20
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250728    gcc-11.5.0
nios2                 randconfig-002-20250728    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250728    gcc-9.5.0
parisc                randconfig-002-20250728    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250728    gcc-10.5.0
powerpc               randconfig-002-20250728    gcc-13.4.0
powerpc               randconfig-003-20250728    gcc-8.5.0
powerpc64             randconfig-001-20250728    clang-22
powerpc64             randconfig-002-20250728    clang-22
powerpc64             randconfig-003-20250728    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250728    clang-22
riscv                 randconfig-002-20250728    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250728    clang-22
s390                  randconfig-002-20250728    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250728    gcc-14.3.0
sh                    randconfig-002-20250728    gcc-9.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250728    gcc-8.5.0
sparc                 randconfig-002-20250728    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250728    clang-20
sparc64               randconfig-002-20250728    gcc-12.5.0
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250728    clang-22
um                    randconfig-002-20250728    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250728    clang-20
x86_64      buildonly-randconfig-002-20250728    clang-20
x86_64      buildonly-randconfig-003-20250728    clang-20
x86_64      buildonly-randconfig-004-20250728    clang-20
x86_64      buildonly-randconfig-005-20250728    clang-20
x86_64      buildonly-randconfig-006-20250728    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250728    gcc-8.5.0
xtensa                randconfig-002-20250728    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

