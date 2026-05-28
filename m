Return-Path: <linux-gpio+bounces-37608-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GMFO+zNF2rsRQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37608-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 07:09:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537565ECA69
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 07:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B6E3089767
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 05:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0C12BEFEF;
	Thu, 28 May 2026 05:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7ab3Qtp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B5343888
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779944938; cv=none; b=tZFNorlNPVcWG8BZRmR2O2Cnju7HcKdcZETSGK89ZX8KE/Ogl0exCeRha+roZSsYzIU840Kr9cD/AN/CtQwi6NVyZawgoitnoASlF0hjDwr9Q3r0ziWkdI18zed692GrmRe/AL/gAWNKUGzk5l72N+bJCAcU9Bb06EteFLQujvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779944938; c=relaxed/simple;
	bh=J6P6mVm+mTNl2tFjqfNxUz9kVhlEAm6Y78c1xg/rWyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sfMNQzSxEKiEdDdvO3VmUa/iXMoAc5PVdiWiEem0MKDrIeEshhE5DMk+UXS17gBmzNlSpMOHaRGw6pORvxImbQx5rA3YF8ZRu7Lf5B+Olnur2ZL4Yh1v9gKj4g2km1eK0GO5LcwF2WWsCzH2sW5kFPS6RFBt5YV+ruBc9jAOpw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7ab3Qtp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779944936; x=1811480936;
  h=date:from:to:cc:subject:message-id;
  bh=J6P6mVm+mTNl2tFjqfNxUz9kVhlEAm6Y78c1xg/rWyI=;
  b=S7ab3Qtp5qMTAKW7fs2jUYjjhWm9FCLvwubeSqvq6/3Kr5EVyLMaj0n2
   Ojg/28+r4NmO757Vnf3b/OtgL0Iqpg8xWNKoLeyXyUkYt1/Ru/HH8F8Vj
   ZPdwBWZW2VW56red0tBN2QOhY1pCqnMbk37aPdv0+sFgHt1YLkibijPVV
   O9cNPhbcHqB6ooy45USGJB2sF4laqS5vCVJEAOY/w20GW/KnSpPbXnF3P
   K86qREGT9UXSUGLIQtOfO7MjyWNyZZE87v3vPxTvGbo3G67OY7aPri8il
   MehDsk7bQBs1b4vH8/IYZ/F3pYLhTJGsuICyx1S0syiCefBhtS1er+yFT
   g==;
X-CSE-ConnectionGUID: F+0dVqy7RDODQNhqS/j5Qw==
X-CSE-MsgGUID: GUGEggn4T4W7A9/qYC6o9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98358485"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="98358485"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 22:08:55 -0700
X-CSE-ConnectionGUID: 3Jq/gdMBSKi+HkO+SxgkKg==
X-CSE-MsgGUID: OTanOs6ZR8eM7sTR1rhkEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="280561572"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 May 2026 22:08:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSSzC-000000005YY-2Oys;
	Thu, 28 May 2026 05:08:50 +0000
Date: Thu, 28 May 2026 13:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 61442e46fb9de57718a36f54c9ce1ce66ff7750b
Message-ID: <202605281338.yTyGbQ7D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37608-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 537565ECA69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 61442e46fb9de57718a36f54c9ce1ce66ff7750b  ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

elapsed time: 783m

configs tested: 164
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260528    clang-23
arc                   randconfig-002-20260528    clang-23
arc                    vdk_hs38_smp_defconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260528    clang-23
arm                   randconfig-002-20260528    clang-23
arm                   randconfig-003-20260528    clang-23
arm                   randconfig-004-20260528    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260528    gcc-15.2.0
arm64                 randconfig-002-20260528    gcc-15.2.0
arm64                 randconfig-003-20260528    gcc-15.2.0
arm64                 randconfig-004-20260528    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260528    gcc-15.2.0
csky                  randconfig-002-20260528    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260528    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260528    clang-20
i386        buildonly-randconfig-002-20260528    clang-20
i386        buildonly-randconfig-003-20260528    clang-20
i386        buildonly-randconfig-004-20260528    clang-20
i386        buildonly-randconfig-005-20260528    clang-20
i386        buildonly-randconfig-006-20260528    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260528    gcc-14
i386                  randconfig-002-20260528    gcc-14
i386                  randconfig-003-20260528    gcc-14
i386                  randconfig-004-20260528    gcc-14
i386                  randconfig-005-20260528    gcc-14
i386                  randconfig-006-20260528    gcc-14
i386                  randconfig-007-20260528    gcc-14
i386                  randconfig-011-20260528    clang-20
i386                  randconfig-012-20260528    clang-20
i386                  randconfig-013-20260528    clang-20
i386                  randconfig-014-20260528    clang-20
i386                  randconfig-015-20260528    clang-20
i386                  randconfig-016-20260528    clang-20
i386                  randconfig-017-20260528    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-002-20260528    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260528    gcc-11.5.0
nios2                 randconfig-002-20260528    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260528    clang-23
parisc                randconfig-002-20260528    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-002-20260528    clang-23
powerpc64             randconfig-001-20260528    clang-23
powerpc64             randconfig-002-20260528    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260528    gcc-13.4.0
riscv                 randconfig-002-20260528    gcc-13.4.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260528    gcc-13.4.0
s390                  randconfig-002-20260528    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260528    gcc-13.4.0
sh                    randconfig-002-20260528    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260528    gcc-15.2.0
sparc                 randconfig-002-20260528    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260528    gcc-15.2.0
sparc64               randconfig-002-20260528    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260528    gcc-15.2.0
um                    randconfig-002-20260528    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260528    gcc-14
x86_64      buildonly-randconfig-002-20260528    gcc-14
x86_64      buildonly-randconfig-003-20260528    gcc-14
x86_64      buildonly-randconfig-004-20260528    gcc-14
x86_64      buildonly-randconfig-005-20260528    gcc-14
x86_64      buildonly-randconfig-006-20260528    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260528    gcc-14
x86_64                randconfig-002-20260528    gcc-14
x86_64                randconfig-003-20260528    gcc-14
x86_64                randconfig-004-20260528    gcc-14
x86_64                randconfig-005-20260528    gcc-14
x86_64                randconfig-006-20260528    gcc-14
x86_64                randconfig-011-20260528    gcc-14
x86_64                randconfig-012-20260528    gcc-14
x86_64                randconfig-013-20260528    gcc-14
x86_64                randconfig-014-20260528    gcc-14
x86_64                randconfig-015-20260528    gcc-14
x86_64                randconfig-016-20260528    gcc-14
x86_64                randconfig-071-20260528    gcc-14
x86_64                randconfig-072-20260528    gcc-14
x86_64                randconfig-073-20260528    gcc-14
x86_64                randconfig-074-20260528    gcc-14
x86_64                randconfig-075-20260528    gcc-14
x86_64                randconfig-076-20260528    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260528    gcc-15.2.0
xtensa                randconfig-002-20260528    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

