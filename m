Return-Path: <linux-gpio+bounces-12289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5529B5905
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 02:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45BFF1F23D67
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 01:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFC2139D07;
	Wed, 30 Oct 2024 01:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBxqSjJd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D03D96A
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 01:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730251163; cv=none; b=aZWXqQpw1yBxqJm11xdscqrztiTMZ4yYOIr/nAva6De1fgfKsHGKFbssAeVETv6xlYtSMibiiDN/1UQPjJDZw3Os1R5ArzLAxofDJKEaEdEN3/JNQdqK66Rcm0tjpRnxoF1cuDW5AkM99PhIvaIfMWYe8qPUS9C9kFYCuSTV8QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730251163; c=relaxed/simple;
	bh=7V637SuCl/51Y+0iF+JB9Ol1wbpy8fYM3nl6xVzjglA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IzI1p1NFI3+GkG54QWOfhu9cCHdhLZztprApoD1Zu65aJ5t9Ez0xOk1N5XCpy63clJMLa8aws/Xxc6pGt0+uPE1IZv9KsJ1/HHqcCvPDWIzyl+9Ry94jZimsi/8COCJT655xnA9YnJyq2F4tHmoWFDZsL3L+p72bGajFyHMDxyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBxqSjJd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730251161; x=1761787161;
  h=date:from:to:cc:subject:message-id;
  bh=7V637SuCl/51Y+0iF+JB9Ol1wbpy8fYM3nl6xVzjglA=;
  b=aBxqSjJdiT4oHCkZGWHwn3nJ4bBqbQozfN3vu36tRXWBY13bZwHcgjKc
   bAu/4CbWag9/8J2p+rTWwKq5iC389ZDKJF7eIrVqIQM67QBon5b0wBWr/
   mHLlt6/9bsKRu+7Bvx9GRtb38cF51SCPnG1CH+z2v5t7ejTiddmfItNKv
   Fs5KFgqOck7BvD9pyl2tDjNFUuQT6imNb9Fm5oUGdySG+tbVA8oc9niwC
   UN8k/Uje4GKn1GIl4aMrOh/z/22UK7OPYx13FJIvWIWmz5PjB4BI8wrvZ
   Sawusre90gfz5SstLFvdPZir5VEtoxsW6AC7aM3WqSh+BpjaDueEeKfCr
   Q==;
X-CSE-ConnectionGUID: kSSPUYe0SpuDVdAmtI9PEw==
X-CSE-MsgGUID: hWOga8GgQpqwdvuVDxe2SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52492309"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52492309"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 18:12:15 -0700
X-CSE-ConnectionGUID: 4VsemFegSw6nD5Ect4mibQ==
X-CSE-MsgGUID: 96VeiXDITEKVRd0ckd3IXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="81703567"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2024 18:11:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5xFI-000eMU-2N;
	Wed, 30 Oct 2024 01:11:36 +0000
Date: Wed, 30 Oct 2024 09:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 fad9c4ca8e28ed6088e4c270dedacd2fc221eb2d
Message-ID: <202410300916.Pp5pKXi3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: fad9c4ca8e28ed6088e4c270dedacd2fc221eb2d  Merge fixup

elapsed time: 887m

configs tested: 185
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241029    gcc-14.1.0
arc                   randconfig-002-20241029    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    gcc-14.1.0
arm                      integrator_defconfig    gcc-14.1.0
arm                        keystone_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    clang-20
arm                   randconfig-001-20241029    gcc-14.1.0
arm                   randconfig-002-20241029    gcc-14.1.0
arm                   randconfig-003-20241029    gcc-14.1.0
arm                   randconfig-004-20241029    gcc-14.1.0
arm                             rpc_defconfig    clang-20
arm                         s5pv210_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                           sama7_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241029    gcc-14.1.0
arm64                 randconfig-002-20241029    gcc-14.1.0
arm64                 randconfig-003-20241029    gcc-14.1.0
arm64                 randconfig-004-20241029    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241029    gcc-14.1.0
csky                  randconfig-002-20241029    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241029    gcc-14.1.0
hexagon               randconfig-002-20241029    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241029    clang-19
i386        buildonly-randconfig-001-20241030    gcc-12
i386        buildonly-randconfig-002-20241029    clang-19
i386        buildonly-randconfig-002-20241030    gcc-12
i386        buildonly-randconfig-003-20241029    clang-19
i386        buildonly-randconfig-003-20241030    gcc-12
i386        buildonly-randconfig-004-20241029    clang-19
i386        buildonly-randconfig-004-20241030    gcc-12
i386        buildonly-randconfig-005-20241029    clang-19
i386        buildonly-randconfig-005-20241030    gcc-12
i386        buildonly-randconfig-006-20241029    clang-19
i386        buildonly-randconfig-006-20241030    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241029    clang-19
i386                  randconfig-001-20241030    gcc-12
i386                  randconfig-002-20241029    clang-19
i386                  randconfig-002-20241030    gcc-12
i386                  randconfig-003-20241029    clang-19
i386                  randconfig-003-20241030    gcc-12
i386                  randconfig-004-20241029    clang-19
i386                  randconfig-004-20241030    gcc-12
i386                  randconfig-005-20241029    clang-19
i386                  randconfig-005-20241030    gcc-12
i386                  randconfig-006-20241029    clang-19
i386                  randconfig-006-20241030    gcc-12
i386                  randconfig-011-20241029    clang-19
i386                  randconfig-011-20241030    gcc-12
i386                  randconfig-012-20241029    clang-19
i386                  randconfig-012-20241030    gcc-12
i386                  randconfig-013-20241029    clang-19
i386                  randconfig-013-20241030    gcc-12
i386                  randconfig-014-20241029    clang-19
i386                  randconfig-014-20241030    gcc-12
i386                  randconfig-015-20241029    clang-19
i386                  randconfig-015-20241030    gcc-12
i386                  randconfig-016-20241029    clang-19
i386                  randconfig-016-20241030    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241029    gcc-14.1.0
loongarch             randconfig-002-20241029    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    clang-20
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241029    gcc-14.1.0
nios2                 randconfig-002-20241029    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241029    gcc-14.1.0
parisc                randconfig-002-20241029    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   lite5200b_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    gcc-14.1.0
powerpc                       ppc64_defconfig    clang-20
powerpc               randconfig-001-20241029    gcc-14.1.0
powerpc               randconfig-002-20241029    gcc-14.1.0
powerpc               randconfig-003-20241029    gcc-14.1.0
powerpc                     tqm8541_defconfig    clang-20
powerpc64             randconfig-001-20241029    gcc-14.1.0
powerpc64             randconfig-002-20241029    gcc-14.1.0
riscv                            alldefconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241029    gcc-14.1.0
riscv                 randconfig-002-20241029    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241029    gcc-14.1.0
s390                  randconfig-002-20241029    gcc-14.1.0
sh                               alldefconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                    randconfig-001-20241029    gcc-14.1.0
sh                    randconfig-002-20241029    gcc-14.1.0
sh                          rsk7264_defconfig    clang-20
sh                   rts7751r2dplus_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    clang-20
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241029    gcc-14.1.0
sparc64               randconfig-002-20241029    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241029    gcc-14.1.0
um                    randconfig-002-20241029    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    clang-20
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20241029    gcc-14.1.0
xtensa                randconfig-002-20241029    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

