Return-Path: <linux-gpio+bounces-38513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q759Jr2NMGp6UQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 01:41:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B177868A9F2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 01:41:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MRoyBhc5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38513-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38513-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D20C1306EA66
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 23:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AF0351C14;
	Mon, 15 Jun 2026 23:39:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6354344DA4
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 23:39:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781566752; cv=none; b=tQrK8LhvnHT/sDsAatdlq9HY5FikENC0wCcnFL/Bpn9D66RA2yNsUVLPjsQNaJzfQuJX9H+jmv5mqIdvU5XkWSkJTYnQRC5JD03Hsnp1w6QW2PzAEP3wa13ww4vzezun+58lIpzyGu+Kl5EtbD98aVQK7mIk2IRPZ2yIqIuJyrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781566752; c=relaxed/simple;
	bh=zZA8YecHfcc+6vGpiiQwk88oIv97XObEcgqlJJhthTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uyA9q56/z1sjwe1YE2uxKR0FgjqM62yAHR/gRHgP4UgkiwOkMYjo9Y6Rf/GekBJBrmtzLSVzjT0MthuNd/nY6wKmJmeCFExNhEzb63KRzz1I0Lu1MSi5R02LOxse9SS6SFJ3XRl2xn6F8l6QSyvpK0uDgLFiwaEknZ6/q8AvRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRoyBhc5; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781566750; x=1813102750;
  h=date:from:to:cc:subject:message-id;
  bh=zZA8YecHfcc+6vGpiiQwk88oIv97XObEcgqlJJhthTE=;
  b=MRoyBhc5ZSi7TXWSokhf7T9sKStOut605iie75JayxiWIfdkj+s4pjaK
   oDYPPIFjkvz0eeiVvCvE5Q/Tblcl801XczMK7ewx4UA88Ahb6E3UyROP5
   8yb6WS329M/dOSA3TOKnVGjK1gTQKntTaO2TpllIEFIwiZ/3AsgTnz6hi
   QzbfN13Rj9ClBayqnVep5O/fBFwXWbPd/K+4Iusw5kOP+svgmkGCbj4d9
   WyiMkmy1mh0yHzqXRdwfXJlv65jPs7DFCtOHg6f+XXFA9LE3+ymkjIu60
   OigEe8kA1QDQ9Sn9kUcjzWCcg3q+uYBSCjRzSOfJNN4JCezmYDMaeFrd1
   g==;
X-CSE-ConnectionGUID: 1hPkelwUSJmobfJjldXarw==
X-CSE-MsgGUID: jERMxL5hSSyaoI1HZJVrpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92992310"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="92992310"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 16:39:09 -0700
X-CSE-ConnectionGUID: VGvG1bERQoODGWIZKGEAyA==
X-CSE-MsgGUID: kwjF7R+ERn6jCDBCD+13tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="251897177"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jun 2026 16:39:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZGtU-00000000SSk-3iq9;
	Mon, 15 Jun 2026 23:39:04 +0000
Date: Tue, 16 Jun 2026 07:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/export-get-group-selector] BUILD SUCCESS
 cb6af574d673458fa0210f18a9b3bf2ae4694f92
Message-ID: <202606160750.LLPU2RPZ-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38513-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B177868A9F2

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/export-get-group-selector
branch HEAD: cb6af574d673458fa0210f18a9b3bf2ae4694f92  pinctrl: Export pinctrl_get_group_selector()

elapsed time: 822m

configs tested: 311
configs skipped: 11

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
arc                            randconfig-001    gcc-10.5.0
arc                   randconfig-001-20260615    gcc-10.5.0
arc                   randconfig-001-20260616    gcc-9.5.0
arc                            randconfig-002    gcc-10.5.0
arc                   randconfig-002-20260615    gcc-10.5.0
arc                   randconfig-002-20260616    gcc-9.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                       imx_v4_v5_defconfig    clang-23
arm                            randconfig-001    gcc-10.5.0
arm                   randconfig-001-20260615    gcc-10.5.0
arm                   randconfig-001-20260616    gcc-9.5.0
arm                            randconfig-002    gcc-10.5.0
arm                   randconfig-002-20260615    gcc-10.5.0
arm                   randconfig-002-20260616    gcc-9.5.0
arm                            randconfig-003    gcc-10.5.0
arm                   randconfig-003-20260615    gcc-10.5.0
arm                   randconfig-003-20260616    gcc-9.5.0
arm                            randconfig-004    gcc-10.5.0
arm                   randconfig-004-20260615    gcc-10.5.0
arm                   randconfig-004-20260616    gcc-9.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260615    clang-23
arm64                 randconfig-001-20260616    gcc-13.4.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260615    clang-23
arm64                 randconfig-002-20260616    gcc-13.4.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260615    clang-23
arm64                 randconfig-003-20260616    gcc-13.4.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260615    clang-23
arm64                 randconfig-004-20260616    gcc-13.4.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260615    clang-23
csky                  randconfig-001-20260616    gcc-13.4.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260615    clang-23
csky                  randconfig-002-20260616    gcc-13.4.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260615    clang-18
hexagon               randconfig-001-20260616    clang-23
hexagon               randconfig-002-20260615    clang-18
hexagon               randconfig-002-20260616    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260615    clang-22
i386        buildonly-randconfig-001-20260616    clang-22
i386        buildonly-randconfig-002-20260615    clang-22
i386        buildonly-randconfig-002-20260616    clang-22
i386        buildonly-randconfig-003-20260615    clang-22
i386        buildonly-randconfig-003-20260616    clang-22
i386        buildonly-randconfig-004-20260615    clang-22
i386        buildonly-randconfig-004-20260616    clang-22
i386        buildonly-randconfig-005-20260615    clang-22
i386        buildonly-randconfig-005-20260616    clang-22
i386        buildonly-randconfig-006-20260615    clang-22
i386        buildonly-randconfig-006-20260616    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260615    clang-22
i386                  randconfig-001-20260616    gcc-14
i386                  randconfig-002-20260615    clang-22
i386                  randconfig-002-20260616    gcc-14
i386                  randconfig-003-20260615    clang-22
i386                  randconfig-003-20260616    gcc-14
i386                  randconfig-004-20260615    clang-22
i386                  randconfig-004-20260616    gcc-14
i386                  randconfig-005-20260615    clang-22
i386                  randconfig-005-20260616    gcc-14
i386                  randconfig-006-20260615    clang-22
i386                  randconfig-006-20260616    gcc-14
i386                  randconfig-007-20260615    clang-22
i386                  randconfig-007-20260616    gcc-14
i386                  randconfig-011-20260615    gcc-14
i386                  randconfig-011-20260616    clang-22
i386                  randconfig-012-20260615    gcc-14
i386                  randconfig-012-20260616    clang-22
i386                  randconfig-013-20260615    gcc-14
i386                  randconfig-013-20260616    clang-22
i386                  randconfig-014-20260615    gcc-14
i386                  randconfig-014-20260616    clang-22
i386                  randconfig-015-20260615    gcc-14
i386                  randconfig-015-20260616    clang-22
i386                  randconfig-016-20260615    gcc-14
i386                  randconfig-016-20260616    clang-22
i386                  randconfig-017-20260615    gcc-14
i386                  randconfig-017-20260616    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260615    clang-18
loongarch             randconfig-001-20260616    clang-23
loongarch             randconfig-002-20260615    clang-18
loongarch             randconfig-002-20260616    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                    maltaup_xpa_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260615    clang-18
nios2                 randconfig-001-20260616    clang-23
nios2                 randconfig-002-20260615    clang-18
nios2                 randconfig-002-20260616    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    clang-23
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260615    gcc-8.5.0
parisc                randconfig-001-20260616    gcc-8.5.0
parisc                randconfig-002-20260615    gcc-13.4.0
parisc                randconfig-002-20260616    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260615    gcc-8.5.0
powerpc               randconfig-001-20260616    gcc-8.5.0
powerpc               randconfig-002-20260615    clang-23
powerpc               randconfig-002-20260616    gcc-8.5.0
powerpc64             randconfig-001-20260615    clang-23
powerpc64             randconfig-001-20260616    gcc-8.5.0
powerpc64             randconfig-002-20260615    gcc-8.5.0
powerpc64             randconfig-002-20260616    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260615    gcc-16.1.0
riscv                 randconfig-001-20260616    gcc-16.1.0
riscv                 randconfig-002-20260615    gcc-16.1.0
riscv                 randconfig-002-20260616    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260615    gcc-16.1.0
s390                  randconfig-001-20260616    gcc-16.1.0
s390                  randconfig-002-20260615    gcc-16.1.0
s390                  randconfig-002-20260616    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    clang-23
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                    randconfig-001-20260615    gcc-16.1.0
sh                    randconfig-001-20260616    gcc-16.1.0
sh                    randconfig-002-20260615    gcc-16.1.0
sh                    randconfig-002-20260616    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260615    gcc-13.4.0
sparc                 randconfig-001-20260615    gcc-15.2.0
sparc                 randconfig-001-20260616    gcc-8.5.0
sparc                 randconfig-002-20260615    gcc-15.2.0
sparc                 randconfig-002-20260616    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260615    gcc-15.2.0
sparc64               randconfig-001-20260615    gcc-8.5.0
sparc64               randconfig-001-20260616    gcc-8.5.0
sparc64               randconfig-002-20260615    gcc-15.2.0
sparc64               randconfig-002-20260615    gcc-8.5.0
sparc64               randconfig-002-20260616    gcc-8.5.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260615    clang-23
um                    randconfig-001-20260615    gcc-15.2.0
um                    randconfig-001-20260616    gcc-8.5.0
um                    randconfig-002-20260615    clang-23
um                    randconfig-002-20260615    gcc-15.2.0
um                    randconfig-002-20260616    gcc-8.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260615    clang-22
x86_64      buildonly-randconfig-001-20260616    gcc-14
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260615    clang-22
x86_64      buildonly-randconfig-002-20260615    gcc-14
x86_64      buildonly-randconfig-002-20260616    gcc-14
x86_64               buildonly-randconfig-003    clang-22
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260615    clang-22
x86_64      buildonly-randconfig-003-20260616    gcc-14
x86_64               buildonly-randconfig-004    clang-22
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260615    clang-22
x86_64      buildonly-randconfig-004-20260616    gcc-14
x86_64               buildonly-randconfig-005    clang-22
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260615    clang-22
x86_64      buildonly-randconfig-005-20260615    gcc-14
x86_64      buildonly-randconfig-005-20260616    gcc-14
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260615    clang-22
x86_64      buildonly-randconfig-006-20260616    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260615    clang-22
x86_64                randconfig-002-20260615    clang-22
x86_64                randconfig-003-20260615    clang-22
x86_64                randconfig-004-20260615    clang-22
x86_64                randconfig-005-20260615    clang-22
x86_64                randconfig-006-20260615    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260615    clang-22
x86_64                randconfig-011-20260616    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260615    clang-22
x86_64                randconfig-012-20260616    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260615    clang-22
x86_64                randconfig-013-20260616    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260615    clang-22
x86_64                randconfig-014-20260616    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260615    clang-22
x86_64                randconfig-015-20260616    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260615    clang-22
x86_64                randconfig-016-20260616    clang-22
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260615    gcc-13
x86_64                randconfig-071-20260615    gcc-14
x86_64                randconfig-071-20260616    gcc-14
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260615    clang-22
x86_64                randconfig-072-20260615    gcc-13
x86_64                randconfig-072-20260616    gcc-14
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260615    clang-22
x86_64                randconfig-073-20260615    gcc-13
x86_64                randconfig-073-20260616    gcc-14
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260615    gcc-13
x86_64                randconfig-074-20260615    gcc-14
x86_64                randconfig-074-20260616    gcc-14
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260615    clang-22
x86_64                randconfig-075-20260615    gcc-13
x86_64                randconfig-075-20260616    gcc-14
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260615    clang-22
x86_64                randconfig-076-20260615    gcc-13
x86_64                randconfig-076-20260616    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260615    gcc-13.4.0
xtensa                randconfig-001-20260615    gcc-15.2.0
xtensa                randconfig-001-20260616    gcc-8.5.0
xtensa                randconfig-002-20260615    gcc-15.2.0
xtensa                randconfig-002-20260615    gcc-8.5.0
xtensa                randconfig-002-20260616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

