Return-Path: <linux-gpio+bounces-9124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149095E26D
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 09:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 814A81F21966
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 07:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2180757CAC;
	Sun, 25 Aug 2024 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIPSI0fm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163252F62
	for <linux-gpio@vger.kernel.org>; Sun, 25 Aug 2024 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724570910; cv=none; b=ij9qDuEHjtplIOspeR1OqhFQz8eoGA+Tvh4sFFz8ZAncGjXs1OUMgtZyWOFPsjIS9y3sAJUifaj2fjQzKJsbtl6ciRrbON/MyWa2wxqaKQLl6VsdysDYdfNC0LMbhTRrc5Y72fdk9gI06DzxFIl67+3rdaSzsQGW1GHIfbAedx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724570910; c=relaxed/simple;
	bh=xwzlgqXHxjQhbdZeaFSGWOIvzJm41vFagLs916+O/po=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kbXE9lLRJZiOa5D2ajAHTVWfq1BdiYZu/QSywHefQu/iFzwSgwkLi4dvXxQ5R3Do9XCZLg5EUrE7ujIipWE/iDgWmgHWrWuWUrlaA6Vm3VjRq3nZj76NaUgaeQaL/4nmrwB8K6uqqZbN1/rqSHB2UbcItnht8q2reVH8lFlHkHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIPSI0fm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724570907; x=1756106907;
  h=date:from:to:cc:subject:message-id;
  bh=xwzlgqXHxjQhbdZeaFSGWOIvzJm41vFagLs916+O/po=;
  b=DIPSI0fm1RVp0dh34wlX1RPhilhOFyZ5v6ULuP9h4ghQ2lLQJNaGNwUF
   tEYDpGhheq8hKDC6WMdtvDckfAxiMjjUUj1r6Qf4lYz9UTfa1XwlFmUUA
   YKDO1JlDL60hw3/eEIBE97JPHvKFIJ4YKExYBaDT/FIVs6lS5IVnXiAJQ
   bcvGAYFHbkKIZqXjEs8zTCF2+90EJw7obBZMQQX/BaGEsXNjs4s6V2tXG
   kzDNR+9ep5wispg/77mwZqNdN3ZHkkEDsfblv+RlkXGyNc33VLmh4n58P
   n5JUhCJeLoUKuh7sbdlHh+KC0Cu3Mvd2yPhvMQEfeptBD8ycpeAieCktg
   w==;
X-CSE-ConnectionGUID: 19s8HurfRWKHZ1AVnd+AtA==
X-CSE-MsgGUID: LdCQIbyZRLaxsN9QSiu8uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34165139"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="34165139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 00:28:27 -0700
X-CSE-ConnectionGUID: J1jt3dvFQz6REe1kSnko5A==
X-CSE-MsgGUID: 4/D9NENxT6ONy6t8XLr74w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="93008025"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Aug 2024 00:28:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1si7fj-000F1H-2E;
	Sun, 25 Aug 2024 07:28:23 +0000
Date: Sun, 25 Aug 2024 15:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-current] BUILD SUCCESS
 06802616488c980a63084e53f401cfc8a65672a7
Message-ID: <202408251535.AvlPxcYr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: 06802616488c980a63084e53f401cfc8a65672a7  power: sequencing: qcom-wcn: set the wlan-enable GPIO to output

elapsed time: 1443m

configs tested: 248
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240824   gcc-13.2.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240824   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-14
arm                          gemini_defconfig   clang-20
arm                         mv78xx0_defconfig   clang-20
arm                             mxs_defconfig   clang-14
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240824   gcc-13.2.0
arm                   randconfig-001-20240825   gcc-13.2.0
arm                   randconfig-002-20240824   gcc-13.2.0
arm                   randconfig-002-20240825   gcc-13.2.0
arm                   randconfig-003-20240824   gcc-13.2.0
arm                   randconfig-003-20240825   gcc-13.2.0
arm                   randconfig-004-20240824   gcc-13.2.0
arm                   randconfig-004-20240825   gcc-13.2.0
arm                             rpc_defconfig   clang-20
arm                         socfpga_defconfig   clang-14
arm                           sunxi_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240824   gcc-13.2.0
arm64                 randconfig-001-20240825   gcc-13.2.0
arm64                 randconfig-002-20240824   gcc-13.2.0
arm64                 randconfig-002-20240825   gcc-13.2.0
arm64                 randconfig-003-20240824   gcc-13.2.0
arm64                 randconfig-003-20240825   gcc-13.2.0
arm64                 randconfig-004-20240824   gcc-13.2.0
arm64                 randconfig-004-20240825   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240824   gcc-13.2.0
csky                  randconfig-001-20240825   gcc-13.2.0
csky                  randconfig-002-20240824   gcc-13.2.0
csky                  randconfig-002-20240825   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240824   clang-18
i386         buildonly-randconfig-001-20240825   clang-18
i386         buildonly-randconfig-002-20240824   clang-18
i386         buildonly-randconfig-002-20240825   clang-18
i386         buildonly-randconfig-003-20240824   clang-18
i386         buildonly-randconfig-003-20240825   clang-18
i386         buildonly-randconfig-004-20240824   clang-18
i386         buildonly-randconfig-004-20240825   clang-18
i386         buildonly-randconfig-005-20240824   clang-18
i386         buildonly-randconfig-005-20240825   clang-18
i386         buildonly-randconfig-006-20240824   clang-18
i386         buildonly-randconfig-006-20240825   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240824   clang-18
i386                  randconfig-001-20240825   clang-18
i386                  randconfig-002-20240824   clang-18
i386                  randconfig-002-20240825   clang-18
i386                  randconfig-003-20240824   clang-18
i386                  randconfig-003-20240825   clang-18
i386                  randconfig-004-20240824   clang-18
i386                  randconfig-004-20240825   clang-18
i386                  randconfig-005-20240824   clang-18
i386                  randconfig-005-20240825   clang-18
i386                  randconfig-006-20240824   clang-18
i386                  randconfig-006-20240825   clang-18
i386                  randconfig-011-20240824   clang-18
i386                  randconfig-011-20240825   clang-18
i386                  randconfig-012-20240824   clang-18
i386                  randconfig-012-20240825   clang-18
i386                  randconfig-013-20240824   clang-18
i386                  randconfig-013-20240825   clang-18
i386                  randconfig-014-20240824   clang-18
i386                  randconfig-014-20240825   clang-18
i386                  randconfig-015-20240824   clang-18
i386                  randconfig-015-20240825   clang-18
i386                  randconfig-016-20240824   clang-18
i386                  randconfig-016-20240825   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240824   gcc-13.2.0
loongarch             randconfig-001-20240825   gcc-13.2.0
loongarch             randconfig-002-20240824   gcc-13.2.0
loongarch             randconfig-002-20240825   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-14
mips                          rb532_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240824   gcc-13.2.0
nios2                 randconfig-001-20240825   gcc-13.2.0
nios2                 randconfig-002-20240824   gcc-13.2.0
nios2                 randconfig-002-20240825   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240824   gcc-13.2.0
parisc                randconfig-001-20240825   gcc-13.2.0
parisc                randconfig-002-20240824   gcc-13.2.0
parisc                randconfig-002-20240825   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-14
powerpc                 mpc8313_rdb_defconfig   clang-14
powerpc                      pasemi_defconfig   clang-20
powerpc                     powernv_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-20
powerpc                      ppc64e_defconfig   clang-20
powerpc               randconfig-001-20240824   gcc-13.2.0
powerpc               randconfig-001-20240825   gcc-13.2.0
powerpc               randconfig-002-20240825   gcc-13.2.0
powerpc                     tqm8548_defconfig   clang-20
powerpc                        warp_defconfig   clang-14
powerpc64             randconfig-001-20240824   gcc-13.2.0
powerpc64             randconfig-001-20240825   gcc-13.2.0
powerpc64             randconfig-002-20240824   gcc-13.2.0
powerpc64             randconfig-003-20240824   gcc-13.2.0
powerpc64             randconfig-003-20240825   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240824   gcc-13.2.0
riscv                 randconfig-001-20240825   gcc-13.2.0
riscv                 randconfig-002-20240824   gcc-13.2.0
riscv                 randconfig-002-20240825   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                          debug_defconfig   clang-20
s390                                defconfig   clang-14
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240824   gcc-13.2.0
s390                  randconfig-001-20240825   gcc-13.2.0
s390                  randconfig-002-20240824   gcc-13.2.0
s390                  randconfig-002-20240825   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240824   gcc-13.2.0
sh                    randconfig-001-20240825   gcc-13.2.0
sh                    randconfig-002-20240824   gcc-13.2.0
sh                    randconfig-002-20240825   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240824   gcc-13.2.0
sparc64               randconfig-001-20240825   gcc-13.2.0
sparc64               randconfig-002-20240824   gcc-13.2.0
sparc64               randconfig-002-20240825   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240824   gcc-13.2.0
um                    randconfig-001-20240825   gcc-13.2.0
um                    randconfig-002-20240824   gcc-13.2.0
um                    randconfig-002-20240825   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240824   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240824   clang-18
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240824   clang-18
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240824   clang-18
x86_64       buildonly-randconfig-004-20240825   gcc-12
x86_64       buildonly-randconfig-005-20240824   clang-18
x86_64       buildonly-randconfig-005-20240825   gcc-12
x86_64       buildonly-randconfig-006-20240824   clang-18
x86_64       buildonly-randconfig-006-20240825   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240824   clang-18
x86_64                randconfig-001-20240825   gcc-12
x86_64                randconfig-002-20240824   clang-18
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240824   clang-18
x86_64                randconfig-003-20240825   gcc-12
x86_64                randconfig-004-20240824   clang-18
x86_64                randconfig-004-20240825   gcc-12
x86_64                randconfig-005-20240824   clang-18
x86_64                randconfig-005-20240825   gcc-12
x86_64                randconfig-006-20240824   clang-18
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240824   clang-18
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240824   clang-18
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240824   clang-18
x86_64                randconfig-013-20240825   gcc-12
x86_64                randconfig-014-20240824   clang-18
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240824   clang-18
x86_64                randconfig-015-20240825   gcc-12
x86_64                randconfig-016-20240824   clang-18
x86_64                randconfig-016-20240825   gcc-12
x86_64                randconfig-071-20240824   clang-18
x86_64                randconfig-071-20240825   gcc-12
x86_64                randconfig-072-20240824   clang-18
x86_64                randconfig-072-20240825   gcc-12
x86_64                randconfig-073-20240824   clang-18
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240824   clang-18
x86_64                randconfig-074-20240825   gcc-12
x86_64                randconfig-075-20240824   clang-18
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240824   clang-18
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240824   gcc-13.2.0
xtensa                randconfig-001-20240825   gcc-13.2.0
xtensa                randconfig-002-20240824   gcc-13.2.0
xtensa                randconfig-002-20240825   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

