Return-Path: <linux-gpio+bounces-20481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3CAC0E96
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 16:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E2AE4A2E5C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 14:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C817B28B3F7;
	Thu, 22 May 2025 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC+z70wu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65028C2B1
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925158; cv=none; b=K0NR6lqWXg7pTadz2imPrONyW++3Rm9LHSEfyexJsnt4ln7jB7VUVz82NddYttZIFYNV4GpB7p1ykgnt3JTjs8f9BDDpjiOUQ175hBtdphC7ZpTHUaLogSYMAAu1AVIuhhbo28RYPRJRiJp2bCklS+UlSCO0tAKlrJtU05pwjD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925158; c=relaxed/simple;
	bh=PfNjiTO6ATnrnHL+CQxCrLnLno8NnSEyJX7Pk8GW7Dg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jmVbFmLtr6Y/+csig2EXqFCbGW15bs171Fa/v0T7W5VN65eDet1HVDpBtpG2SUmha0AJCXz5xqRmI/uBceVGgXOPUhihHJFmNZf+j8v+G2K/emCqnc8p1SIssRA2VQgnOk6WeawKVHeJ6sXugtv7w6ydLrpo83bYAldNbbnqqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC+z70wu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747925157; x=1779461157;
  h=date:from:to:cc:subject:message-id;
  bh=PfNjiTO6ATnrnHL+CQxCrLnLno8NnSEyJX7Pk8GW7Dg=;
  b=KC+z70wuD4AOJ2dTIt0ifZAYfMz2v5XWHw+gEGKPQg5L6U988fOy8hu2
   8Kr8RDwKAhYjt8U0h2kZKIEbeQ9gd2PbDVJ7bj5dt+QQTkgd3JCrMMAoU
   7hpghbjP+0m6FVVo19AsuUD37BSOmjZ4oZfdvocIypkQCzSaGPqBcX1tk
   pIfNRqAf5CmablFosNlRaUeZ/ekeY55SK2OKm6aG+V93srrBgmY7WZEnF
   stQi3zKlWqYCZiVfClfetcYq2FxSYkczCQAw9IEMSMHSa28OcC/S9bqQF
   fA34TcwdT+Sm9td3E5E/v8YM4zaJGIqVVVDLghXWM8w19dc872KP5pQRu
   A==;
X-CSE-ConnectionGUID: hVH5GIovSu+8Vpwb/rgSDQ==
X-CSE-MsgGUID: aR3MgV52QOu42wieqBurpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75352256"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75352256"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 07:45:56 -0700
X-CSE-ConnectionGUID: K5qFkd5aTtuq/OZKgXEB7Q==
X-CSE-MsgGUID: bBXAqoQ0TByTjltOg0Mz0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140498793"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 May 2025 07:45:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI7BA-000PRE-3C;
	Thu, 22 May 2025 14:45:53 +0000
Date: Thu, 22 May 2025 22:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 08dcbe30be481bc66eb5ee1e82a577d64e451612
Message-ID: <202505222251.0McfxAzs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 08dcbe30be481bc66eb5ee1e82a577d64e451612  pinctrl: freescale: Add support for imx943 pinctrl

elapsed time: 1456m

configs tested: 95
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                   randconfig-001-20250521    gcc-10.5.0
arc                   randconfig-002-20250521    gcc-12.4.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250521    clang-16
arm                   randconfig-004-20250521    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250521    gcc-6.5.0
arm64                 randconfig-002-20250521    gcc-6.5.0
arm64                 randconfig-003-20250521    gcc-8.5.0
arm64                 randconfig-004-20250521    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250522    gcc-15.1.0
csky                  randconfig-002-20250522    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250522    clang-17
hexagon               randconfig-002-20250522    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250522    clang-20
i386        buildonly-randconfig-002-20250522    gcc-12
i386        buildonly-randconfig-003-20250522    gcc-12
i386        buildonly-randconfig-004-20250522    gcc-12
i386        buildonly-randconfig-005-20250522    gcc-12
i386        buildonly-randconfig-006-20250522    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250522    gcc-15.1.0
loongarch             randconfig-002-20250522    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250522    gcc-6.5.0
parisc                randconfig-002-20250522    gcc-12.4.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250522    clang-21
powerpc               randconfig-003-20250522    gcc-7.5.0
powerpc64             randconfig-001-20250522    clang-21
powerpc64             randconfig-002-20250522    gcc-10.5.0
powerpc64             randconfig-003-20250522    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-002-20250522    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-002-20250522    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-002-20250522    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-002-20250522    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250522    gcc-12
um                    randconfig-002-20250522    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250522    clang-20
x86_64      buildonly-randconfig-002-20250522    gcc-12
x86_64      buildonly-randconfig-003-20250522    gcc-12
x86_64      buildonly-randconfig-004-20250522    gcc-12
x86_64      buildonly-randconfig-005-20250522    gcc-12
x86_64      buildonly-randconfig-006-20250522    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-002-20250522    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

