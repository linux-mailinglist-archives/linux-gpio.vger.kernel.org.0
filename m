Return-Path: <linux-gpio+bounces-28252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8AEC41218
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 18:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DE8C188EC2B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 17:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFA03370E9;
	Fri,  7 Nov 2025 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adpOaHGF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3313336EF5
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762537325; cv=none; b=YOUWY0livVHpO4BvO7JRlnKnhHQVXn263l91G2DlabDWfso7VU/pElZJ/LOl0cVhpN/OIipSlocjQd8jwLn1ZJlMjhCj+28b5DodBDgMI5qgNkcsb3/Lasxhw+Q8lthfpKlclMXVOj36GK3CQiAzybSWfio5SNEK1WxYdG3nXrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762537325; c=relaxed/simple;
	bh=VkGVZoy+er72AxvHAWJjCTqCoUEyQIaTVC6AWWijQcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RrQuRAQWtAzK9L2BOp4xSp1ef7+Ixo+E5RlqhjJYjAykg7s2umuL1lGaq4MzXgBayrlbWdJSKxwkMLQgC7xH06HFXJTfHDQl66HJmxgSMFcT5Qh/PfXnyieWtFrd6g3lCQh7Q9FgNRlXM2CjY5eZ1PfG14jeGfTQMGiKA5bACEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adpOaHGF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762537324; x=1794073324;
  h=date:from:to:cc:subject:message-id;
  bh=VkGVZoy+er72AxvHAWJjCTqCoUEyQIaTVC6AWWijQcE=;
  b=adpOaHGFjNgtoK3mxhWnCuKs1MyE7V6eXJGjTCEKNnbX3+PeoTGVpVJi
   7b+7J3u228W2CNZmmw3A905t5/+ttwRHDZKfKbhogkGZBDEniyTWPeqEP
   nrZWDU1xMnlSG+vgz6N8ccgfOsoXUB5+GuDiinEluamY3ekC2NLjOWAWR
   rjNDN3yw6gRVPsAuuB+nV6dhMlmm3mYqjVeEOUYap4Cp8Rurrjjgcnw2c
   tWu0RBafBeZBRr8NXrUojLPHAyKIrSqQbyUAY8b1BL0/pDWUkj8VUeQvy
   PmFjY3+4FE8DXxTsrF0sTDd7qQC7LtDBI5VQ04AU3EcjugxCeigGG+NJK
   A==;
X-CSE-ConnectionGUID: DuU7msDAT2SAQQiviZM/6g==
X-CSE-MsgGUID: e9/cmNFwQBqFunl75H3xyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64605864"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64605864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 09:42:03 -0800
X-CSE-ConnectionGUID: zhLAcmCdRkeTbUMOPvysIg==
X-CSE-MsgGUID: /MRGiXQkToee9ESduk1qWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188255818"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2025 09:42:02 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHQTI-0000BT-06;
	Fri, 07 Nov 2025 17:42:00 +0000
Date: Sat, 08 Nov 2025 01:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 2157a9edc3d23f209ade2f61247edc70b59f0824
Message-ID: <202511080103.D8CluEn4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 2157a9edc3d23f209ade2f61247edc70b59f0824  Merge branch 'devel' into for-next

elapsed time: 2853m

configs tested: 84
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arm                    allmodconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64                  allyesconfig    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                   allyesconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-22
hexagon     randconfig-001-20251106    clang-19
hexagon     randconfig-002-20251106    clang-20
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch              allyesconfig    clang-22
loongarch   randconfig-001-20251106    gcc-15.1.0
loongarch   randconfig-002-20251106    gcc-15.1.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                  allyesconfig    gcc-11.5.0
nios2       randconfig-001-20251106    gcc-9.5.0
nios2       randconfig-002-20251106    gcc-8.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc               allyesconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      randconfig-001-20251106    gcc-10.5.0
parisc      randconfig-002-20251106    gcc-10.5.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc                allyesconfig    clang-22
powerpc     randconfig-001-20251106    gcc-14.3.0
powerpc     randconfig-002-20251106    clang-22
powerpc64   randconfig-002-20251106    gcc-8.5.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20251106    clang-22
riscv       randconfig-002-20251106    gcc-12.5.0
s390                   allmodconfig    clang-18
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
sparc                  allyesconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
sparc64                allyesconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa                 allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

