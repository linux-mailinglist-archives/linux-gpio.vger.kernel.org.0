Return-Path: <linux-gpio+bounces-33915-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AeGL709vWmJ8AIAu9opvQ
	(envelope-from <linux-gpio+bounces-33915-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:29:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0048E2DA40D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9837830200D4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 12:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403FA3A7855;
	Fri, 20 Mar 2026 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhwIBYuw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F228FFFB
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009699; cv=none; b=ehmHP2KqGATGCk5VAvSNyA92SJeM494PtmrfHt3CE0gLbORkOaH5G+ghDQzI/Y9Cd0AQSX1MPgHdEM0z/VozEpchw0kF21FfOs3iVP8hewvfOXm4hrLq8wtixhxKX3ymDPqovHlmbUteXFP28tB6GEtVm11NAJcJMbiA1uLws9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009699; c=relaxed/simple;
	bh=pL+0m9o3XMNTl+N+LyDfHeGz7+g+ITgEZnWLYD4nYLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f7cGZVSVPzNs0ykW23T4iXpWuB9AOY/ghbsx5y/enVMjs2W+mRg7X/AcNspmqOO+zX1xilryaK93lL8ZreLy6dk18mVT/3e1ojimnjsxG9UfYPWOHK1S+EbqDsJm4cKRxc+ghYvy0ftyFZS03gbwypHYTY2EQuLyLizM2sKHdx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhwIBYuw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774009697; x=1805545697;
  h=date:from:to:cc:subject:message-id;
  bh=pL+0m9o3XMNTl+N+LyDfHeGz7+g+ITgEZnWLYD4nYLI=;
  b=GhwIBYuwkdGqO7bdWJMZfB3t8M0ZptmAK/BhVNM5ppiemwOhFsKuLEZM
   se/trU4qcC9HZK69uYt34TzMgiJ571jtUDHpusGJsOep41C5TaP+eSJ7I
   zn49aug4D8+/4T0teAw/vq+Md8m+fjnj6ywrYgabh4GtQlGbSCJLQ5W5s
   8XqWg+K79KqW/JOFMDGFbL5RbD/JbMdWXN2VCozw2aPUkF0ETfVsQg0Qe
   kg0hj8fiYi55glTfiSerhRWrG9ZPc1L7e+jIy01dBuG4wnQNQAo7B2hbn
   tNRpzEpNxkjy7Sy69iUJI0PNZAhQZZ8vT9ITUgWWctfs1s+KuF/2l6qST
   Q==;
X-CSE-ConnectionGUID: TwuiBn/hTDG06V2C9JTN0g==
X-CSE-MsgGUID: VRTi6PW6Q8KmGv5KymC/ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86169964"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86169964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 05:28:17 -0700
X-CSE-ConnectionGUID: luWpajwFSAC2jtxVU5SgFw==
X-CSE-MsgGUID: B0vnatL7S8uF1hjuitDY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="247394890"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Mar 2026 05:28:15 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3YxH-000000002Lt-2jPT;
	Fri, 20 Mar 2026 12:28:03 +0000
Date: Fri, 20 Mar 2026 20:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 7c839b398814aa4a4ca07c1ac8b158095d2efe34
Message-ID: <202603202059.f9wDp1nF-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33915-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 0048E2DA40D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 7c839b398814aa4a4ca07c1ac8b158095d2efe34  Merge branch 'devel' into for-next

elapsed time: 1074m

configs tested: 164
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
arc                   randconfig-001-20260320    gcc-13.4.0
arc                   randconfig-002-20260320    gcc-13.4.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260320    gcc-13.4.0
arm                   randconfig-002-20260320    gcc-13.4.0
arm                   randconfig-003-20260320    gcc-13.4.0
arm                   randconfig-004-20260320    gcc-13.4.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260320    clang-17
arm64                 randconfig-002-20260320    clang-17
arm64                 randconfig-003-20260320    clang-17
arm64                 randconfig-004-20260320    clang-17
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260320    clang-17
csky                  randconfig-002-20260320    clang-17
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260320    gcc-8.5.0
hexagon               randconfig-002-20260320    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260320    gcc-14
i386        buildonly-randconfig-002-20260320    gcc-14
i386        buildonly-randconfig-003-20260320    gcc-14
i386        buildonly-randconfig-004-20260320    gcc-14
i386        buildonly-randconfig-005-20260320    gcc-14
i386        buildonly-randconfig-006-20260320    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260320    clang-20
i386                  randconfig-002-20260320    clang-20
i386                  randconfig-003-20260320    clang-20
i386                  randconfig-004-20260320    clang-20
i386                  randconfig-005-20260320    clang-20
i386                  randconfig-006-20260320    clang-20
i386                  randconfig-007-20260320    clang-20
i386                  randconfig-011-20260320    clang-20
i386                  randconfig-012-20260320    clang-20
i386                  randconfig-013-20260320    clang-20
i386                  randconfig-014-20260320    clang-20
i386                  randconfig-015-20260320    clang-20
i386                  randconfig-016-20260320    clang-20
i386                  randconfig-017-20260320    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260320    gcc-8.5.0
loongarch             randconfig-002-20260320    gcc-8.5.0
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
nios2                 randconfig-001-20260320    gcc-8.5.0
nios2                 randconfig-002-20260320    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260320    gcc-10.5.0
parisc                randconfig-002-20260320    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260320    gcc-10.5.0
powerpc               randconfig-002-20260320    gcc-10.5.0
powerpc64             randconfig-001-20260320    gcc-10.5.0
powerpc64             randconfig-002-20260320    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260320    gcc-8.5.0
riscv                 randconfig-002-20260320    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260320    gcc-8.5.0
s390                  randconfig-002-20260320    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260320    gcc-8.5.0
sh                    randconfig-002-20260320    gcc-8.5.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260320    gcc-14
sparc                 randconfig-002-20260320    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260320    gcc-14
sparc64               randconfig-002-20260320    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260320    gcc-14
um                    randconfig-002-20260320    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260320    clang-20
x86_64      buildonly-randconfig-002-20260320    clang-20
x86_64      buildonly-randconfig-003-20260320    clang-20
x86_64      buildonly-randconfig-004-20260320    clang-20
x86_64      buildonly-randconfig-005-20260320    clang-20
x86_64      buildonly-randconfig-006-20260320    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20260320    gcc-14
x86_64                randconfig-012-20260320    gcc-14
x86_64                randconfig-013-20260320    gcc-14
x86_64                randconfig-014-20260320    gcc-14
x86_64                randconfig-015-20260320    gcc-14
x86_64                randconfig-016-20260320    gcc-14
x86_64                randconfig-071-20260320    gcc-14
x86_64                randconfig-072-20260320    gcc-14
x86_64                randconfig-073-20260320    gcc-14
x86_64                randconfig-074-20260320    gcc-14
x86_64                randconfig-075-20260320    gcc-14
x86_64                randconfig-076-20260320    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260320    gcc-14
xtensa                randconfig-002-20260320    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

