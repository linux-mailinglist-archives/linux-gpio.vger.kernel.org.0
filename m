Return-Path: <linux-gpio+bounces-8538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D861945B7B
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 11:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 446BEB20D45
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 09:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C431DB420;
	Fri,  2 Aug 2024 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qpm2xNFY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C7D4C62A
	for <linux-gpio@vger.kernel.org>; Fri,  2 Aug 2024 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722592268; cv=none; b=NJ1sk+c/i6NMIV/8X9Uy5HQMfaHN1+7SHFYoBnpBEuEfONjeDtg0S9KwxufVN3yU/qvaJDCYAcjrmSEUvoW5drgrCrLgIKpxJZS5XuGkU0DqIl1VfWmrzYErv546xC0L0q9B7e4iFc4xa8dV4I28/6JYoKvqBCp/fTuftsvBWCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722592268; c=relaxed/simple;
	bh=d1IAhZLc3yRE0/6qlHN0/Z1tU4pQji822aUQkQb0wcg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dj7STMk9taQ390I4yITbmbrua4bEcmmxrOyMnuxIxpxCf/l7fBrDoIxtvzAf4dqWmyd2+7dJDJs6Nkgxg7fWJo9u41/28YgCPx1lFWFJwA5eD9bnbRrisR1+gXYooUXqltQwQmj3k6vpU/7Qqu05Cc4iEMnjRn2ztarraXhfOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qpm2xNFY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722592266; x=1754128266;
  h=date:from:to:cc:subject:message-id;
  bh=d1IAhZLc3yRE0/6qlHN0/Z1tU4pQji822aUQkQb0wcg=;
  b=Qpm2xNFYvrUfK0NaI08nx/v7D+77POlShBZl1Kyl2f4qY82IYEe2ve1A
   Kw6xi6wGwlvjCPNfTeKT33y0GIi3yjFpnkXk0sATJWwaHSnrqICfUwfPb
   M22VWADugPTTKT9jFDHogRUsCZMjyl4kzws83rZbK9Ql8VlVE+98Hn6Fv
   +8VW5o+WCIMZ7G3eU1k4TnJasDdz4gaNVVoL1Gw6jtB/Fub5aT14Lwseh
   sktaRzgycUKVBKgXyMYPAqHqMbQVlFXeYWYE+ZL6Kzk1X498Z1VFIu/JD
   LnzLB/007zmFU1Znw8ohL3mWINUEheYaSTkBpaS/iMHeeTJ/rxyOfTu+W
   A==;
X-CSE-ConnectionGUID: DwXOHgGbRJeHsAcyPVscjQ==
X-CSE-MsgGUID: 2bFCM3DYR8akth4CgR6ylw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31178840"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="31178840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 02:51:06 -0700
X-CSE-ConnectionGUID: SNTYobqPTIeXAvjKtLkY4w==
X-CSE-MsgGUID: JOeOT3LVT0+d6qlcM3SRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="55951347"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Aug 2024 02:51:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZowA-000wca-0R;
	Fri, 02 Aug 2024 09:51:02 +0000
Date: Fri, 02 Aug 2024 17:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b034a90b2745e43b4a85b56dc5fd7a6fa1a21f31
Message-ID: <202408021743.fpLyO6nb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b034a90b2745e43b4a85b56dc5fd7a6fa1a21f31  gpio: Use of_property_present()

elapsed time: 1503m

configs tested: 287
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                   randconfig-001-20240801   gcc-13.2.0
arc                   randconfig-001-20240802   gcc-13.2.0
arc                   randconfig-002-20240801   gcc-13.2.0
arc                   randconfig-002-20240802   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              alldefconfig   gcc-14.1.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g5_defconfig   gcc-14.1.0
arm                         assabet_defconfig   gcc-14.1.0
arm                        clps711x_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   gcc-14.1.0
arm                          exynos_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                      jornada720_defconfig   gcc-14.1.0
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                   randconfig-001-20240801   gcc-13.2.0
arm                   randconfig-001-20240802   gcc-13.2.0
arm                   randconfig-002-20240801   gcc-13.2.0
arm                   randconfig-002-20240802   gcc-13.2.0
arm                   randconfig-003-20240801   gcc-13.2.0
arm                   randconfig-003-20240802   gcc-13.2.0
arm                   randconfig-004-20240801   gcc-13.2.0
arm                   randconfig-004-20240802   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                        shmobile_defconfig   gcc-14.1.0
arm                           sunxi_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240801   gcc-13.2.0
arm64                 randconfig-001-20240802   gcc-13.2.0
arm64                 randconfig-002-20240801   gcc-13.2.0
arm64                 randconfig-002-20240802   gcc-13.2.0
arm64                 randconfig-003-20240801   gcc-13.2.0
arm64                 randconfig-003-20240802   gcc-13.2.0
arm64                 randconfig-004-20240801   gcc-13.2.0
arm64                 randconfig-004-20240802   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240801   gcc-13.2.0
csky                  randconfig-001-20240802   gcc-13.2.0
csky                  randconfig-002-20240801   gcc-13.2.0
csky                  randconfig-002-20240802   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240801   gcc-9
i386         buildonly-randconfig-001-20240802   gcc-13
i386         buildonly-randconfig-002-20240801   gcc-9
i386         buildonly-randconfig-002-20240802   gcc-13
i386         buildonly-randconfig-003-20240801   gcc-9
i386         buildonly-randconfig-003-20240802   gcc-13
i386         buildonly-randconfig-004-20240801   gcc-9
i386         buildonly-randconfig-004-20240802   gcc-13
i386         buildonly-randconfig-005-20240801   gcc-9
i386         buildonly-randconfig-005-20240802   gcc-13
i386         buildonly-randconfig-006-20240801   gcc-9
i386         buildonly-randconfig-006-20240802   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240801   gcc-9
i386                  randconfig-001-20240802   gcc-13
i386                  randconfig-002-20240801   gcc-9
i386                  randconfig-002-20240802   gcc-13
i386                  randconfig-003-20240801   gcc-9
i386                  randconfig-003-20240802   gcc-13
i386                  randconfig-004-20240801   gcc-9
i386                  randconfig-004-20240802   gcc-13
i386                  randconfig-005-20240801   gcc-9
i386                  randconfig-005-20240802   gcc-13
i386                  randconfig-006-20240801   gcc-9
i386                  randconfig-006-20240802   gcc-13
i386                  randconfig-011-20240801   gcc-9
i386                  randconfig-011-20240802   gcc-13
i386                  randconfig-012-20240801   gcc-9
i386                  randconfig-012-20240802   gcc-13
i386                  randconfig-013-20240801   gcc-9
i386                  randconfig-013-20240802   gcc-13
i386                  randconfig-014-20240801   gcc-9
i386                  randconfig-014-20240802   gcc-13
i386                  randconfig-015-20240801   gcc-9
i386                  randconfig-015-20240802   gcc-13
i386                  randconfig-016-20240801   gcc-9
i386                  randconfig-016-20240802   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240801   gcc-13.2.0
loongarch             randconfig-001-20240802   gcc-13.2.0
loongarch             randconfig-002-20240801   gcc-13.2.0
loongarch             randconfig-002-20240802   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5307c3_defconfig   gcc-14.1.0
m68k                       m5475evb_defconfig   gcc-14.1.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        bcm63xx_defconfig   gcc-13.2.0
mips                         bigsur_defconfig   gcc-14.1.0
mips                          eyeq5_defconfig   gcc-14.1.0
mips                           ip30_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-14.1.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                malta_qemu_32r6_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240801   gcc-13.2.0
nios2                 randconfig-001-20240802   gcc-13.2.0
nios2                 randconfig-002-20240801   gcc-13.2.0
nios2                 randconfig-002-20240802   gcc-13.2.0
openrisc                         alldefconfig   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240801   gcc-13.2.0
parisc                randconfig-001-20240802   gcc-13.2.0
parisc                randconfig-002-20240801   gcc-13.2.0
parisc                randconfig-002-20240802   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       eiger_defconfig   gcc-14.1.0
powerpc                        fsp2_defconfig   gcc-14.1.0
powerpc                        icon_defconfig   gcc-14.1.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                      ppc6xx_defconfig   gcc-14.1.0
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240801   gcc-13.2.0
powerpc               randconfig-001-20240802   gcc-13.2.0
powerpc               randconfig-002-20240801   gcc-13.2.0
powerpc               randconfig-003-20240801   gcc-13.2.0
powerpc               randconfig-003-20240802   gcc-13.2.0
powerpc                    sam440ep_defconfig   gcc-14.1.0
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   gcc-14.1.0
powerpc                     taishan_defconfig   gcc-14.1.0
powerpc                     tqm8540_defconfig   gcc-14.1.0
powerpc                         wii_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240801   gcc-13.2.0
powerpc64             randconfig-001-20240802   gcc-13.2.0
powerpc64             randconfig-002-20240801   gcc-13.2.0
powerpc64             randconfig-002-20240802   gcc-13.2.0
powerpc64             randconfig-003-20240801   gcc-13.2.0
powerpc64             randconfig-003-20240802   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240801   gcc-13.2.0
riscv                 randconfig-001-20240802   gcc-13.2.0
riscv                 randconfig-002-20240801   gcc-13.2.0
riscv                 randconfig-002-20240802   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240801   gcc-13.2.0
s390                  randconfig-001-20240802   gcc-13.2.0
s390                  randconfig-002-20240801   gcc-13.2.0
s390                  randconfig-002-20240802   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7760_defconfig   gcc-13.2.0
sh                 kfr2r09-romimage_defconfig   gcc-14.1.0
sh                          r7785rp_defconfig   gcc-14.1.0
sh                    randconfig-001-20240801   gcc-13.2.0
sh                    randconfig-001-20240802   gcc-13.2.0
sh                    randconfig-002-20240801   gcc-13.2.0
sh                    randconfig-002-20240802   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                          sdk7786_defconfig   gcc-13.2.0
sh                             sh03_defconfig   gcc-13.2.0
sh                   sh7724_generic_defconfig   gcc-14.1.0
sh                   sh7770_generic_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-14.1.0
sh                            titan_defconfig   gcc-13.2.0
sh                          urquell_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240801   gcc-13.2.0
sparc64               randconfig-001-20240802   gcc-13.2.0
sparc64               randconfig-002-20240801   gcc-13.2.0
sparc64               randconfig-002-20240802   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240801   gcc-13.2.0
um                    randconfig-001-20240802   gcc-13.2.0
um                    randconfig-002-20240801   gcc-13.2.0
um                    randconfig-002-20240802   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240801   clang-18
x86_64       buildonly-randconfig-001-20240802   gcc-8
x86_64       buildonly-randconfig-002-20240801   clang-18
x86_64       buildonly-randconfig-002-20240802   gcc-8
x86_64       buildonly-randconfig-003-20240801   clang-18
x86_64       buildonly-randconfig-003-20240802   gcc-8
x86_64       buildonly-randconfig-004-20240801   clang-18
x86_64       buildonly-randconfig-004-20240802   gcc-8
x86_64       buildonly-randconfig-005-20240801   clang-18
x86_64       buildonly-randconfig-005-20240802   gcc-8
x86_64       buildonly-randconfig-006-20240801   clang-18
x86_64       buildonly-randconfig-006-20240802   gcc-8
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240801   clang-18
x86_64                randconfig-001-20240802   gcc-8
x86_64                randconfig-002-20240801   clang-18
x86_64                randconfig-002-20240802   gcc-8
x86_64                randconfig-003-20240801   clang-18
x86_64                randconfig-003-20240802   gcc-8
x86_64                randconfig-004-20240801   clang-18
x86_64                randconfig-004-20240802   gcc-8
x86_64                randconfig-005-20240801   clang-18
x86_64                randconfig-005-20240802   gcc-8
x86_64                randconfig-006-20240801   clang-18
x86_64                randconfig-006-20240802   gcc-8
x86_64                randconfig-011-20240801   clang-18
x86_64                randconfig-011-20240802   gcc-8
x86_64                randconfig-012-20240801   clang-18
x86_64                randconfig-012-20240802   gcc-8
x86_64                randconfig-013-20240801   clang-18
x86_64                randconfig-013-20240802   gcc-8
x86_64                randconfig-014-20240801   clang-18
x86_64                randconfig-014-20240802   gcc-8
x86_64                randconfig-015-20240801   clang-18
x86_64                randconfig-015-20240802   gcc-8
x86_64                randconfig-016-20240801   clang-18
x86_64                randconfig-016-20240802   gcc-8
x86_64                randconfig-071-20240801   clang-18
x86_64                randconfig-071-20240802   gcc-8
x86_64                randconfig-072-20240801   clang-18
x86_64                randconfig-072-20240802   gcc-8
x86_64                randconfig-073-20240801   clang-18
x86_64                randconfig-073-20240802   gcc-8
x86_64                randconfig-074-20240801   clang-18
x86_64                randconfig-074-20240802   gcc-8
x86_64                randconfig-075-20240801   clang-18
x86_64                randconfig-075-20240802   gcc-8
x86_64                randconfig-076-20240801   clang-18
x86_64                randconfig-076-20240802   gcc-8
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240801   gcc-13.2.0
xtensa                randconfig-001-20240802   gcc-13.2.0
xtensa                randconfig-002-20240801   gcc-13.2.0
xtensa                randconfig-002-20240802   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

