Return-Path: <linux-gpio+bounces-23189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D915AB02BC0
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 17:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207F016E5CA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 15:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D669227781E;
	Sat, 12 Jul 2025 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab2038Eu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E31F18D
	for <linux-gpio@vger.kernel.org>; Sat, 12 Jul 2025 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752335578; cv=none; b=Xepe4CBxC6phwDPUg15v6lhXJcS+YPj9CRRif33goBdC3ltLrvHPHijSwFYhqh33hx+RYyj9/47YTWR/2VL4lMcGWxr+vf3/1hQrjVnbaxMoc0zs/9/fBnSl5Be37birTkPLM49vJO/Lt27i7r++wwhA+ygNkIxegV90on891mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752335578; c=relaxed/simple;
	bh=9KWNZn7uepo5fe+Lasg3rQbk6oqgczsyb9iPaTZb1MY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A1HLF39G2UKvBiLuphz7fxumA9p7P7X4Sw1ecNURQECEJYRDKaSRN1772LTF/+B7hm4/+l0G+K4nHwCN8jApPK34Typ70KqOg9vGiG8Th4qCSDzIec5KUT1ZoIdAqzSfg9LYWgKe44O9bIBQj5rW9wvOtm9ZMZPbX/HH90Ygjr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab2038Eu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752335576; x=1783871576;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9KWNZn7uepo5fe+Lasg3rQbk6oqgczsyb9iPaTZb1MY=;
  b=Ab2038EuCdNYpjD172s51c6FgbDWeLodOETJ7tldw61HfT7THRk5ZKzi
   4rRulcQec2a5ab+tT/kotTsn/18J1AcyfcjXNmjWptoFfD7E55MybMP+2
   Jkkq4J01eI9DALUsN7juzOtkoxGS7v4fCI/vSLExcgnNcoUgsDCok9Bf7
   zxsz+9C2kqRIftOcfxq9a37SqZOyqXNcseviuLhjuvkHa/oSnwsvFJ6IH
   RCd578erH4AvkRtJAAP/SYz17koNxjiWOlTY7lM/+YyzQqn7HqwX4WNnP
   h9sWplNMmj9UnQlrzMvP+SqfHgsHi0P8ZHaHKrSB5w35ldAjtdpjZvA7E
   g==;
X-CSE-ConnectionGUID: eFhfGDL6R0yH7GsdKii/0A==
X-CSE-MsgGUID: UGqYzGyaRV2mwxgsR3Wk2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58366340"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="58366340"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 08:52:55 -0700
X-CSE-ConnectionGUID: FbIBj8DCQY6rlSKEuAevxg==
X-CSE-MsgGUID: Tfqjf4/MSzWCvv6n37qGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="162264842"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jul 2025 08:52:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uacWy-0007RO-1F;
	Sat, 12 Jul 2025 15:52:52 +0000
Date: Sat, 12 Jul 2025 23:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 f2dd69908b3a456cefdfed2993ff0c878d3a9175
Message-ID: <202507122317.pYoCc2Uz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-p=
inctrl.git for-next
branch HEAD: f2dd69908b3a456cefdfed2993ff0c878d3a9175  MAINTAINERS: add Cl=
=C3=A9ment Le Goffic as STM32 HDP maintainer

elapsed time: 1213m

configs tested: 128
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250712    gcc-10.5.0
arc                   randconfig-002-20250712    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                         lpc18xx_defconfig    clang-21
arm                   randconfig-001-20250712    gcc-8.5.0
arm                   randconfig-002-20250712    gcc-10.5.0
arm                   randconfig-003-20250712    clang-21
arm                   randconfig-004-20250712    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250712    gcc-12.3.0
arm64                 randconfig-002-20250712    gcc-12.3.0
arm64                 randconfig-003-20250712    gcc-8.5.0
arm64                 randconfig-004-20250712    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250712    gcc-14.3.0
csky                  randconfig-002-20250712    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250712    clang-21
hexagon               randconfig-002-20250712    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250712    clang-20
i386        buildonly-randconfig-002-20250712    gcc-11
i386        buildonly-randconfig-003-20250712    gcc-12
i386        buildonly-randconfig-004-20250712    gcc-12
i386        buildonly-randconfig-005-20250712    gcc-12
i386        buildonly-randconfig-006-20250712    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250712    gcc-15.1.0
loongarch             randconfig-002-20250712    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip27_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250712    gcc-11.5.0
nios2                 randconfig-002-20250712    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250712    gcc-8.5.0
parisc                randconfig-002-20250712    gcc-12.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250712    gcc-15.1.0
powerpc               randconfig-002-20250712    gcc-8.5.0
powerpc               randconfig-003-20250712    clang-21
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250712    gcc-8.5.0
powerpc64             randconfig-002-20250712    clang-21
powerpc64             randconfig-003-20250712    clang-19
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250712    gcc-8.5.0
riscv                 randconfig-002-20250712    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250712    clang-21
s390                  randconfig-002-20250712    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250712    gcc-15.1.0
sh                    randconfig-002-20250712    gcc-14.3.0
sh                           se7751_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250712    gcc-13.4.0
sparc                 randconfig-002-20250712    gcc-15.1.0
sparc64               randconfig-001-20250712    clang-20
sparc64               randconfig-002-20250712    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250712    gcc-12
um                    randconfig-002-20250712    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250712    gcc-12
x86_64      buildonly-randconfig-002-20250712    gcc-12
x86_64      buildonly-randconfig-003-20250712    clang-20
x86_64      buildonly-randconfig-004-20250712    clang-20
x86_64      buildonly-randconfig-005-20250712    gcc-12
x86_64      buildonly-randconfig-006-20250712    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250712    gcc-8.5.0
xtensa                randconfig-002-20250712    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

