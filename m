Return-Path: <linux-gpio+bounces-31192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFE3OzN9eWldxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 04:06:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A019C7DB
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 04:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B7963068A07
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 03:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88458219A7A;
	Wed, 28 Jan 2026 03:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv8iFO19"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139C2C2346
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 03:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569453; cv=none; b=WIL9DJ2iu2Eg8gvv1F6UKWS3dhM/1l77StCTyZ4W8vJF+atcebAe8+189G2s7YO6H0H28zNXEIWu3XpmoXygeGd/w9JQxfLba6bXX+1c/WJND/pTeNltP8Rsu9Qtu+Q+rcClhvSCz7q3VYMWccTjPm+fSE7GtMjMl/bfxizTN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569453; c=relaxed/simple;
	bh=U+igsKaGNoTfLJ3DwVZceYtGR8Mem0S9HQeKc1ZCeNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xo03DgxuXOLNX4uzFekmNFptF+vUwjReV0xRqI6GkUmQ96liSQ518Cfyu8Ncr4oaNEg9cGm8z9flOZV8rGKQCiLMeKEITkQA9K2+jwVE/aT5DB29o2bSCDjczk7V0YNL9SNG2QLuUdtr688DoA2kYqFDdBBY/AcCBmBBjTp9ogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv8iFO19; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769569451; x=1801105451;
  h=date:from:to:cc:subject:message-id;
  bh=U+igsKaGNoTfLJ3DwVZceYtGR8Mem0S9HQeKc1ZCeNI=;
  b=hv8iFO192eA+flT9X2THaJQK0vLkqHVljHlbcEDj2UQfXv5W0jrpW83V
   B0P7DsaylVpakrMN7sDG2wKony5m48iHDTHmxCgoc/nO8eI2MmJksHs9l
   JZpV2Q2nNvEYjhoZbiyB7+SgTJoIyPSIj+LP8Zj63LJz6Awo8ryvLiqrO
   MWA9FvZdOkjQFUvNZL+sEzKGUS0Yg4oQ2Elsy8NBPsdp0ahB/Z4A+hYrD
   jt84elzrbHyqqkXohsWBZD7RP6h9WhkjSc5NqGRD/qeNyc27q5waf8mGL
   uloXFu404ho7A5pmdTTSBT0vg6yPg7Y88ajDF3kc9a6woZWRd2BRd81G2
   w==;
X-CSE-ConnectionGUID: 1R4XXT/CREGegcz13WayHg==
X-CSE-MsgGUID: V76fH1PzRBqAQb+OBehKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70677915"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70677915"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 19:04:11 -0800
X-CSE-ConnectionGUID: RHJbimAnQ/2Q3/SSzxMdQg==
X-CSE-MsgGUID: bt+blyL1SxqBRVYMbROpgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="245760012"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2026 19:04:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvqg-00000000ZAi-1xoj;
	Wed, 28 Jan 2026 03:04:06 +0000
Date: Wed, 28 Jan 2026 11:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 cc75f0256122fb5fd35a621d74d1dbba5091d103
Message-ID: <202601281116.Bxt5y15Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31192-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: E0A019C7DB
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: cc75f0256122fb5fd35a621d74d1dbba5091d103  Merge branch 'devel' into for-next

elapsed time: 991m

configs tested: 274
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260127    gcc-8.5.0
arc                   randconfig-001-20260128    gcc-8.5.0
arc                   randconfig-002-20260127    gcc-11.5.0
arc                   randconfig-002-20260128    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260127    clang-22
arm                   randconfig-001-20260128    gcc-8.5.0
arm                   randconfig-002-20260127    clang-18
arm                   randconfig-002-20260128    gcc-8.5.0
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-003-20260128    gcc-8.5.0
arm                   randconfig-004-20260127    clang-18
arm                   randconfig-004-20260128    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260128    clang-22
arm64                 randconfig-001-20260128    gcc-14.3.0
arm64                 randconfig-002-20260128    gcc-12.5.0
arm64                 randconfig-002-20260128    gcc-14.3.0
arm64                 randconfig-003-20260128    gcc-14.3.0
arm64                 randconfig-004-20260128    gcc-13.4.0
arm64                 randconfig-004-20260128    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260128    gcc-14.3.0
csky                  randconfig-001-20260128    gcc-15.2.0
csky                  randconfig-002-20260128    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260128    clang-22
hexagon               randconfig-002-20260128    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260127    clang-20
i386        buildonly-randconfig-001-20260128    clang-20
i386        buildonly-randconfig-002-20260127    clang-20
i386        buildonly-randconfig-002-20260128    clang-20
i386        buildonly-randconfig-003-20260127    gcc-14
i386        buildonly-randconfig-003-20260128    clang-20
i386        buildonly-randconfig-004-20260127    clang-20
i386        buildonly-randconfig-004-20260128    clang-20
i386        buildonly-randconfig-005-20260127    gcc-14
i386        buildonly-randconfig-005-20260128    clang-20
i386        buildonly-randconfig-006-20260127    gcc-14
i386        buildonly-randconfig-006-20260128    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260127    gcc-14
i386                  randconfig-001-20260128    gcc-14
i386                  randconfig-002-20260127    gcc-14
i386                  randconfig-002-20260128    gcc-14
i386                  randconfig-003-20260127    clang-20
i386                  randconfig-003-20260128    gcc-14
i386                  randconfig-004-20260127    gcc-14
i386                  randconfig-004-20260128    gcc-14
i386                  randconfig-005-20260127    gcc-14
i386                  randconfig-005-20260128    gcc-14
i386                  randconfig-006-20260127    clang-20
i386                  randconfig-006-20260128    gcc-14
i386                  randconfig-007-20260127    clang-20
i386                  randconfig-007-20260128    gcc-14
i386                  randconfig-011-20260127    gcc-14
i386                  randconfig-011-20260128    clang-20
i386                  randconfig-012-20260127    gcc-12
i386                  randconfig-012-20260128    clang-20
i386                  randconfig-013-20260127    gcc-14
i386                  randconfig-013-20260128    clang-20
i386                  randconfig-014-20260127    clang-20
i386                  randconfig-014-20260128    clang-20
i386                  randconfig-015-20260127    clang-20
i386                  randconfig-015-20260128    clang-20
i386                  randconfig-016-20260127    gcc-14
i386                  randconfig-016-20260128    clang-20
i386                  randconfig-017-20260127    gcc-14
i386                  randconfig-017-20260128    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260128    clang-22
loongarch             randconfig-002-20260128    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                        mvme147_defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         cobalt_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                           xway_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260128    clang-22
nios2                 randconfig-002-20260128    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260127    gcc-11.5.0
parisc                randconfig-001-20260128    gcc-11.5.0
parisc                randconfig-002-20260127    gcc-13.4.0
parisc                randconfig-002-20260128    gcc-11.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      chrp32_defconfig    gcc-15.2.0
powerpc                     ep8248e_defconfig    gcc-15.2.0
powerpc                        fsp2_defconfig    gcc-15.2.0
powerpc                          g5_defconfig    gcc-15.2.0
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20260127    gcc-14.3.0
powerpc               randconfig-001-20260128    gcc-11.5.0
powerpc               randconfig-002-20260127    clang-22
powerpc               randconfig-002-20260128    gcc-11.5.0
powerpc                     tqm8555_defconfig    gcc-15.2.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260127    gcc-11.5.0
powerpc64             randconfig-001-20260128    gcc-11.5.0
powerpc64             randconfig-002-20260127    clang-22
powerpc64             randconfig-002-20260128    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260128    gcc-13.4.0
riscv                 randconfig-002-20260128    gcc-13.4.0
riscv                 randconfig-002-20260128    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260128    gcc-13.4.0
s390                  randconfig-002-20260128    gcc-13.4.0
s390                  randconfig-002-20260128    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                               j2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260128    gcc-13.4.0
sh                    randconfig-001-20260128    gcc-15.2.0
sh                    randconfig-002-20260128    gcc-13.4.0
sh                    randconfig-002-20260128    gcc-15.2.0
sh                           se7721_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260128    gcc-11.5.0
sparc                 randconfig-001-20260128    gcc-8.5.0
sparc                 randconfig-002-20260128    gcc-11.5.0
sparc                 randconfig-002-20260128    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260128    gcc-11.5.0
sparc64               randconfig-001-20260128    gcc-12.5.0
sparc64               randconfig-002-20260128    gcc-10.5.0
sparc64               randconfig-002-20260128    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260128    gcc-11.5.0
um                    randconfig-001-20260128    gcc-12
um                    randconfig-002-20260128    clang-22
um                    randconfig-002-20260128    gcc-11.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260128    gcc-14
x86_64      buildonly-randconfig-002-20260128    gcc-14
x86_64      buildonly-randconfig-003-20260128    gcc-14
x86_64      buildonly-randconfig-004-20260128    gcc-12
x86_64      buildonly-randconfig-004-20260128    gcc-14
x86_64      buildonly-randconfig-005-20260128    clang-20
x86_64      buildonly-randconfig-005-20260128    gcc-14
x86_64      buildonly-randconfig-006-20260128    clang-20
x86_64      buildonly-randconfig-006-20260128    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260128    gcc-13
x86_64                randconfig-002-20260128    gcc-13
x86_64                randconfig-003-20260128    gcc-13
x86_64                randconfig-004-20260128    gcc-13
x86_64                randconfig-005-20260128    gcc-13
x86_64                randconfig-006-20260128    gcc-13
x86_64                randconfig-011-20260127    clang-20
x86_64                randconfig-011-20260128    clang-20
x86_64                randconfig-012-20260127    gcc-13
x86_64                randconfig-012-20260128    clang-20
x86_64                randconfig-013-20260127    clang-20
x86_64                randconfig-013-20260128    clang-20
x86_64                randconfig-014-20260127    clang-20
x86_64                randconfig-014-20260128    clang-20
x86_64                randconfig-015-20260127    gcc-13
x86_64                randconfig-015-20260128    clang-20
x86_64                randconfig-016-20260127    clang-20
x86_64                randconfig-016-20260128    clang-20
x86_64                randconfig-071-20260128    clang-20
x86_64                randconfig-072-20260128    clang-20
x86_64                randconfig-073-20260128    clang-20
x86_64                randconfig-074-20260128    clang-20
x86_64                randconfig-075-20260128    clang-20
x86_64                randconfig-076-20260128    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260128    gcc-11.5.0
xtensa                randconfig-001-20260128    gcc-8.5.0
xtensa                randconfig-002-20260128    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

