Return-Path: <linux-gpio+bounces-34365-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WExNGEQIyWk3tgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34365-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 13:08:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3317351BAB
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 13:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83F69301413B
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 11:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC1731DDBF;
	Sun, 29 Mar 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFnzOb40"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5514F314B63
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782527; cv=none; b=DEZgnLpZO8cCcxbxY/VUpCdc2TOb1O2Iiw1mTl3ZiwFGW1PghbAfKrygwyeTbzJ6Cc8TJuACwMKYfjTGS+AF5SXbOAUdIiMtmoc7lSCH5sMzIPEP6GmOdW+nqfNjWiwIhg4ok/n8BckZQgbdVJ2GF0SlMprjfNTqQDIaFJYtrLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782527; c=relaxed/simple;
	bh=jFZZ1mD/KohwvVBLnkXXL6VIMMTpYy+vpGk8SUejoH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lKls9Oaj9NgaroN0tW7BPAndBG/JMITVJxVYesylQ4hjCUxZMnjmF7l4fEX15Kb+F01wl8fx5/mBnR+jjYpl6/mCGp0N6bN7LKdgTh6c9F/4AcXRPHEoLmES9325jwiWoELPho38Yi7XplHNnQ70fSFFx5vazhzcpQbKH45R/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFnzOb40; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774782526; x=1806318526;
  h=date:from:to:cc:subject:message-id;
  bh=jFZZ1mD/KohwvVBLnkXXL6VIMMTpYy+vpGk8SUejoH0=;
  b=DFnzOb40+ecYGhpj2Vm8696IhTRRsk+sJ08igKT2jbm6PuABvuE2hUvK
   0vE3SUmBHopA4uOh28udc5L0guCKfPI5vv5cNHjmHDn9LAXsemeViOmVU
   tzD2kin9G8QzDVQiv3Xh4WV0sprzs6tJz9BVSOXdt0+0ZrJlrws6mPoVB
   re2+VDI+J+bDg7B+fAO6VvUdITsyz68cppknaAj2DMeq6D8eaBeURjWaw
   ectt8wXd8EdDPBdUYlKuilFWmGwb7La63xZ02bblG9nGsYykVwT32LwjP
   nleMCCx/2NnV2/HVBm29RoQVhzw/d231zasS7B9WWU7Z0ONeupDXwwoQS
   w==;
X-CSE-ConnectionGUID: Ry7bO+yJS2eJd6FRKcpEyA==
X-CSE-MsgGUID: mbUKzeytQwyl5gJghjOhkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75813569"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75813569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:08:45 -0700
X-CSE-ConnectionGUID: zbgS7t2PTheJAntvwBSTaw==
X-CSE-MsgGUID: h6CCRokAStmPbfL9fzP4AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="248828782"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2026 04:08:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6o0X-00000000CIv-0sSe;
	Sun, 29 Mar 2026 11:08:41 +0000
Date: Sun, 29 Mar 2026 19:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 58a64a4b05e1ea555490a93ee1b2cb27657e546e
Message-ID: <202603291936.6qtNRr9Q-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34365-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3317351BAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 58a64a4b05e1ea555490a93ee1b2cb27657e546e  Merge branch 'devel' into for-next

elapsed time: 743m

configs tested: 169
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
arc                   randconfig-001-20260329    gcc-8.5.0
arc                   randconfig-002-20260329    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20260329    gcc-8.5.0
arm                   randconfig-002-20260329    gcc-8.5.0
arm                   randconfig-003-20260329    gcc-8.5.0
arm                   randconfig-004-20260329    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260329    gcc-12.5.0
arm64                 randconfig-002-20260329    gcc-12.5.0
arm64                 randconfig-003-20260329    gcc-12.5.0
arm64                 randconfig-004-20260329    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260329    gcc-12.5.0
csky                  randconfig-002-20260329    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260329    gcc-11.5.0
hexagon               randconfig-002-20260329    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260329    clang-20
i386        buildonly-randconfig-002-20260329    clang-20
i386        buildonly-randconfig-003-20260329    clang-20
i386        buildonly-randconfig-004-20260329    clang-20
i386        buildonly-randconfig-005-20260329    clang-20
i386        buildonly-randconfig-006-20260329    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260329    clang-20
i386                  randconfig-002-20260329    clang-20
i386                  randconfig-003-20260329    clang-20
i386                  randconfig-004-20260329    clang-20
i386                  randconfig-005-20260329    clang-20
i386                  randconfig-006-20260329    clang-20
i386                  randconfig-007-20260329    clang-20
i386                  randconfig-011-20260329    clang-20
i386                  randconfig-012-20260329    clang-20
i386                  randconfig-013-20260329    clang-20
i386                  randconfig-014-20260329    clang-20
i386                  randconfig-015-20260329    clang-20
i386                  randconfig-016-20260329    clang-20
i386                  randconfig-017-20260329    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260329    gcc-11.5.0
loongarch             randconfig-002-20260329    gcc-11.5.0
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
nios2                 randconfig-001-20260329    gcc-11.5.0
nios2                 randconfig-002-20260329    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260329    gcc-8.5.0
parisc                randconfig-002-20260329    gcc-11.5.0
parisc                randconfig-002-20260329    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260329    clang-17
powerpc               randconfig-001-20260329    gcc-8.5.0
powerpc               randconfig-002-20260329    gcc-8.5.0
powerpc64             randconfig-001-20260329    gcc-8.5.0
powerpc64             randconfig-002-20260329    clang-23
powerpc64             randconfig-002-20260329    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260329    clang-23
riscv                 randconfig-002-20260329    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260329    clang-23
s390                  randconfig-002-20260329    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                         ap325rxa_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260329    clang-23
sh                    randconfig-002-20260329    clang-23
sh                        sh7763rdp_defconfig    gcc-15.2.0
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
x86_64      buildonly-randconfig-001-20260329    gcc-14
x86_64      buildonly-randconfig-002-20260329    gcc-14
x86_64      buildonly-randconfig-003-20260329    gcc-14
x86_64      buildonly-randconfig-004-20260329    gcc-14
x86_64      buildonly-randconfig-005-20260329    gcc-14
x86_64      buildonly-randconfig-006-20260329    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260329    gcc-14
x86_64                randconfig-002-20260329    gcc-14
x86_64                randconfig-003-20260329    gcc-14
x86_64                randconfig-004-20260329    gcc-14
x86_64                randconfig-005-20260329    gcc-14
x86_64                randconfig-006-20260329    gcc-14
x86_64                randconfig-011-20260329    gcc-14
x86_64                randconfig-012-20260329    gcc-14
x86_64                randconfig-013-20260329    gcc-14
x86_64                randconfig-014-20260329    gcc-14
x86_64                randconfig-015-20260329    gcc-14
x86_64                randconfig-016-20260329    gcc-14
x86_64                randconfig-071-20260329    clang-20
x86_64                randconfig-072-20260329    clang-20
x86_64                randconfig-073-20260329    clang-20
x86_64                randconfig-074-20260329    clang-20
x86_64                randconfig-075-20260329    clang-20
x86_64                randconfig-076-20260329    clang-20
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

