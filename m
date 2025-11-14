Return-Path: <linux-gpio+bounces-28464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C40AC5BB8B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 08:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8735035C8B4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 07:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF0D2F60B5;
	Fri, 14 Nov 2025 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cd8z/7zI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B5F2F5A1B
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104448; cv=none; b=DxmPm21RYleay5wz9LOEAVSBGl31I5O6quNOm2F3Pxnvez301pTkUET5Xe7baiJgVPuKwazxkUV8bGyZCcpkNkhxAD33TqtFzMUtPeWxydLWERzRUsKjAtS1OtPF16x9l0GkaGVbpkmo80Cx6+k6rWQ8/YfR4oX4OXYlqmWec9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104448; c=relaxed/simple;
	bh=P/sMe51zEOLJre5CSo04BXj0OmZmqyMmd4e5wZUuSTU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=On7A7+4X8cFLWituNkacoAsYrMd8xmbHB/Yjuxm7pbfl+5spCkyFjy1RlVa+KdF66jVk2QOg8CTlnsn40QEfWGvUvO8Z9/7BX+gCUuT4yV2Veejss24K3skgbcoTIA13DwDthUM5Q6iDBL1ubcNJzUYLV0il2m4eTMJhEyusNtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cd8z/7zI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763104446; x=1794640446;
  h=date:from:to:cc:subject:message-id;
  bh=P/sMe51zEOLJre5CSo04BXj0OmZmqyMmd4e5wZUuSTU=;
  b=cd8z/7zIRumbyApiEH1N9yN9mTE7H1IJf6yUDcUQBTp14bMTnS+xSS1i
   RmaIXqKIjIaRbQj5WOLI4U6BmZWMcxkHamvFSYpjaJ8EYFn8oN9lK1R6h
   hU0FNE/a1wOHpjdzECHIkydTr3rAdMzJ2C/IHy0R3ee0BgT60vtap6FGl
   qzVWcFuN8mVKK+uqzmsx6chwYoIkvRbjK8BR70ZlGg1MHE7HShbvsZNY6
   5vct80oEJhF/RzKB57cW/bFSDlxxPO/BKsobRcfJEvM8cZSHmylJ8O2q7
   +mVajDnyHKYH6I9fT11nb0Q6OtVTSCK+BeOxLHtNf2+AV5BbsPAJb6Ak+
   w==;
X-CSE-ConnectionGUID: vB1ebw7kTa+pHOaPG2+aeg==
X-CSE-MsgGUID: +svX40YoROGOEu/oGjbJNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="87841581"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="87841581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 23:14:03 -0800
X-CSE-ConnectionGUID: MW7lZvkDT1yZ31XK/ZAzlg==
X-CSE-MsgGUID: sayZGtMRRNGUBmzQyPpwNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="193996742"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2025 23:14:02 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJo0O-0006Hv-0f;
	Fri, 14 Nov 2025 07:14:00 +0000
Date: Fri, 14 Nov 2025 15:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 f2596d9fa19c0910319fe8eb1ccdf6348f0e02db
Message-ID: <202511141521.Gd8ON86y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: f2596d9fa19c0910319fe8eb1ccdf6348f0e02db  pinctrl: airoha: convert comma to semicolon

elapsed time: 1886m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251113    gcc-8.5.0
arc                   randconfig-002-20251113    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20251113    gcc-10.5.0
arm                   randconfig-002-20251113    clang-22
arm                   randconfig-003-20251113    clang-22
arm                   randconfig-004-20251113    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251114    gcc-8.5.0
arm64                 randconfig-002-20251114    clang-22
arm64                 randconfig-003-20251114    clang-22
arm64                 randconfig-004-20251114    gcc-10.5.0
csky                             alldefconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251114    gcc-10.5.0
csky                  randconfig-002-20251114    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251114    clang-22
hexagon               randconfig-002-20251114    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251114    gcc-14
i386        buildonly-randconfig-003-20251114    clang-20
i386        buildonly-randconfig-004-20251114    gcc-14
i386                  randconfig-011-20251114    gcc-12
i386                  randconfig-012-20251114    gcc-14
i386                  randconfig-013-20251114    gcc-14
i386                  randconfig-014-20251114    clang-20
i386                  randconfig-015-20251114    gcc-14
i386                  randconfig-016-20251114    gcc-14
i386                  randconfig-017-20251114    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251114    clang-18
loongarch             randconfig-002-20251114    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
mips                           ip27_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251114    gcc-10.5.0
nios2                 randconfig-002-20251114    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251114    gcc-12.5.0
parisc                randconfig-002-20251114    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251114    clang-17
powerpc               randconfig-002-20251114    clang-22
powerpc64             randconfig-001-20251114    gcc-8.5.0
powerpc64             randconfig-002-20251114    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-002-20251114    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-002-20251114    gcc-11.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                    randconfig-002-20251114    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251114    gcc-14.3.0
sparc                 randconfig-002-20251114    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251114    gcc-8.5.0
sparc64               randconfig-002-20251114    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251114    gcc-13
um                    randconfig-002-20251114    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251114    clang-20
x86_64      buildonly-randconfig-002-20251114    gcc-14
x86_64      buildonly-randconfig-003-20251114    gcc-14
x86_64      buildonly-randconfig-004-20251114    clang-20
x86_64      buildonly-randconfig-005-20251114    clang-20
x86_64      buildonly-randconfig-006-20251114    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20251114    clang-20
x86_64                randconfig-072-20251114    clang-20
x86_64                randconfig-073-20251114    clang-20
x86_64                randconfig-074-20251114    clang-20
x86_64                randconfig-075-20251114    gcc-14
x86_64                randconfig-076-20251114    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251114    gcc-14.3.0
xtensa                randconfig-002-20251114    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

