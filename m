Return-Path: <linux-gpio+bounces-13989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8C9F6A65
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 16:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80D2018877CC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444C31C5CDA;
	Wed, 18 Dec 2024 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl/rjfLT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51413D518
	for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537065; cv=none; b=nTpUKYs2Zh4TvixaSuIT4ujeaCPgEAc9Lxv7keOeTICRNdFZJKHuhZFjNfwtIPlkPIQXGGJLVK+KSHb0kwtEWbzlvYkg7VLCjP/iYYFm47kc8/KmCtlDCYn4PthW/cTikNlTXq43VoXnRnMfUmiHdyUfUpkO9wVj5t21amVmWOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537065; c=relaxed/simple;
	bh=UnyVdHj8jTc768K0n9vlm59FvPfm3h33Fz26y/DnL9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AeM4v/54UNf3BVt2VLQFzn8ejhkCxV5NW95t1QyvfY4CAuePkWYYqi3sIAYayo/JBZDdIjeQ/SiTGdIWs6mpvppU+gHJ9hNie/BdeuW3FXbh7fELBzQRcuAYKlcllF7uA1r/dfFaRQuJNpURYkjR7SXuUfhPkywImKfUHuGbv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pl/rjfLT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734537062; x=1766073062;
  h=date:from:to:cc:subject:message-id;
  bh=UnyVdHj8jTc768K0n9vlm59FvPfm3h33Fz26y/DnL9A=;
  b=Pl/rjfLTLK7sBNKy5Cx/Veu1Eo+gNtgYI4hfJWWYSUYPz5HwMUUqAhAn
   WABJyklNx6moPOPXu9tbgMbTa2Pi77yIBjNNJ88uOIagI1Z7kq5BYzKFU
   eORd5cV6VDit4G5wJXijs8Y4w+BJCRRNfHzh/J+XJMRrdLRLQ4IMxU2Xz
   Iu/MxbCPq1ANKxy9Nl4kTNbBijHFTv7gEXUgyO063FZQmpoiobgEkXBhU
   UtJfH5otsQduULZAZQLjldsL8bvJbiR3LhuGUZxjTKDC8gjd5gHmh/HXz
   VsEPOk4SqVGNsSX+8i7kG5NvlGneS8duOmwN+1BwmQv9V26eSN90qfGx8
   A==;
X-CSE-ConnectionGUID: wGDPgrV3S2+ujBNlAupYKw==
X-CSE-MsgGUID: UXm02yFpRbicgBNwZcIFoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45710211"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="45710211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 07:51:02 -0800
X-CSE-ConnectionGUID: /sqBRzbaSxKQSY368LrzxQ==
X-CSE-MsgGUID: Kc085gQATiSdNVIXTpbFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102899661"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Dec 2024 07:51:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNwKA-000GRe-2L;
	Wed, 18 Dec 2024 15:50:58 +0000
Date: Wed, 18 Dec 2024 23:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 a37eecb705f33726f1fb7cd2a67e514a15dfe693
Message-ID: <202412182342.gmeHjKtQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: a37eecb705f33726f1fb7cd2a67e514a15dfe693  pinctrl: mcp23s08: Fix sleeping in atomic context due to regmap locking

elapsed time: 1447m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241218    gcc-13.2.0
arc                   randconfig-002-20241218    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241218    clang-20
arm                   randconfig-002-20241218    clang-19
arm                   randconfig-003-20241218    clang-17
arm                   randconfig-004-20241218    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241218    clang-20
arm64                 randconfig-002-20241218    clang-20
arm64                 randconfig-003-20241218    gcc-14.2.0
arm64                 randconfig-004-20241218    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241218    gcc-14.2.0
csky                  randconfig-002-20241218    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241218    clang-20
hexagon               randconfig-002-20241218    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241218    clang-19
i386        buildonly-randconfig-002-20241218    clang-19
i386        buildonly-randconfig-003-20241218    gcc-12
i386        buildonly-randconfig-004-20241218    gcc-12
i386        buildonly-randconfig-005-20241218    clang-19
i386        buildonly-randconfig-006-20241218    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241218    gcc-14.2.0
loongarch             randconfig-002-20241218    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241218    gcc-14.2.0
nios2                 randconfig-002-20241218    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241218    gcc-14.2.0
parisc                randconfig-002-20241218    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241218    gcc-14.2.0
powerpc               randconfig-002-20241218    clang-15
powerpc               randconfig-003-20241218    clang-17
powerpc64             randconfig-002-20241218    clang-20
powerpc64             randconfig-003-20241218    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241218    gcc-14.2.0
riscv                 randconfig-002-20241218    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241218    gcc-14.2.0
s390                  randconfig-002-20241218    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241218    gcc-14.2.0
sh                    randconfig-002-20241218    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241218    gcc-14.2.0
sparc                 randconfig-002-20241218    gcc-14.2.0
sparc64               randconfig-001-20241218    gcc-14.2.0
sparc64               randconfig-002-20241218    gcc-14.2.0
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241218    gcc-12
um                    randconfig-002-20241218    clang-17
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241218    clang-19
x86_64      buildonly-randconfig-002-20241218    clang-19
x86_64      buildonly-randconfig-003-20241218    gcc-12
x86_64      buildonly-randconfig-004-20241218    gcc-12
x86_64      buildonly-randconfig-005-20241218    gcc-12
x86_64      buildonly-randconfig-006-20241218    gcc-11
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241218    gcc-14.2.0
xtensa                randconfig-002-20241218    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

