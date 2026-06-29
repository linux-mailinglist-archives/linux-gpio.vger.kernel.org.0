Return-Path: <linux-gpio+bounces-39164-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ANAJLXSQmpUDgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39164-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 22:16:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD36DE932
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 22:16:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="U/XEMnFl";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39164-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39164-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80C02302BEBF
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 20:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B3437D13A;
	Mon, 29 Jun 2026 20:16:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BA1D5CC9
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 20:16:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764210; cv=none; b=auBJoqRNOXAtfUemxNM0gERpEMqCOrX7PIFWgy+O5PmiXsqHNI8TTJ6HiIIxupjYW7AGAxU0kTdX8QGm9nJxZbE/RK6rNkuY4h8jmzeTYnIFSl/tueBhLiFW1I7qhSzQCG+mt66VBQsrQKPLNzwD+XYrTcyjzjSkJhOWyRRCrkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764210; c=relaxed/simple;
	bh=xi4gSuT37g6Y0+MSEPUI3WphaulUwLCiDA+zj2m9oSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tBtoo3NWdJU1w6Nc3WhhroMQGyBCejslI9Yhu2k3CUda7nSS8uN8R1ZjjjP9JPNH+gATEED/xKnWjo1QgEczhbri3naLmJtCHmT1rDj0EY6gOWmXraqzczDhEkPJ/ZLLZrTsuk2SQbxjfbsXXhbiOZ9FUfq8JwphLjXycGcdq2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/XEMnFl; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782764209; x=1814300209;
  h=date:from:to:cc:subject:message-id;
  bh=xi4gSuT37g6Y0+MSEPUI3WphaulUwLCiDA+zj2m9oSk=;
  b=U/XEMnFlv6hySPay1OK/vD+UNWvOISqNpqwGd2FoIxJB9Xret9cm0ryN
   ZbtfuAO6NN9Ino9S1cSm6DmWoHAlEQt2/mY44y6Gm9WMQZEGz7ZXE/AUh
   NqJVNO1DH/Vxy++CSzKCLSsEddhkmr8bHLNCfG6EWXbJDxYdScHkQgmCU
   mIgNzlQyNiai4rJebln+dmfhbSXFw8lsQXrMAam2yEc46XR3vssq4f1LQ
   XEzTOTxgTqSYpj/ZS0j5WGcjz1PUhyQlElksBJKiDip7A6rwG9hgNCxr6
   HYkNiM0nGE6GcpH1hgpIU5jqmMdSswZsVWKs4GnYGHjnLTLQGeHzhs+Rc
   w==;
X-CSE-ConnectionGUID: cV80ui3BTae67xomYMi3kw==
X-CSE-MsgGUID: V3TeUsoNRpSsvOlI/bplSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83498158"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83498158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:16:49 -0700
X-CSE-ConnectionGUID: bT/E8hJWQxabY2kaSaDc6w==
X-CSE-MsgGUID: KhEcGFmeSXOKlv3glhKZgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="252199247"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Jun 2026 13:16:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weIPN-000000007j3-00C5;
	Mon, 29 Jun 2026 20:16:45 +0000
Date: Tue, 30 Jun 2026 04:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 2ed2e359dea752e7758d29a423033031a0b96584
Message-ID: <202606300419.c7yXA474-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-39164-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7FD36DE932

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 2ed2e359dea752e7758d29a423033031a0b96584  Merge tag 'v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

elapsed time: 751m

configs tested: 319
configs skipped: 6

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
arc                   randconfig-001-20260629    clang-17
arc                   randconfig-001-20260629    gcc-16.1.0
arc                   randconfig-001-20260630    clang-23
arc                   randconfig-002-20260629    clang-17
arc                   randconfig-002-20260629    gcc-8.5.0
arc                   randconfig-002-20260630    clang-23
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260629    clang-17
arm                   randconfig-001-20260629    gcc-10.5.0
arm                   randconfig-001-20260630    clang-23
arm                   randconfig-002-20260629    clang-17
arm                   randconfig-002-20260630    clang-23
arm                   randconfig-003-20260629    clang-17
arm                   randconfig-003-20260630    clang-23
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
i386                  randconfig-015-20260629    gcc-14
i386                  randconfig-015-20260630    gcc-12
i386                  randconfig-016-20260629    gcc-14
i386                  randconfig-016-20260630    gcc-12
i386                  randconfig-017-20260629    gcc-14
i386                  randconfig-017-20260630    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
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
nios2                            allmodconfig    gcc-11.5.0
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
parisc                randconfig-001-20260629    gcc-9.5.0
parisc                randconfig-001-20260630    clang-22
parisc                randconfig-002-20260629    gcc-9.5.0
parisc                randconfig-002-20260630    clang-22
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260629    gcc-9.5.0
powerpc               randconfig-001-20260630    clang-22
powerpc               randconfig-002-20260629    gcc-9.5.0
powerpc               randconfig-002-20260630    clang-22
powerpc                        warp_defconfig    gcc-16.1.0
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260629    gcc-9.5.0
powerpc64             randconfig-001-20260630    clang-22
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
x86_64                randconfig-002-20260629    gcc-14
x86_64                randconfig-002-20260630    gcc-14
x86_64                randconfig-003-20260629    gcc-14
x86_64                randconfig-003-20260630    gcc-14
x86_64                randconfig-004-20260629    gcc-14
x86_64                randconfig-004-20260630    gcc-14
x86_64                randconfig-005-20260629    gcc-14
x86_64                randconfig-005-20260630    gcc-14
x86_64                randconfig-006-20260629    gcc-14
x86_64                randconfig-006-20260630    gcc-14
x86_64                randconfig-011-20260629    gcc-13
x86_64                randconfig-011-20260630    gcc-14
x86_64                randconfig-012-20260629    gcc-13
x86_64                randconfig-012-20260630    gcc-14
x86_64                randconfig-013-20260629    gcc-13
x86_64                randconfig-013-20260630    gcc-14
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

