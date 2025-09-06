Return-Path: <linux-gpio+bounces-25701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70128B476EE
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 21:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E954F566588
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 19:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EDD293B75;
	Sat,  6 Sep 2025 19:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3NvM0id"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124A417C21E
	for <linux-gpio@vger.kernel.org>; Sat,  6 Sep 2025 19:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757188765; cv=none; b=eeWMxass1Zb8TPZL/MMk1LqiaQymrKiX4OLvTVS91YbNeEQOg0eEL1qaclmyJBoQVR+FmLZAO5r0rZMKM0Rzysf71Li7Gp0sbs5jm7WqeZsti7BW6NQF7Szuah/OjfaHpn+Tr8SW80f3wU8N9r8NIfGcDlX5QI32YyrySa9H0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757188765; c=relaxed/simple;
	bh=qUUHv6pXVx0aXjCDvTJvdk3oNUB8PSZCQl84eCktha4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gyYZRmxNmy6iHotbFVMpluAofnCezJzB+wc+CCbC7bLNLiM/xEVsduR1vfyTNfq12cIWSxEQTaGQTAOv9exLx4JqlBcp5iNROFjTpSDedZEOSBrrlLRa9fjRu18PW9unAdx5d7WUwXWQFN0eihXjwqZNkw5ko6jGIc4yn2OmJsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3NvM0id; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757188763; x=1788724763;
  h=date:from:to:cc:subject:message-id;
  bh=qUUHv6pXVx0aXjCDvTJvdk3oNUB8PSZCQl84eCktha4=;
  b=S3NvM0idsMaOA4XkJzMgXUqcpmrzj/vxzf5jutsuLdoRsqY01Rjx6jUL
   Q+3l7BOER/A0JECoSN0wF6u7hnEpQ041INqZ20NdTH2VLNDVkgJDD3tvW
   U85x6ZZBHZYp9EYci0Om1JdGxJNXl/qweXWwJMq3Y8W2JhXaJtQc1Uot3
   TkBLwzGASeJmYelGDmpuW1Unc82ZgfsrIPA9dk9M57ERfMLhY+c26sf2Q
   Wxiusd3mMXviha4Y5+PDFNpmZNZ6XHsfMY/rwsHGAifiqVPB110i+yrz6
   5UwuKz6iJ/AXsnztvlLCKXpsn1Uz12DwVLOEd9TCsCgNuQkhBr8ZYAIme
   w==;
X-CSE-ConnectionGUID: N9oC6zePRmmtalwF1pCNcA==
X-CSE-MsgGUID: a9aR31YgQ8eQtW95UzhZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59453999"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59453999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 12:59:22 -0700
X-CSE-ConnectionGUID: Lgd9TwovSQyjvgRVfYGajA==
X-CSE-MsgGUID: tsYxyUFfSseL88Bp/wb5rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="177692465"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2025 12:59:22 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuz4B-0001lq-0K;
	Sat, 06 Sep 2025 19:59:19 +0000
Date: Sun, 07 Sep 2025 03:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/output-value-just-value] BUILD SUCCESS
 92065594b2ddb6242e2d9e2bb52665ac8b673b46
Message-ID: <202509070344.uxkiAaoy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/output-value-just-value
branch HEAD: 92065594b2ddb6242e2d9e2bb52665ac8b673b46  pinctrl: generic: rename PIN_CONFIG_OUTPUT to LEVEL

elapsed time: 2031m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250905    gcc-11.5.0
arc                   randconfig-002-20250905    gcc-13.4.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20250905    clang-22
arm                   randconfig-002-20250905    clang-22
arm                   randconfig-003-20250905    clang-16
arm                   randconfig-004-20250905    gcc-14.3.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250905    clang-22
arm64                 randconfig-002-20250905    clang-17
arm64                 randconfig-003-20250905    clang-17
arm64                 randconfig-004-20250905    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250906    gcc-15.1.0
csky                  randconfig-002-20250906    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250906    clang-20
hexagon               randconfig-002-20250906    clang-22
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250905    clang-20
i386        buildonly-randconfig-002-20250905    clang-20
i386        buildonly-randconfig-003-20250905    clang-20
i386        buildonly-randconfig-004-20250905    gcc-13
i386        buildonly-randconfig-005-20250905    clang-20
i386        buildonly-randconfig-006-20250905    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250906    clang-22
loongarch             randconfig-002-20250906    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-22
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250906    gcc-11.5.0
nios2                 randconfig-002-20250906    gcc-11.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250906    gcc-11.5.0
parisc                randconfig-002-20250906    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250906    gcc-14.3.0
powerpc               randconfig-002-20250906    clang-20
powerpc               randconfig-003-20250906    clang-22
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250906    gcc-13.4.0
powerpc64             randconfig-002-20250906    gcc-10.5.0
powerpc64             randconfig-003-20250906    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250905    gcc-14.3.0
riscv                 randconfig-002-20250905    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250905    gcc-9.5.0
s390                  randconfig-002-20250905    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250905    gcc-15.1.0
sh                    randconfig-002-20250905    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250905    gcc-8.5.0
sparc                 randconfig-002-20250905    gcc-15.1.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64               randconfig-001-20250905    gcc-8.5.0
sparc64               randconfig-002-20250905    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250905    clang-22
um                    randconfig-002-20250905    gcc-13
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250905    clang-20
x86_64      buildonly-randconfig-002-20250905    clang-20
x86_64      buildonly-randconfig-003-20250905    gcc-13
x86_64      buildonly-randconfig-004-20250905    clang-20
x86_64      buildonly-randconfig-005-20250905    clang-20
x86_64      buildonly-randconfig-006-20250905    gcc-13
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250905    gcc-8.5.0
xtensa                randconfig-002-20250905    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

