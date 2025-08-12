Return-Path: <linux-gpio+bounces-24313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F205B22B87
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 17:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E50423E03
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 15:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B88A2ED167;
	Tue, 12 Aug 2025 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htXJcSDq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61432C85
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755011972; cv=none; b=o3QOO/JuLEvyWDZxPzhBQbA/pzyPfud7on8FTwFly3L3vfdsFu4LTiFk8kQLr9NpSyJQnz4m5qj7ZdWuLFyCzJ5b/PS8wHPrndsaZTQEUARwweHnQQqbbJALCkMuU2j7QNSFgwy2cXAI0Y/WgR7RXs+g5dQ6ev/RM+78d6BKK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755011972; c=relaxed/simple;
	bh=lsM5x7DkZTA5jBhcm3h3uDNtgwLsLFcHtMBKnQG3ReU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e3ap9N6wMmblQVZMcUXex9yG0tEEV+h0L9b6/bf6VPS+qQzPWKF003C6U7dZ2fqlYAjNQx3yIRZB21dtpB3z6Av6kHL2u3Be41KINm/8cqO4RzoGGmc8bpYYWUVOCv9RWiqTcmAspu8LXNCZH5cJkUKlOV4qAhPGR9KCPZmguYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htXJcSDq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755011970; x=1786547970;
  h=date:from:to:cc:subject:message-id;
  bh=lsM5x7DkZTA5jBhcm3h3uDNtgwLsLFcHtMBKnQG3ReU=;
  b=htXJcSDqURGNippCEKuqKp92Ny+p+VcPdLClQ2Zu+AxaUHftHpX1only
   4X+qVAB2pB2yOm5JNWUNAWhqB7bDWNMjLcs0BTgWHKHeQGkl1rn5HrGIT
   fUqgBjqWLcWkryC6rnJdweZIUaXeVs/GyGpquVj7AHp6ydm3PkzbUKjaB
   AFHmiXyaYaGgM1Ykq/OLoL3Z0swTpP9dn3zuO8fSvyqRPgWwD2QsvtVzi
   AEMhcMpEp1ZaKmKwtxAoUM47mAIWGc9p/ykm6UjxMvxWE1HXkKAEeM7LY
   MQ5sQUxsq/8+oae9i6pOua7nADaD4HnmVbaSGaJRV8Hb9NFF0Pw+gOyD6
   g==;
X-CSE-ConnectionGUID: CwRo3vZFTguKVpopde1Xzw==
X-CSE-MsgGUID: ESh2ZHHaTVaHqlJax/aP1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57004100"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57004100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 08:19:30 -0700
X-CSE-ConnectionGUID: BvPxjrm4Rve5Pu/tblKXuw==
X-CSE-MsgGUID: RuwB9OkkQ760WECnyXjg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170356130"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2025 08:19:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulqmX-0006vR-15;
	Tue, 12 Aug 2025 15:19:22 +0000
Date: Tue, 12 Aug 2025 23:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 38f7b4a6a0510bc9b578b2bbf31e434d84b3244b
Message-ID: <202508122334.VZX7emJ3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 38f7b4a6a0510bc9b578b2bbf31e434d84b3244b  Merge tag 'gpio-aggregator-refactoring-for-v6.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into gpio/for-next

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250812
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-052-20250812
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-053-20250812
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-054-20250812
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
`-- arm-randconfig-055-20250812
    `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long

elapsed time: 1452m

configs tested: 151
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250812    gcc-8.5.0
arc                   randconfig-002-20250812    gcc-12.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20250812    clang-22
arm                   randconfig-002-20250812    clang-22
arm                   randconfig-003-20250812    gcc-14.3.0
arm                   randconfig-004-20250812    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250812    gcc-8.5.0
arm64                 randconfig-002-20250812    gcc-8.5.0
arm64                 randconfig-003-20250812    gcc-14.3.0
arm64                 randconfig-004-20250812    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250812    gcc-13.4.0
csky                  randconfig-002-20250812    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250812    clang-22
hexagon               randconfig-002-20250812    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250812    gcc-12
i386        buildonly-randconfig-002-20250812    gcc-12
i386        buildonly-randconfig-003-20250812    gcc-12
i386        buildonly-randconfig-004-20250812    clang-20
i386        buildonly-randconfig-004-20250812    gcc-12
i386        buildonly-randconfig-005-20250812    clang-20
i386        buildonly-randconfig-005-20250812    gcc-12
i386        buildonly-randconfig-006-20250812    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250812    clang-20
i386                  randconfig-002-20250812    clang-20
i386                  randconfig-003-20250812    clang-20
i386                  randconfig-004-20250812    clang-20
i386                  randconfig-005-20250812    clang-20
i386                  randconfig-006-20250812    clang-20
i386                  randconfig-007-20250812    clang-20
i386                  randconfig-011-20250812    gcc-12
i386                  randconfig-012-20250812    gcc-12
i386                  randconfig-013-20250812    gcc-12
i386                  randconfig-014-20250812    gcc-12
i386                  randconfig-015-20250812    gcc-12
i386                  randconfig-016-20250812    gcc-12
i386                  randconfig-017-20250812    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250812    gcc-15.1.0
loongarch             randconfig-002-20250812    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250812    gcc-10.5.0
nios2                 randconfig-002-20250812    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250812    gcc-10.5.0
parisc                randconfig-002-20250812    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250812    clang-19
powerpc               randconfig-002-20250812    clang-22
powerpc               randconfig-003-20250812    gcc-12.5.0
powerpc64             randconfig-001-20250812    clang-22
powerpc64             randconfig-002-20250812    clang-16
powerpc64             randconfig-003-20250812    clang-18
riscv                            alldefconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250812    gcc-9.5.0
riscv                 randconfig-002-20250812    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250812    clang-18
s390                  randconfig-002-20250812    clang-22
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250812    gcc-15.1.0
sh                    randconfig-002-20250812    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250812    gcc-8.5.0
sparc                 randconfig-002-20250812    gcc-8.5.0
sparc64               randconfig-001-20250812    clang-22
sparc64               randconfig-002-20250812    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250812    gcc-11
um                    randconfig-002-20250812    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250812    clang-20
x86_64      buildonly-randconfig-001-20250812    gcc-12
x86_64      buildonly-randconfig-002-20250812    gcc-12
x86_64      buildonly-randconfig-003-20250812    gcc-12
x86_64      buildonly-randconfig-004-20250812    gcc-12
x86_64      buildonly-randconfig-005-20250812    clang-20
x86_64      buildonly-randconfig-005-20250812    gcc-12
x86_64      buildonly-randconfig-006-20250812    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250812    gcc-11
x86_64                randconfig-002-20250812    gcc-11
x86_64                randconfig-003-20250812    gcc-11
x86_64                randconfig-004-20250812    gcc-11
x86_64                randconfig-005-20250812    gcc-11
x86_64                randconfig-006-20250812    gcc-11
x86_64                randconfig-007-20250812    gcc-11
x86_64                randconfig-008-20250812    gcc-11
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250812    gcc-10.5.0
xtensa                randconfig-002-20250812    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

