Return-Path: <linux-gpio+bounces-17224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E98A56473
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 10:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4C93AFD0B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 09:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F09120D4E7;
	Fri,  7 Mar 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbEd3skE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F68120C473
	for <linux-gpio@vger.kernel.org>; Fri,  7 Mar 2025 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741341542; cv=none; b=p1bZSpR6OiV+NJTWqw3BowCAkm8HpXlDiyFxlJOnt8ChGZZg7hoo80JyNkcCkzYYonimjRMTVsLxaUxWEawsJj0sY6jKALRdcwn57NldoVRm8Bz4y8GbL9nvaO5YhgByDn0AoRvaukTYlt0AAIbklbTQLH9Y26CSNVwbOKEPmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741341542; c=relaxed/simple;
	bh=U9Ex0OXD8iq5aXk6cu5g5FJaCFd8b6HU7XvzsoRtJ7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=haVHgw41bKDT18qDj3kamovMLqH9s8i4kZ83PBk3+4wwXR9yFzOP70bWWc0EJnoqPPQOMmdm9N6XxinNeueu/BbnFv1gD1xECAZg8p3njlbjugtRiAKg8/+jS5wMsmaKe2hxfhwq/e/dP2cqt/PCvgNeetNu3091AUhUUBJ4i4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbEd3skE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741341540; x=1772877540;
  h=date:from:to:cc:subject:message-id;
  bh=U9Ex0OXD8iq5aXk6cu5g5FJaCFd8b6HU7XvzsoRtJ7U=;
  b=bbEd3skE4mZY3pQUKVxUWhaAZf7SJr6X1p1H7g2BVyVQajNTag6WfNgT
   M5tBD+vgc0eYCeGvO/2PYJ4t6G8LbdzWwUI6DELWPov0PAF7SEwJVCWZ4
   DW+zuYM3lRHLcUUiGPnDTxFJutlxKTB4dN6I9CMvl6YS7MUfNQfg/soYe
   Ukkdv4j/se8SffCmpy4RQWS2JEDYxIg2KR+oDMOz9tZYYoqQa7J9kAMuO
   J3duHUAUlAihkwNxVnG7DxMYDXxk0O5IFulSG7Qg80GK6B5J0pMYsoSNy
   n7n58O4ubYrQAaIMOktY93rC6QJ/kR12TRFm5r9IZg+YJALUFUglZESNW
   Q==;
X-CSE-ConnectionGUID: kknjQ0IYT/6o4XskSotq1g==
X-CSE-MsgGUID: aGrlkYeqSYalZvSldx97iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53774586"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53774586"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:58:59 -0800
X-CSE-ConnectionGUID: mV3YF6a8TAqBODwMIDnNng==
X-CSE-MsgGUID: Mj2ev5hhRnOD/F8FTr7SSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119969174"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2025 01:58:59 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqUTo-0000Gj-2v;
	Fri, 07 Mar 2025 09:58:56 +0000
Date: Fri, 07 Mar 2025 17:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 e058c5f49ceff38bf1579a679a5ca20842718579
Message-ID: <202503071750.GayZ38eo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: e058c5f49ceff38bf1579a679a5ca20842718579  Merge branch 'devel' into for-next

elapsed time: 1451m

configs tested: 88
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250306    gcc-13.2.0
arc                  randconfig-002-20250306    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250306    gcc-14.2.0
arm                  randconfig-002-20250306    gcc-14.2.0
arm                  randconfig-003-20250306    gcc-14.2.0
arm                  randconfig-004-20250306    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250306    gcc-14.2.0
arm64                randconfig-002-20250306    gcc-14.2.0
arm64                randconfig-003-20250306    gcc-14.2.0
arm64                randconfig-004-20250306    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250306    gcc-14.2.0
csky                 randconfig-002-20250306    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                          allnoconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250306    clang-21
hexagon              randconfig-002-20250306    clang-19
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250306    clang-19
i386       buildonly-randconfig-002-20250306    clang-19
i386       buildonly-randconfig-003-20250306    clang-19
i386       buildonly-randconfig-004-20250306    gcc-12
i386       buildonly-randconfig-005-20250306    gcc-12
i386       buildonly-randconfig-006-20250306    clang-19
i386                               defconfig    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250306    gcc-14.2.0
loongarch            randconfig-002-20250306    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20250306    gcc-14.2.0
nios2                randconfig-002-20250306    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250306    gcc-14.2.0
parisc               randconfig-002-20250306    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250306    clang-21
powerpc              randconfig-002-20250306    clang-18
powerpc              randconfig-003-20250306    gcc-14.2.0
powerpc64            randconfig-001-20250306    clang-18
powerpc64            randconfig-002-20250306    clang-21
powerpc64            randconfig-003-20250306    clang-18
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250306    clang-18
riscv                randconfig-002-20250306    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250306    gcc-14.2.0
s390                 randconfig-002-20250306    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250306    gcc-14.2.0
sh                   randconfig-002-20250306    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250306    gcc-14.2.0
sparc                randconfig-002-20250306    gcc-14.2.0
sparc64              randconfig-001-20250306    gcc-14.2.0
sparc64              randconfig-002-20250306    gcc-14.2.0
um                              allmodconfig    clang-21
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250306    gcc-12
um                   randconfig-002-20250306    clang-16
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250306    gcc-11
x86_64     buildonly-randconfig-002-20250306    clang-19
x86_64     buildonly-randconfig-003-20250306    clang-19
x86_64     buildonly-randconfig-004-20250306    clang-19
x86_64     buildonly-randconfig-005-20250306    clang-19
x86_64     buildonly-randconfig-006-20250306    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250306    gcc-14.2.0
xtensa               randconfig-002-20250306    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

