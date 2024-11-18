Return-Path: <linux-gpio+bounces-13080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAEA9D1044
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 12:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94EF51F21842
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 11:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDE3194AD7;
	Mon, 18 Nov 2024 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ej4N3GZf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2466176AA9
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731931109; cv=none; b=fA5fB5H6hKdWK6NFWwxuSUNYOXxN9cU8/uXp/vhyrK+Nqga5URbFVPqmDh2VXjY6bu82j6/2/R09dhohhF0d9REaiXGCabkwcS1vutrfo8nulCRky/nxHOjJKv+2Y31zpX6zKWk1ZRpZ5TEmucM0xL/eO3LsH5opdTDgn34Lmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731931109; c=relaxed/simple;
	bh=hsFSTsNMf0BwerbdtzONbbE/1DxuhYPOfLS7Q9Ta1Gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c+VfRePqY5FXImLYGhv8W+H/tDTvKO2qaT26CSat/5S3SChVLOoSEs/cSDa/rP6ubBeMxuK+AopNEMkSGBa1XFqOI8FhrqBkVPTonH2Qy0K7iHnUIGS2MjqcF/efNeIZ8kAmzl9x9oLhAeKzpEYxpss91qe2/Q31o4JmwpW/aSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ej4N3GZf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731931107; x=1763467107;
  h=date:from:to:cc:subject:message-id;
  bh=hsFSTsNMf0BwerbdtzONbbE/1DxuhYPOfLS7Q9Ta1Gs=;
  b=Ej4N3GZfV+2AuO5f3PJPfkAlDMk0MVdJz8DQgxngnu7eDaUsOf4/0lbO
   0fOyt3uA+YU+iWPaLPNrdr1SyT8a4sp/sdkD3XrI7gJsTLfKgisUrA5W6
   QiVTr83l+ikZbkaTdm2DiIBumXk4TpFidEIxHEtfGlnKPDwQ2sDcd+4io
   i3Tzc/KYENzI+yUbeirc5935WthCOlx3ciyqrF8wsJItiyr7mzTQrYuZ8
   IDmLkUXYUlEInp4WpbnmqdHyQ1nh2m8+pA/m+NGIgSm9BusTHymCbzREu
   CruD7RWYLABleEQjjnILEqKK6jkpMvzXCQDR+xoPrnqdrQIYOHenlqqHZ
   Q==;
X-CSE-ConnectionGUID: HBBmhHlxQQO6sGvG3MoJDw==
X-CSE-MsgGUID: waB06sTGSQWMUQV7X+wVtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31258362"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31258362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 03:58:26 -0800
X-CSE-ConnectionGUID: FzLC/IF7SyaJ+XhOEBgA2g==
X-CSE-MsgGUID: X/0rwQ7PRYiZmObiq+1JLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89635060"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2024 03:58:25 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD0Od-0002Pf-09;
	Mon, 18 Nov 2024 11:58:23 +0000
Date: Mon, 18 Nov 2024 19:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 6bc0ebfb1d920f13c522545f114cdabb49e9408a
Message-ID: <202411181919.oKL3tqqj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 6bc0ebfb1d920f13c522545f114cdabb49e9408a  pinctrl: qcom: spmi: fix debugfs drive strength

elapsed time: 725m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    clang-20
arm                         axm55xx_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241118    gcc-12
i386        buildonly-randconfig-002-20241118    gcc-12
i386        buildonly-randconfig-003-20241118    gcc-12
i386        buildonly-randconfig-004-20241118    gcc-12
i386        buildonly-randconfig-005-20241118    gcc-12
i386        buildonly-randconfig-006-20241118    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241118    gcc-12
i386                  randconfig-002-20241118    gcc-12
i386                  randconfig-003-20241118    gcc-12
i386                  randconfig-004-20241118    gcc-12
i386                  randconfig-005-20241118    gcc-12
i386                  randconfig-006-20241118    gcc-12
i386                  randconfig-011-20241118    gcc-12
i386                  randconfig-012-20241118    gcc-12
i386                  randconfig-013-20241118    gcc-12
i386                  randconfig-014-20241118    gcc-12
i386                  randconfig-015-20241118    gcc-12
i386                  randconfig-016-20241118    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                           ip27_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-20
powerpc                    sam440ep_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    clang-20
sh                           se7750_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sh                            shmin_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

