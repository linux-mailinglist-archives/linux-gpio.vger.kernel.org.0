Return-Path: <linux-gpio+bounces-32516-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELZ5FdWiqGnKwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32516-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:23:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74E207EDB
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F343045C08
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EB6384230;
	Wed,  4 Mar 2026 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+1uBQ+x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62E37267B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659356; cv=none; b=qkP4evCvEFX+84EXU1rVGgsoFio5Hvh2T3Us0kFqnBxpINC5xwgSvoDINr8s1JWBbr9T1SICUlq6zoMM+CSjtFl+XjG59XEMeJfenAHi+4QUabNH0QlXKlJPT96v9wgsxWQhmgJcdqfR+kXbffmBOl9rNWDJavfPJciORZqw+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659356; c=relaxed/simple;
	bh=KPtE4FXfhk6ZrNK0P5tY2I3WpB1iCv/Z3wl/iw9Q7KQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RRK3KCjWIfLQOh4xq6BFGT+uGcRSe/vAoqt5FJgVBMhAYzA/O5GjYdv73dSXB0bEO7Vbwci0xVDSrBkuvz6GXYo602xD/EUkSo3VEvJgmnD+BVzXQctF+HwImkS6RZFcled+zmxhxYG+oXE3ygDcLiQwOikacxFF1H8/gkBLFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+1uBQ+x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772659354; x=1804195354;
  h=date:from:to:cc:subject:message-id;
  bh=KPtE4FXfhk6ZrNK0P5tY2I3WpB1iCv/Z3wl/iw9Q7KQ=;
  b=W+1uBQ+xM/RQx63fQooD865Vi90FQ6XmjIuFvh2xnbtUOoAWW5H6XDCK
   YPq6mC4a0EfAZ4HOfsKA9YDRzU5GejKkJ+yoQeE0s0q1kBmeTB61YGUG7
   UtUdZfHdwaZKeN0pvRd2f1P3WOasr4YjsOHMoAGlbg1RIWxS4nNcwRq4d
   yPYD71ZKZ77QWtMYYGrJkuyFAeo4For9tbNMWS5+YTa7UxccELb8etrsc
   DqXCi2YpwRYQktE+0a9h9uAGWHO7WMYK0M7msx+udjXbm4olVJU2GFcjs
   qds9g8u2IBqmJb5iG0ebzJe2Wu5gCfA1PjwGWk+wHK/XrnceiXq+Edrgb
   A==;
X-CSE-ConnectionGUID: AfIK6bgpRSOQGMfncyrugA==
X-CSE-MsgGUID: 5A+UGIqaSuGUygfEIlhBmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="99201910"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="99201910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:22:34 -0800
X-CSE-ConnectionGUID: jpULT/KuRGyDmMHVVzFuGQ==
X-CSE-MsgGUID: U+UDKIooTSqXfupm9PdkEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="218595663"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Mar 2026 13:22:32 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxtfp-000000004W9-1gmI;
	Wed, 04 Mar 2026 21:22:29 +0000
Date: Thu, 05 Mar 2026 05:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-current] BUILD SUCCESS
 5c3daa5301693d2e5364483a3405649a0fdaed98
Message-ID: <202603050506.RKhvqhw1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: AE74E207EDB
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32516-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: 5c3daa5301693d2e5364483a3405649a0fdaed98  power: sequencing: pcie-m2: Fix device node reference leak in probe

elapsed time: 756m

configs tested: 174
configs skipped: 2

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
arc                   randconfig-001-20260304    clang-23
arc                   randconfig-002-20260304    clang-23
arm                              alldefconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260304    clang-23
arm                   randconfig-002-20260304    clang-23
arm                   randconfig-003-20260304    clang-23
arm                   randconfig-004-20260304    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260304    gcc-15.2.0
arm64                 randconfig-002-20260304    gcc-15.2.0
arm64                 randconfig-003-20260304    gcc-15.2.0
arm64                 randconfig-004-20260304    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260304    gcc-15.2.0
csky                  randconfig-002-20260304    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260304    gcc-15.2.0
hexagon               randconfig-002-20260304    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260304    gcc-14
i386        buildonly-randconfig-001-20260305    clang-20
i386        buildonly-randconfig-002-20260304    gcc-14
i386        buildonly-randconfig-002-20260305    clang-20
i386        buildonly-randconfig-003-20260304    gcc-14
i386        buildonly-randconfig-003-20260305    clang-20
i386        buildonly-randconfig-004-20260304    gcc-14
i386        buildonly-randconfig-004-20260305    clang-20
i386        buildonly-randconfig-005-20260304    gcc-14
i386        buildonly-randconfig-005-20260305    clang-20
i386        buildonly-randconfig-006-20260304    gcc-14
i386        buildonly-randconfig-006-20260305    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260304    clang-20
i386                  randconfig-002-20260304    clang-20
i386                  randconfig-003-20260304    clang-20
i386                  randconfig-004-20260304    clang-20
i386                  randconfig-005-20260304    clang-20
i386                  randconfig-006-20260304    clang-20
i386                  randconfig-007-20260304    clang-20
i386                  randconfig-011-20260304    gcc-14
i386                  randconfig-012-20260304    gcc-14
i386                  randconfig-013-20260304    gcc-14
i386                  randconfig-014-20260304    gcc-14
i386                  randconfig-015-20260304    gcc-14
i386                  randconfig-016-20260304    gcc-14
i386                  randconfig-017-20260304    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260304    gcc-15.2.0
loongarch             randconfig-002-20260304    gcc-15.2.0
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
nios2                 randconfig-001-20260304    gcc-15.2.0
nios2                 randconfig-002-20260304    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260304    gcc-8.5.0
parisc                randconfig-002-20260304    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260304    gcc-8.5.0
powerpc               randconfig-002-20260304    gcc-8.5.0
powerpc64             randconfig-001-20260304    gcc-8.5.0
powerpc64             randconfig-002-20260304    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260304    clang-23
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-002-20260304    clang-23
riscv                 randconfig-002-20260305    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260304    clang-23
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-002-20260304    clang-23
s390                  randconfig-002-20260305    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260304    clang-23
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-002-20260304    clang-23
sh                    randconfig-002-20260305    clang-23
sh                           se7751_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260304    gcc-14
x86_64      buildonly-randconfig-002-20260304    gcc-14
x86_64      buildonly-randconfig-003-20260304    gcc-14
x86_64      buildonly-randconfig-004-20260304    gcc-14
x86_64      buildonly-randconfig-005-20260304    gcc-14
x86_64      buildonly-randconfig-006-20260304    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260304    clang-20
x86_64                randconfig-002-20260304    clang-20
x86_64                randconfig-003-20260304    clang-20
x86_64                randconfig-004-20260304    clang-20
x86_64                randconfig-005-20260304    clang-20
x86_64                randconfig-006-20260304    clang-20
x86_64                randconfig-011-20260304    gcc-14
x86_64                randconfig-012-20260304    gcc-14
x86_64                randconfig-013-20260304    gcc-14
x86_64                randconfig-014-20260304    gcc-14
x86_64                randconfig-015-20260304    gcc-14
x86_64                randconfig-016-20260304    gcc-14
x86_64                randconfig-071-20260304    clang-20
x86_64                randconfig-072-20260304    clang-20
x86_64                randconfig-073-20260304    clang-20
x86_64                randconfig-074-20260304    clang-20
x86_64                randconfig-075-20260304    clang-20
x86_64                randconfig-076-20260304    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

