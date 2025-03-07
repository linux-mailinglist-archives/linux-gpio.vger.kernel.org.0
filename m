Return-Path: <linux-gpio+bounces-17225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 414ADA5647B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 11:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D88216BBEE
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 10:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A976620C482;
	Fri,  7 Mar 2025 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g648K9d4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF720CCCC
	for <linux-gpio@vger.kernel.org>; Fri,  7 Mar 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741341602; cv=none; b=pCvDwVr3rKIF1012LAilC4qwICjiY7ZZ1oCtF14+F7cMk68ICVrvXYchFoe6GT+92gliSpbZP9L8mmGolF1f4WqEfPmPdaaYEiHGuKr8LFcvol+ikgvzZWDEprbPh56jCj3p5aHQGn+b3BJLXxioB0ev3XGjmzM0/zrZGyjrE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741341602; c=relaxed/simple;
	bh=pG4ZSIVNu+rYWpCEiLNDPh2uxyKr/wuqLea8UzQbIBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hXk9EjwnA1jzmXLZOGvjRVkU3+e64HhQBHsFbTo74Xde+wzSZJXpxm6+AeIEWVjcYVeW1RQcDmg4/z1Ppa2B0GkQaH5QEGkdkaPKDD8NM9vTiEhn+PWCORu0vIl1ZxAOYR+YaQtHM7tk5HR0wmNhDyvchfpz7G3QqnPcxN/EOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g648K9d4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741341601; x=1772877601;
  h=date:from:to:cc:subject:message-id;
  bh=pG4ZSIVNu+rYWpCEiLNDPh2uxyKr/wuqLea8UzQbIBs=;
  b=g648K9d4WZbN6YbrSh3j8uKjqcBANGZivHByWVoCa9pMCP6EYo3OJTmN
   LFWsiCrrOGPHVurwfDvLa8RNbzXHjCZLOd+r8qF4w7BrERA3Tke7l5mwp
   0iu0QFlFV8QHQPRCO0TDKdRmkb3awpwT7Sy0hkQoHQXAfRkqPXpx/hPpv
   bAQdgiS8TjqFrJUmH6WuLa9ygnA9JJGsP81HdwrK32I2wKll5iR05uymq
   bCvd3u2Zp61jGjntFKJw7I+bI0U4LxeEN641bkrNOKfxB3TC87gi66PyX
   YDnqOgBrkVdxNAzqW4qGSZn9wItWWCJbl0r1EARm4Vk/xg+wb7WJIf0eI
   g==;
X-CSE-ConnectionGUID: fipqZN1NS7CG1lkcMgmeAA==
X-CSE-MsgGUID: QM4xDauST3uipdcXPzQHTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53373847"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53373847"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 02:00:01 -0800
X-CSE-ConnectionGUID: gRqtsBmLSeaPk2j5OSCn6Q==
X-CSE-MsgGUID: 6vvaSxsMSt6sATQzlUZCeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119207394"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 01:59:59 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqUUn-0000Gp-0F;
	Fri, 07 Mar 2025 09:59:57 +0000
Date: Fri, 07 Mar 2025 17:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 60d69769c851d309047d0c79a05011e9b2158b35
Message-ID: <202503071729.KIA1RQqt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 60d69769c851d309047d0c79a05011e9b2158b35  pinctrl: bcm281xx: Add support for BCM21664 pinmux

elapsed time: 1452m

configs tested: 80
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250306    gcc-13.2.0
arc                  randconfig-002-20250306    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250306    gcc-14.2.0
arm                  randconfig-002-20250306    gcc-14.2.0
arm                  randconfig-003-20250306    gcc-14.2.0
arm                  randconfig-004-20250306    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250306    gcc-14.2.0
arm64                randconfig-002-20250306    gcc-14.2.0
arm64                randconfig-003-20250306    gcc-14.2.0
arm64                randconfig-004-20250306    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250306    gcc-14.2.0
csky                 randconfig-002-20250306    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                          allnoconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250306    clang-21
hexagon              randconfig-002-20250306    clang-19
i386                             allnoconfig    gcc-12
i386       buildonly-randconfig-001-20250306    clang-19
i386       buildonly-randconfig-002-20250306    clang-19
i386       buildonly-randconfig-003-20250306    clang-19
i386       buildonly-randconfig-004-20250306    gcc-12
i386       buildonly-randconfig-005-20250306    gcc-12
i386       buildonly-randconfig-006-20250306    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250306    gcc-14.2.0
loongarch            randconfig-002-20250306    gcc-14.2.0
nios2                randconfig-001-20250306    gcc-14.2.0
nios2                randconfig-002-20250306    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250306    gcc-14.2.0
parisc               randconfig-002-20250306    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250306    clang-21
powerpc              randconfig-002-20250306    clang-18
powerpc              randconfig-003-20250306    gcc-14.2.0
powerpc64            randconfig-001-20250306    clang-18
powerpc64            randconfig-002-20250306    clang-21
powerpc64            randconfig-003-20250306    clang-18
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250306    clang-18
riscv                randconfig-002-20250306    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250306    gcc-14.2.0
s390                 randconfig-002-20250306    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250306    gcc-14.2.0
sh                   randconfig-002-20250306    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250306    gcc-14.2.0
sparc                randconfig-002-20250306    gcc-14.2.0
sparc64              randconfig-001-20250306    gcc-14.2.0
sparc64              randconfig-002-20250306    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250306    gcc-12
um                   randconfig-002-20250306    clang-16
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250306    gcc-11
x86_64     buildonly-randconfig-002-20250306    clang-19
x86_64     buildonly-randconfig-003-20250306    clang-19
x86_64     buildonly-randconfig-004-20250306    clang-19
x86_64     buildonly-randconfig-005-20250306    clang-19
x86_64     buildonly-randconfig-006-20250306    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250306    gcc-14.2.0
xtensa               randconfig-002-20250306    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

