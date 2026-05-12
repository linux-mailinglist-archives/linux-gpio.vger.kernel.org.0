Return-Path: <linux-gpio+bounces-36631-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH0vHyyPAmryuQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36631-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 04:23:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28189518E99
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 04:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E867301B340
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 02:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2253035AC3E;
	Tue, 12 May 2026 02:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6zVHiJR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653AB35B63B
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 02:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552615; cv=none; b=Q8VuAOERtSsaWgEBeFWglksLQmmhB7NM7ChpfRy4vnI5wVVA2173tXby+4i2ZY7wORuddVq8NIxcIqTsr8g+3KHYAgR1w3gtTrN7xhcZ62oegCoa1/v27UcphA2t2blAEbreq+NDD+5VK4IDJa1YKKQnVCKRSDV0/pDoNyw22IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552615; c=relaxed/simple;
	bh=tVHKs63IaQqwBd+KXfEgvxP2Pc/qCU2d+vMnrnPK9jk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pW533CV3OrudnU/v0CWS/tm56hptQsLiCy8hXWcgEIZHwlAXLtix6F57hmzd6OwFIS8gDoGu3R9GVSDhj8a4dCzbQO16UcPd+e8ORZdJlezkAn73qNUn6F0boZZ4iQGLctP1J8ZiZGSSzHIC+UFVvlzZ6qHIy7MBjLO28Bh0E04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6zVHiJR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778552613; x=1810088613;
  h=date:from:to:cc:subject:message-id;
  bh=tVHKs63IaQqwBd+KXfEgvxP2Pc/qCU2d+vMnrnPK9jk=;
  b=W6zVHiJRaYiWEFSU+moK8LvPHODFTJvsswtP17vr78V1KCdzxhWxf0Sm
   5zohZPNv4LUBhhdYWhRWs/4zszIMclH4O1f2SODi6jWN+pIl9VRiTUocS
   69ZccfllqBaa2ieOVV4A5dLLlIRImCnKvx/rTZeccCdtByA/KC1/NKqb1
   niY5T535pT/IeMZtQCQGSRiVtHM/Q/+vwp27N+fh0qZ5FGIO2vdmachny
   xkopQEaBiWTgc3+cOp9fa2X2twzjuta1lHNVAbCQXcGOHNABLgQ8cnhII
   7OyEH5dNtHO0TAMk32VMt5Q5lcA7xhHvuf+Z7N9JFiP9ZTikD36Lw4yMc
   Q==;
X-CSE-ConnectionGUID: A64AUiYcTIaSLjXWywdwNw==
X-CSE-MsgGUID: EoUkYoHZQOyQvahleFt4Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79436965"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79436965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 19:23:33 -0700
X-CSE-ConnectionGUID: f/D60VjJTlqzEuq2wuOLvw==
X-CSE-MsgGUID: D1OobFsFQ1aEOjS9I4Wbxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="261118089"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2026 19:23:31 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMcmO-000000001TB-3Xq1;
	Tue, 12 May 2026 02:23:28 +0000
Date: Tue, 12 May 2026 10:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/add-gpiod-is-single-ended] BUILD SUCCESS
 b5fafa01bdaade5253bd39317f5455d13e6efc7d
Message-ID: <202605121053.dTDJTfT1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 28189518E99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36631-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/add-gpiod-is-single-ended
branch HEAD: b5fafa01bdaade5253bd39317f5455d13e6efc7d  gpiolib: add gpiod_is_single_ended() helper

elapsed time: 814m

configs tested: 272
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260512    gcc-11.5.0
arc                   randconfig-002-20260512    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    clang-23
arm                   randconfig-001-20260512    gcc-11.5.0
arm                   randconfig-002-20260512    gcc-11.5.0
arm                   randconfig-003-20260512    gcc-11.5.0
arm                   randconfig-004-20260512    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260511    clang-17
arm64                 randconfig-001-20260512    gcc-14.3.0
arm64                 randconfig-002-20260511    clang-17
arm64                 randconfig-002-20260512    gcc-14.3.0
arm64                 randconfig-003-20260511    clang-17
arm64                 randconfig-003-20260512    gcc-14.3.0
arm64                 randconfig-004-20260511    clang-17
arm64                 randconfig-004-20260512    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260511    clang-17
csky                  randconfig-001-20260512    gcc-14.3.0
csky                  randconfig-002-20260511    clang-17
csky                  randconfig-002-20260512    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260511    gcc-8.5.0
hexagon               randconfig-001-20260512    gcc-10.5.0
hexagon               randconfig-002-20260511    gcc-8.5.0
hexagon               randconfig-002-20260512    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260511    gcc-14
i386        buildonly-randconfig-001-20260512    gcc-14
i386        buildonly-randconfig-002-20260511    gcc-14
i386        buildonly-randconfig-002-20260512    gcc-14
i386        buildonly-randconfig-003-20260511    gcc-14
i386        buildonly-randconfig-003-20260512    gcc-14
i386        buildonly-randconfig-004-20260511    gcc-14
i386        buildonly-randconfig-004-20260512    gcc-14
i386        buildonly-randconfig-005-20260511    gcc-14
i386        buildonly-randconfig-005-20260512    gcc-14
i386        buildonly-randconfig-006-20260511    gcc-14
i386        buildonly-randconfig-006-20260512    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260511    gcc-12
i386                  randconfig-001-20260512    gcc-14
i386                  randconfig-002-20260511    gcc-12
i386                  randconfig-002-20260512    gcc-14
i386                  randconfig-003-20260511    gcc-12
i386                  randconfig-003-20260512    gcc-14
i386                  randconfig-004-20260511    gcc-12
i386                  randconfig-004-20260512    gcc-14
i386                  randconfig-005-20260511    gcc-12
i386                  randconfig-005-20260512    gcc-14
i386                  randconfig-006-20260511    gcc-12
i386                  randconfig-006-20260512    gcc-14
i386                  randconfig-007-20260511    gcc-12
i386                  randconfig-007-20260512    gcc-14
i386                  randconfig-011-20260512    clang-20
i386                  randconfig-012-20260512    clang-20
i386                  randconfig-013-20260512    clang-20
i386                  randconfig-014-20260512    clang-20
i386                  randconfig-015-20260512    clang-20
i386                  randconfig-016-20260512    clang-20
i386                  randconfig-017-20260512    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260511    gcc-8.5.0
loongarch             randconfig-001-20260512    gcc-10.5.0
loongarch             randconfig-002-20260511    gcc-8.5.0
loongarch             randconfig-002-20260512    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-17
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260511    gcc-8.5.0
nios2                 randconfig-001-20260512    gcc-10.5.0
nios2                 randconfig-002-20260511    gcc-8.5.0
nios2                 randconfig-002-20260512    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260511    clang-20
parisc                randconfig-001-20260512    gcc-12.5.0
parisc                randconfig-002-20260511    clang-20
parisc                randconfig-002-20260512    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc               randconfig-001-20260511    clang-20
powerpc               randconfig-001-20260512    gcc-12.5.0
powerpc               randconfig-002-20260511    clang-20
powerpc               randconfig-002-20260512    gcc-12.5.0
powerpc64             randconfig-001-20260511    clang-20
powerpc64             randconfig-001-20260512    gcc-12.5.0
powerpc64             randconfig-002-20260511    clang-20
powerpc64             randconfig-002-20260512    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260511    gcc-12.5.0
riscv                 randconfig-001-20260512    gcc-15.2.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260511    gcc-12.5.0
riscv                 randconfig-002-20260512    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260511    gcc-12.5.0
s390                  randconfig-001-20260512    gcc-15.2.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260511    gcc-12.5.0
s390                  randconfig-002-20260512    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260511    gcc-12.5.0
sh                    randconfig-001-20260512    gcc-15.2.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260511    gcc-12.5.0
sh                    randconfig-002-20260512    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260511    gcc-8.5.0
sparc                 randconfig-001-20260512    gcc-13.4.0
sparc                 randconfig-002-20260511    gcc-8.5.0
sparc                 randconfig-002-20260512    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260511    gcc-8.5.0
sparc64               randconfig-001-20260512    gcc-13.4.0
sparc64               randconfig-002-20260511    gcc-8.5.0
sparc64               randconfig-002-20260512    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260511    gcc-8.5.0
um                    randconfig-001-20260512    gcc-13.4.0
um                    randconfig-002-20260511    gcc-8.5.0
um                    randconfig-002-20260512    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260512    gcc-14
x86_64      buildonly-randconfig-002-20260512    gcc-14
x86_64      buildonly-randconfig-003-20260512    gcc-14
x86_64      buildonly-randconfig-004-20260512    gcc-14
x86_64      buildonly-randconfig-005-20260512    gcc-14
x86_64      buildonly-randconfig-006-20260512    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260511    clang-20
x86_64                randconfig-001-20260512    gcc-14
x86_64                randconfig-002-20260511    clang-20
x86_64                randconfig-002-20260512    gcc-14
x86_64                randconfig-003-20260511    clang-20
x86_64                randconfig-003-20260512    gcc-14
x86_64                randconfig-004-20260511    clang-20
x86_64                randconfig-004-20260512    gcc-14
x86_64                randconfig-005-20260511    clang-20
x86_64                randconfig-005-20260512    gcc-14
x86_64                randconfig-006-20260511    clang-20
x86_64                randconfig-006-20260512    gcc-14
x86_64                randconfig-011-20260511    clang-20
x86_64                randconfig-011-20260512    clang-20
x86_64                randconfig-012-20260511    clang-20
x86_64                randconfig-012-20260512    clang-20
x86_64                randconfig-013-20260511    clang-20
x86_64                randconfig-013-20260512    clang-20
x86_64                randconfig-014-20260511    clang-20
x86_64                randconfig-014-20260512    clang-20
x86_64                randconfig-015-20260511    clang-20
x86_64                randconfig-015-20260512    clang-20
x86_64                randconfig-016-20260511    clang-20
x86_64                randconfig-016-20260512    clang-20
x86_64                randconfig-071-20260511    clang-20
x86_64                randconfig-071-20260512    clang-20
x86_64                randconfig-071-20260512    gcc-14
x86_64                randconfig-072-20260511    clang-20
x86_64                randconfig-072-20260512    clang-20
x86_64                randconfig-073-20260511    clang-20
x86_64                randconfig-073-20260512    clang-20
x86_64                randconfig-074-20260511    clang-20
x86_64                randconfig-074-20260512    clang-20
x86_64                randconfig-074-20260512    gcc-14
x86_64                randconfig-075-20260511    clang-20
x86_64                randconfig-075-20260512    clang-20
x86_64                randconfig-076-20260511    clang-20
x86_64                randconfig-076-20260512    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260511    gcc-8.5.0
xtensa                randconfig-001-20260512    gcc-13.4.0
xtensa                randconfig-002-20260511    gcc-8.5.0
xtensa                randconfig-002-20260512    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

