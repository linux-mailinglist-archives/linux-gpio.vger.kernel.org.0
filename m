Return-Path: <linux-gpio+bounces-34979-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COraDz6J2GkIewgAu9opvQ
	(envelope-from <linux-gpio+bounces-34979-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:23:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C913D247A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434E4301DE2E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 05:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72238331A56;
	Fri, 10 Apr 2026 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEtMJ78S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A753264FF
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 05:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798587; cv=none; b=ZEGniU+A6RNv+JE5wBSC1MZnPQqBg7Ua4m4zqiwGUSSvl87tFM5q9d+KVNMgh/qTQgP3L/wQYJ0CxN/4rjANh+uX9UfQtBRODPXbOr5aEoxEdm6KZJrjcMGG98jDspuSMYaO08cfdDTP3oPG64SV5lBL4C4vY3ePqj1uQxW2jrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798587; c=relaxed/simple;
	bh=K8I35ARzaHitOYV07gJPYj7u7s7aGFytI4l301K5TVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZlRl4rOKVC5ObyOMdN78cnIVfK4HmSqR3ynT6VHV7uE7gdqz6l5pLrbKt5yq5OWu8hf6/K4wvbRRhlu9k3Ioi1e1sUyjOb6LoAVOXfNto4ASDcsIUG8DTAbOKO2c11qlgnGPgEt5ZFpVL9qz3b7IP4FkfYe4YVleBshgc7w+AA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEtMJ78S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775798585; x=1807334585;
  h=date:from:to:cc:subject:message-id;
  bh=K8I35ARzaHitOYV07gJPYj7u7s7aGFytI4l301K5TVU=;
  b=iEtMJ78SBEsQsiduKBv1s963RwdDw7kOTK7eyEsyVtXYWTqi0da8WXzp
   MY7oLL1R96y4ZZJbvtoye2dAY6NQn9BG33X2UjO7PnmbG++7kvOAmmddx
   boPM0Pj4DVvAK1Ems75rgFysGVmDNo84vNX6uRGTnw4lmxAVAUbgUVr0u
   03p5Mz4dgqSy10xxI1CPOsJMsWN6vcoPNOO0j9wFhPjqpMu63Mu5sbBKR
   UaOZjn6pwrFvIInsoXnDRoMpsBGH2BI3w3SEqAvBuWGe6j7Sx8ou5FShw
   tWMZZ3ATL9YctcbP0J001SxvM8l4ANOORHuQ72mWIjO3scTXWtrJnVEXE
   A==;
X-CSE-ConnectionGUID: bbORzoYMR9OVW0jW0kI/Bg==
X-CSE-MsgGUID: r0R8QLH5QKe46LdU5SQQJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80702457"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80702457"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:23:05 -0700
X-CSE-ConnectionGUID: XEyL3gBpSo2N2rujH+ZmPg==
X-CSE-MsgGUID: n/gsIqD8TbqlM2cW5cVOyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228153179"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2026 22:23:04 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB4Kb-000000003Gn-0Q79;
	Fri, 10 Apr 2026 05:23:01 +0000
Date: Fri, 10 Apr 2026 13:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 828ec7f803f41588a120e6d804297e74a482ab9d
Message-ID: <202604101316.awx6MFj9-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34979-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 94C913D247A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 828ec7f803f41588a120e6d804297e74a482ab9d  gpio: bd72720: handle missing regmap

elapsed time: 2735m

configs tested: 149
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260408    gcc-8.5.0
arc                   randconfig-002-20260408    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260408    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260408    gcc-14.3.0
arm64                 randconfig-002-20260408    gcc-14.3.0
arm64                 randconfig-003-20260408    gcc-14.3.0
arm64                 randconfig-004-20260408    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260408    gcc-14.3.0
csky                  randconfig-002-20260408    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260408    clang-20
i386                  randconfig-002-20260408    clang-20
i386                  randconfig-003-20260408    clang-20
i386                  randconfig-004-20260408    clang-20
i386                  randconfig-005-20260408    clang-20
i386                  randconfig-006-20260408    clang-20
i386                  randconfig-007-20260408    clang-20
i386                  randconfig-011-20260408    gcc-14
i386                  randconfig-012-20260408    gcc-14
i386                  randconfig-013-20260408    gcc-14
i386                  randconfig-014-20260408    gcc-14
i386                  randconfig-015-20260408    gcc-14
i386                  randconfig-016-20260408    gcc-14
i386                  randconfig-017-20260408    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260408    gcc-8.5.0
parisc                randconfig-002-20260408    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260408    gcc-8.5.0
powerpc               randconfig-002-20260408    gcc-8.5.0
powerpc64             randconfig-002-20260408    gcc-8.5.0
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260408    gcc-15.2.0
riscv                 randconfig-002-20260408    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260408    gcc-15.2.0
sh                    randconfig-002-20260408    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260408    clang-20
x86_64      buildonly-randconfig-002-20260408    clang-20
x86_64      buildonly-randconfig-003-20260408    clang-20
x86_64      buildonly-randconfig-004-20260408    clang-20
x86_64      buildonly-randconfig-005-20260408    clang-20
x86_64      buildonly-randconfig-006-20260408    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260408    gcc-12
x86_64                randconfig-001-20260408    gcc-14
x86_64                randconfig-002-20260408    gcc-12
x86_64                randconfig-002-20260408    gcc-14
x86_64                randconfig-003-20260408    gcc-12
x86_64                randconfig-003-20260408    gcc-14
x86_64                randconfig-004-20260408    gcc-12
x86_64                randconfig-004-20260408    gcc-14
x86_64                randconfig-005-20260408    gcc-12
x86_64                randconfig-005-20260408    gcc-14
x86_64                randconfig-006-20260408    gcc-12
x86_64                randconfig-011-20260408    clang-20
x86_64                randconfig-012-20260408    clang-20
x86_64                randconfig-013-20260408    clang-20
x86_64                randconfig-014-20260408    clang-20
x86_64                randconfig-015-20260408    clang-20
x86_64                randconfig-016-20260408    clang-20
x86_64                randconfig-071-20260408    clang-20
x86_64                randconfig-072-20260408    clang-20
x86_64                randconfig-073-20260408    clang-20
x86_64                randconfig-074-20260408    clang-20
x86_64                randconfig-075-20260408    clang-20
x86_64                randconfig-076-20260408    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

