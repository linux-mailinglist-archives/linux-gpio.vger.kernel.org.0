Return-Path: <linux-gpio+bounces-17952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF15A6EB91
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1282F167094
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921F519EEC2;
	Tue, 25 Mar 2025 08:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Th2+1DtI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188BA927
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891424; cv=none; b=Rh/fVF5qZ+YionU7lOnrRZEC14Z9p20hjxwGcubwW5zZRvmW4QlMaSvXcc2C5vdBfLUV4SMuI+Reoy7cSAbNvQfsc/ejRpvj5xBsDhE0cdOiV+Q+OOGRgs7keIWKzvR5w7ZZS2HquabbnS8422PP1wK+/bt8qH+8E1b7h9dE96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891424; c=relaxed/simple;
	bh=ypy/DGq87LxKbFKj6NQqyI92b48DFXMUhexUTJcOJDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ung9OZ2sv/SENwUev2pWtvsBOmUNYgCvG46Jq2QN68jbLkVJ5V2cnJz9GhI8Kecz/Uhmbu+2dEPSDzMMH8v+pndV3XcPyxBtrHX5VstysKx+aQK0F73/VZYr+a45+1Zr0Zfpvg2RN07ro/ufQRQbqXK3MQILwr2mTGiEhCXZqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Th2+1DtI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742891422; x=1774427422;
  h=date:from:to:cc:subject:message-id;
  bh=ypy/DGq87LxKbFKj6NQqyI92b48DFXMUhexUTJcOJDs=;
  b=Th2+1DtIXVliXKzpjkY/smIJhzKZddZAjzuUmg0XMDR096Z8Bjhycsme
   +buDbHYniLlItOK6471QZTYCMiaefCwhoU+y+VZcgMB2BIKDcM70PQQCJ
   RZJ4oyHhXdRssWp95K7mDPdwemPB/X20rcaslVQ4gM29vJbNmhQxSVlJB
   osdfgbz5ReyyqNst7vpD3nfs1hucZWuZmxhVFMGd/Yuf7B6VVo6aC6KP+
   gA6NntN4VutqhNGtIuaYX9sw4g79dsX1ttazf3vL9PfJz+oMTc2qXF9u6
   HsWhGdM9OYkzAV0nYpN5nvMeAOCoUWPQFLBLsK5b5sZf2SrxiIL+YY6v3
   w==;
X-CSE-ConnectionGUID: roN2VowmSDy4KNRm+E1dsg==
X-CSE-MsgGUID: 4oTRfjDdTjeGAoQfJwiJcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="48000137"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="48000137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 01:27:34 -0700
X-CSE-ConnectionGUID: Df2ZhaRZSDuK4Nl5aaKSdQ==
X-CSE-MsgGUID: mEvtHlMNQJCM3UrLwLxNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124764683"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Mar 2025 01:26:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twzcE-0004Et-0n;
	Tue, 25 Mar 2025 08:26:30 +0000
Date: Tue, 25 Mar 2025 16:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/fix-amlogic-a4] BUILD SUCCESS
 685ae15e2d7340076a8e5028d38fc211036f8938
Message-ID: <202503251659.C4XUi6P9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/fix-amlogic-a4
branch HEAD: 685ae15e2d7340076a8e5028d38fc211036f8938  pinctrl: amlogic-a4: Drop surplus semicolon

elapsed time: 1451m

configs tested: 139
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                   randconfig-001-20250324    gcc-12.4.0
arc                   randconfig-002-20250324    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-14
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250324    gcc-8.5.0
arm                   randconfig-002-20250324    gcc-7.5.0
arm                   randconfig-003-20250324    clang-21
arm                   randconfig-004-20250324    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250324    gcc-8.5.0
arm64                 randconfig-002-20250324    clang-14
arm64                 randconfig-003-20250324    clang-21
arm64                 randconfig-004-20250324    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250324    gcc-14.2.0
csky                  randconfig-002-20250324    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250324    clang-21
hexagon               randconfig-002-20250324    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250324    clang-20
i386        buildonly-randconfig-002-20250324    clang-20
i386        buildonly-randconfig-003-20250324    gcc-12
i386        buildonly-randconfig-004-20250324    clang-20
i386        buildonly-randconfig-005-20250324    gcc-12
i386        buildonly-randconfig-006-20250324    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250324    gcc-14.2.0
loongarch             randconfig-002-20250324    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-21
mips                        omega2p_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250324    gcc-8.5.0
nios2                 randconfig-002-20250324    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250324    gcc-13.3.0
parisc                randconfig-002-20250324    gcc-5.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250324    gcc-6.5.0
powerpc               randconfig-002-20250324    clang-19
powerpc               randconfig-003-20250324    clang-21
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250324    gcc-6.5.0
powerpc64             randconfig-002-20250324    clang-15
powerpc64             randconfig-003-20250324    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250324    clang-21
riscv                 randconfig-002-20250324    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250324    clang-15
s390                  randconfig-002-20250324    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250324    gcc-12.4.0
sh                    randconfig-002-20250324    gcc-12.4.0
sh                           se7705_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250324    gcc-5.5.0
sparc                 randconfig-002-20250324    gcc-11.5.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250324    gcc-13.3.0
sparc64               randconfig-002-20250324    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250324    clang-21
um                    randconfig-002-20250324    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250324    clang-20
x86_64      buildonly-randconfig-002-20250324    gcc-12
x86_64      buildonly-randconfig-003-20250324    clang-20
x86_64      buildonly-randconfig-004-20250324    clang-20
x86_64      buildonly-randconfig-005-20250324    clang-20
x86_64      buildonly-randconfig-006-20250324    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250324    gcc-13.3.0
xtensa                randconfig-002-20250324    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

