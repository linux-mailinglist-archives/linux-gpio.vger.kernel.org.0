Return-Path: <linux-gpio+bounces-29253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E11CA3A75
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 13:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD873037431
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 12:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC10312827;
	Thu,  4 Dec 2025 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+v96c0b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F82DF126
	for <linux-gpio@vger.kernel.org>; Thu,  4 Dec 2025 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852430; cv=none; b=aWs7LFFEyVWGge0HLtItLGzlpLMhURU9kU9MnboUH2uhe5V2i0iPzg3cmp/5povhN2jbso0/wAJAaC0U1Lrkr56gccfmMlFh1GjmTuBeI30cfAU8FHl2bTJfcTnnkfJ9D0bKPoKK25fbH3TIWnkRcHbbdebWnh545ARKlvQlT2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852430; c=relaxed/simple;
	bh=ywRTntkXgJEUHAfJ274UPs2chRJhj9Kdpu71kFTNWUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uTWoNWEHwVr4WZNfL1MhxqTe4PA4D+vZuKky9yvfG7yd1rMsGYPDeDxuseAyTgR6TdBm/9X649MbCEQCc2XhueClhJj9Q+BiW26a7Yu+zRgXoJcAU/MJzuPSNzSeVt8p+uJaQSSLzClRWJTFRsG6fvuwOP/PxTtqXBpwyMnO+aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+v96c0b; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764852429; x=1796388429;
  h=date:from:to:cc:subject:message-id;
  bh=ywRTntkXgJEUHAfJ274UPs2chRJhj9Kdpu71kFTNWUk=;
  b=M+v96c0bUm8pseCPY4HG4XPtDiRccg3zYqFCPgY/TMFI6q/dX5poMta1
   kZRafLYnxKpFCkUUIcVBUshkzjHUI75Tv2YIWjXame06MgJWbI8IA3A6n
   cdWNI0m9Q69K8AhA2Z70rbacfOP9qBi3Eb0szeIXDTJ6rfdGpJ9wSToz6
   uziZYTvT+KA5B9JVlf3Y1tKXSFkSdI9tRpiCEoDdrZraOsbGFTAOTXWfO
   eMheqeAuPX58QnKd90DBPbIRYiUvIhM+wZ8Go7KQheuD7UuE9NIfJAjoa
   XLmuWeDRnpJRXMWxaq2HsqMplR3vxMXsGZHTIjQdhfticAFexVNPNbAqW
   w==;
X-CSE-ConnectionGUID: BB8SAP0lTfWipPfdCR//Mg==
X-CSE-MsgGUID: 8fha8uU/TqyUXCvh+bphLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="89518887"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="89518887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:47:08 -0800
X-CSE-ConnectionGUID: 9FrxZO78T8WNmWPniIDBVg==
X-CSE-MsgGUID: ZxrARdCiTt+1Exq7DLsBrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="199401125"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2025 04:47:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR8jg-00000000DnN-3QBJ;
	Thu, 04 Dec 2025 12:47:04 +0000
Date: Thu, 04 Dec 2025 20:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 7d80e248e8fc4c70f8feac4989f3666878039565
Message-ID: <202512042055.vrIYHXV4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 7d80e248e8fc4c70f8feac4989f3666878039565  gpio: mmio: fix bad guard conversion

elapsed time: 1462m

configs tested: 224
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251204    gcc-10.5.0
arc                   randconfig-001-20251204    gcc-12.5.0
arc                   randconfig-002-20251204    gcc-10.5.0
arc                   randconfig-002-20251204    gcc-8.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                        multi_v5_defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                         orion5x_defconfig    gcc-15.1.0
arm                   randconfig-001-20251204    clang-18
arm                   randconfig-001-20251204    gcc-10.5.0
arm                   randconfig-002-20251204    clang-19
arm                   randconfig-002-20251204    gcc-10.5.0
arm                   randconfig-003-20251204    gcc-10.5.0
arm                   randconfig-004-20251204    gcc-10.5.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251204    gcc-14.3.0
arm64                 randconfig-002-20251204    gcc-14.3.0
arm64                 randconfig-003-20251204    gcc-14.3.0
arm64                 randconfig-004-20251204    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251204    gcc-14.3.0
csky                  randconfig-002-20251204    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251204    gcc-15.1.0
hexagon               randconfig-002-20251204    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251204    clang-20
i386        buildonly-randconfig-001-20251204    gcc-14
i386        buildonly-randconfig-002-20251204    clang-20
i386        buildonly-randconfig-003-20251204    clang-20
i386        buildonly-randconfig-004-20251204    clang-20
i386        buildonly-randconfig-004-20251204    gcc-14
i386        buildonly-randconfig-005-20251204    clang-20
i386        buildonly-randconfig-006-20251204    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251204    clang-20
i386                  randconfig-002-20251204    clang-20
i386                  randconfig-003-20251204    clang-20
i386                  randconfig-004-20251204    clang-20
i386                  randconfig-005-20251204    clang-20
i386                  randconfig-006-20251204    clang-20
i386                  randconfig-007-20251204    clang-20
i386                  randconfig-011-20251204    gcc-14
i386                  randconfig-012-20251204    gcc-14
i386                  randconfig-013-20251204    clang-20
i386                  randconfig-013-20251204    gcc-14
i386                  randconfig-014-20251204    gcc-14
i386                  randconfig-015-20251204    gcc-14
i386                  randconfig-016-20251204    gcc-14
i386                  randconfig-017-20251204    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251204    gcc-15.1.0
loongarch             randconfig-002-20251204    gcc-15.1.0
m68k                             alldefconfig    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                         10m50_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251204    gcc-15.1.0
nios2                 randconfig-002-20251204    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251204    clang-22
parisc                randconfig-001-20251204    gcc-15.1.0
parisc                randconfig-002-20251204    clang-22
parisc                randconfig-002-20251204    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251204    clang-16
powerpc               randconfig-001-20251204    clang-22
powerpc               randconfig-002-20251204    clang-22
powerpc               randconfig-002-20251204    gcc-12.5.0
powerpc                     tqm8548_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251204    clang-22
powerpc64             randconfig-001-20251204    gcc-10.5.0
powerpc64             randconfig-002-20251204    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251204    clang-22
riscv                 randconfig-002-20251204    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251204    clang-22
s390                  randconfig-002-20251204    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251204    clang-22
sh                    randconfig-002-20251204    clang-22
sh                          rsk7201_defconfig    gcc-15.1.0
sh                      rts7751r2d1_defconfig    clang-22
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7705_defconfig    clang-22
sh                           se7712_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251204    clang-22
sparc                 randconfig-002-20251204    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251204    clang-22
sparc64               randconfig-002-20251204    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251204    clang-22
um                    randconfig-002-20251204    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251204    clang-20
x86_64      buildonly-randconfig-002-20251204    clang-20
x86_64      buildonly-randconfig-003-20251204    clang-20
x86_64      buildonly-randconfig-004-20251204    clang-20
x86_64      buildonly-randconfig-005-20251204    clang-20
x86_64      buildonly-randconfig-006-20251204    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251204    clang-20
x86_64                randconfig-002-20251204    clang-20
x86_64                randconfig-002-20251204    gcc-14
x86_64                randconfig-003-20251204    clang-20
x86_64                randconfig-004-20251204    clang-20
x86_64                randconfig-005-20251204    clang-20
x86_64                randconfig-005-20251204    gcc-14
x86_64                randconfig-006-20251204    clang-20
x86_64                randconfig-006-20251204    gcc-14
x86_64                randconfig-011-20251204    clang-20
x86_64                randconfig-012-20251204    clang-20
x86_64                randconfig-013-20251204    clang-20
x86_64                randconfig-014-20251204    clang-20
x86_64                randconfig-015-20251204    clang-20
x86_64                randconfig-016-20251204    clang-20
x86_64                randconfig-071-20251204    clang-20
x86_64                randconfig-072-20251204    clang-20
x86_64                randconfig-073-20251204    clang-20
x86_64                randconfig-074-20251204    clang-20
x86_64                randconfig-075-20251204    clang-20
x86_64                randconfig-076-20251204    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251204    clang-22
xtensa                randconfig-002-20251204    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

