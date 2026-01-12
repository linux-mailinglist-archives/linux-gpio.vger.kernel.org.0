Return-Path: <linux-gpio+bounces-30422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC4D109B2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 06:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78488301A1EA
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 05:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB8A30BB83;
	Mon, 12 Jan 2026 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndG/EhsT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E1B30C61B
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768194299; cv=none; b=YjjiCGMcUDGc2UIYbIZnSa8x8+MN7Sw1B3TPA4JZjp+YQWM2yKf+W/lhSD525dTcmdIQxpe8BUuA55/GzPrIEm3EGDspi0HoJ9E4IQp5LE0w5vcN3bn0oTnaTV5Of5+QPkN7FRQ2zwrOLt2mUizbUhcCeDihXT+euPwdBTl9/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768194299; c=relaxed/simple;
	bh=+XaaeqtgBFszW3qy7R41+DD+sy2Ef6g6zXDvxxAUVXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pHTNXTpPzDOWApbZba1oyJRC0hLQLRFsWHAqdzE5iGGtq55FRqWdxJjtkc6VoFuhbG7vQPIqRE2goHchM5ilHcDkdcu81tGQRlIIZopE3BNIx28gHWTmKf4vBKBYp79edpRksERCnXDnrIFHF2Cc+swZ3vXoxDIxHVHlq5qZ754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndG/EhsT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768194298; x=1799730298;
  h=date:from:to:cc:subject:message-id;
  bh=+XaaeqtgBFszW3qy7R41+DD+sy2Ef6g6zXDvxxAUVXI=;
  b=ndG/EhsTenPBv5zt++btOrKMTOo3cI6+HzWfouUzErOujmtE7g7iXt0d
   WhEX9ClLhu8z66hOblinS810qtaumplXSyvFi/5SOGTAzXNcrw9EOPHuo
   JLIJqEJYrABA+tJcgcfV/gmJAN6eQKOCIGnEULc7QUz8X5FLu/tplwrEx
   yXpcnUzzxVn2F7k5nmc0fBNeNVjDNq6dK/LFcv5is0RP9IllPo/5O9pr1
   EhLXejsC4N6JBnfWRC0KYWF3c6Pry6VecL/wcQaZS2BOyhUQPVDrHFlTJ
   HYTfA1/3SkJvbzhN0wwJ2hXH1PTaZNsdFfkvhFh6q5+Lwy/HH6JZOJeO4
   w==;
X-CSE-ConnectionGUID: eVZk1EfkQxi25w1jPVLdmg==
X-CSE-MsgGUID: f3aFQi7WSGmTUaEXgmwFBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80104790"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80104790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 21:04:57 -0800
X-CSE-ConnectionGUID: KoduRIcGTJaasxrBFe/sGg==
X-CSE-MsgGUID: 652XzfYGS9m6BtRPbyYXIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203904025"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2026 21:04:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfA6n-00000000D0S-15RW;
	Mon, 12 Jan 2026 05:04:53 +0000
Date: Mon, 12 Jan 2026 13:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 0968c81ce9c4b42cfaaee15de53c665064fe7ee3
Message-ID: <202601121318.k5lcZ6Vx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 0968c81ce9c4b42cfaaee15de53c665064fe7ee3  pinctrl: at91-pio4: Add sama7d65 pio4 support

elapsed time: 4720m

configs tested: 132
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260112    gcc-8.5.0
arc                   randconfig-002-20260112    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                          collie_defconfig    gcc-15.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20260112    clang-22
arm                   randconfig-001-20260112    gcc-8.5.0
arm                   randconfig-002-20260112    gcc-8.5.0
arm                   randconfig-003-20260112    clang-22
arm                   randconfig-003-20260112    gcc-8.5.0
arm                   randconfig-004-20260112    gcc-8.5.0
arm64                             allnoconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon               randconfig-001-20260112    clang-22
hexagon               randconfig-002-20260112    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386        buildonly-randconfig-001-20260112    gcc-14
i386        buildonly-randconfig-002-20260112    clang-20
i386        buildonly-randconfig-003-20260112    gcc-14
i386        buildonly-randconfig-004-20260112    clang-20
i386        buildonly-randconfig-005-20260112    gcc-14
i386        buildonly-randconfig-006-20260112    gcc-14
i386                  randconfig-001-20260112    clang-20
i386                  randconfig-002-20260112    clang-20
i386                  randconfig-003-20260112    clang-20
i386                  randconfig-004-20260112    clang-20
i386                  randconfig-004-20260112    gcc-14
i386                  randconfig-005-20260112    clang-20
i386                  randconfig-005-20260112    gcc-14
i386                  randconfig-006-20260112    clang-20
i386                  randconfig-006-20260112    gcc-12
i386                  randconfig-007-20260112    clang-20
i386                  randconfig-007-20260112    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch             randconfig-001-20260112    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260112    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260112    gcc-14.3.0
parisc64                            defconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                        cell_defconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260112    gcc-11.5.0
riscv                 randconfig-001-20260112    gcc-15.2.0
riscv                 randconfig-002-20260112    clang-17
riscv                 randconfig-002-20260112    gcc-15.2.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20260112    clang-22
s390                  randconfig-001-20260112    gcc-15.2.0
s390                  randconfig-002-20260112    gcc-10.5.0
s390                  randconfig-002-20260112    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260112    gcc-15.2.0
sh                    randconfig-002-20260112    gcc-14.3.0
sh                    randconfig-002-20260112    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7724_defconfig    gcc-15.2.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260112    gcc-15.2.0
sparc                 randconfig-002-20260112    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260112    clang-20
sparc64               randconfig-002-20260112    gcc-12.5.0
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260112    gcc-14
um                    randconfig-002-20260112    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20260112    gcc-14
x86_64      buildonly-randconfig-002-20260112    clang-20
x86_64      buildonly-randconfig-003-20260112    gcc-14
x86_64      buildonly-randconfig-004-20260112    gcc-14
x86_64      buildonly-randconfig-005-20260112    gcc-14
x86_64      buildonly-randconfig-006-20260112    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260112    gcc-13
x86_64                randconfig-002-20260112    clang-20
x86_64                randconfig-003-20260112    gcc-13
x86_64                randconfig-004-20260112    gcc-13
x86_64                randconfig-005-20260112    clang-20
x86_64                randconfig-006-20260112    clang-20
x86_64                randconfig-011-20260112    clang-20
x86_64                randconfig-012-20260112    gcc-14
x86_64                randconfig-013-20260112    gcc-14
x86_64                randconfig-014-20260112    gcc-14
x86_64                randconfig-015-20260112    gcc-12
x86_64                randconfig-016-20260112    clang-20
x86_64                randconfig-071-20260112    gcc-14
x86_64                randconfig-072-20260112    gcc-14
x86_64                randconfig-073-20260112    gcc-14
x86_64                randconfig-074-20260112    gcc-14
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260112    gcc-10.5.0
xtensa                randconfig-002-20260112    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

