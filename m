Return-Path: <linux-gpio+bounces-11228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B46799B03D
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 04:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B22F2826C9
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 02:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0895A46447;
	Sat, 12 Oct 2024 02:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr3dxPDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A163168DC
	for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2024 02:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728701392; cv=none; b=p5c/1xkTPVuz5tJjVimJOF0bG4uJ3aBGhbLopcAexuRUTz4P7eR1sSOQvZVJcJCdj++ikMR9a7yshe2gM691AQgpbd6Oyc5D52gA6oBPNOwFDH3AgEdoAL5EKa3gePkvl2wUe4Wzu3hNu19Y8nUSBpnkESOAM6QUEaj+mzL+dqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728701392; c=relaxed/simple;
	bh=6Im1RcaAe3tIrywunee/yvrUOON639jytyu3VgUjLPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CaYLI/e8YV4XUuxcBTsyb7aUW9W2AvlU4nU7A4/h/wa59qLnMIFBZAGmenhUBfTziO8B5P3S3PEcAugvn1xHCru/7iFd98KcYnnKwJ67sNI+1CEwjm989o3HBHKAuLVH6rJEK+1Ev3oBLllkLChNP4NCmZvQddlCulWC+tah1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr3dxPDn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728701391; x=1760237391;
  h=date:from:to:cc:subject:message-id;
  bh=6Im1RcaAe3tIrywunee/yvrUOON639jytyu3VgUjLPk=;
  b=Hr3dxPDnm5t6UB97foTRoehFgREVBpe/8p+rfIh1BAj9UCDR2wQ5LDI+
   Q90ZBwjIMWDU9LOs9tEFJRKLCdbWqUsUUE3H3RTxxOImPUpJ5s0beIARg
   +HocJuapGOLBmLzBwrQwZjn836vr9rcBjEy520pKx3Ozn5zNF69ezaO7J
   64qVUg+TcK48IQ/IeExxazkAvQi0GgjqLqwVnilG0rVi3pn8bWCIdD0cw
   PSYeueycUmr3smRejtIoIrjLXCo+JMb6Yw55nUghxXDkRzspMBjFP74FK
   ex5LCG98/OrIRVvrpHW8670chgP9hAg5FbuEYpk51DLNFPUdwKmRuaX1h
   g==;
X-CSE-ConnectionGUID: sU6M//PhQdyyBSWHOiq2dw==
X-CSE-MsgGUID: ApS3N1usRdKKseH7IvqbWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39236379"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="39236379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 19:49:51 -0700
X-CSE-ConnectionGUID: +VV/MAIKTQKpBGCe4AzxoA==
X-CSE-MsgGUID: IEHplWAiQjOpR+SAfq9a5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="76954112"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Oct 2024 19:49:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szSCR-000Cyl-0D;
	Sat, 12 Oct 2024 02:49:47 +0000
Date: Sat, 12 Oct 2024 10:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 6dbd1577b7dc10263d515045ef6460e80d6c9afa
Message-ID: <202410121006.cdHIS43a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 6dbd1577b7dc10263d515045ef6460e80d6c9afa  Merge branch 'devel' into for-next

elapsed time: 991m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241012    gcc-12
i386        buildonly-randconfig-002-20241012    gcc-12
i386        buildonly-randconfig-003-20241012    gcc-12
i386        buildonly-randconfig-004-20241012    gcc-12
i386        buildonly-randconfig-005-20241012    gcc-12
i386        buildonly-randconfig-006-20241012    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241012    gcc-12
i386                  randconfig-002-20241012    gcc-12
i386                  randconfig-003-20241012    gcc-12
i386                  randconfig-004-20241012    gcc-12
i386                  randconfig-005-20241012    gcc-12
i386                  randconfig-006-20241012    gcc-12
i386                  randconfig-011-20241012    gcc-12
i386                  randconfig-012-20241012    gcc-12
i386                  randconfig-013-20241012    gcc-12
i386                  randconfig-014-20241012    gcc-12
i386                  randconfig-015-20241012    gcc-12
i386                  randconfig-016-20241012    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

