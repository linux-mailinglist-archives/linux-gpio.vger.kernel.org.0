Return-Path: <linux-gpio+bounces-22320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F9AEAE00
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 06:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9B301BC1966
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 04:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126631E51FE;
	Fri, 27 Jun 2025 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwAF8Dbm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85511C860A
	for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 04:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998759; cv=none; b=POH/lg8r3MwobAcwbCGPU7XuA1AJ4D7WJC7rGi4QiNtVPOiKQ4WBzRcJs4hdj8mQFgadcDzFu8qsBELqk1480vl/F2/V2l/8EVaV64AJhX9FfyIZBflU1ivcbcCZAnR4pwQkdtIczgyYOGFmWAIi2XI39UbkAI9kZ5guiruXn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998759; c=relaxed/simple;
	bh=Zwu+IkbRc+NWlbDhyeqnLcjhro6/8D7Wqj7UGCrkvkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S6E59xdv0naybUE32ftMmmKmFz6QhaI8jIGYf2DVmT+5NkgC8Eo0uk3WtZnhP/niSqycj0w0PUrpJjjW+P9NGm/B24fd8AKKjcRY3REyQZv0/uMiDQK4xqMzK6NGBLzP+aJLwvnQi91WOIUfHb2xTRwy6FISRSQtZpAwmdm1nCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwAF8Dbm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750998758; x=1782534758;
  h=date:from:to:cc:subject:message-id;
  bh=Zwu+IkbRc+NWlbDhyeqnLcjhro6/8D7Wqj7UGCrkvkM=;
  b=ZwAF8Dbm5rojURgZvksAupSvfbOvqwSokXJhwjjQLMxjNiphJeGZ6Tei
   EGKgmW9bRxWBLT6If1w63LlxnnSPCXeGCH3avAThA3xVgO5p/o+B5115H
   o4VLzlLOQAqEOQbO5tTTstp+oQ6UL4w+CPAOATfJWntuHdQjONUs5lazT
   ioydrhkigVB0e/I0vUD2zhisAKImT9bdiR7KunqZY7gKirihxSDhueDRs
   GHYeYqGatoYTBJGH0SnGIqAa9/Y4xNJJCKsWTLMSDFYv49nflnUo4xtSV
   NcEo5lTmmjWsN+y4w6yKzgB12ib8bgHHFwCjlj1hxGCSSH91mzHADGQO0
   Q==;
X-CSE-ConnectionGUID: dAw6ZXkPTzGCOp1BBoRKpQ==
X-CSE-MsgGUID: mqdNjSDPRx2Rm4Q+a2S+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64746234"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="64746234"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 21:32:37 -0700
X-CSE-ConnectionGUID: 4UhwtODdTXKJgUqyLTp/bg==
X-CSE-MsgGUID: H/Fnx/SpQKSQfoJ3rOvIBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="189903756"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2025 21:32:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV0lO-000VnR-0Q;
	Fri, 27 Jun 2025 04:32:34 +0000
Date: Fri, 27 Jun 2025 12:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3315e39e5639ac770782b658e499d45f68ea7d82
Message-ID: <202506271243.Ec2X6nFO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3315e39e5639ac770782b658e499d45f68ea7d82  gpio: rcar: Use new line value setter callbacks

elapsed time: 1108m

configs tested: 110
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250626    gcc-12.4.0
arc                   randconfig-001-20250627    gcc-10.5.0
arc                   randconfig-002-20250626    gcc-13.3.0
arc                   randconfig-002-20250627    gcc-10.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250626    clang-21
arm                   randconfig-001-20250627    gcc-10.5.0
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-002-20250627    gcc-10.5.0
arm                   randconfig-003-20250626    gcc-10.5.0
arm                   randconfig-003-20250627    gcc-10.5.0
arm                   randconfig-004-20250626    clang-21
arm                   randconfig-004-20250627    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250626    clang-21
arm64                 randconfig-001-20250627    gcc-10.5.0
arm64                 randconfig-002-20250626    clang-17
arm64                 randconfig-002-20250627    gcc-10.5.0
arm64                 randconfig-003-20250626    gcc-8.5.0
arm64                 randconfig-003-20250627    gcc-10.5.0
arm64                 randconfig-004-20250626    clang-21
arm64                 randconfig-004-20250627    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-001-20250627    gcc-12
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-002-20250627    gcc-12
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-003-20250627    gcc-12
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-004-20250627    gcc-12
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-005-20250627    gcc-12
i386        buildonly-randconfig-006-20250626    clang-20
i386        buildonly-randconfig-006-20250627    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-001-20250627    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-002-20250627    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-003-20250627    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-004-20250627    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-005-20250627    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64      buildonly-randconfig-006-20250627    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

