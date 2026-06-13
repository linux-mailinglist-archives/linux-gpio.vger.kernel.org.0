Return-Path: <linux-gpio+bounces-38410-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GCytBazcLWqrlgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38410-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 00:41:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3F67FF04
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 00:41:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=AX8JraoQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38410-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38410-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49272300FEED
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 22:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0B03451CD;
	Sat, 13 Jun 2026 22:41:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A179223DCE
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jun 2026 22:41:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781390504; cv=none; b=BobRjhF+l21vvSal6GafSscVEWcbWhDm0IFrmxIaCGKy6bMAXInLaXjLf8JHPbb3anvQX8WmN/6EDFYwdyKEi60POc8A/cdZDCaIcNclqD4Qetoo0bQYOUQ1d2uZffEuqdH2RTftPxtOWHZxabS/PghjEaEe8LSeGSsH24ptKeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781390504; c=relaxed/simple;
	bh=DmZJQL0F44zCW/EDnHxLmxMSu7wuoIbzybSMbTeTgm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gjD01vYcE7p72XdM/0T6XIstV1q8hllCAWEUAsrlOOeoHy90PZIJLmJ5CKWHVgy/P93XhP20UbjgwDjQD/IqD1tdtw4gESBweG66j8YhuPFaTlkT1AYQ03T4+1wmWN9GwW1l8mc6gSrd6JLXcmaluIwIc200RVb1yGxUaVFOaYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AX8JraoQ; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781390503; x=1812926503;
  h=date:from:to:cc:subject:message-id;
  bh=DmZJQL0F44zCW/EDnHxLmxMSu7wuoIbzybSMbTeTgm4=;
  b=AX8JraoQNo1gHwl27A/080hpQ81KCgQlCQs4PQsP/NIlUydW9/VFddEW
   toSGbb8EOovlc2aMLRFmlgJ7fOBeT7sTvGL1Af6dFZyt8MH8qUN7tCA6l
   aJ2PzihlzkeU1bsxWjJhBN8WD3T+TfzfGqalxSeJry3Erk/ukhwh195dh
   R/7hDxio5RmfQg+tOOy18OGaLh7hecpigSRWWeVvL/eWpm2FpE8rD07WV
   A98WK0HLejozlRAIf5Fj+O72FzC5ucZnHaRRi6OmDcDh+qPSuPJwNFtPc
   dQTA64p8RHfQ1A02Hm7cXk8vAvKjpsDOSLO/UYk1N+pQ5FgVc15sQAP8h
   g==;
X-CSE-ConnectionGUID: towgfrD9QzegKwxjRtVb1A==
X-CSE-MsgGUID: PJdev1cpREGOfv5TcjL4Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93675356"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="93675356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 15:41:42 -0700
X-CSE-ConnectionGUID: 718OAj9CQlCU63IIb7dTaQ==
X-CSE-MsgGUID: sKjswOcnRyil6m2twnlWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="249017880"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2026 15:41:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYX2o-00000000QKY-2Ct8;
	Sat, 13 Jun 2026 22:41:38 +0000
Date: Sun, 14 Jun 2026 06:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 ca250bb102083c8d68394f4fb519cd5b612e1227
Message-ID: <202606140635.y089s4JA-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38410-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCE3F67FF04

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: ca250bb102083c8d68394f4fb519cd5b612e1227  Merge branch 'devel' into for-next

elapsed time: 834m

configs tested: 359
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-12.5.0
arc                   randconfig-001-20260613    gcc-12.5.0
arc                   randconfig-001-20260614    gcc-11.5.0
arc                            randconfig-002    gcc-12.5.0
arc                   randconfig-002-20260613    gcc-12.5.0
arc                   randconfig-002-20260613    gcc-14.3.0
arc                   randconfig-002-20260614    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                         lpc32xx_defconfig    clang-17
arm                            randconfig-001    gcc-12.5.0
arm                   randconfig-001-20260613    gcc-12.5.0
arm                   randconfig-001-20260613    gcc-8.5.0
arm                   randconfig-001-20260614    gcc-11.5.0
arm                            randconfig-002    gcc-12.5.0
arm                   randconfig-002-20260613    clang-17
arm                   randconfig-002-20260613    gcc-12.5.0
arm                   randconfig-002-20260614    gcc-11.5.0
arm                            randconfig-003    gcc-12.5.0
arm                   randconfig-003-20260613    clang-23
arm                   randconfig-003-20260613    gcc-12.5.0
arm                   randconfig-003-20260614    gcc-11.5.0
arm                            randconfig-004    gcc-12.5.0
arm                   randconfig-004-20260613    clang-23
arm                   randconfig-004-20260613    gcc-12.5.0
arm                   randconfig-004-20260614    gcc-11.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260613    gcc-16.1.0
arm64                 randconfig-001-20260614    gcc-11.5.0
arm64                 randconfig-002-20260613    clang-16
arm64                 randconfig-002-20260613    gcc-16.1.0
arm64                 randconfig-002-20260614    gcc-11.5.0
arm64                 randconfig-003-20260613    clang-23
arm64                 randconfig-003-20260613    gcc-16.1.0
arm64                 randconfig-003-20260614    gcc-11.5.0
arm64                 randconfig-004-20260613    clang-19
arm64                 randconfig-004-20260613    gcc-16.1.0
arm64                 randconfig-004-20260614    gcc-11.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260613    gcc-16.1.0
csky                  randconfig-001-20260614    gcc-11.5.0
csky                  randconfig-002-20260613    gcc-16.1.0
csky                  randconfig-002-20260614    gcc-11.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260613    gcc-11.5.0
hexagon               randconfig-001-20260614    clang-16
hexagon               randconfig-001-20260614    clang-17
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260613    gcc-11.5.0
hexagon               randconfig-002-20260614    clang-16
hexagon               randconfig-002-20260614    clang-17
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260613    gcc-14
i386        buildonly-randconfig-001-20260614    gcc-14
i386                 buildonly-randconfig-002    clang-22
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260613    gcc-14
i386        buildonly-randconfig-002-20260614    gcc-14
i386                 buildonly-randconfig-003    clang-22
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260613    clang-22
i386        buildonly-randconfig-003-20260613    gcc-14
i386        buildonly-randconfig-003-20260614    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260613    gcc-13
i386        buildonly-randconfig-004-20260613    gcc-14
i386        buildonly-randconfig-004-20260614    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260613    clang-22
i386        buildonly-randconfig-005-20260613    gcc-14
i386        buildonly-randconfig-005-20260614    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260613    gcc-14
i386        buildonly-randconfig-006-20260614    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260613    clang-22
i386                  randconfig-001-20260613    gcc-14
i386                  randconfig-001-20260614    clang-22
i386                  randconfig-002-20260613    clang-22
i386                  randconfig-002-20260614    clang-22
i386                  randconfig-003-20260613    clang-22
i386                  randconfig-003-20260613    gcc-14
i386                  randconfig-003-20260614    clang-22
i386                  randconfig-004-20260613    clang-22
i386                  randconfig-004-20260614    clang-22
i386                  randconfig-005-20260613    clang-22
i386                  randconfig-005-20260614    clang-22
i386                  randconfig-006-20260613    clang-22
i386                  randconfig-006-20260613    gcc-14
i386                  randconfig-006-20260614    clang-22
i386                  randconfig-007-20260613    clang-22
i386                  randconfig-007-20260614    clang-22
i386                           randconfig-011    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260613    clang-22
i386                  randconfig-011-20260613    gcc-14
i386                  randconfig-011-20260614    clang-22
i386                           randconfig-012    clang-22
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260613    clang-22
i386                  randconfig-012-20260613    gcc-14
i386                  randconfig-012-20260614    clang-22
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260613    gcc-14
i386                  randconfig-013-20260614    clang-22
i386                           randconfig-014    clang-22
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260613    gcc-14
i386                  randconfig-014-20260614    clang-22
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260613    gcc-14
i386                  randconfig-015-20260614    clang-22
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260613    gcc-14
i386                  randconfig-016-20260614    clang-22
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260613    gcc-14
i386                  randconfig-017-20260614    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260613    gcc-11.5.0
loongarch             randconfig-001-20260614    clang-16
loongarch             randconfig-001-20260614    clang-17
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260613    gcc-11.5.0
loongarch             randconfig-002-20260614    clang-16
loongarch             randconfig-002-20260614    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                malta_qemu_32r6_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260613    gcc-11.5.0
nios2                 randconfig-001-20260614    clang-16
nios2                 randconfig-001-20260614    clang-17
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260613    gcc-11.5.0
nios2                 randconfig-002-20260614    clang-16
nios2                 randconfig-002-20260614    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-23
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-15.2.0
parisc                randconfig-001-20260613    gcc-15.2.0
parisc                randconfig-001-20260613    gcc-9.5.0
parisc                randconfig-001-20260614    gcc-12.5.0
parisc                         randconfig-002    gcc-15.2.0
parisc                randconfig-002-20260613    gcc-15.2.0
parisc                randconfig-002-20260614    gcc-12.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                  mpc885_ads_defconfig    clang-23
powerpc                        randconfig-001    gcc-15.2.0
powerpc               randconfig-001-20260613    gcc-14.3.0
powerpc               randconfig-001-20260613    gcc-15.2.0
powerpc               randconfig-001-20260614    gcc-12.5.0
powerpc                        randconfig-002    gcc-15.2.0
powerpc               randconfig-002-20260613    gcc-15.2.0
powerpc               randconfig-002-20260613    gcc-8.5.0
powerpc               randconfig-002-20260614    gcc-12.5.0
powerpc64                      randconfig-001    gcc-15.2.0
powerpc64             randconfig-001-20260613    clang-23
powerpc64             randconfig-001-20260613    gcc-15.2.0
powerpc64             randconfig-001-20260614    gcc-12.5.0
powerpc64                      randconfig-002    gcc-15.2.0
powerpc64             randconfig-002-20260613    clang-16
powerpc64             randconfig-002-20260613    gcc-15.2.0
powerpc64             randconfig-002-20260614    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-9.5.0
riscv                 randconfig-001-20260613    gcc-10.5.0
riscv                 randconfig-001-20260614    gcc-9.5.0
riscv                          randconfig-002    gcc-9.5.0
riscv                 randconfig-002-20260613    gcc-10.5.0
riscv                 randconfig-002-20260614    gcc-9.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-9.5.0
s390                  randconfig-001-20260613    gcc-10.5.0
s390                  randconfig-001-20260614    gcc-9.5.0
s390                           randconfig-002    gcc-9.5.0
s390                  randconfig-002-20260613    gcc-10.5.0
s390                  randconfig-002-20260614    gcc-9.5.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-23
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                          r7780mp_defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-9.5.0
sh                    randconfig-001-20260613    gcc-10.5.0
sh                    randconfig-001-20260614    gcc-9.5.0
sh                             randconfig-002    gcc-9.5.0
sh                    randconfig-002-20260613    gcc-10.5.0
sh                    randconfig-002-20260614    gcc-9.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260613    gcc-11.5.0
sparc                 randconfig-001-20260613    gcc-13.4.0
sparc                 randconfig-001-20260614    gcc-8.5.0
sparc                 randconfig-002-20260613    gcc-13.4.0
sparc                 randconfig-002-20260614    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260613    gcc-11.5.0
sparc64               randconfig-001-20260613    gcc-13.4.0
sparc64               randconfig-001-20260614    gcc-8.5.0
sparc64               randconfig-002-20260613    clang-23
sparc64               randconfig-002-20260613    gcc-13.4.0
sparc64               randconfig-002-20260614    gcc-8.5.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260613    gcc-13.4.0
um                    randconfig-001-20260613    gcc-14
um                    randconfig-001-20260614    gcc-8.5.0
um                    randconfig-002-20260613    gcc-13.4.0
um                    randconfig-002-20260613    gcc-14
um                    randconfig-002-20260614    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260613    clang-22
x86_64      buildonly-randconfig-001-20260614    gcc-14
x86_64      buildonly-randconfig-002-20260613    clang-22
x86_64      buildonly-randconfig-002-20260614    gcc-14
x86_64      buildonly-randconfig-003-20260613    clang-22
x86_64      buildonly-randconfig-003-20260614    gcc-14
x86_64      buildonly-randconfig-004-20260613    clang-22
x86_64      buildonly-randconfig-004-20260614    gcc-14
x86_64      buildonly-randconfig-005-20260613    clang-22
x86_64      buildonly-randconfig-005-20260614    gcc-14
x86_64      buildonly-randconfig-006-20260613    clang-22
x86_64      buildonly-randconfig-006-20260614    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260613    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260613    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260613    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260613    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260613    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260613    clang-22
x86_64                randconfig-011-20260613    clang-22
x86_64                randconfig-011-20260614    clang-22
x86_64                randconfig-012-20260613    clang-22
x86_64                randconfig-012-20260614    clang-22
x86_64                randconfig-013-20260613    clang-22
x86_64                randconfig-013-20260614    clang-22
x86_64                randconfig-014-20260613    clang-22
x86_64                randconfig-014-20260614    clang-22
x86_64                randconfig-015-20260613    clang-22
x86_64                randconfig-015-20260614    clang-22
x86_64                randconfig-016-20260613    clang-22
x86_64                randconfig-016-20260614    clang-22
x86_64                randconfig-071-20260613    clang-22
x86_64                randconfig-071-20260614    clang-22
x86_64                randconfig-072-20260613    clang-22
x86_64                randconfig-072-20260614    clang-22
x86_64                randconfig-073-20260613    clang-22
x86_64                randconfig-073-20260614    clang-22
x86_64                randconfig-074-20260613    gcc-13
x86_64                randconfig-074-20260614    clang-22
x86_64                randconfig-075-20260613    gcc-14
x86_64                randconfig-075-20260614    clang-22
x86_64                randconfig-076-20260613    gcc-14
x86_64                randconfig-076-20260614    clang-22
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
xtensa                randconfig-001-20260613    gcc-11.5.0
xtensa                randconfig-001-20260613    gcc-13.4.0
xtensa                randconfig-001-20260614    gcc-8.5.0
xtensa                randconfig-002-20260613    gcc-13.4.0
xtensa                randconfig-002-20260613    gcc-8.5.0
xtensa                randconfig-002-20260614    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

