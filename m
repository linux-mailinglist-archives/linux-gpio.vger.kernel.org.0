Return-Path: <linux-gpio+bounces-14619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19403A07179
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 10:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD8C81885D1E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 09:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDCA214A79;
	Thu,  9 Jan 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YopCqpZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD35103F
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jan 2025 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415104; cv=none; b=LMW5DKGKYofx8TapJkztb2r790DLrbPwCRFbL6ymAsfBRCRWwgsfo2fM4YaIqR+zfPLuOQtUijwvZ670ccE6V0d2OSQpmn2NDtomhbXfu3RNmH2jpYnsNxOar+/NSMRWGc0Z2u1pf7RpJArXnvT++DAS+9SiL0ckh38KqJIb7Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415104; c=relaxed/simple;
	bh=GDr8xdUnANGHq4yKlcPcoSsbCjm8zsmcnWnJNaxXAUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iITeyTyKX/KgImJeiuRKhu1+FBeYWVM5NeaPoGrIK6SWRUSccxHSDRu6ToWfcdZh6/j/PWqrabA05Huqr00X8leAbTL341DQSmkZIw9uPvUc9k7jOdKMhMZY/Cu4g5aeRLkyqx0Fr/E8NRs2R+WlCH694Os6f7aQTl+ZGMNUe+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YopCqpZU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736415103; x=1767951103;
  h=date:from:to:cc:subject:message-id;
  bh=GDr8xdUnANGHq4yKlcPcoSsbCjm8zsmcnWnJNaxXAUk=;
  b=YopCqpZUeSdhAAo2hEZEEJ3gwNUbmCtVFmtRFCXxFPKUk0a+8tGvD7Yp
   heYYnWL9/kVbbOe68Gk6IHnNfN8qfLUf/XIKZJyo7EIeDt28EOtMCsIgr
   muauv7FPwVKZXbkuZiDDw45uSyS9p9LLO9vxGovc6C6MOTk5kLnx7+aI7
   ZJSC0To0pKiMzA9iFxD66cJC0fNoHfYWP/LGTJN+pSTbAQdjuyHyGSh8S
   ZFAslFkkTJQ1Vu3Uw95EW4op4GDd8jPVaTqe3GOOs67ddH2Ia9VwEhOAs
   zVeTvG3HrT4AUOyUPyZ+UEhLYbZVStKx9SYYZTcx9uchOvNh6Eas2R8kg
   A==;
X-CSE-ConnectionGUID: GXsTi+x5RKWW4IIoYdgXgw==
X-CSE-MsgGUID: S6i8NlbdQwaJCUcmmgue+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40432375"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40432375"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:29:39 -0800
X-CSE-ConnectionGUID: aJXPqFQbTp6U6ktmmQCMWg==
X-CSE-MsgGUID: d1podL6VTRCnsqf/pTPnpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126643032"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 01:29:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVorA-000HJN-08;
	Thu, 09 Jan 2025 09:29:36 +0000
Date: Thu, 09 Jan 2025 17:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 e59f4c97172de0c302894cfd5616161c1f0c4d85
Message-ID: <202501091734.X7rlLkoT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: e59f4c97172de0c302894cfd5616161c1f0c4d85  gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset

elapsed time: 1453m

configs tested: 85
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250108    gcc-13.2.0
arc                  randconfig-002-20250108    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250108    gcc-14.2.0
arm                  randconfig-002-20250108    gcc-14.2.0
arm                  randconfig-003-20250108    clang-20
arm                  randconfig-004-20250108    clang-18
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250108    gcc-14.2.0
arm64                randconfig-002-20250108    clang-20
arm64                randconfig-003-20250108    gcc-14.2.0
arm64                randconfig-004-20250108    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250108    gcc-14.2.0
csky                 randconfig-002-20250108    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250108    clang-20
hexagon              randconfig-002-20250108    clang-20
i386                             allnoconfig    gcc-12
i386       buildonly-randconfig-001-20250108    clang-19
i386       buildonly-randconfig-002-20250108    gcc-12
i386       buildonly-randconfig-003-20250108    gcc-12
i386       buildonly-randconfig-004-20250108    gcc-12
i386       buildonly-randconfig-005-20250108    gcc-12
i386       buildonly-randconfig-006-20250108    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250108    gcc-14.2.0
loongarch            randconfig-002-20250108    gcc-14.2.0
nios2                randconfig-001-20250108    gcc-14.2.0
nios2                randconfig-002-20250108    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250108    gcc-14.2.0
parisc               randconfig-002-20250108    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250108    clang-16
powerpc              randconfig-002-20250108    gcc-14.2.0
powerpc              randconfig-003-20250108    gcc-14.2.0
powerpc64            randconfig-001-20250108    clang-18
powerpc64            randconfig-002-20250108    clang-16
powerpc64            randconfig-003-20250108    clang-20
riscv                           allmodconfig    clang-20
riscv                            allnoconfig    gcc-14.2.0
riscv                           allyesconfig    clang-20
riscv                randconfig-001-20250108    gcc-14.2.0
riscv                randconfig-002-20250108    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250108    gcc-14.2.0
s390                 randconfig-002-20250108    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250108    gcc-14.2.0
sh                   randconfig-002-20250108    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250108    gcc-14.2.0
sparc                randconfig-002-20250108    gcc-14.2.0
sparc64              randconfig-001-20250108    gcc-14.2.0
sparc64              randconfig-002-20250108    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250108    gcc-12
um                   randconfig-002-20250108    clang-16
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250108    clang-19
x86_64     buildonly-randconfig-002-20250108    gcc-11
x86_64     buildonly-randconfig-003-20250108    clang-19
x86_64     buildonly-randconfig-004-20250108    gcc-12
x86_64     buildonly-randconfig-005-20250108    gcc-12
x86_64     buildonly-randconfig-006-20250108    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250108    gcc-14.2.0
xtensa               randconfig-002-20250108    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

