Return-Path: <linux-gpio+bounces-25217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D267B3C598
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 01:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5981C804D1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 23:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590272FF650;
	Fri, 29 Aug 2025 23:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xo06i1tI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7CB26F2BE
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 23:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756510153; cv=none; b=nK5g5GOXiHkQNAiIgYHihIx6MrHNfDGdtB2aPWm4E5hi8hbWWi9aGq2LicNrGj9PtrUNhQhE7VAB/FpLZF4ZaAS61g9W6uDIunyM8it7+mP3kXMyYx2nn0LIgS1x6HAIjQF8H78Z7Za4wQr9R74MNBXEuY74d9FSRCl5WL6UL0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756510153; c=relaxed/simple;
	bh=pzkCCmraOH4kvkqQSafRELy81pNN3DiQrXUW1zKJbq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GmQZoD+J6kd1KrNscyZo94s8xJMLzObZQNSGlSv0ITCZsjKeWTjd7RSU1PnSwMc3jU8LG0X7/7Vvjn2R2PAS4DHWf0gH7LSFRwZBQNRQXANu3bZFIMJlg96vz4L67qrOrzzS0sa5S3m1bxWfa1KYtVoVo3YU3iJA/P47hvuJwec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xo06i1tI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756510152; x=1788046152;
  h=date:from:to:cc:subject:message-id;
  bh=pzkCCmraOH4kvkqQSafRELy81pNN3DiQrXUW1zKJbq4=;
  b=Xo06i1tIJhF0DaQj6BX/GVdEMSOWAoV5V408Uq8A7jnuFXZi/9/z99J5
   1KjubzvN7SWVgyws4lyUn3uSPcEdZP4D0O5PH60bn+7i2ChsZfoIJc9B1
   mne+Y5Fk4ccgl8wzNN0MZ6VybQOAeABfQS3zB3WsjoT8qkhMTPIbistCu
   Iv5qnP4zDtRjW62KIyyugGZxKjRPZsst/+ddNr9G+aEhc98ATvhCA73bd
   p2ri0aTrRpPdYDfSoTtNI3Pz4MsIZc5v6yfQeOE897PbZ7ycPuWYzwl8e
   +BL+lrxFuaMJ1kUrMKcQYmySApd0aRC6uQP2bfteN4uOeeg4Lyq/0lTvJ
   A==;
X-CSE-ConnectionGUID: e/bytB1UTJC9gYbcpAA/Gg==
X-CSE-MsgGUID: pQTskm0uSBGrJd1vqC7dsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58734080"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58734080"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 16:29:11 -0700
X-CSE-ConnectionGUID: 9qtA7krZQkuWlNQSuInsmA==
X-CSE-MsgGUID: ChdsRmuZS6i/7rX3umWj/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="175769919"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Aug 2025 16:29:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us8WG-000V37-0I;
	Fri, 29 Aug 2025 23:28:34 +0000
Date: Sat, 30 Aug 2025 07:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 c0392d7bff8b5a04e05d3d85c5df8e880ece2537
Message-ID: <202508300742.BmDFAuw8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: c0392d7bff8b5a04e05d3d85c5df8e880ece2537  Merge branch 'devel' into for-next

elapsed time: 1455m

configs tested: 183
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250829    gcc-12.5.0
arc                   randconfig-002-20250829    gcc-12.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                          exynos_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250829    gcc-12.5.0
arm                   randconfig-002-20250829    gcc-12.5.0
arm                   randconfig-003-20250829    gcc-12.5.0
arm                   randconfig-004-20250829    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250829    gcc-12.5.0
arm64                 randconfig-002-20250829    gcc-12.5.0
arm64                 randconfig-003-20250829    gcc-12.5.0
arm64                 randconfig-004-20250829    gcc-12.5.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250829    clang-22
csky                  randconfig-002-20250829    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250829    clang-22
hexagon               randconfig-002-20250829    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250829    clang-20
i386        buildonly-randconfig-002-20250829    clang-20
i386        buildonly-randconfig-003-20250829    clang-20
i386        buildonly-randconfig-004-20250829    clang-20
i386        buildonly-randconfig-005-20250829    clang-20
i386        buildonly-randconfig-006-20250829    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250829    clang-20
i386                  randconfig-002-20250829    clang-20
i386                  randconfig-003-20250829    clang-20
i386                  randconfig-004-20250829    clang-20
i386                  randconfig-005-20250829    clang-20
i386                  randconfig-006-20250829    clang-20
i386                  randconfig-007-20250829    clang-20
i386                  randconfig-011-20250829    clang-20
i386                  randconfig-012-20250829    clang-20
i386                  randconfig-013-20250829    clang-20
i386                  randconfig-014-20250829    clang-20
i386                  randconfig-015-20250829    clang-20
i386                  randconfig-016-20250829    clang-20
i386                  randconfig-017-20250829    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250829    clang-22
loongarch             randconfig-002-20250829    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250829    clang-22
nios2                 randconfig-002-20250829    clang-22
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250829    clang-22
parisc                randconfig-002-20250829    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     asp8347_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250829    clang-22
powerpc               randconfig-002-20250829    clang-22
powerpc               randconfig-003-20250829    clang-22
powerpc64             randconfig-001-20250829    clang-22
powerpc64             randconfig-002-20250829    clang-22
powerpc64             randconfig-003-20250829    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250829    gcc-8.5.0
riscv                 randconfig-002-20250829    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250829    gcc-8.5.0
s390                  randconfig-002-20250829    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250829    gcc-8.5.0
sh                    randconfig-002-20250829    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250829    gcc-8.5.0
sparc                 randconfig-002-20250829    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250829    gcc-8.5.0
sparc64               randconfig-002-20250829    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250829    gcc-8.5.0
um                    randconfig-002-20250829    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250829    clang-20
x86_64      buildonly-randconfig-002-20250829    clang-20
x86_64      buildonly-randconfig-003-20250829    clang-20
x86_64      buildonly-randconfig-004-20250829    clang-20
x86_64      buildonly-randconfig-005-20250829    clang-20
x86_64      buildonly-randconfig-006-20250829    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250829    gcc-12
x86_64                randconfig-002-20250829    gcc-12
x86_64                randconfig-003-20250829    gcc-12
x86_64                randconfig-004-20250829    gcc-12
x86_64                randconfig-005-20250829    gcc-12
x86_64                randconfig-006-20250829    gcc-12
x86_64                randconfig-007-20250829    gcc-12
x86_64                randconfig-008-20250829    gcc-12
x86_64                randconfig-071-20250829    clang-20
x86_64                randconfig-072-20250829    clang-20
x86_64                randconfig-073-20250829    clang-20
x86_64                randconfig-074-20250829    clang-20
x86_64                randconfig-075-20250829    clang-20
x86_64                randconfig-076-20250829    clang-20
x86_64                randconfig-077-20250829    clang-20
x86_64                randconfig-078-20250829    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250829    gcc-8.5.0
xtensa                randconfig-002-20250829    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

