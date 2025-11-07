Return-Path: <linux-gpio+bounces-28245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C0C3FBBC
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 12:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C93CF3A684B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 11:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A848B31AF14;
	Fri,  7 Nov 2025 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNLgR9b2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DFB322DA8
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762514857; cv=none; b=L0Y6KwlVvnHhNID5g/XQgl0iabTmB5VrbTz12BCE/8As+u7zxWq64Vc361A0Z+eKd58WrPb+CkR27DecHfPUuTbxrUJy3McHnoqzhJ6OUxxHFiOlfYwq/J5iZT9D0OcEzpFMxfwqTEwj3Z8hgwA87cV8hu3b3W6MDejod4DvcOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762514857; c=relaxed/simple;
	bh=oGNW/fMYU81pgWX2pz+KAhh0o5JaWjnSdunTfuE8EYs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q2kWZlNKmhEK5AS2tyFwFUmFeviGUQtpujDqCTlN+QDV3w0VP0tPKna11LrmtTAyefUA+za9/5NRKan8YvXdnURvQUSzjxLZrT40mGLSRcXT/JYU8K27Ln32J19EN4lOdz/KBpSdMcFO9Bng6PEM6Z6QHnyyr5NO7mhmCNS6S2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNLgR9b2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762514855; x=1794050855;
  h=date:from:to:cc:subject:message-id;
  bh=oGNW/fMYU81pgWX2pz+KAhh0o5JaWjnSdunTfuE8EYs=;
  b=CNLgR9b2yMkI+dq2mNnPamqYibVVcwOSnKOY42bLV9UFRllWVLR4zEgG
   ielv9r9MzUDOeDKySSAuYg4zve9p+75edaoSw4QD72jK5yUul1q9pi4BO
   jIKUT8HHSnGhTSNqdn9/15JmaiyeSjoyu41/IwjsSQ3DUg7TU+XumuDiz
   SuJRyMJsRvBFuYv+n39zaTYDxZ7LcAP+tl32cp7U/ssNHUQYZdxp1Wx21
   HMopLWls7C07excBCNccHXHUE/Dsqm+DqWN/Bi/qWFPxuFZiL7mklqAz9
   Dt/OpMp0e8Ljhp7Y/Rpf7ivs6i0b2pjI5dnoZjhkPaoQ1pbWxcrFGSDul
   w==;
X-CSE-ConnectionGUID: htZE4oADRXqsamRzIKqOAw==
X-CSE-MsgGUID: TIvP+qT2TbW0dXZEXE8RlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68501825"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="68501825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 03:27:34 -0800
X-CSE-ConnectionGUID: m5SYtZB1ThihbGxEmdyGMg==
X-CSE-MsgGUID: OAJnHh3qTiSJ6mNmU++/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="193185348"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Nov 2025 03:27:32 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHKcs-000V2S-1V;
	Fri, 07 Nov 2025 11:27:30 +0000
Date: Fri, 07 Nov 2025 19:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 59d2d28f2269dfb89d64828fd330bc32113fd036
Message-ID: <202511071902.dRXhMNto-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 59d2d28f2269dfb89d64828fd330bc32113fd036  pinctrl: cix: sky1: Provide pin control dummy states

elapsed time: 2479m

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

