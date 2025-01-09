Return-Path: <linux-gpio+bounces-14623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252ABA08367
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 00:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5EC3A2BCE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 23:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A05205E01;
	Thu,  9 Jan 2025 23:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2NrsJcH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE91FCFF7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jan 2025 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736465047; cv=none; b=uIdVKefPNVYaA2BUCZfH+qblrqQsIQRXbT9mRwmRg0QELCkqR2HkjTqJQ9bfeh6oJChDUZcO17tgKJH9nOWzn313lFnN7bjthH+6cE8OSyWYYOQqfMJYOK9RxYqVkhroc86lIzdAHU1liAERVZkCFcGl+A++V/b8IX5/9e68jrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736465047; c=relaxed/simple;
	bh=udQJhFaGI9LyqS/BqrOr0dx9TZ1/OP23JsAdt/YgzwA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j5NgAjIvKZs/T9bAQHCAaPbdXMVmhdwTlfr9Ejx4qlTkRRR0+8mSrpsPFdlZL+BXIaFb/aNkov3+U2HVM7gHhLvZkI79PjueanemHkcEfbMWBqe1WZsl18RpqpNsJmV7XumDKL0bMxRN1+s+Zg6ZRDw+/lTYnVR9AfshfBpFqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2NrsJcH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736465045; x=1768001045;
  h=date:from:to:cc:subject:message-id;
  bh=udQJhFaGI9LyqS/BqrOr0dx9TZ1/OP23JsAdt/YgzwA=;
  b=Y2NrsJcHL/SoJHBXJHbY+yxSFMtk2hiSHxTqKiu1fsz3nZfbZXhzLtA3
   qv8dl1mNRqNSoQxOfU3MK5PteTnhkHTStoe4rc4+wQRwXr+HpLh6hvLrm
   oG0NneVP9t8S5xM9SBVtGDKWFUw6zZkOxnEbNJoszGTpj2/EDj4kQCbSP
   uZoFsA10a0piimMhjF5ZseFUDqbvEzqTX40F+KfRdVqbxFgMSzcCUE54U
   8C4H3Y3g4iWerMaoFIO7zu71yfXkwX4jQ1UU1kIU3A6T4qBMGNhRy2lKm
   feSBm/t8I9i00/X9g0pDCp5xyW8mOEJnul38YH+HFenndVaaC8W7QpY3J
   w==;
X-CSE-ConnectionGUID: 2UAIkuwyRjSa2pt7DDSQ/g==
X-CSE-MsgGUID: CWaMP2HzT2m7h6aJjgkB3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36978853"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36978853"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 15:24:04 -0800
X-CSE-ConnectionGUID: FHM6/DXYTqe8PQ1ig9GRkQ==
X-CSE-MsgGUID: JbDsK9eGToO5GpXsMlou5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108662168"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 15:24:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW1sf-000IH4-1D;
	Thu, 09 Jan 2025 23:24:01 +0000
Date: Fri, 10 Jan 2025 07:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 a3ece0e44e8dd3710ecbde1efb780be34a6d8f72
Message-ID: <202501100741.GhCPc8WO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: a3ece0e44e8dd3710ecbde1efb780be34a6d8f72  Merge branch 'devel' into for-next

elapsed time: 1454m

configs tested: 74
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250109    gcc-13.2.0
arc                  randconfig-002-20250109    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250109    gcc-14.2.0
arm                  randconfig-002-20250109    clang-17
arm                  randconfig-003-20250109    clang-20
arm                  randconfig-004-20250109    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250109    gcc-14.2.0
arm64                randconfig-002-20250109    clang-20
arm64                randconfig-003-20250109    gcc-14.2.0
arm64                randconfig-004-20250109    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250109    gcc-14.2.0
csky                 randconfig-002-20250109    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250109    clang-14
hexagon              randconfig-002-20250109    clang-20
i386       buildonly-randconfig-001-20250109    gcc-12
i386       buildonly-randconfig-002-20250109    gcc-12
i386       buildonly-randconfig-003-20250109    clang-19
i386       buildonly-randconfig-004-20250109    clang-19
i386       buildonly-randconfig-005-20250109    clang-19
i386       buildonly-randconfig-006-20250109    gcc-12
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250109    gcc-14.2.0
loongarch            randconfig-002-20250109    gcc-14.2.0
nios2                randconfig-001-20250109    gcc-14.2.0
nios2                randconfig-002-20250109    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250109    gcc-14.2.0
parisc               randconfig-002-20250109    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250109    clang-15
powerpc              randconfig-002-20250109    gcc-14.2.0
powerpc              randconfig-003-20250109    gcc-14.2.0
powerpc64            randconfig-001-20250109    gcc-14.2.0
powerpc64            randconfig-002-20250109    clang-20
powerpc64            randconfig-003-20250109    clang-17
riscv                           allmodconfig    clang-20
riscv                randconfig-001-20250109    gcc-14.2.0
riscv                randconfig-002-20250109    clang-15
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250109    gcc-14.2.0
s390                 randconfig-002-20250109    clang-16
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250109    gcc-14.2.0
sh                   randconfig-002-20250109    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250109    gcc-14.2.0
sparc                randconfig-002-20250109    gcc-14.2.0
sparc64              randconfig-001-20250109    gcc-14.2.0
sparc64              randconfig-002-20250109    gcc-14.2.0
um                   randconfig-001-20250109    gcc-12
um                   randconfig-002-20250109    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250109    clang-19
x86_64     buildonly-randconfig-002-20250109    gcc-12
x86_64     buildonly-randconfig-003-20250109    clang-19
x86_64     buildonly-randconfig-004-20250109    clang-19
x86_64     buildonly-randconfig-005-20250109    clang-19
x86_64     buildonly-randconfig-006-20250109    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250109    gcc-14.2.0
xtensa               randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

