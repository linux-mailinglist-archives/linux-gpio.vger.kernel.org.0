Return-Path: <linux-gpio+bounces-27885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E2C24139
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1F8189B5A7
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 09:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA9D32E698;
	Fri, 31 Oct 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0LjHiAP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE3C175A5
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901979; cv=none; b=CqzvLWPQnxdQ7vTyc1OYXqdD4WxQGgxlRoZMd5D0vig3U38ovf26fgu4IJgkim1YJEzDdQdO+1fHMcHmxLtuOICW4QpN4PG6+ItYqGwQqScvFoNUW3iILp+I/92GTzBO3dKTuODKvjGEGVTAaS/GXCXIaF8IJbjaFDuPN4P/Mj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901979; c=relaxed/simple;
	bh=fqn+1G8xCnp9B3n8SADQDADtQRyap+87333IcQt0nQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NTn4qrpx7V/INwosvdl7vp4kBGJn02YcJyVdp6u0nH8YlRFhFAiDyy/VUnTeQkYoWRWS1Ygq1x8KBgqMic5DgLoz33PUu1o/YHnI/dG3pwT9mXQUrG6mH1uXFZIrrDvSAd59e0D7cPggsiBgqDusVTPHKA8OL55639SstGWRrDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0LjHiAP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901976; x=1793437976;
  h=date:from:to:cc:subject:message-id;
  bh=fqn+1G8xCnp9B3n8SADQDADtQRyap+87333IcQt0nQs=;
  b=A0LjHiAP16ZKerQXjCV6gp7e+KPICbEUT/R4eHVPsIzYyeQ81MKoz7Mh
   rH1RtYNE8tKhysy23OuOvwZ66psHThAX8Te2OVw5QgvJiUSa2hznGdzb1
   a3eoltEm/1blyW37UJa91giDrASkRsstH5XMC6ytEJrAGaatxGYQmqpR6
   tkcQirwQQIJtDctZLE/2VSrK0hn1oj1T86MOLQWaTVEHkgZndkS3/bV6M
   ruyz+TngkDfvJGoJPAtVew/On/xnA14G+0Thd+ebbqmb+LC1+ChAoP213
   ZY/7RgCEIxYqfPXpv9weTbikPYoNS0m0xRrLudW7ogwkHlEfciUPmZ4hs
   g==;
X-CSE-ConnectionGUID: lNmq522AQlSl231PikyrSg==
X-CSE-MsgGUID: IKPGkXL5ScekeDAGmagUMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81470970"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="81470970"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:12:56 -0700
X-CSE-ConnectionGUID: wVZn2tU/SYKON5DKcWEAYw==
X-CSE-MsgGUID: lKwoXXIDSAenONc/pKAf/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="191337402"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2025 02:12:54 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vElBi-000Mvr-0a;
	Fri, 31 Oct 2025 09:12:51 +0000
Date: Fri, 31 Oct 2025 17:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 99224c151c19b74e1930d236dd348b6b22a607a5
Message-ID: <202510311730.u2BxY3Z7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 99224c151c19b74e1930d236dd348b6b22a607a5  pinctrl: mpfs-iomux0: fix compile-time constant warning for LLVM prior to 17

Error/Warning (recently discovered and may have been fixed):

    drivers/pinctrl/pinctrl-mpfs-iomux0.c:221:(.text+0xe0): undefined reference to `pinconf_generic_dt_node_to_map'
    drivers/pinctrl/pinctrl-pic64gx-gpio2.c:272:(.text+0xe8): undefined reference to `pinconf_generic_dt_node_to_map'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- xtensa-randconfig-001-20251031
    |-- drivers-pinctrl-pinctrl-mpfs-iomux0.c:(.text):undefined-reference-to-pinconf_generic_dt_node_to_map
    `-- drivers-pinctrl-pinctrl-pic64gx-gpio2.c:(.text):undefined-reference-to-pinconf_generic_dt_node_to_map

elapsed time: 1165m

configs tested: 203
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251031    gcc-8.5.0
arc                   randconfig-002-20251031    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                           imxrt_defconfig    gcc-15.1.0
arm                   randconfig-001-20251031    gcc-14.3.0
arm                   randconfig-001-20251031    gcc-8.5.0
arm                   randconfig-002-20251031    clang-22
arm                   randconfig-002-20251031    gcc-8.5.0
arm                   randconfig-003-20251031    gcc-11.5.0
arm                   randconfig-003-20251031    gcc-8.5.0
arm                   randconfig-004-20251031    clang-22
arm                   randconfig-004-20251031    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251031    gcc-10.5.0
arm64                 randconfig-002-20251031    gcc-10.5.0
arm64                 randconfig-003-20251031    gcc-10.5.0
arm64                 randconfig-004-20251031    gcc-10.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251031    gcc-10.5.0
csky                  randconfig-002-20251031    gcc-10.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251031    clang-22
hexagon               randconfig-002-20251031    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251031    clang-20
i386        buildonly-randconfig-002-20251031    clang-20
i386        buildonly-randconfig-003-20251031    clang-20
i386        buildonly-randconfig-004-20251031    clang-20
i386        buildonly-randconfig-005-20251031    clang-20
i386        buildonly-randconfig-006-20251031    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251031    clang-20
i386                  randconfig-002-20251031    clang-20
i386                  randconfig-003-20251031    clang-20
i386                  randconfig-004-20251031    clang-20
i386                  randconfig-005-20251031    clang-20
i386                  randconfig-006-20251031    clang-20
i386                  randconfig-007-20251031    clang-20
i386                  randconfig-011-20251031    gcc-13
i386                  randconfig-012-20251031    gcc-13
i386                  randconfig-013-20251031    gcc-13
i386                  randconfig-014-20251031    gcc-13
i386                  randconfig-015-20251031    gcc-13
i386                  randconfig-016-20251031    gcc-13
i386                  randconfig-017-20251031    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251031    clang-22
loongarch             randconfig-001-20251031    gcc-15.1.0
loongarch             randconfig-002-20251031    clang-22
loongarch             randconfig-002-20251031    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251031    clang-22
nios2                 randconfig-001-20251031    gcc-9.5.0
nios2                 randconfig-002-20251031    clang-22
nios2                 randconfig-002-20251031    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251031    clang-22
parisc                randconfig-001-20251031    gcc-14.3.0
parisc                randconfig-002-20251031    clang-22
parisc                randconfig-002-20251031    gcc-15.1.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251031    clang-22
powerpc               randconfig-002-20251031    clang-22
powerpc               randconfig-002-20251031    gcc-12.5.0
powerpc64             randconfig-001-20251031    clang-22
powerpc64             randconfig-002-20251031    clang-22
powerpc64             randconfig-002-20251031    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251031    clang-17
riscv                 randconfig-001-20251031    gcc-8.5.0
riscv                 randconfig-002-20251031    clang-17
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251031    clang-16
s390                  randconfig-001-20251031    clang-17
s390                  randconfig-002-20251031    clang-17
s390                  randconfig-002-20251031    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251031    clang-17
sh                    randconfig-001-20251031    gcc-14.3.0
sh                    randconfig-002-20251031    clang-17
sh                    randconfig-002-20251031    gcc-14.3.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251031    gcc-8.5.0
sparc                 randconfig-002-20251031    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251031    gcc-8.5.0
sparc64               randconfig-002-20251031    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251031    gcc-8.5.0
um                    randconfig-002-20251031    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251031    gcc-14
x86_64      buildonly-randconfig-002-20251031    gcc-14
x86_64      buildonly-randconfig-003-20251031    gcc-14
x86_64      buildonly-randconfig-004-20251031    gcc-14
x86_64      buildonly-randconfig-005-20251031    gcc-14
x86_64      buildonly-randconfig-006-20251031    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251031    gcc-14
x86_64                randconfig-002-20251031    gcc-14
x86_64                randconfig-003-20251031    gcc-14
x86_64                randconfig-004-20251031    gcc-14
x86_64                randconfig-005-20251031    gcc-14
x86_64                randconfig-006-20251031    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    gcc-14
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                randconfig-015-20251031    gcc-14
x86_64                randconfig-016-20251031    gcc-14
x86_64                randconfig-071-20251031    clang-20
x86_64                randconfig-072-20251031    clang-20
x86_64                randconfig-073-20251031    clang-20
x86_64                randconfig-074-20251031    clang-20
x86_64                randconfig-075-20251031    clang-20
x86_64                randconfig-076-20251031    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251031    gcc-8.5.0
xtensa                randconfig-002-20251031    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

