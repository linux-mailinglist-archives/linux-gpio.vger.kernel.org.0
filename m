Return-Path: <linux-gpio+bounces-28241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E468C3F482
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 10:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0F714E4014
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 09:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748F02F5A3F;
	Fri,  7 Nov 2025 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxbcVn+Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EB184
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762509448; cv=none; b=keahmn5yVeivEo77lTY16VApgd7AG9qC30nYETt8mqA8txEx+iVPcZ2hbUs2MinFZNg+xR/JGDdcbi4Zxp4wG2Y5Pbe+MnMjD9YD3xSwOxqFPg59OrAq1NzHvkIQ6SJWynSLg1zxwck1nye/Z6oq3pVHDB+jZpD9GKDnTErLliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762509448; c=relaxed/simple;
	bh=gxrpcH1R19Y7uHAhvEJBlJMrA3PpZhZ1IAXInnOZyPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uT5F/UDVnu3VvKaBVYM3bmR/LNUdkQy5vO/CfNaYxmkzG/hQlZOt9iiaO3nuIk7jXGdzvr07ykqR4cxCtVSIUC+JfEJMIbls/ihmnFhoJ4K4ePCGc9larv5MQf8A8J1pvcrGzOUQOaY2+a1K2pNMnInlp0Wh84DZ2fEtkMfWwG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxbcVn+Y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762509447; x=1794045447;
  h=date:from:to:cc:subject:message-id;
  bh=gxrpcH1R19Y7uHAhvEJBlJMrA3PpZhZ1IAXInnOZyPU=;
  b=ZxbcVn+Y70tnY5TybnyUkJHw35JRYVQfgHfIMclmOdYKRuGF20MlVMvJ
   HVGf0quMEYZzhgZOYZNgEFoT5ppSnvhAmW/A5vakItkPBMMozjd/I0Fy9
   HLcW7510bfGv2L0fjrPKyct1SWBmxJ1sHoCm/X1yLLDiUzV71vtI4QzUW
   x3ek0iDvsJwCc6YX7x52r9zGX0NDZbSfIHpEdVpqI71lH8NK2/zvM5IKI
   KRV8ZkYXrS/t64LvlyikmevtFFPYwKq+nImIlSQEiOj07p70Ws5vc0sNC
   rRLo0e0eZD9ABnzDVBehk4k6+qBHD8eRlhgdfHxYB7/TKwosxH9LslDc7
   w==;
X-CSE-ConnectionGUID: UJtHmWTmSEu2PnU5RavTvw==
X-CSE-MsgGUID: 0Jo8fQnGTMWNqAMD5FdmQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68497119"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="68497119"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 01:57:26 -0800
X-CSE-ConnectionGUID: A7uWoxu0RvOjWVRdbzNTow==
X-CSE-MsgGUID: RozgosvTQ+GLhuGXKKm+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187255930"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Nov 2025 01:57:26 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHJDf-000Uy0-0k;
	Fri, 07 Nov 2025 09:57:23 +0000
Date: Fri, 07 Nov 2025 17:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/cix-dummies] BUILD SUCCESS
 f755bb823852078331080ebe1d998831a524a59b
Message-ID: <202511071700.WcePG072-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/cix-dummies
branch HEAD: f755bb823852078331080ebe1d998831a524a59b  pinctrl: cix: sky1: Provide pin control dummy states

elapsed time: 2390m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    clang-19
arc                    allmodconfig    clang-19
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    clang-19
arm                    allmodconfig    clang-19
arm                     allnoconfig    clang-22
arm                    allyesconfig    clang-19
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64                  allyesconfig    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                   allyesconfig    gcc-15.1.0
hexagon                allmodconfig    clang-19
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-19
hexagon     randconfig-001-20251106    clang-19
hexagon     randconfig-002-20251106    clang-20
i386                   allmodconfig    clang-20
i386                    allnoconfig    gcc-14
i386                   allyesconfig    clang-20
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch              allyesconfig    clang-22
loongarch   randconfig-001-20251106    gcc-15.1.0
loongarch   randconfig-002-20251106    gcc-15.1.0
m68k                   allmodconfig    clang-19
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    clang-19
microblaze             allmodconfig    clang-19
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    clang-19
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    clang-22
nios2                   allnoconfig    gcc-11.5.0
nios2                  allyesconfig    clang-22
nios2       randconfig-001-20251106    gcc-9.5.0
nios2       randconfig-002-20251106    gcc-8.5.0
openrisc               allmodconfig    clang-22
openrisc                allnoconfig    gcc-15.1.0
openrisc               allyesconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      randconfig-001-20251106    gcc-10.5.0
parisc      randconfig-002-20251106    gcc-10.5.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc                allyesconfig    gcc-15.1.0
powerpc     randconfig-001-20251106    gcc-14.3.0
powerpc     randconfig-002-20251106    clang-22
powerpc64   randconfig-002-20251106    gcc-8.5.0
riscv                  allmodconfig    gcc-15.1.0
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    gcc-15.1.0
riscv       randconfig-001-20251106    clang-22
riscv       randconfig-002-20251106    gcc-12.5.0
s390                   allmodconfig    gcc-15.1.0
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251106    gcc-8.5.0
s390        randconfig-002-20251106    gcc-14.3.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251106    gcc-11.5.0
sh          randconfig-002-20251106    gcc-13.4.0
sparc                  allmodconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                  allyesconfig    clang-22
sparc64                allmodconfig    clang-22
sparc64                allyesconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    clang-19
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

