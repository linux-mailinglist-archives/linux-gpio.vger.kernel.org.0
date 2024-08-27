Return-Path: <linux-gpio+bounces-9212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C7B960742
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 12:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AF44B24549
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 10:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF86192599;
	Tue, 27 Aug 2024 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3uvYUgj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9ED137747
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753958; cv=none; b=j+CSFLTVoq1AbHSJso1xQyQeU6F+Cwg4SElp1eRFRf4sUcJqjpS1i8Fqn4nej+cUqmi4mBSkcURn/pOtAlNoKRwic7cJNbGEFeh6z8cyfQ1kgLEdWMuoPHwpDdyfnY/cF1YqBh+2fnXDL1S/VDmtJgSceTTjZgrvKhlBIeA3LUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753958; c=relaxed/simple;
	bh=7zoq8D3EO2Ds/Gv5yJ7gibZSCzNFT0LGUYcUn8Rs4ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hPamTAjp0/B+AIaoBzfWkpG9+fZj8EtjZrlTXT/aNa003uv4F58WO92jGy7rA+pj/0WnrgfwyJ+JUjWICP0Fsgv4JdToWOmY/ssCc/O+dRuvdToziDUoGe1m9NbCLwnxp47s04CNX3Aiesd+lGuL3JY6L1LHOjYBN0lQvRIZ2LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3uvYUgj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724753956; x=1756289956;
  h=date:from:to:cc:subject:message-id;
  bh=7zoq8D3EO2Ds/Gv5yJ7gibZSCzNFT0LGUYcUn8Rs4ok=;
  b=T3uvYUgjzBc5ubINMw927KHpC+l3QruEjPgptHdTpJElUplgEGBTQV5q
   3cd/Lspo2HlqsdXtBgR6qqp/OPBcy+tg083Gg18cCwy5vpamhIeAkEMEw
   8tTFidZxp3hmlkl32BjA3lU0Qsv8SJVdTjiqPLbimM/mZIZUO2J5UkaU/
   AmMxP8dgssu8+p9dlfveeRh6ml3aO9wl2UmAp1UPAtXCs+G8cPJPXL9LS
   1NERb9H55ZI4+RBHZSGvZ8tCNF7Nr9nkYT+Zb+OaZHff4Dt4zH3yk1eMu
   cNDZqts+vaSkGoarfcmg1SCz4wpnhjxdayEC6Fz/uZg6NC3nk0GgwJZAp
   g==;
X-CSE-ConnectionGUID: R3bbKm9EQQa6sHXG3KAAJg==
X-CSE-MsgGUID: liW2/RMSRmqtchvTd5lrDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23347161"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="23347161"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 03:19:16 -0700
X-CSE-ConnectionGUID: 0pKlH2qGQe6fZsWRLciVdQ==
X-CSE-MsgGUID: 9fvF4q4ZRECLp51h36a94w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62516407"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2024 03:19:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sitI8-000IVi-2k;
	Tue, 27 Aug 2024 10:19:12 +0000
Date: Tue, 27 Aug 2024 18:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 9b82ec85ebb326d20553220945bad1cc203b8805
Message-ID: <202408271819.LTkyIDkm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 9b82ec85ebb326d20553220945bad1cc203b8805  Merge branch 'ib-sophgo-pintrl' into devel

elapsed time: 1475m

configs tested: 237
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240827   gcc-13.2.0
arc                   randconfig-002-20240827   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                      footbridge_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                           omap1_defconfig   clang-20
arm                   randconfig-001-20240827   clang-20
arm                   randconfig-001-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-14.1.0
arm                   randconfig-003-20240827   clang-20
arm                   randconfig-003-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-14.1.0
arm                         s5pv210_defconfig   clang-20
arm                          sp7021_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-14.1.0
arm64                 randconfig-002-20240827   clang-14
arm64                 randconfig-002-20240827   gcc-13.2.0
arm64                 randconfig-003-20240827   clang-14
arm64                 randconfig-003-20240827   gcc-13.2.0
arm64                 randconfig-004-20240827   clang-20
arm64                 randconfig-004-20240827   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-14.1.0
csky                  randconfig-002-20240827   gcc-13.2.0
csky                  randconfig-002-20240827   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240827   clang-20
hexagon               randconfig-002-20240827   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240827   gcc-12
i386         buildonly-randconfig-002-20240827   clang-18
i386         buildonly-randconfig-002-20240827   gcc-12
i386         buildonly-randconfig-003-20240827   gcc-12
i386         buildonly-randconfig-004-20240827   clang-18
i386         buildonly-randconfig-004-20240827   gcc-12
i386         buildonly-randconfig-005-20240827   clang-18
i386         buildonly-randconfig-005-20240827   gcc-12
i386         buildonly-randconfig-006-20240827   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240827   gcc-12
i386                  randconfig-002-20240827   gcc-12
i386                  randconfig-003-20240827   gcc-12
i386                  randconfig-004-20240827   gcc-12
i386                  randconfig-005-20240827   gcc-12
i386                  randconfig-006-20240827   clang-18
i386                  randconfig-006-20240827   gcc-12
i386                  randconfig-011-20240827   clang-18
i386                  randconfig-011-20240827   gcc-12
i386                  randconfig-012-20240827   clang-18
i386                  randconfig-012-20240827   gcc-12
i386                  randconfig-013-20240827   clang-18
i386                  randconfig-013-20240827   gcc-12
i386                  randconfig-014-20240827   gcc-12
i386                  randconfig-015-20240827   gcc-12
i386                  randconfig-016-20240827   clang-18
i386                  randconfig-016-20240827   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-14.1.0
loongarch             randconfig-002-20240827   gcc-13.2.0
loongarch             randconfig-002-20240827   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                           ci20_defconfig   clang-20
mips                  maltasmvp_eva_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-14.1.0
nios2                 randconfig-002-20240827   gcc-13.2.0
nios2                 randconfig-002-20240827   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240827   gcc-13.2.0
parisc                randconfig-001-20240827   gcc-14.1.0
parisc                randconfig-002-20240827   gcc-13.2.0
parisc                randconfig-002-20240827   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                        cell_defconfig   clang-20
powerpc                        icon_defconfig   clang-20
powerpc               randconfig-001-20240827   clang-14
powerpc               randconfig-001-20240827   gcc-13.2.0
powerpc               randconfig-002-20240827   gcc-13.2.0
powerpc               randconfig-002-20240827   gcc-14.1.0
powerpc               randconfig-003-20240827   clang-20
powerpc               randconfig-003-20240827   gcc-13.2.0
powerpc                     sequoia_defconfig   clang-20
powerpc64             randconfig-001-20240827   gcc-13.2.0
powerpc64             randconfig-001-20240827   gcc-14.1.0
powerpc64             randconfig-002-20240827   gcc-13.2.0
powerpc64             randconfig-002-20240827   gcc-14.1.0
powerpc64             randconfig-003-20240827   clang-14
powerpc64             randconfig-003-20240827   gcc-13.2.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240827   clang-20
riscv                 randconfig-001-20240827   gcc-13.2.0
riscv                 randconfig-002-20240827   gcc-13.2.0
riscv                 randconfig-002-20240827   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240827   clang-20
s390                  randconfig-001-20240827   gcc-13.2.0
s390                  randconfig-002-20240827   gcc-13.2.0
s390                  randconfig-002-20240827   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240827   gcc-13.2.0
sh                    randconfig-001-20240827   gcc-14.1.0
sh                    randconfig-002-20240827   gcc-13.2.0
sh                    randconfig-002-20240827   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240827   gcc-13.2.0
sparc64               randconfig-001-20240827   gcc-14.1.0
sparc64               randconfig-002-20240827   gcc-13.2.0
sparc64               randconfig-002-20240827   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240827   gcc-12
um                    randconfig-001-20240827   gcc-13.2.0
um                    randconfig-002-20240827   gcc-12
um                    randconfig-002-20240827   gcc-13.2.0
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240827   clang-18
x86_64       buildonly-randconfig-002-20240827   clang-18
x86_64       buildonly-randconfig-002-20240827   gcc-12
x86_64       buildonly-randconfig-003-20240827   clang-18
x86_64       buildonly-randconfig-003-20240827   gcc-12
x86_64       buildonly-randconfig-004-20240827   clang-18
x86_64       buildonly-randconfig-004-20240827   gcc-12
x86_64       buildonly-randconfig-005-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240827   clang-18
x86_64                randconfig-002-20240827   clang-18
x86_64                randconfig-002-20240827   gcc-12
x86_64                randconfig-003-20240827   clang-18
x86_64                randconfig-003-20240827   gcc-12
x86_64                randconfig-004-20240827   clang-18
x86_64                randconfig-004-20240827   gcc-12
x86_64                randconfig-005-20240827   clang-18
x86_64                randconfig-006-20240827   clang-18
x86_64                randconfig-006-20240827   gcc-12
x86_64                randconfig-011-20240827   clang-18
x86_64                randconfig-011-20240827   gcc-12
x86_64                randconfig-012-20240827   clang-18
x86_64                randconfig-012-20240827   gcc-12
x86_64                randconfig-013-20240827   clang-18
x86_64                randconfig-013-20240827   gcc-12
x86_64                randconfig-014-20240827   clang-18
x86_64                randconfig-015-20240827   clang-18
x86_64                randconfig-015-20240827   gcc-12
x86_64                randconfig-016-20240827   clang-18
x86_64                randconfig-016-20240827   gcc-12
x86_64                randconfig-071-20240827   clang-18
x86_64                randconfig-071-20240827   gcc-12
x86_64                randconfig-072-20240827   clang-18
x86_64                randconfig-072-20240827   gcc-11
x86_64                randconfig-073-20240827   clang-18
x86_64                randconfig-073-20240827   gcc-12
x86_64                randconfig-074-20240827   clang-18
x86_64                randconfig-074-20240827   gcc-12
x86_64                randconfig-075-20240827   clang-18
x86_64                randconfig-076-20240827   clang-18
x86_64                randconfig-076-20240827   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240827   gcc-13.2.0
xtensa                randconfig-001-20240827   gcc-14.1.0
xtensa                randconfig-002-20240827   gcc-13.2.0
xtensa                randconfig-002-20240827   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

