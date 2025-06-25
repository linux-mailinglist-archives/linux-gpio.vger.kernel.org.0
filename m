Return-Path: <linux-gpio+bounces-22206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3462FAE8B0C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 19:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6ADB3A3F85
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 17:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60DB2D540A;
	Wed, 25 Jun 2025 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1OS757E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51B2D6601
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870687; cv=none; b=USPHBK4z2W9NDDwiHobrW7qFDSb0VISYO4KqONU1Okp2r3aBq7o4UZeIM3RnFePUCo15hd2R/AZMUazJtvn011NQyRQwlxKUvyrmWDnPsiJWJOUIw8W6g/TDRTLLKnlNhD4U0/3Gg6ObeUGkyNz7tx8Af/jAIwQhKkOH4Z7mgsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870687; c=relaxed/simple;
	bh=hYD4AiYy0eY8e5g/xWKR667sY8Azip4fOQdh3Ec4Kc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UbKmVBQPYevbHl4DBSAbDVN0vLo9GUDv73MtH0z3P7/T2akJI86IZFkJt0+D0a+qY29cc9VnuQ3zDPqDpA+jquxmAw/I5WuwtZZDlL2XWdWIy/tDJtkfOGPCjEzkyp+iHJhaIszWSjXEiwKB5D0tex/5Qe4UwzAq6kX/bjb/s4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1OS757E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750870685; x=1782406685;
  h=date:from:to:cc:subject:message-id;
  bh=hYD4AiYy0eY8e5g/xWKR667sY8Azip4fOQdh3Ec4Kc4=;
  b=X1OS757EE8PH7trXOgpzXSrdZZrqAPom6mX9Urs7d0JEkA6CR4FFkuK7
   3J1b7+vUk4VjM6VHAcfxbPEMyeSnuKuoLUDKdsBWZX6x8MPItV+OKR0YX
   4dSaqs1/IGGvym9aYwAPbeNpERu0YQMQPoyx66ipC6ik7qjTcKJdhGxkd
   043NMOum8NomnMgQs9GwJZq4O4lIiInvlHRC84OXqJ+ZK/4QvJmMs38aB
   GgCk3zuKI1tg9x2hI5Y8fePqVJ8bBx4MI1RtJPuWKQqJbmBFh/zj7uRYi
   4JNKFz6ukXbcLeUZCtQwV+XYqzex2l/r1lZevBzfVW0L32ED0PIALeI0o
   Q==;
X-CSE-ConnectionGUID: s0wumUpJQCCn2Yk7zuk0Yw==
X-CSE-MsgGUID: hJmzakOOTrWt7CAAJ9TQZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64209227"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="64209227"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:58:05 -0700
X-CSE-ConnectionGUID: O01FSw6BRhWyPP2AJX4RpA==
X-CSE-MsgGUID: z8DWrGi9SMKTQ0Rh5wUY5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="157764183"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2025 09:58:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUTRh-000TLA-27;
	Wed, 25 Jun 2025 16:58:01 +0000
Date: Thu, 26 Jun 2025 00:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 aeaca01619b05d3df117e81f486f5b3b694329bf
Message-ID: <202506260027.IlKkhmTC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: aeaca01619b05d3df117e81f486f5b3b694329bf  Merge branch 'devel' into for-next

elapsed time: 1224m

configs tested: 100
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-002-20250625    gcc-11.5.0
arc                   randconfig-002-20250625    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250625    clang-21
arm                   randconfig-001-20250625    gcc-11.5.0
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-003-20250625    gcc-11.5.0
arm                   randconfig-003-20250625    gcc-13.3.0
arm                   randconfig-004-20250625    gcc-11.5.0
arm                   randconfig-004-20250625    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-002-20250625    clang-20
arm64                 randconfig-002-20250625    gcc-11.5.0
arm64                 randconfig-003-20250625    gcc-11.5.0
arm64                 randconfig-003-20250625    gcc-12.3.0
arm64                 randconfig-004-20250625    clang-20
arm64                 randconfig-004-20250625    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250625    clang-20
i386        buildonly-randconfig-001-20250625    gcc-12
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-005-20250625    clang-20
i386        buildonly-randconfig-005-20250625    gcc-12
i386        buildonly-randconfig-006-20250625    clang-20
i386        buildonly-randconfig-006-20250625    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250625    gcc-12
x86_64      buildonly-randconfig-002-20250625    clang-20
x86_64      buildonly-randconfig-003-20250625    clang-20
x86_64      buildonly-randconfig-004-20250625    clang-20
x86_64      buildonly-randconfig-005-20250625    clang-20
x86_64      buildonly-randconfig-006-20250625    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

