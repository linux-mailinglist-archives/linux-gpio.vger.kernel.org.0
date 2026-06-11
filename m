Return-Path: <linux-gpio+bounces-38359-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mrs9OZQzK2qm4AMAu9opvQ
	(envelope-from <linux-gpio+bounces-38359-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 00:15:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BCC67591D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 00:15:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=L849vjOt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38359-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38359-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDAF8337F701
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 22:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C7F386576;
	Thu, 11 Jun 2026 22:14:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D9438F649
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 22:14:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216095; cv=none; b=ZcMe6oUGQHV1jZ/17XLDvm+bMG3yedG8HEPeqvSo0Ic5rdllrKnLiKFGd9DJPMhqL2aHADiYC1CrRSkmysS25VXxlcBF2ajflWQ8wO1ipYu/gmQpX16iQdBxPxUD1bMaGj6KvkGvev7HsWbgiWHmH5cX1uSFcu990/bManOMRFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216095; c=relaxed/simple;
	bh=ooSc9EDb78igR6dQ7HP5Z2r9zDohBWSWYc2dSOz2CeY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0HIBv821v+lPIWmU+3DHhLQuCZKyyHX6n7pt1d48VEOcdMifudluynheow6OiLNe3JUP+xIl/dS2iljnmy/Q/0tt+IjQdc9jHMQMU4WVJEG4lUegvHspQ7ICz23G/HLESYrydD/iiJvfJEJsNtaNrfK5+oM1StOMlFd+2ZFvOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L849vjOt; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781216093; x=1812752093;
  h=date:from:to:cc:subject:message-id;
  bh=ooSc9EDb78igR6dQ7HP5Z2r9zDohBWSWYc2dSOz2CeY=;
  b=L849vjOtbJByEaZeoXXmn5T5QCutQ6wEZxiaJ7qnwZRujWb3i+rL9LRt
   ++U5a0Q0fTsi4JDX5GzIR/t3daBx0vqG5dHyHCTPGBHJH23QsbJWEpExi
   0mZHpfyAp7AHYOVwc+VkuEzGypEcF5JiUH7nlmJA7FE+bOu3qMzceeGU7
   J5+VZXaz68va40I/ThIRY2JWTyEZWdSDbLOdWsiX4yOpM9KRERtMLY5cE
   7bKT2fOLEqYFOt9MTM8G3r725KMJtqKOKt2Vm3elEg5LndEUAsZ4gwlhX
   9OJ/++psFSkKPR9yhsVQABgJyVIN7MYxjeUNR8bMyfS3ukiaKMXPcDquD
   w==;
X-CSE-ConnectionGUID: 3xDyG88ZTAGCgY/tYBwrpg==
X-CSE-MsgGUID: 7cI2Jk8FQs2wT2f/0LPe/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84613921"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="84613921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 15:14:52 -0700
X-CSE-ConnectionGUID: edVWDtKKSDmygJ/DNktm6A==
X-CSE-MsgGUID: TQt9ATt1Q3Op/Fwilm7ltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246705745"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2026 15:14:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXnfk-00000000NvX-3mdB;
	Thu, 11 Jun 2026 22:14:48 +0000
Date: Fri, 12 Jun 2026 06:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 f953585dafd71ecb0897f9def9c0a3702afc1bf8
Message-ID: <202606120644.sb64wHxp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38359-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1BCC67591D

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: f953585dafd71ecb0897f9def9c0a3702afc1bf8  gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h>

elapsed time: 823m

configs tested: 265
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-13.4.0
arc                            randconfig-001    gcc-14.3.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                   randconfig-001-20260612    gcc-13.4.0
arc                            randconfig-002    gcc-13.4.0
arc                            randconfig-002    gcc-14.3.0
arc                   randconfig-002-20260611    gcc-14.3.0
arc                   randconfig-002-20260612    gcc-13.4.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                          pxa910_defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-13.4.0
arm                            randconfig-001    gcc-14.3.0
arm                   randconfig-001-20260611    gcc-14.3.0
arm                   randconfig-001-20260612    gcc-13.4.0
arm                            randconfig-002    gcc-13.4.0
arm                            randconfig-002    gcc-14.3.0
arm                   randconfig-002-20260611    gcc-14.3.0
arm                   randconfig-002-20260612    gcc-13.4.0
arm                            randconfig-003    gcc-13.4.0
arm                            randconfig-003    gcc-14.3.0
arm                   randconfig-003-20260611    gcc-14.3.0
arm                   randconfig-003-20260612    gcc-13.4.0
arm                            randconfig-004    gcc-13.4.0
arm                            randconfig-004    gcc-14.3.0
arm                   randconfig-004-20260611    gcc-14.3.0
arm                   randconfig-004-20260612    gcc-13.4.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260611    gcc-14.3.0
arm64                 randconfig-001-20260612    gcc-13.4.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260611    gcc-14.3.0
arm64                 randconfig-002-20260612    gcc-13.4.0
arm64                          randconfig-003    gcc-14.3.0
arm64                 randconfig-003-20260611    gcc-14.3.0
arm64                 randconfig-003-20260612    gcc-13.4.0
arm64                          randconfig-004    gcc-14.3.0
arm64                 randconfig-004-20260611    gcc-14.3.0
arm64                 randconfig-004-20260612    gcc-13.4.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-14.3.0
csky                  randconfig-001-20260611    gcc-14.3.0
csky                  randconfig-001-20260612    gcc-13.4.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260611    gcc-14.3.0
csky                  randconfig-002-20260612    gcc-13.4.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260611    clang-16
hexagon               randconfig-001-20260611    clang-17
hexagon               randconfig-001-20260612    clang-23
hexagon               randconfig-002-20260611    clang-16
hexagon               randconfig-002-20260611    clang-17
hexagon               randconfig-002-20260612    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260611    clang-22
i386        buildonly-randconfig-001-20260612    gcc-14
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260611    clang-22
i386        buildonly-randconfig-002-20260612    gcc-14
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260611    clang-22
i386        buildonly-randconfig-003-20260612    gcc-14
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260611    clang-22
i386        buildonly-randconfig-004-20260612    gcc-14
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260611    clang-22
i386        buildonly-randconfig-005-20260612    gcc-14
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260611    clang-22
i386        buildonly-randconfig-006-20260612    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260611    gcc-14
i386                  randconfig-002-20260611    gcc-14
i386                  randconfig-003-20260611    gcc-14
i386                  randconfig-004-20260611    gcc-14
i386                  randconfig-005-20260611    gcc-14
i386                  randconfig-006-20260611    gcc-14
i386                  randconfig-007-20260611    gcc-14
i386                  randconfig-011-20260611    gcc-14
i386                  randconfig-012-20260611    gcc-14
i386                  randconfig-013-20260611    gcc-14
i386                  randconfig-014-20260611    gcc-14
i386                  randconfig-015-20260611    gcc-14
i386                  randconfig-016-20260611    gcc-14
i386                  randconfig-017-20260611    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260611    clang-16
loongarch             randconfig-001-20260611    clang-17
loongarch             randconfig-001-20260612    clang-23
loongarch             randconfig-002-20260611    clang-16
loongarch             randconfig-002-20260611    clang-17
loongarch             randconfig-002-20260612    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                        m5272c3_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260611    clang-16
nios2                 randconfig-001-20260611    clang-17
nios2                 randconfig-001-20260612    clang-23
nios2                 randconfig-002-20260611    clang-16
nios2                 randconfig-002-20260611    clang-17
nios2                 randconfig-002-20260612    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    clang-23
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260611    gcc-13.4.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260611    gcc-13.4.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260611    gcc-13.4.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260611    gcc-13.4.0
powerpc                     tqm8540_defconfig    gcc-16.1.0
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260611    gcc-13.4.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260611    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260611    gcc-12.5.0
riscv                 randconfig-001-20260612    gcc-11.5.0
riscv                 randconfig-002-20260611    gcc-12.5.0
riscv                 randconfig-002-20260612    gcc-11.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260611    gcc-12.5.0
s390                  randconfig-001-20260612    gcc-11.5.0
s390                  randconfig-002-20260611    gcc-12.5.0
s390                  randconfig-002-20260612    gcc-11.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    clang-23
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260611    gcc-12.5.0
sh                    randconfig-001-20260612    gcc-11.5.0
sh                    randconfig-002-20260611    gcc-12.5.0
sh                    randconfig-002-20260612    gcc-11.5.0
sh                             shx3_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260611    gcc-15.2.0
sparc                 randconfig-002-20260611    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260611    gcc-15.2.0
sparc64               randconfig-002-20260611    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260611    gcc-15.2.0
um                    randconfig-002-20260611    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260611    gcc-14
x86_64      buildonly-randconfig-002-20260611    gcc-14
x86_64      buildonly-randconfig-003-20260611    gcc-14
x86_64      buildonly-randconfig-004-20260611    gcc-14
x86_64      buildonly-randconfig-005-20260611    gcc-14
x86_64      buildonly-randconfig-006-20260611    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260611    gcc-14
x86_64                randconfig-002-20260611    gcc-14
x86_64                randconfig-003-20260611    gcc-14
x86_64                randconfig-004-20260611    gcc-14
x86_64                randconfig-005-20260611    gcc-14
x86_64                randconfig-006-20260611    gcc-14
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260611    clang-22
x86_64                randconfig-011-20260611    gcc-14
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260611    clang-22
x86_64                randconfig-012-20260611    gcc-14
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260611    clang-22
x86_64                randconfig-013-20260611    gcc-14
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260611    clang-22
x86_64                randconfig-014-20260611    gcc-14
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260611    clang-22
x86_64                randconfig-015-20260611    gcc-14
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260611    clang-22
x86_64                randconfig-016-20260611    gcc-14
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260611    clang-22
x86_64                randconfig-071-20260611    gcc-13
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260611    clang-22
x86_64                randconfig-072-20260611    gcc-13
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260611    clang-22
x86_64                randconfig-073-20260611    gcc-13
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260611    clang-22
x86_64                randconfig-074-20260611    gcc-13
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260611    clang-22
x86_64                randconfig-075-20260611    gcc-13
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260611    clang-22
x86_64                randconfig-076-20260611    gcc-13
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260611    gcc-15.2.0
xtensa                randconfig-002-20260611    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

