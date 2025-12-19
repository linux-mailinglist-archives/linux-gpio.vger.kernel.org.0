Return-Path: <linux-gpio+bounces-29768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C9CD0D63
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 17:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CCB4312FA7C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 16:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EB834EF11;
	Fri, 19 Dec 2025 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ah/hscv8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758022D780
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766160481; cv=none; b=U08hqVyF38kaloQS2PynqdxojxyErLwRHP/3Ev9eRgN2QR84N+QJlb5jtk0oAxy1Pb96AXQ9K4b8o//S6kitLoswcaL9YIx/7NsOT3C1UZQgVh0bzuVDrl4NLN16uXUR6eEeyjrML8BjyLnV9fttKNCqKw5aZB4GxpnUsh8yQHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766160481; c=relaxed/simple;
	bh=G78sl5Yo/zKllp8hguXEyOIThGtocTbIIDv2p2YMym0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j3apEtRqk+QAd45U6NR6PosxF/zpBRj3dUQeRqTV3hhwJxJORmoq/z2ey1wxaWBp82E8wtZ3GIRfJv4fems0WyAMU4fex4W2J2apF4QpJvC0WnSmT5YOX2+gBe/XS1zKmHetC6i/AS+z5fFvfIOKHpFPksOlIuazhgLCslTkxAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ah/hscv8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766160480; x=1797696480;
  h=date:from:to:cc:subject:message-id;
  bh=G78sl5Yo/zKllp8hguXEyOIThGtocTbIIDv2p2YMym0=;
  b=ah/hscv8fIk9A4lDTrB5LbEKY6LIt3r21mKkbHkhZSRll3cGMtwDbuGa
   m0XXSu4CZcqqhQnMEkyQ9ui6as+NQxJyZ9Q73B+T9/4q/EtGLGMqqXuR9
   flmItuUSWextxTMAtr2qCpxwq7tuxHgQVheiUK/3FPSyAtixMK/blEN19
   NSoTNfmb6We50nN8xZkdQoTfusP/jd42e2M064mNyibxMEJ8t+OyhRoV+
   sK2Un0m14hzaO0PjAyOL4x05MzDaFyTfNrpe5ZYgXVNH2XnnUHfxzRGmV
   gmKo9Mbv9y4ghbUqyaxZDEErmK4yuZlgxHdvvp2KUSOQU5Q3S0bVKyuS9
   w==;
X-CSE-ConnectionGUID: kTZHQNX6QnuVHI4BHwjqQw==
X-CSE-MsgGUID: jWbnplQKQUSanGNWYWr7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67874195"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="67874195"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 08:07:59 -0800
X-CSE-ConnectionGUID: AhR6aMAfSvmnTseiWo3Fww==
X-CSE-MsgGUID: 7WNeDxVYTaaFG0OS9JNpFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198045908"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2025 08:07:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWd1F-000000003iL-3pjL;
	Fri, 19 Dec 2025 16:07:53 +0000
Date: Sat, 20 Dec 2025 00:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 47d8cb678081d12704d52ed42b625e96f38470e0
Message-ID: <202512200009.PJ2PiZFW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 47d8cb678081d12704d52ed42b625e96f38470e0  gpio: realtek-otto: use larger type for dev_flags

elapsed time: 1469m

configs tested: 174
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251219    gcc-11.5.0
arc                   randconfig-002-20251219    gcc-11.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251219    gcc-11.5.0
arm                   randconfig-002-20251219    gcc-11.5.0
arm                   randconfig-003-20251219    gcc-11.5.0
arm                   randconfig-004-20251219    gcc-11.5.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251219    gcc-9.5.0
arm64                 randconfig-002-20251219    gcc-9.5.0
arm64                 randconfig-003-20251219    gcc-9.5.0
arm64                 randconfig-004-20251219    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251219    gcc-9.5.0
csky                  randconfig-002-20251219    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251219    gcc-11.5.0
hexagon               randconfig-002-20251219    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251219    clang-20
i386        buildonly-randconfig-002-20251219    clang-20
i386        buildonly-randconfig-003-20251219    clang-20
i386        buildonly-randconfig-004-20251219    clang-20
i386        buildonly-randconfig-005-20251219    clang-20
i386        buildonly-randconfig-006-20251219    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251219    clang-20
i386                  randconfig-002-20251219    clang-20
i386                  randconfig-003-20251219    clang-20
i386                  randconfig-004-20251219    clang-20
i386                  randconfig-005-20251219    clang-20
i386                  randconfig-006-20251219    clang-20
i386                  randconfig-007-20251219    clang-20
i386                  randconfig-011-20251219    gcc-14
i386                  randconfig-012-20251219    gcc-14
i386                  randconfig-013-20251219    gcc-14
i386                  randconfig-014-20251219    gcc-14
i386                  randconfig-015-20251219    gcc-14
i386                  randconfig-016-20251219    gcc-14
i386                  randconfig-017-20251219    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251219    gcc-11.5.0
loongarch             randconfig-002-20251219    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251219    gcc-11.5.0
nios2                 randconfig-002-20251219    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251219    clang-22
parisc                randconfig-002-20251219    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                   bluestone_defconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251219    clang-22
powerpc               randconfig-002-20251219    clang-22
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251219    clang-22
powerpc64             randconfig-002-20251219    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251219    clang-22
riscv                 randconfig-002-20251219    clang-22
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251219    clang-22
s390                  randconfig-002-20251219    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251219    clang-22
sh                    randconfig-002-20251219    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251219    gcc-8.5.0
sparc                 randconfig-002-20251219    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251219    gcc-8.5.0
sparc64               randconfig-002-20251219    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251219    gcc-8.5.0
um                    randconfig-002-20251219    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251219    clang-20
x86_64      buildonly-randconfig-002-20251219    clang-20
x86_64      buildonly-randconfig-003-20251219    clang-20
x86_64      buildonly-randconfig-004-20251219    clang-20
x86_64      buildonly-randconfig-005-20251219    clang-20
x86_64      buildonly-randconfig-006-20251219    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251219    gcc-14
x86_64                randconfig-002-20251219    gcc-14
x86_64                randconfig-003-20251219    gcc-14
x86_64                randconfig-004-20251219    gcc-14
x86_64                randconfig-005-20251219    gcc-14
x86_64                randconfig-006-20251219    gcc-14
x86_64                randconfig-011-20251219    clang-20
x86_64                randconfig-012-20251219    clang-20
x86_64                randconfig-013-20251219    clang-20
x86_64                randconfig-014-20251219    clang-20
x86_64                randconfig-015-20251219    clang-20
x86_64                randconfig-016-20251219    clang-20
x86_64                randconfig-071-20251219    gcc-14
x86_64                randconfig-072-20251219    gcc-14
x86_64                randconfig-073-20251219    gcc-14
x86_64                randconfig-074-20251219    gcc-14
x86_64                randconfig-075-20251219    gcc-14
x86_64                randconfig-076-20251219    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251219    gcc-8.5.0
xtensa                randconfig-002-20251219    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

