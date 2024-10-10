Return-Path: <linux-gpio+bounces-11165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C0999532
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 00:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29851F28730
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 22:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669B41E573C;
	Thu, 10 Oct 2024 22:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/hq9Y3R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36111E490B
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 22:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599260; cv=none; b=XZnQXL8cMJX1LRiWPGzdjVIAf+q3Kqw+jfdAOhrL/qUoNtY9jp7F5fEpRYvnrl5FNb9SAhEKn4HHjkyA3bGdbQoLfdqUSjVwi1ocGFDzWLGqmVMopwre+m8HED3HMJ4MT9OsqWPYzJS9QHNji0hDrDQ0VsnIjrOIqdbrufT2DL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599260; c=relaxed/simple;
	bh=R9C5VehgfPy+C53L9KUJjsrQ+iII5wh4TP4tr9fRgs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GE5m9EgNuMDjbnT18mwzFxk8SREKBd/n2nUPGvfg9ao4GELClCToPK6FTfCkeo0hBXkN/tJ8khSa20e5mOPKi+PTD8zZI/HLU8b9f56mXCRHinxPxZFFGF0DXzEvIsxNb9lauhZUPogbAHH8ipWrMCh14vE0GsaAF7bzqP37g28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/hq9Y3R; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728599259; x=1760135259;
  h=date:from:to:cc:subject:message-id;
  bh=R9C5VehgfPy+C53L9KUJjsrQ+iII5wh4TP4tr9fRgs8=;
  b=k/hq9Y3RwLD4uK0twgdFtEMKrwPdNV1r71MpVutRLjEF76LfZt9Tn46n
   Nbq1dy41X8WvPq1RgYEgoZb+nBfVZgZnydOnSHURE7vi2/+ACVTEg/wpl
   7tu8QTQHPv+VUelya7/s11SzhCmJTgFeAmlLstBW3HS1oX2PqZteGkhd3
   Lk6Pv5Cxe9vQ8ie2bTvELg2t85Z0x+VZlwfixBlZUVaRCB1rrPGlObWE6
   chvI1KRQvD+0mY7N/GSHXMgkMGF2IfpEm/Ov8EiAm/lMAdy37WfA1Qhmk
   v5wriUSzCxiCekHy09CRZTZahvzU7T9QIfI0qk25/95Zr1Xl+ZjUR1asV
   Q==;
X-CSE-ConnectionGUID: GihUf12pSwqPtAJKIUPWhg==
X-CSE-MsgGUID: lGcXJpABQOKE6cqYAdWzAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39117102"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39117102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 15:27:38 -0700
X-CSE-ConnectionGUID: 98lSnI11SeKM351XaWhSmw==
X-CSE-MsgGUID: 3/rsnWEIRaWLcTxQlwHKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76645494"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2024 15:27:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz1d8-000BML-2s;
	Thu, 10 Oct 2024 22:27:34 +0000
Date: Fri, 11 Oct 2024 06:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 ea7f2dfd13e096dce3198e5ffdb00d21bf7c8fe5
Message-ID: <202410110643.4i05itpP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: ea7f2dfd13e096dce3198e5ffdb00d21bf7c8fe5  Merge tag 'ib-mfd-gpio-i2c-watchdog-v6.13' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next

elapsed time: 739m

configs tested: 78
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386                                defconfig    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241011    gcc-12
x86_64      buildonly-randconfig-002-20241011    gcc-12
x86_64      buildonly-randconfig-003-20241011    gcc-12
x86_64      buildonly-randconfig-004-20241011    gcc-12
x86_64      buildonly-randconfig-005-20241011    gcc-12
x86_64      buildonly-randconfig-006-20241011    gcc-12
x86_64                              defconfig    clang-18
x86_64                randconfig-001-20241011    gcc-12
x86_64                randconfig-002-20241011    gcc-12
x86_64                randconfig-003-20241011    gcc-12
x86_64                randconfig-004-20241011    gcc-12
x86_64                randconfig-005-20241011    gcc-12
x86_64                randconfig-006-20241011    gcc-12
x86_64                randconfig-011-20241011    gcc-12
x86_64                randconfig-012-20241011    gcc-12
x86_64                randconfig-013-20241011    gcc-12
x86_64                randconfig-014-20241011    gcc-12
x86_64                randconfig-015-20241011    gcc-12
x86_64                randconfig-016-20241011    gcc-12
x86_64                randconfig-071-20241011    gcc-12
x86_64                randconfig-072-20241011    gcc-12
x86_64                randconfig-073-20241011    gcc-12
x86_64                randconfig-074-20241011    gcc-12
x86_64                randconfig-075-20241011    gcc-12
x86_64                randconfig-076-20241011    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

