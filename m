Return-Path: <linux-gpio+bounces-36412-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF++EQT5/GmxVwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36412-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 22:41:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2874EEC91
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 22:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8651F300C38D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 20:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E381175A7D;
	Thu,  7 May 2026 20:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hruSp2Ld"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09982F8EA2
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 20:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778185901; cv=none; b=FBAcBinbnHCfNKRQBIjZgkuEIrHFW3P6Q4C0HXasDvZ9rKGlZJPno+n0Rzb/jT+2kAp/N/gMC1PwRNSWMEH1JmxbswM2aFy86q5ZHJMbZ4l9yw4HBlRGLZeq6D2AgGXAt5MqF8NAmS/p2LWcXo61UBWC0pDNlmbRwGHqnvisPWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778185901; c=relaxed/simple;
	bh=ovoB9hrKPcj1ImjzCRtsYMDHiqDcBXBeVbnjnzh2SeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UKjvSo/hV+neVYzaY8vhHcVo0vGlro05IRogILyv4w+BPw2YvTkSfLRZQYsss7cZQNT4TJ1rPFncNvSEpK36bJWWHMCiMnM+zV+DokkF06Nvn1eY5EbuVmaEEbr+udUFIr6htxg5FPrBvg+yVuBUVa7VYKIrZHO/FbcgmPexjGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hruSp2Ld; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778185900; x=1809721900;
  h=date:from:to:cc:subject:message-id;
  bh=ovoB9hrKPcj1ImjzCRtsYMDHiqDcBXBeVbnjnzh2SeE=;
  b=hruSp2LdyW41Jr1/r0RDbRHOdNkStGR+DhpoHGREBnoCwplWzxapH8Eo
   d3HGXCDbezw7mT6HekxWTiA9lDvCfPbgPZCT4HhVYzipI6qNRrI597bRY
   rwwatDbshToCQ2wP4y27RSdXml8p2nmh1oxkMWrGWoIhKjKbxKGa6jY5b
   Bh9k9sjnHvkDAK68Erfoc39TiyGX8bQTdBCjaFw29AYXU6z2NS751DvZm
   wLgQCn2Yo1IutCw/CjeZNRyqdOUa5v/BjkDEUnaIRG8d1tS5STYVbzgvc
   L61lLD6Qzpw28fJape4oy9NsgssFGDIVam3rHWNP+dY5BMOdDiAqPkZfW
   g==;
X-CSE-ConnectionGUID: 2ABfAf2NReWpzsUDyKBz3Q==
X-CSE-MsgGUID: Wkgfdo8KQGep24fB/0V8tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82769764"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="82769764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 13:31:39 -0700
X-CSE-ConnectionGUID: 6LdV6FJ5TP+1hpsFYWBrGQ==
X-CSE-MsgGUID: YWeruCqqSsGPmVqac7xI+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="236821886"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 May 2026 13:31:38 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL5Nf-000000000Qb-3I5O;
	Thu, 07 May 2026 20:31:35 +0000
Date: Fri, 08 May 2026 04:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 87e4643ab19cdfa152b7d10b3418cfff19724109
Message-ID: <202605080435.FBLqGfJ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: CF2874EEC91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36412-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 87e4643ab19cdfa152b7d10b3418cfff19724109  gpio: amd8111: Drop useless zeros in array initialisation

elapsed time: 724m

configs tested: 219
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260507    gcc-14.3.0
arc                   randconfig-002-20260507    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-002-20260507    gcc-14.3.0
arm                   randconfig-004-20260507    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260507    gcc-15.2.0
arm64                 randconfig-001-20260508    gcc-14.3.0
arm64                 randconfig-002-20260507    gcc-15.2.0
arm64                 randconfig-002-20260508    gcc-14.3.0
arm64                 randconfig-003-20260507    gcc-15.2.0
arm64                 randconfig-003-20260508    gcc-14.3.0
arm64                 randconfig-004-20260507    gcc-15.2.0
arm64                 randconfig-004-20260508    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260507    gcc-15.2.0
csky                  randconfig-001-20260508    gcc-14.3.0
csky                  randconfig-002-20260507    gcc-15.2.0
csky                  randconfig-002-20260508    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260507    clang-23
hexagon               randconfig-002-20260507    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260507    clang-20
i386        buildonly-randconfig-001-20260507    gcc-14
i386        buildonly-randconfig-001-20260508    gcc-14
i386        buildonly-randconfig-002-20260507    clang-20
i386        buildonly-randconfig-002-20260507    gcc-14
i386        buildonly-randconfig-002-20260508    gcc-14
i386        buildonly-randconfig-003-20260507    clang-20
i386        buildonly-randconfig-003-20260507    gcc-14
i386        buildonly-randconfig-003-20260508    gcc-14
i386        buildonly-randconfig-004-20260507    clang-20
i386        buildonly-randconfig-004-20260507    gcc-14
i386        buildonly-randconfig-004-20260508    gcc-14
i386        buildonly-randconfig-005-20260507    clang-20
i386        buildonly-randconfig-005-20260508    gcc-14
i386        buildonly-randconfig-006-20260507    clang-20
i386        buildonly-randconfig-006-20260507    gcc-14
i386        buildonly-randconfig-006-20260508    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260507    gcc-14
i386                  randconfig-002-20260507    gcc-14
i386                  randconfig-003-20260507    gcc-14
i386                  randconfig-004-20260507    gcc-14
i386                  randconfig-005-20260507    gcc-14
i386                  randconfig-006-20260507    gcc-14
i386                  randconfig-007-20260507    gcc-14
i386                  randconfig-011-20260507    clang-20
i386                  randconfig-011-20260507    gcc-14
i386                  randconfig-012-20260507    clang-20
i386                  randconfig-013-20260507    clang-20
i386                  randconfig-013-20260507    gcc-14
i386                  randconfig-014-20260507    clang-20
i386                  randconfig-014-20260507    gcc-14
i386                  randconfig-015-20260507    clang-20
i386                  randconfig-016-20260507    clang-20
i386                  randconfig-016-20260507    gcc-14
i386                  randconfig-017-20260507    clang-20
i386                  randconfig-017-20260507    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260507    clang-23
loongarch             randconfig-002-20260507    clang-23
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
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260507    clang-23
nios2                 randconfig-002-20260507    clang-23
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
parisc                randconfig-001-20260507    gcc-8.5.0
parisc                randconfig-001-20260508    gcc-9.5.0
parisc                randconfig-002-20260507    gcc-8.5.0
parisc                randconfig-002-20260508    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260507    gcc-8.5.0
powerpc               randconfig-001-20260508    gcc-9.5.0
powerpc               randconfig-002-20260507    gcc-8.5.0
powerpc               randconfig-002-20260508    gcc-9.5.0
powerpc64             randconfig-001-20260507    gcc-8.5.0
powerpc64             randconfig-001-20260508    gcc-9.5.0
powerpc64             randconfig-002-20260507    gcc-8.5.0
powerpc64             randconfig-002-20260508    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-12.5.0
sparc                 randconfig-001-20260507    gcc-12.5.0
sparc                          randconfig-002    gcc-12.5.0
sparc                 randconfig-002-20260507    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-12.5.0
sparc64               randconfig-001-20260507    gcc-12.5.0
sparc64                        randconfig-002    gcc-12.5.0
sparc64               randconfig-002-20260507    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-12.5.0
um                    randconfig-001-20260507    gcc-12.5.0
um                             randconfig-002    gcc-12.5.0
um                    randconfig-002-20260507    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260507    clang-20
x86_64      buildonly-randconfig-002-20260507    clang-20
x86_64      buildonly-randconfig-003-20260507    clang-20
x86_64      buildonly-randconfig-004-20260507    clang-20
x86_64      buildonly-randconfig-005-20260507    clang-20
x86_64      buildonly-randconfig-006-20260507    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260507    gcc-14
x86_64                randconfig-002-20260507    gcc-14
x86_64                randconfig-003-20260507    gcc-14
x86_64                randconfig-004-20260507    gcc-14
x86_64                randconfig-005-20260507    gcc-14
x86_64                randconfig-006-20260507    gcc-14
x86_64                randconfig-011-20260507    gcc-14
x86_64                randconfig-012-20260507    gcc-14
x86_64                randconfig-013-20260507    gcc-14
x86_64                randconfig-014-20260507    gcc-14
x86_64                randconfig-015-20260507    gcc-14
x86_64                randconfig-016-20260507    gcc-14
x86_64                randconfig-071-20260507    clang-20
x86_64                randconfig-072-20260507    clang-20
x86_64                randconfig-073-20260507    clang-20
x86_64                randconfig-074-20260507    clang-20
x86_64                randconfig-075-20260507    clang-20
x86_64                randconfig-076-20260507    clang-20
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
xtensa                         randconfig-001    gcc-12.5.0
xtensa                randconfig-001-20260507    gcc-12.5.0
xtensa                         randconfig-002    gcc-12.5.0
xtensa                randconfig-002-20260507    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

