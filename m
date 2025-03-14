Return-Path: <linux-gpio+bounces-17579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB4A60C84
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E249D7AAF77
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 09:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD8D1DD873;
	Fri, 14 Mar 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiM277Uh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703CACA4B
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942867; cv=none; b=s93Z1DfyHYsGLNN0g3A1D6R97r4bllBbwUpDkJMsIQN8prWsqqHzTvmusf1vkJd0Rjsu4pZgjfUQjZ1nehmGucL0Dzhewp0l92fxR1hRyuA6rXm5GkqyjF8kioPA/JisAdpS9nH2ZaA4ojscysFyIzjTsbladgRogVsXYuoHp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942867; c=relaxed/simple;
	bh=0bFet2b73CDBLt9zPFm/XTl1rxcLFPdQrjMrT31G8nY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Za2Awf4apVjfi+QYweJnKPOiJ/45jlO1xVAjYz0TzuGm+TUaVJTmK+wyCzvcYcD1q+9g2xnGCJ6QvtnoerrV9v7ZPCHQvGKyZS8aBBy3x8yiUhnLHVWRL68l9nF7frFHB7OsCudnwUjUb1vIGexf/dqRXpTyWefJ+pj6udnCC0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiM277Uh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741942864; x=1773478864;
  h=date:from:to:cc:subject:message-id;
  bh=0bFet2b73CDBLt9zPFm/XTl1rxcLFPdQrjMrT31G8nY=;
  b=DiM277UhgxN+UM2V0R0mE8u1tw5s5g8yFvLReTnbJhB1SDot25/1K7CW
   LwRo3tW2K5+uoNCBqAu8Q566MYg9FIRN52FDrW2pNsQ8HCDmQXh+x7P4E
   WbU5W/TaMH/F35TNSCfW9SiL+9D63PiG3hGx2Yqrd2bh16z+plqQjLgBG
   WXeCAIO5Ar5Cze6QOOUtX22y46oPpEHZ41A6qQsEZhmwj2zD8nMFHKCZk
   WoMVONVSfNTJefqafedu+4wosNl528YEONijvSrCMd5S9oR3FJFAoLsfK
   fZuP53nXO5GMuP+w9rPJkiMowE7OW47FIysbt7Mbk/JvImnbrUf5Tje06
   A==;
X-CSE-ConnectionGUID: WtbPbBsBSH268ha8AoVrOA==
X-CSE-MsgGUID: ufh8Z+jLQMabvFiDvQ1bXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46878066"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="46878066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 02:01:03 -0700
X-CSE-ConnectionGUID: 2olLtph2SpiRepaMqYaPZw==
X-CSE-MsgGUID: sb1cohDfQaq6iEXTIM4Ikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121250697"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 Mar 2025 02:01:02 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt0uZ-000AGG-38;
	Fri, 14 Mar 2025 09:00:59 +0000
Date: Fri, 14 Mar 2025 17:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 240ba5b6df0fb14cc49577c25d75dd4a6290239a
Message-ID: <202503141748.k0aaV55Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 240ba5b6df0fb14cc49577c25d75dd4a6290239a  Merge tag 'intel-gpio-v6.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next

elapsed time: 1447m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250313    gcc-13.2.0
arc                   randconfig-002-20250313    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-17
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250313    clang-16
arm                   randconfig-002-20250313    clang-18
arm                   randconfig-003-20250313    gcc-14.2.0
arm                   randconfig-004-20250313    clang-21
arm                           sama7_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250313    clang-18
arm64                 randconfig-002-20250313    clang-16
arm64                 randconfig-003-20250313    gcc-14.2.0
arm64                 randconfig-004-20250313    clang-21
csky                  randconfig-001-20250313    gcc-14.2.0
csky                  randconfig-002-20250313    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250313    clang-17
hexagon               randconfig-002-20250313    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250313    gcc-12
i386        buildonly-randconfig-002-20250313    gcc-12
i386        buildonly-randconfig-003-20250313    clang-19
i386        buildonly-randconfig-004-20250313    gcc-12
i386        buildonly-randconfig-005-20250313    clang-19
i386        buildonly-randconfig-006-20250313    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250313    gcc-14.2.0
loongarch             randconfig-002-20250313    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250313    gcc-14.2.0
nios2                 randconfig-002-20250313    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250313    gcc-14.2.0
parisc                randconfig-002-20250313    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      ppc44x_defconfig    clang-21
powerpc               randconfig-001-20250313    clang-16
powerpc               randconfig-002-20250313    clang-18
powerpc               randconfig-003-20250313    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-21
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250313    gcc-14.2.0
powerpc64             randconfig-002-20250313    gcc-14.2.0
powerpc64             randconfig-003-20250313    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250313    clang-21
riscv                 randconfig-002-20250313    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250313    clang-15
s390                  randconfig-002-20250313    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250313    gcc-14.2.0
sh                    randconfig-002-20250313    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250313    gcc-14.2.0
sparc                 randconfig-002-20250313    gcc-14.2.0
sparc64               randconfig-001-20250313    gcc-14.2.0
sparc64               randconfig-002-20250313    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250313    clang-21
um                    randconfig-002-20250313    clang-21
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250313    clang-19
x86_64      buildonly-randconfig-002-20250313    clang-19
x86_64      buildonly-randconfig-003-20250313    clang-19
x86_64      buildonly-randconfig-004-20250313    gcc-12
x86_64      buildonly-randconfig-005-20250313    clang-19
x86_64      buildonly-randconfig-006-20250313    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250313    gcc-14.2.0
xtensa                randconfig-002-20250313    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

