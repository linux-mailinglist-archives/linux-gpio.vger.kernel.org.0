Return-Path: <linux-gpio+bounces-25548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A762FB42D81
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 01:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69536169FC1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 23:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980332EA479;
	Wed,  3 Sep 2025 23:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnYIXalS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97E24677D
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 23:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756942746; cv=none; b=Oyp5fKBDd0z2GhEiSSWCrkZsQ9ximbPm41O80JJM8ocWl1HvzvBKFJ7iA4MkUpDjGDPL7hksQBg9vTRxDfh6RnrExVErLIc5uULQymwbDAs4zVsoG5qJnE0paLUAaeY6MrmGg0TEHBtMvFK/kmjW3nGN18tLDo4odNZeb9kq6c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756942746; c=relaxed/simple;
	bh=eDwpOxBar/RIznTot4ld83U1QQMbfmegBgpwrSEutgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sIrt/umW4SMh+iAkboTdNo2MBq/QT9aWs7uE8CMVnb75yHscy6sBp2v18m8ecWn5TOpFCtAUcjwSkl8Va2EDdof9VJy/UDsjbfVwc00w9p64x4BSI/HqB9fiXz4KrqUGkuUE48ReX2fKTAmghmkNUUhjDCsbShZvzIyizO3Eojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnYIXalS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756942744; x=1788478744;
  h=date:from:to:cc:subject:message-id;
  bh=eDwpOxBar/RIznTot4ld83U1QQMbfmegBgpwrSEutgE=;
  b=QnYIXalSjMFD+N+utFwC1nGiobDDwSuGza5/2+VPiha4/MvXaA8NY+a7
   4VRf5avggq33S6gmX85rg/luVISIpKekyHyI7vBivrPdVn5DUpWkyStBJ
   IqXRwzz+amiwvyAv6z2lnIPC2jXP88/XOuu1o44gl5QXFOVra7C6WKGk1
   zGXJy0lnIsTBAE4QN3V7bY0A1HiWBlmouJoslE2se/ybTKl9NVyeLHakQ
   xyfoxTCQSD1E5kBjIlL5Hjtr94dcY5+HL7+7nbBbIwFaoBgS6kWlX4ZnF
   /CTUGCICb/i4YqqZdtRFb0Bo0tmnPFvx34zRGupFuO99A8UroNgIN3Ikh
   g==;
X-CSE-ConnectionGUID: lC7TKrG/Sgin2y0dF4H5oA==
X-CSE-MsgGUID: 5cFDTfgrQC2bTSpknRjOyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="61906625"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="61906625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 16:39:04 -0700
X-CSE-ConnectionGUID: FTUlFLgzQFipSa5RzDcElQ==
X-CSE-MsgGUID: sQBRO8B6QjCqk0IY2SKShw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="172560382"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2025 16:39:03 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utx3V-0004Wd-1w;
	Wed, 03 Sep 2025 23:38:38 +0000
Date: Thu, 04 Sep 2025 07:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 57810fd8312bcbef7cb5f38f7ab0d1703f26e9c4
Message-ID: <202509040728.SDVp61YP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 57810fd8312bcbef7cb5f38f7ab0d1703f26e9c4  pinctrl: qcom: make the pinmuxing strict

elapsed time: 1476m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250903    gcc-15.1.0
arc                   randconfig-002-20250903    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                   randconfig-001-20250903    clang-22
arm                   randconfig-002-20250903    clang-16
arm                   randconfig-003-20250903    clang-22
arm                   randconfig-004-20250903    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250903    gcc-8.5.0
arm64                 randconfig-002-20250903    gcc-11.5.0
arm64                 randconfig-003-20250903    clang-22
arm64                 randconfig-004-20250903    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250903    gcc-9.5.0
csky                  randconfig-002-20250903    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250903    clang-22
hexagon               randconfig-002-20250903    clang-18
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250903    gcc-12
i386        buildonly-randconfig-002-20250903    gcc-12
i386        buildonly-randconfig-003-20250903    clang-20
i386        buildonly-randconfig-004-20250903    clang-20
i386        buildonly-randconfig-005-20250903    clang-20
i386        buildonly-randconfig-006-20250903    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250903    gcc-15.1.0
loongarch             randconfig-002-20250903    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250903    gcc-10.5.0
nios2                 randconfig-002-20250903    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250903    gcc-13.4.0
parisc                randconfig-002-20250903    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250903    gcc-8.5.0
powerpc               randconfig-002-20250903    gcc-8.5.0
powerpc               randconfig-003-20250903    gcc-14.3.0
powerpc                     sequoia_defconfig    clang-17
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20250903    clang-22
powerpc64             randconfig-002-20250903    clang-22
powerpc64             randconfig-003-20250903    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250903    gcc-8.5.0
riscv                 randconfig-002-20250903    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250903    gcc-8.5.0
s390                  randconfig-002-20250903    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250903    gcc-12.5.0
sh                    randconfig-002-20250903    gcc-10.5.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250903    gcc-11.5.0
sparc                 randconfig-002-20250903    gcc-15.1.0
sparc64               randconfig-001-20250903    gcc-8.5.0
sparc64               randconfig-002-20250903    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250903    gcc-12
um                    randconfig-002-20250903    clang-18
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250903    clang-20
x86_64      buildonly-randconfig-002-20250903    clang-20
x86_64      buildonly-randconfig-003-20250903    clang-20
x86_64      buildonly-randconfig-004-20250903    gcc-12
x86_64      buildonly-randconfig-005-20250903    clang-20
x86_64      buildonly-randconfig-006-20250903    gcc-13
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250903    gcc-11.5.0
xtensa                randconfig-002-20250903    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

