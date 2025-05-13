Return-Path: <linux-gpio+bounces-20104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24289AB5D5F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 21:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42DD67A2AB8
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 19:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9A21F4CBF;
	Tue, 13 May 2025 19:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwLe7Kfb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CCC3596B
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165739; cv=none; b=tdw1eT8rDiZ7Piv+UUq4YGilwf57EETHQLEVygqAVPV+UgHhMEntBjU39TagAuSu2fENTa42suHVDsKMcZxosTtbu6KCNfwu5HO8XqMSMkkCqM44PbwJn+1fsqm5b1K0FTBk1w3+JUdeeTRSFkH8G5NKRwwOGGNB2cQirz57LK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165739; c=relaxed/simple;
	bh=gv/3pc/YCpVeV4co60PS2LfYllsS5ijP0aRT0kYQOCc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eX1BJjptvMNMSnsW5J91i1mduMzvFZ9cuPYHSv/qmF/2zGxfeg7+QM89Cz9TEWMXU58ZkruNlymATZKsZGNM3zHosPOETuLRG0rYU+AMngWdvN/OtcF9yn1z27j2YEhsiTuBRpJi3mBNCHoaY6Qkb+7LHa8PIF2yePvv39n/9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BwLe7Kfb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747165737; x=1778701737;
  h=date:from:to:cc:subject:message-id;
  bh=gv/3pc/YCpVeV4co60PS2LfYllsS5ijP0aRT0kYQOCc=;
  b=BwLe7KfbU4HQ2lPj5kYSgqN5+ul4i7x3P/Wjl5fvOIGX7nIVq3qn7jv+
   vyNl1smzbs9+rfL2CxAkehqy0T6SKOH5DIbOi/VCzKdy7e+16VWk+oyYq
   oWpcBT85fx/4TfoFlD7QZXspYFvNpKu48hEY6MytOE1fllzZ8UqKzBya5
   OnRwpF6pt942gNKPlGXgDIxi6lvSzBpmKumEOyxLhuAVyZUSkTP9bXNR+
   0qNcRkVTvuc1BkbDqQQmB4mblDoqO7INasE3QhW08LnGxK1irp+qnXII7
   1Pa+GFkMnpKbLG/pI7hJNQXqoOo6VX3VpD6cvMzd4kQfwc055bP2PxRyH
   Q==;
X-CSE-ConnectionGUID: 39SZX11tTSyZDk5NP/ZGlQ==
X-CSE-MsgGUID: 6EV+qdtpQlm6iPl03zcLQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59264039"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="59264039"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 12:48:57 -0700
X-CSE-ConnectionGUID: hjGWp2kVRG+MJQ8li8kWiw==
X-CSE-MsgGUID: G8pltkcYTdGL8BSVPiPRhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138731172"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 12:48:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEvcT-000GMB-2t;
	Tue, 13 May 2025 19:48:53 +0000
Date: Wed, 14 May 2025 03:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 36e3495307b5d5eafd1435cacacf5faff23a0d47
Message-ID: <202505140343.xXZr3V5G-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 36e3495307b5d5eafd1435cacacf5faff23a0d47  Merge branch 'devel' into for-next

elapsed time: 1254m

configs tested: 131
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-14.2.0
arc                   randconfig-001-20250513    gcc-14.2.0
arc                   randconfig-002-20250513    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                        multi_v5_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250513    gcc-7.5.0
arm                   randconfig-002-20250513    gcc-8.5.0
arm                   randconfig-003-20250513    gcc-8.5.0
arm                   randconfig-004-20250513    clang-16
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250513    clang-21
arm64                 randconfig-002-20250513    clang-21
arm64                 randconfig-003-20250513    gcc-6.5.0
arm64                 randconfig-004-20250513    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250513    gcc-14.2.0
csky                  randconfig-002-20250513    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250513    clang-21
hexagon               randconfig-002-20250513    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250513    clang-20
i386        buildonly-randconfig-002-20250513    clang-20
i386        buildonly-randconfig-003-20250513    clang-20
i386        buildonly-randconfig-004-20250513    clang-20
i386        buildonly-randconfig-005-20250513    gcc-12
i386        buildonly-randconfig-006-20250513    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250513    gcc-14.2.0
loongarch             randconfig-002-20250513    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250513    gcc-10.5.0
nios2                 randconfig-002-20250513    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250513    gcc-11.5.0
parisc                randconfig-002-20250513    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-002-20250513    gcc-8.5.0
powerpc               randconfig-003-20250513    clang-21
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-003-20250513    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250513    gcc-14.2.0
riscv                 randconfig-002-20250513    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250513    clang-21
s390                  randconfig-002-20250513    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250513    gcc-12.4.0
sh                    randconfig-002-20250513    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250513    gcc-11.5.0
sparc                 randconfig-002-20250513    gcc-13.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250513    gcc-11.5.0
sparc64               randconfig-002-20250513    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250513    clang-19
um                    randconfig-002-20250513    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250513    gcc-12
x86_64      buildonly-randconfig-002-20250513    gcc-12
x86_64      buildonly-randconfig-003-20250513    clang-20
x86_64      buildonly-randconfig-004-20250513    gcc-12
x86_64      buildonly-randconfig-005-20250513    clang-20
x86_64      buildonly-randconfig-006-20250513    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250513    gcc-7.5.0
xtensa                randconfig-002-20250513    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

