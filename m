Return-Path: <linux-gpio+bounces-25964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A0B5360F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 16:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9452B3A5575
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 14:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B8B1A9FA7;
	Thu, 11 Sep 2025 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXAEoqgI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603F32142A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601930; cv=none; b=kyJzEy1JioKLkSyL0OgTshauBRHqGB/opM4lzJ4oSnzOvk+aIk0b85ML8yMT77hq/6/6ZhlQXhS1XR+ulfo2W+KCFqXIBVzuTVHQCjO5cyLZgPsSecOnx/unPkfRDAo7fY+BAYcPu77yd2g3FE2jw5YOWsCBxS2o7TogIwGzMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601930; c=relaxed/simple;
	bh=wNUi2lc7LfhftxjnvsXD6iLBCRh9UJDBv2GcDQrt7Wg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RqUP6X9nz0iVUJcgL9PEoQFhIzI1aOvBmFvXUBQ/jadzHIqy/P8GHYnbtmHisPNzHezPTxDFkRD38sCxNlS8yVlVoy6B9m/0TiHWOCnYhU8Qa0+Ws2PaNSoSVY5vDkbiSLlujkdb/8sA5unc4q+j+if8Vl7YYp1fYjUxbz0LSds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXAEoqgI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757601929; x=1789137929;
  h=date:from:to:cc:subject:message-id;
  bh=wNUi2lc7LfhftxjnvsXD6iLBCRh9UJDBv2GcDQrt7Wg=;
  b=kXAEoqgINWR/lleP36NT2hhxOBbRgmX3C6d9XEapmQSD/CTwP7yk5OXz
   I/CodIgBJpgCPkhkP58UL3+wT9PNM2r096Utq19v9SDW0Zrpd2OAkIQ4Z
   DMEFiifdqzMMtrKIWUzHpXJlM3UxF2s7dv2rq2hj073bS4VEZkFRHdXob
   13X516iJc9TKFBrHaRSeWpEqjPHwnP35oIeEJQQUqfS/8/BG8RGg3l/Rn
   OBqXCidULGZAiH0YYe4qVewHKjtUxMhh3omaiUdZ64jocL+44Zs5rvjsf
   jgCsP0Fx31HDBxx/RNOfGblapRrb7lf/QVQsIcuv3aFJu8/DjVLz2yYUM
   A==;
X-CSE-ConnectionGUID: xeAS0IzkSoGHfetMXhlSXQ==
X-CSE-MsgGUID: 3+0vVYSdRkicVsh3Ywq7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59881806"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59881806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 07:45:27 -0700
X-CSE-ConnectionGUID: 3hPRg/0gSHCF7Hy+sp2R2g==
X-CSE-MsgGUID: 8NYSH8A3RRSb3nOn8Q6BNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="173776130"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Sep 2025 07:45:25 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwiY6-0000OQ-13;
	Thu, 11 Sep 2025 14:45:22 +0000
Date: Thu, 11 Sep 2025 22:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 1c84a6b2ca9400516d3659dcb5515ffcd09fc801
Message-ID: <202509112215.l3KebZRl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 1c84a6b2ca9400516d3659dcb5515ffcd09fc801  Merge branch 'devel' into for-next

elapsed time: 1466m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250911    gcc-8.5.0
arc                   randconfig-002-20250911    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250911    clang-22
arm                   randconfig-002-20250911    gcc-14.3.0
arm                   randconfig-003-20250911    clang-22
arm                   randconfig-004-20250911    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250911    gcc-13.4.0
arm64                 randconfig-002-20250911    gcc-8.5.0
arm64                 randconfig-003-20250911    gcc-8.5.0
arm64                 randconfig-004-20250911    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250911    gcc-15.1.0
csky                  randconfig-002-20250911    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250911    clang-20
hexagon               randconfig-002-20250911    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250910    gcc-14
i386        buildonly-randconfig-002-20250910    gcc-13
i386        buildonly-randconfig-003-20250910    clang-20
i386        buildonly-randconfig-004-20250910    clang-20
i386        buildonly-randconfig-005-20250910    gcc-14
i386        buildonly-randconfig-006-20250910    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250911    gcc-15.1.0
loongarch             randconfig-002-20250911    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250911    gcc-11.5.0
nios2                 randconfig-002-20250911    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250911    gcc-8.5.0
parisc                randconfig-002-20250911    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250911    gcc-8.5.0
powerpc               randconfig-002-20250911    gcc-15.1.0
powerpc               randconfig-003-20250911    gcc-8.5.0
powerpc64             randconfig-001-20250911    clang-22
powerpc64             randconfig-002-20250911    gcc-11.5.0
powerpc64             randconfig-003-20250911    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250910    clang-22
riscv                 randconfig-002-20250910    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250910    clang-22
s390                  randconfig-002-20250910    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250910    gcc-15.1.0
sh                    randconfig-002-20250910    gcc-12.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250910    gcc-8.5.0
sparc                 randconfig-002-20250910    gcc-8.5.0
sparc64               randconfig-001-20250910    gcc-8.5.0
sparc64               randconfig-002-20250910    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250910    clang-22
um                    randconfig-002-20250910    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250910    gcc-14
x86_64      buildonly-randconfig-002-20250910    clang-20
x86_64      buildonly-randconfig-003-20250910    gcc-14
x86_64      buildonly-randconfig-004-20250910    clang-20
x86_64      buildonly-randconfig-005-20250910    gcc-14
x86_64      buildonly-randconfig-006-20250910    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250910    gcc-8.5.0
xtensa                randconfig-002-20250910    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

