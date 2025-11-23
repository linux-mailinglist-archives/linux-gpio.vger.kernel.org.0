Return-Path: <linux-gpio+bounces-28980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99193C7DA9B
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Nov 2025 02:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 527CD3AAF49
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Nov 2025 01:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01861A9F83;
	Sun, 23 Nov 2025 01:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRpAOb8V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4250276
	for <linux-gpio@vger.kernel.org>; Sun, 23 Nov 2025 01:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863048; cv=none; b=OmPrBdxRYwf6ovh1ipz9oDcMnd5q++KVvsRJ3GN4MSeZUViZLa4cSYiSJXKIk8WLz6NIHTFXKTQ5+P28Dps9g5oFT5Q+M3GiETBAd/24TfOwG/NX2QbJ+mQWTadfBRCciVGVxKc3ZkWsP8b+WVq/hpmCAfwivKmRdTObmju0P4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863048; c=relaxed/simple;
	bh=kRllYQWGy3FhhdusRZGwPdgSLcjNT6uHe7NdlFmzafY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZJwks1Dy52oVtfNNqrbCmqdaYCcFmQXeMtYAk0A9CqIyQLR7AgPfyt4YH637QsUyvXJwUSLumYsLvd7ImA+7GXrxbsfHXjC1uAeWurWxhyJNSpGG01FVOX1etFOgc5N3ah0Ks/JHsRCu/HShG/xoIQ7gnor1kdzdtZ4ItLEvlKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRpAOb8V; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863047; x=1795399047;
  h=date:from:to:cc:subject:message-id;
  bh=kRllYQWGy3FhhdusRZGwPdgSLcjNT6uHe7NdlFmzafY=;
  b=eRpAOb8VL0uBMkA4wcnPosTs9j8Xbph4xjBR/MEejumbW1Pb/whXjlfN
   YjDjtgqUUc4B9R/cf0cIv8KpD9j8nbCPWUSl9HZgHc/g6qrmuT7Q3h9ub
   tRbst2LkeEWOPuB5B/d/838sNFgxPRcLaO/9EIDrVm487uCCzBbnQGmb3
   y4RHUdbtGmqZ/EeHKokNG7+Bx+eiqHycORMA91Xqwc3LjqV2DgplPSwWp
   /py0x2Fb0ISV4Wj1ysNTxxrUm+WM5ilSQrutaZzreknFn9Qcuz1HjsSPW
   xxw6MKlCHr5oK18i2QYmlN0CbgZPlLUEYCy0MHaKSj05JX1yUEGsP0gRG
   g==;
X-CSE-ConnectionGUID: TbejkUGiSTmQd/SSueZ5OA==
X-CSE-MsgGUID: coUV5we1TMmzCxxeeYUITQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83529311"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="83529311"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:57:26 -0800
X-CSE-ConnectionGUID: gNpwQbUWS02q2mcCZ8kKXA==
X-CSE-MsgGUID: dBNiXaLMQpKgyEiWFjcPEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191197953"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2025 17:57:25 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzLu-0007yn-1W;
	Sun, 23 Nov 2025 01:57:22 +0000
Date: Sun, 23 Nov 2025 09:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 79afd3c5edac93b684393ec84185b2776d0630ef
Message-ID: <202511230916.jNddAQHO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 79afd3c5edac93b684393ec84185b2776d0630ef  dt-bindings: pinctrl: xlnx,versal-pinctrl: Add missing unevaluatedProperties on '^conf' nodes

elapsed time: 1951m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251122    gcc-14.3.0
arc                   randconfig-002-20251122    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20251122    clang-22
arm                   randconfig-002-20251122    clang-22
arm                   randconfig-003-20251122    clang-22
arm                   randconfig-004-20251122    gcc-12.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251122    gcc-8.5.0
arm64                 randconfig-002-20251122    gcc-9.5.0
arm64                 randconfig-003-20251122    gcc-10.5.0
arm64                 randconfig-004-20251122    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251122    gcc-15.1.0
csky                  randconfig-002-20251122    gcc-14.3.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251122    clang-22
hexagon               randconfig-002-20251122    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251123    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251123    gcc-14
i386                  randconfig-002-20251123    gcc-14
i386                  randconfig-003-20251123    gcc-14
i386                  randconfig-004-20251123    gcc-14
i386                  randconfig-005-20251123    gcc-14
i386                  randconfig-006-20251123    clang-20
i386                  randconfig-007-20251123    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251122    gcc-12.5.0
loongarch             randconfig-002-20251122    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251122    gcc-11.5.0
nios2                 randconfig-002-20251122    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251123    gcc-14.3.0
parisc                randconfig-002-20251123    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    clang-19
powerpc               randconfig-001-20251123    clang-22
powerpc               randconfig-002-20251123    gcc-8.5.0
powerpc64             randconfig-001-20251123    clang-22
powerpc64             randconfig-002-20251123    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251122    clang-22
riscv                 randconfig-002-20251122    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251122    clang-16
s390                  randconfig-002-20251122    gcc-13.4.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251122    gcc-15.1.0
sh                    randconfig-002-20251122    gcc-10.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251122    gcc-13.4.0
sparc                 randconfig-002-20251122    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251122    gcc-13.4.0
sparc64               randconfig-002-20251122    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251122    clang-22
um                    randconfig-002-20251122    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251123    gcc-14
x86_64      buildonly-randconfig-002-20251123    gcc-12
x86_64      buildonly-randconfig-003-20251123    gcc-14
x86_64      buildonly-randconfig-004-20251123    clang-20
x86_64      buildonly-randconfig-005-20251123    gcc-14
x86_64      buildonly-randconfig-006-20251123    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251123    gcc-14
x86_64                randconfig-012-20251123    gcc-14
x86_64                randconfig-013-20251123    clang-20
x86_64                randconfig-014-20251123    gcc-14
x86_64                randconfig-015-20251123    gcc-14
x86_64                randconfig-016-20251123    clang-20
x86_64                randconfig-071-20251123    clang-20
x86_64                randconfig-072-20251123    gcc-14
x86_64                randconfig-073-20251123    gcc-12
x86_64                randconfig-074-20251123    clang-20
x86_64                randconfig-075-20251123    clang-20
x86_64                randconfig-076-20251123    gcc-12
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251122    gcc-12.5.0
xtensa                randconfig-002-20251122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

