Return-Path: <linux-gpio+bounces-10791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387C98F032
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 15:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DFE2B2110F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 13:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D172BAFC;
	Thu,  3 Oct 2024 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGnzjxyP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6F146A66
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961584; cv=none; b=JTYygk6TkuO7pv7Ps7ZsGpR1ab+jtFO5v5qLIwS0erFpLJC5I3DASkKPtF7JOXJY6DZx3zmJqHo7uUeDKrAcmvTU72gYIlqn32BlpHrmOIxC+8OD+KHAcYcflf3uwkv0LfMUpZaQ8/zTBXYI9ovVzxs8HQADqYjvDvQD4P9+UkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961584; c=relaxed/simple;
	bh=+oRA8zOv05GkZK9tfZrsRDGlCYm1BCSIgVfTLZjngIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kGVjVp8vJGUU4kEQzROCJliv6X7ZFPjsfNlVtyOJBiJBUeUZSX+IgRm1DCguTwAvdpAGmG4RMDpHOayG43cBMZnx/r3gp6hN22LnPz6a2a+ojrHbUCfr7x5kR6cOhMyAm3KAczTqWsl3TXMvUnuypNMC926cUoxbEDFghiblATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGnzjxyP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727961581; x=1759497581;
  h=date:from:to:cc:subject:message-id;
  bh=+oRA8zOv05GkZK9tfZrsRDGlCYm1BCSIgVfTLZjngIA=;
  b=BGnzjxyPV8wcyQ7hE2sVfSfGJYpjnrKzcskzeso8iZQCFy6CGcuR2ObC
   7LzHcsaAV7pyhxXGzRi0DB0E7wLPSvGhIIEk4yTcgCdDFwWdCU52cRNSV
   4SLOWSQnOxwK65EYYQPQkJra3YwcaZmUly3/0N3gYxIWFEU1ZQo78DQh5
   2saY5+t4t86/UW3C+LgD5Rb/qOfxLc87WkQMUYpIAnzOgHD0hebpsMHU1
   SjH2Y9RISVvH835WtcuLGTaJaUvkGFdHoF/s9l0Ga1YVwZMm0/19eqIn4
   gWKMY6nZx75u6JxzAed4P0pEPD9adXcS745X0cxB4yjMfhsjjPxLDGWrH
   Q==;
X-CSE-ConnectionGUID: K3SiBsORRZu5BSw9lhm/9g==
X-CSE-MsgGUID: SaBCUf5RTbK+tTGFccwzzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27028547"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27028547"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:11:33 -0700
X-CSE-ConnectionGUID: yWQfi5d1TXiLCWk4NIU8Cw==
X-CSE-MsgGUID: afsEa+GhSlSxTSCgnUO03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74021630"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2024 06:11:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swLc8-0000RZ-2E;
	Thu, 03 Oct 2024 13:11:28 +0000
Date: Thu, 03 Oct 2024 21:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING
 06783dc52057045edd9cfcdd8f90899d04bc8678
Message-ID: <202410032143.bSScGZIu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 06783dc52057045edd9cfcdd8f90899d04bc8678  pinctrl: imx1: Fix too generic defines

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202410030852.q0Hukplf-lkp@intel.com

    kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX_SCU when selected by PINCTRL_IMX8DXL

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-allnoconfig
    `-- kismet:WARNING:unmet-direct-dependencies-detected-for-PINCTRL_IMX_SCU-when-selected-by-PINCTRL_IMX8DXL

elapsed time: 918m

configs tested: 172
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                            hsdk_defconfig    gcc-14.1.0
arc                   randconfig-001-20241003    gcc-14.1.0
arc                   randconfig-002-20241003    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                         orion5x_defconfig    gcc-14.1.0
arm                   randconfig-001-20241003    gcc-14.1.0
arm                   randconfig-002-20241003    gcc-14.1.0
arm                   randconfig-003-20241003    gcc-14.1.0
arm                   randconfig-004-20241003    gcc-14.1.0
arm                        realview_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241003    gcc-14.1.0
arm64                 randconfig-002-20241003    gcc-14.1.0
arm64                 randconfig-003-20241003    gcc-14.1.0
arm64                 randconfig-004-20241003    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241003    gcc-14.1.0
csky                  randconfig-002-20241003    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241003    gcc-14.1.0
hexagon               randconfig-002-20241003    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241003    gcc-12
i386        buildonly-randconfig-002-20241003    gcc-12
i386        buildonly-randconfig-003-20241003    gcc-12
i386        buildonly-randconfig-004-20241003    gcc-12
i386        buildonly-randconfig-005-20241003    gcc-12
i386        buildonly-randconfig-006-20241003    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241003    gcc-12
i386                  randconfig-002-20241003    gcc-12
i386                  randconfig-003-20241003    gcc-12
i386                  randconfig-004-20241003    gcc-12
i386                  randconfig-005-20241003    gcc-12
i386                  randconfig-006-20241003    gcc-12
i386                  randconfig-011-20241003    gcc-12
i386                  randconfig-012-20241003    gcc-12
i386                  randconfig-013-20241003    gcc-12
i386                  randconfig-014-20241003    gcc-12
i386                  randconfig-015-20241003    gcc-12
i386                  randconfig-016-20241003    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241003    gcc-14.1.0
loongarch             randconfig-002-20241003    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                        qi_lb60_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241003    gcc-14.1.0
nios2                 randconfig-002-20241003    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241003    gcc-14.1.0
parisc                randconfig-002-20241003    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   currituck_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241003    gcc-14.1.0
powerpc               randconfig-002-20241003    gcc-14.1.0
powerpc               randconfig-003-20241003    gcc-14.1.0
powerpc64             randconfig-001-20241003    gcc-14.1.0
powerpc64             randconfig-002-20241003    gcc-14.1.0
powerpc64             randconfig-003-20241003    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241003    gcc-14.1.0
riscv                 randconfig-002-20241003    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.1.0
s390                  randconfig-001-20241003    gcc-14.1.0
s390                  randconfig-002-20241003    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    gcc-14.1.0
sh                    randconfig-001-20241003    gcc-14.1.0
sh                    randconfig-002-20241003    gcc-14.1.0
sh                           se7750_defconfig    gcc-14.1.0
sh                            shmin_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241003    gcc-14.1.0
sparc64               randconfig-002-20241003    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241003    gcc-14.1.0
um                    randconfig-002-20241003    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241003    clang-18
x86_64      buildonly-randconfig-002-20241003    clang-18
x86_64      buildonly-randconfig-003-20241003    clang-18
x86_64      buildonly-randconfig-004-20241003    clang-18
x86_64      buildonly-randconfig-005-20241003    clang-18
x86_64      buildonly-randconfig-006-20241003    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241003    clang-18
x86_64                randconfig-002-20241003    clang-18
x86_64                randconfig-003-20241003    clang-18
x86_64                randconfig-004-20241003    clang-18
x86_64                randconfig-005-20241003    clang-18
x86_64                randconfig-006-20241003    clang-18
x86_64                randconfig-011-20241003    clang-18
x86_64                randconfig-012-20241003    clang-18
x86_64                randconfig-013-20241003    clang-18
x86_64                randconfig-014-20241003    clang-18
x86_64                randconfig-015-20241003    clang-18
x86_64                randconfig-016-20241003    clang-18
x86_64                randconfig-071-20241003    clang-18
x86_64                randconfig-072-20241003    clang-18
x86_64                randconfig-073-20241003    clang-18
x86_64                randconfig-074-20241003    clang-18
x86_64                randconfig-075-20241003    clang-18
x86_64                randconfig-076-20241003    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241003    gcc-14.1.0
xtensa                randconfig-002-20241003    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

