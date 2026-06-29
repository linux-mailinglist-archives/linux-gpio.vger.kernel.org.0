Return-Path: <linux-gpio+bounces-39165-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEfsEC3bQmpbFAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39165-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 22:53:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8035F6DEBA3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 22:53:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="eeiLQeg/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39165-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39165-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E9F13023DC3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 20:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30081388369;
	Mon, 29 Jun 2026 20:52:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7F348C4B
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 20:52:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766374; cv=none; b=URqa2TZfjNI2AtrU3EpdbPobrzxdtVqng/n2xOpxRwbALjYQNyIKVTYZt4rC35TY44HsP+Bygpw19Dw439dXmzEIIlbIJMh7no3ZE6zbsp5Y5U3AqFxoV4w2Hep9aXFTpm0k0iO1OzOFbA4qAJr3NRo1hvlRlMq5AR573uixn74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766374; c=relaxed/simple;
	bh=bYvkAdG5ast9Dv1MmPikIt9Y44picjaZRppE27yPQ18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pCWodiyocNwW6IEK1pvQHTbX/CmBSrBTmKow+8BajqxS2qvK0oevOPfU86MJEVvmmRips3HccApd3kv8sSd3fFRGpkiM3lxamJuUDwR18S3ihWa4u8716/S3i2ZEK42rpANreWN7QSrfJ0ORyVdtHGIqzM5icOvWT3rin8yhPlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeiLQeg/; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782766373; x=1814302373;
  h=date:from:to:cc:subject:message-id;
  bh=bYvkAdG5ast9Dv1MmPikIt9Y44picjaZRppE27yPQ18=;
  b=eeiLQeg/c4WhEv9Mx8Hp42Ntz5Jn4+6+3WqtZ+6LnkXbp1ScRGzahvPh
   r38M3hV990gIn3kHYjyQMgg38AUPXACHZZ9x+SlofRHfKNzB9DJLmffxh
   UlWah/gJOkctVqPo5w/l1zWEeNRJ+HJUM/OhmYIhaKsM8a0aAXexaG2eR
   xRFNqJnWx4zuFy6hJUOnd1vcPEmfS3DpwYlUpYKwPq8ayLFDkJv4tXh/Q
   WiuyuuMz/9tR8eGzxv6O9LVPE1jzpuvLKHRBc6eZEh6B5MbgYKAu6M3x8
   rj63p8BMvaPaseoKDDNeX+4eZN9LnPxnIV+tqwxAi6dl+sR9tO4/ZLxFW
   g==;
X-CSE-ConnectionGUID: roHV9BhET5SqBZCMAab3FA==
X-CSE-MsgGUID: 1g0jJoWSQrKZGf7pS4NzAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="101017668"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="101017668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:52:52 -0700
X-CSE-ConnectionGUID: 4GZPJsfITpeaSrEb1Kp3NQ==
X-CSE-MsgGUID: mL8u71PFQh6Xg7TKPxkYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="251008897"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Jun 2026 13:52:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weIyF-000000007kP-30F7;
	Mon, 29 Jun 2026 20:52:47 +0000
Date: Tue, 30 Jun 2026 04:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 2f3096466fce5aa6de51fa24fb8cbfe71e135804
Message-ID: <202606300408.c1XLoU6U-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39165-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8035F6DEBA3

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: 2f3096466fce5aa6de51fa24fb8cbfe71e135804  Merge tag 'v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into pwrseq/for-next

elapsed time: 787m

configs tested: 348
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260629    clang-17
arc                   randconfig-001-20260629    gcc-16.1.0
arc                   randconfig-001-20260630    clang-23
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260629    clang-17
arc                   randconfig-002-20260629    gcc-8.5.0
arc                   randconfig-002-20260630    clang-23
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260629    clang-17
arm                   randconfig-001-20260629    gcc-10.5.0
arm                   randconfig-001-20260630    clang-23
arm                            randconfig-002    gcc-15.2.0
arm                   randconfig-002-20260629    clang-17
arm                   randconfig-002-20260630    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260629    clang-17
arm                   randconfig-003-20260630    clang-23
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260629    clang-17
arm                   randconfig-004-20260629    gcc-16.1.0
arm                   randconfig-004-20260630    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260629    gcc-16.1.0
arm64                 randconfig-001-20260630    clang-23
arm64                 randconfig-002-20260629    clang-22
arm64                 randconfig-002-20260629    gcc-16.1.0
arm64                 randconfig-002-20260630    clang-23
arm64                 randconfig-003-20260629    clang-23
arm64                 randconfig-003-20260629    gcc-16.1.0
arm64                 randconfig-003-20260630    clang-23
arm64                 randconfig-004-20260629    clang-20
arm64                 randconfig-004-20260629    gcc-16.1.0
arm64                 randconfig-004-20260630    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260629    gcc-10.5.0
csky                  randconfig-001-20260629    gcc-16.1.0
csky                  randconfig-001-20260630    clang-23
csky                  randconfig-002-20260629    gcc-12.5.0
csky                  randconfig-002-20260629    gcc-16.1.0
csky                  randconfig-002-20260630    clang-23
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260629    clang-22
hexagon               randconfig-001-20260629    gcc-11.5.0
hexagon               randconfig-001-20260630    clang-18
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260629    clang-23
hexagon               randconfig-002-20260629    gcc-11.5.0
hexagon               randconfig-002-20260630    clang-18
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260629    clang-22
i386        buildonly-randconfig-001-20260629    gcc-14
i386        buildonly-randconfig-001-20260630    clang-22
i386        buildonly-randconfig-002-20260629    gcc-13
i386        buildonly-randconfig-002-20260629    gcc-14
i386        buildonly-randconfig-002-20260630    clang-22
i386        buildonly-randconfig-003-20260629    gcc-14
i386        buildonly-randconfig-003-20260630    clang-22
i386        buildonly-randconfig-004-20260629    clang-22
i386        buildonly-randconfig-004-20260629    gcc-14
i386        buildonly-randconfig-004-20260630    clang-22
i386        buildonly-randconfig-005-20260629    gcc-14
i386        buildonly-randconfig-005-20260630    clang-22
i386        buildonly-randconfig-006-20260629    clang-22
i386        buildonly-randconfig-006-20260629    gcc-14
i386        buildonly-randconfig-006-20260630    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260629    clang-22
i386                  randconfig-001-20260630    clang-22
i386                  randconfig-002-20260629    clang-22
i386                  randconfig-002-20260630    clang-22
i386                  randconfig-003-20260629    clang-22
i386                  randconfig-003-20260630    clang-22
i386                  randconfig-004-20260629    clang-22
i386                  randconfig-004-20260630    clang-22
i386                  randconfig-005-20260629    clang-22
i386                  randconfig-005-20260630    clang-22
i386                  randconfig-006-20260629    clang-22
i386                  randconfig-006-20260630    clang-22
i386                  randconfig-007-20260629    clang-22
i386                  randconfig-007-20260630    clang-22
i386                  randconfig-011-20260629    gcc-14
i386                  randconfig-011-20260630    gcc-12
i386                  randconfig-012-20260629    gcc-14
i386                  randconfig-012-20260630    gcc-12
i386                  randconfig-013-20260629    gcc-14
i386                  randconfig-013-20260630    gcc-12
i386                  randconfig-014-20260629    gcc-14
i386                  randconfig-014-20260630    gcc-12
i386                  randconfig-015-20260629    clang-22
i386                  randconfig-015-20260629    gcc-14
i386                  randconfig-015-20260630    gcc-12
i386                  randconfig-016-20260629    clang-22
i386                  randconfig-016-20260629    gcc-14
i386                  randconfig-016-20260630    gcc-12
i386                  randconfig-017-20260629    clang-22
i386                  randconfig-017-20260629    gcc-14
i386                  randconfig-017-20260630    gcc-12
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260629    gcc-11.5.0
loongarch             randconfig-001-20260629    gcc-12.5.0
loongarch             randconfig-001-20260630    clang-18
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260629    clang-23
loongarch             randconfig-002-20260629    gcc-11.5.0
loongarch             randconfig-002-20260630    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        bcm47xx_defconfig    clang-23
mips                          malta_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260629    gcc-11.5.0
nios2                 randconfig-001-20260630    clang-18
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260629    gcc-11.5.0
nios2                 randconfig-002-20260629    gcc-8.5.0
nios2                 randconfig-002-20260630    clang-18
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260629    gcc-9.5.0
parisc                randconfig-001-20260630    clang-22
parisc                         randconfig-002    gcc-12.5.0
parisc                randconfig-002-20260629    gcc-11.5.0
parisc                randconfig-002-20260629    gcc-9.5.0
parisc                randconfig-002-20260630    clang-22
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260629    gcc-10.5.0
powerpc               randconfig-001-20260629    gcc-9.5.0
powerpc               randconfig-001-20260630    clang-22
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260629    gcc-8.5.0
powerpc               randconfig-002-20260629    gcc-9.5.0
powerpc               randconfig-002-20260630    clang-22
powerpc                        warp_defconfig    gcc-16.1.0
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260629    gcc-8.5.0
powerpc64             randconfig-001-20260629    gcc-9.5.0
powerpc64             randconfig-001-20260630    clang-22
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260629    gcc-8.5.0
powerpc64             randconfig-002-20260629    gcc-9.5.0
powerpc64             randconfig-002-20260630    clang-22
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-17
riscv                 randconfig-001-20260629    clang-17
riscv                 randconfig-001-20260629    gcc-12.5.0
riscv                 randconfig-001-20260630    gcc-9.5.0
riscv                          randconfig-002    clang-17
riscv                 randconfig-002-20260629    clang-17
riscv                 randconfig-002-20260630    gcc-9.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-17
s390                  randconfig-001-20260629    clang-17
s390                  randconfig-001-20260629    gcc-8.5.0
s390                  randconfig-001-20260630    gcc-9.5.0
s390                           randconfig-002    clang-17
s390                  randconfig-002-20260629    clang-17
s390                  randconfig-002-20260629    clang-23
s390                  randconfig-002-20260630    gcc-9.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-17
sh                    randconfig-001-20260629    clang-17
sh                    randconfig-001-20260629    gcc-10.5.0
sh                    randconfig-001-20260630    gcc-9.5.0
sh                             randconfig-002    clang-17
sh                    randconfig-002-20260629    clang-17
sh                    randconfig-002-20260629    gcc-12.5.0
sh                    randconfig-002-20260630    gcc-9.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260629    gcc-15.2.0
sparc                 randconfig-001-20260630    clang-17
sparc                 randconfig-002-20260629    gcc-15.2.0
sparc                 randconfig-002-20260630    clang-17
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260629    gcc-15.2.0
sparc64               randconfig-001-20260630    clang-17
sparc64               randconfig-002-20260629    gcc-15.2.0
sparc64               randconfig-002-20260630    clang-17
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260629    gcc-15.2.0
um                    randconfig-001-20260630    clang-17
um                    randconfig-002-20260629    gcc-15.2.0
um                    randconfig-002-20260630    clang-17
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260629    clang-22
x86_64      buildonly-randconfig-001-20260630    clang-22
x86_64      buildonly-randconfig-002-20260629    clang-22
x86_64      buildonly-randconfig-002-20260629    gcc-14
x86_64      buildonly-randconfig-002-20260630    clang-22
x86_64      buildonly-randconfig-003-20260629    clang-22
x86_64      buildonly-randconfig-003-20260629    gcc-14
x86_64      buildonly-randconfig-003-20260630    clang-22
x86_64      buildonly-randconfig-004-20260629    clang-22
x86_64      buildonly-randconfig-004-20260630    clang-22
x86_64      buildonly-randconfig-005-20260629    clang-22
x86_64      buildonly-randconfig-005-20260630    clang-22
x86_64      buildonly-randconfig-006-20260629    clang-22
x86_64      buildonly-randconfig-006-20260630    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260629    gcc-14
x86_64                randconfig-001-20260630    gcc-14
x86_64                randconfig-002-20260629    clang-22
x86_64                randconfig-002-20260629    gcc-14
x86_64                randconfig-002-20260630    gcc-14
x86_64                randconfig-003-20260629    gcc-14
x86_64                randconfig-003-20260630    gcc-14
x86_64                randconfig-004-20260629    gcc-14
x86_64                randconfig-004-20260630    gcc-14
x86_64                randconfig-005-20260629    clang-22
x86_64                randconfig-005-20260629    gcc-14
x86_64                randconfig-005-20260630    gcc-14
x86_64                randconfig-006-20260629    gcc-14
x86_64                randconfig-006-20260630    gcc-14
x86_64                randconfig-011-20260629    clang-22
x86_64                randconfig-011-20260629    gcc-13
x86_64                randconfig-011-20260630    gcc-14
x86_64                randconfig-012-20260629    clang-22
x86_64                randconfig-012-20260629    gcc-13
x86_64                randconfig-012-20260630    gcc-14
x86_64                randconfig-013-20260629    clang-22
x86_64                randconfig-013-20260629    gcc-13
x86_64                randconfig-013-20260630    gcc-14
x86_64                randconfig-014-20260629    clang-22
x86_64                randconfig-014-20260629    gcc-13
x86_64                randconfig-014-20260630    gcc-14
x86_64                randconfig-015-20260629    gcc-13
x86_64                randconfig-015-20260630    gcc-14
x86_64                randconfig-016-20260629    gcc-13
x86_64                randconfig-016-20260629    gcc-14
x86_64                randconfig-016-20260630    gcc-14
x86_64                randconfig-071-20260629    clang-22
x86_64                randconfig-071-20260630    clang-22
x86_64                randconfig-072-20260629    clang-22
x86_64                randconfig-072-20260630    clang-22
x86_64                randconfig-073-20260629    clang-22
x86_64                randconfig-073-20260629    gcc-14
x86_64                randconfig-073-20260630    clang-22
x86_64                randconfig-074-20260629    clang-22
x86_64                randconfig-074-20260630    clang-22
x86_64                randconfig-075-20260629    clang-22
x86_64                randconfig-075-20260629    gcc-14
x86_64                randconfig-075-20260630    clang-22
x86_64                randconfig-076-20260629    clang-22
x86_64                randconfig-076-20260630    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260629    gcc-15.2.0
xtensa                randconfig-001-20260630    clang-17
xtensa                randconfig-002-20260629    gcc-15.2.0
xtensa                randconfig-002-20260630    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

