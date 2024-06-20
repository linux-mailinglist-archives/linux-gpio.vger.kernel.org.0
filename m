Return-Path: <linux-gpio+bounces-7584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5A8910D79
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 18:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D71E0285FDD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 16:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279D71B47A9;
	Thu, 20 Jun 2024 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgOSsepB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657351B3F2D
	for <linux-gpio@vger.kernel.org>; Thu, 20 Jun 2024 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902037; cv=none; b=YnsVmFNRX+fMjjvL4U14dJyL1QwtR2v4LUMkxlp094UGejTEcUbt1BMkwuNGU0PQUyvi8LfyMdjTV11ilc2jDrvbFCdzG9eMUXsrp/+GLuSBkMn4ye/aYktMe9tIKtQsDjkfZblh/iQhhLlAKfjMDN+zyz9UBl1xisfJjNMY+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902037; c=relaxed/simple;
	bh=1REQZf5l2c8q8yBMVV7ETw9PfIdltLaNzSZhKMEhPL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NwyjXBLQTsdsXy6orxiUQIilbmx5qqiSdAIJNKxxNqfHiAaq6M5mXB5lmb937jmCHjZ1lHJzFpJlM94eOqC+DViZTOCyXfO9ePvM3dPvT/nCmVPZgvD3yiIp3ag9lT9k52gnar+6Rg7RlvzbQmrCITvH49+O0ztegUfQnivcztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgOSsepB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718902035; x=1750438035;
  h=date:from:to:cc:subject:message-id;
  bh=1REQZf5l2c8q8yBMVV7ETw9PfIdltLaNzSZhKMEhPL0=;
  b=HgOSsepBY9HSLezNMBmPFObSSSkgVXCCiyL0dpt96jihJITy+Q7mhhER
   V5utnmRO5RvyIXpkgjywaRkSAfxZRLUElwS26zODD7ncR6NxL4yKO6yZF
   wDxPyDt71bJrxH9pmHt9XawjPz8FZXPXi+jgNqFWGXNMko3kOnUWBbEWX
   j35TWt4MN1SK4ReQqI7lE5pqz4HjXSFhqTpEFC1VsCEL9TAqBSH7I54Cs
   GPjCBFC5+PYffKLiV2CEGXrXgVRpGwf55DOBYtP+CKrGURIcaIkPnMeg/
   LsLvZ3VIxZTWuPmQWH1mebq69I+SDpc49JR8/8oD+GgQQWFjlWhJrn+bc
   Q==;
X-CSE-ConnectionGUID: ASjrAadxSYKSLXak5lDT2A==
X-CSE-MsgGUID: kEWAVQWsRQqvecD2xp40CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="38415564"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="38415564"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 09:47:15 -0700
X-CSE-ConnectionGUID: s6HABV7NQla4aKUR77Cffw==
X-CSE-MsgGUID: TS/2zl+ASkeH5Q47nUtbmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42406362"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jun 2024 09:47:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKKwJ-0007mG-1w;
	Thu, 20 Jun 2024 16:47:11 +0000
Date: Fri, 21 Jun 2024 00:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 f8b4fbb83820ee1787c1ea91cba392c2ffa96098
Message-ID: <202406210028.HOtBYH2A-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: f8b4fbb83820ee1787c1ea91cba392c2ffa96098  Merge branch 'devel' into for-next

elapsed time: 3184m

configs tested: 116
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                        nsim_700_defconfig   gcc-13.2.0
arc                   randconfig-001-20240619   gcc-13.2.0
arc                   randconfig-002-20240619   gcc-13.2.0
arm                      footbridge_defconfig   clang-19
arm                           h3600_defconfig   gcc-13.2.0
arm                   randconfig-001-20240619   clang-19
arm                   randconfig-002-20240619   clang-19
arm                   randconfig-003-20240619   clang-19
arm                   randconfig-004-20240619   gcc-13.2.0
arm                         wpcm450_defconfig   gcc-13.2.0
arm64                 randconfig-001-20240619   clang-19
arm64                 randconfig-002-20240619   clang-19
arm64                 randconfig-003-20240619   clang-19
arm64                 randconfig-004-20240619   clang-19
csky                  randconfig-001-20240619   gcc-13.2.0
csky                  randconfig-002-20240619   gcc-13.2.0
hexagon               randconfig-001-20240619   clang-15
hexagon               randconfig-002-20240619   clang-19
i386         buildonly-randconfig-001-20240619   clang-18
i386         buildonly-randconfig-002-20240619   clang-18
i386         buildonly-randconfig-003-20240619   clang-18
i386         buildonly-randconfig-004-20240619   clang-18
i386         buildonly-randconfig-005-20240619   gcc-7
i386         buildonly-randconfig-006-20240619   gcc-7
i386                  randconfig-001-20240619   gcc-7
i386                  randconfig-002-20240619   gcc-7
i386                  randconfig-003-20240619   clang-18
i386                  randconfig-004-20240619   gcc-7
i386                  randconfig-005-20240619   clang-18
i386                  randconfig-006-20240619   gcc-9
i386                  randconfig-011-20240619   clang-18
i386                  randconfig-012-20240619   clang-18
i386                  randconfig-013-20240619   gcc-13
i386                  randconfig-014-20240619   clang-18
i386                  randconfig-015-20240619   clang-18
i386                  randconfig-016-20240619   gcc-13
loongarch             randconfig-001-20240619   gcc-13.2.0
loongarch             randconfig-002-20240619   gcc-13.2.0
mips                 decstation_r4k_defconfig   gcc-13.2.0
mips                           gcw0_defconfig   clang-19
mips                          malta_defconfig   gcc-13.2.0
nios2                 randconfig-001-20240619   gcc-13.2.0
nios2                 randconfig-002-20240619   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240619   gcc-13.2.0
parisc                randconfig-002-20240619   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                     kilauea_defconfig   clang-19
powerpc               mpc834x_itxgp_defconfig   clang-14
powerpc                      obs600_defconfig   clang-14
powerpc               randconfig-001-20240619   gcc-13.2.0
powerpc               randconfig-002-20240619   clang-15
powerpc               randconfig-003-20240619   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-13.2.0
powerpc                      walnut_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240619   gcc-13.2.0
powerpc64             randconfig-002-20240619   gcc-13.2.0
powerpc64             randconfig-003-20240619   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240619   clang-15
riscv                 randconfig-002-20240619   clang-19
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240619   clang-19
s390                  randconfig-002-20240619   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                         ap325rxa_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240619   gcc-13.2.0
sh                    randconfig-002-20240619   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240619   gcc-13.2.0
sparc64               randconfig-002-20240619   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240619   clang-19
um                    randconfig-002-20240619   clang-19
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240619   clang-18
x86_64       buildonly-randconfig-002-20240619   clang-18
x86_64       buildonly-randconfig-003-20240619   gcc-11
x86_64       buildonly-randconfig-004-20240619   clang-18
x86_64       buildonly-randconfig-005-20240619   clang-18
x86_64       buildonly-randconfig-006-20240619   gcc-13
x86_64                randconfig-001-20240619   gcc-13
x86_64                randconfig-002-20240619   clang-18
x86_64                randconfig-003-20240619   gcc-8
x86_64                randconfig-004-20240619   clang-18
x86_64                randconfig-005-20240619   clang-18
x86_64                randconfig-006-20240619   gcc-13
x86_64                randconfig-011-20240619   gcc-13
x86_64                randconfig-012-20240619   gcc-13
x86_64                randconfig-013-20240619   gcc-13
x86_64                randconfig-014-20240619   clang-18
x86_64                randconfig-015-20240619   clang-18
x86_64                randconfig-016-20240619   gcc-11
x86_64                randconfig-071-20240619   clang-18
x86_64                randconfig-072-20240619   clang-18
x86_64                randconfig-073-20240619   gcc-9
x86_64                randconfig-074-20240619   gcc-9
x86_64                randconfig-075-20240619   clang-18
x86_64                randconfig-076-20240619   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240619   gcc-13.2.0
xtensa                randconfig-002-20240619   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

