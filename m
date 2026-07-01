Return-Path: <linux-gpio+bounces-39338-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7EwOJc6ARWovBQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39338-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 23:04:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DADCC6F1BA5
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 23:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HGoYdLdj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39338-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39338-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68E7530F2EF5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 20:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABCB39B97B;
	Wed,  1 Jul 2026 20:57:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AE6397E64
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 20:57:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939461; cv=none; b=UDjL5bolSz2C6wvPo65tBWUgeTEwL2xTdPuhsUK1i9WOXhb8V3Iz/goKJ5IyM+1+sHGKT1XMdBgPgZ2UnNduxCM8h0RR8+K7ITM22DhkN1LjYp0xdo3rHIfgbyG9LuOWIeIiov0/M9O0i3CFTvohmAKTPFj6GBMYl1hw8lIECVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939461; c=relaxed/simple;
	bh=uitFzxxLB4bV4w7R8kb2L9S8FPkX1YzPgqLm/v0SiV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F8uwwKrLlH5P7Unq+vCNqO0v79/txWDYddaV2WmXNZpT3rrNeTytQZ4gTW3xy/ZbpOUtMjvBiQFA5+f9o3e0jWkaEmUiPERm81/4Ec4h5IhSu52ZJKWU8n+w2RWM3WDq/3LsowaWAhOE+OKr12sTorYs6zsXFcwIINUbISgEitM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGoYdLdj; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782939461; x=1814475461;
  h=date:from:to:cc:subject:message-id;
  bh=uitFzxxLB4bV4w7R8kb2L9S8FPkX1YzPgqLm/v0SiV8=;
  b=HGoYdLdjNqSJzpp3DOX/e3WtM4Jjxmu1FkT/N9Qb74WHosDUd3AP9x+C
   mZub8nZA42cyn+hPTXId/ZtVFn3NFWXhxVNhp0qYtYpiatb5jzLEh6AHr
   YrzD1lThgcG1Tyz7JpzO10Be1F34uYHlObyM2CMdgi8G2oxppmN2Fo4e+
   EPxeEoKfBBUIHeABSvCLRPw8kdyoxjejPEqoLtHzQkVH7pkw310LXbgxm
   AaamfGtVZFJE9bntDwT/k3kMNcDgHu03stjswXvQKuzH1NwHu+5uO8nbB
   fNBI6Xi6r2EpF4HOs7D6qwvg8vqjBgBwOC6nvkouSq7vQwQd57YlmZV/Q
   Q==;
X-CSE-ConnectionGUID: dUdnnnOvQsW/1idDzszuDg==
X-CSE-MsgGUID: iMllolvWQ3CeID1TnffEVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106480631"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="106480631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 13:57:40 -0700
X-CSE-ConnectionGUID: CnljzxnTRoG+/BAiZlEGwA==
X-CSE-MsgGUID: VZvmvWD+TVulfYWZusTHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="250023358"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jul 2026 13:57:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf1zz-000000009cZ-3RXu;
	Wed, 01 Jul 2026 20:57:35 +0000
Date: Thu, 02 Jul 2026 04:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 9777530157e7b82fd994327ff878c4245dadc931
Message-ID: <202607020446.BO5JcYGK-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-39338-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DADCC6F1BA5

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 9777530157e7b82fd994327ff878c4245dadc931  pinctrl: meson: restore non-sleeping GPIO access

elapsed time: 782m

configs tested: 288
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
arc                         haps_hs_defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260701    gcc-12.5.0
arc                   randconfig-001-20260701    gcc-16.1.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260701    gcc-12.5.0
arc                   randconfig-002-20260701    gcc-16.1.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260701    gcc-12.5.0
arm                   randconfig-001-20260701    gcc-16.1.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260701    gcc-12.5.0
arm                   randconfig-002-20260701    gcc-16.1.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260701    gcc-12.5.0
arm                   randconfig-003-20260701    gcc-16.1.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260701    gcc-12.5.0
arm                   randconfig-004-20260701    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-12.5.0
arm64                 randconfig-001-20260701    gcc-12.5.0
arm64                          randconfig-002    gcc-12.5.0
arm64                 randconfig-002-20260701    gcc-12.5.0
arm64                          randconfig-003    gcc-12.5.0
arm64                 randconfig-003-20260701    gcc-12.5.0
arm64                          randconfig-004    gcc-12.5.0
arm64                 randconfig-004-20260701    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-12.5.0
csky                  randconfig-001-20260701    gcc-12.5.0
csky                           randconfig-002    gcc-12.5.0
csky                  randconfig-002-20260701    gcc-12.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260701    clang-23
hexagon               randconfig-001-20260701    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260701    clang-23
hexagon               randconfig-002-20260701    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260701    clang-22
i386        buildonly-randconfig-002-20260701    clang-22
i386        buildonly-randconfig-003-20260701    clang-22
i386        buildonly-randconfig-004-20260701    clang-22
i386        buildonly-randconfig-005-20260701    clang-22
i386        buildonly-randconfig-006-20260701    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260701    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260701    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260701    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260701    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260701    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260701    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260701    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260701    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260701    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260701    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260701    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260701    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260701    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260701    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260701    clang-23
loongarch             randconfig-001-20260701    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260701    clang-23
loongarch             randconfig-002-20260701    gcc-11.5.0
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
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260701    clang-23
nios2                 randconfig-001-20260701    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260701    clang-23
nios2                 randconfig-002-20260701    gcc-11.5.0
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
parisc                randconfig-001-20260701    clang-17
parisc                randconfig-002-20260701    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     mpc512x_defconfig    clang-23
powerpc               randconfig-001-20260701    clang-17
powerpc               randconfig-002-20260701    clang-17
powerpc                     redwood_defconfig    clang-23
powerpc64             randconfig-001-20260701    clang-17
powerpc64             randconfig-002-20260701    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260701    clang-23
riscv                 randconfig-002-20260701    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260701    clang-23
s390                  randconfig-002-20260701    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260701    clang-23
sh                    randconfig-002-20260701    clang-23
sh                           se7206_defconfig    gcc-16.1.0
sh                           se7619_defconfig    gcc-16.1.0
sh                           se7750_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-13.4.0
sparc                 randconfig-001-20260701    gcc-13.4.0
sparc                          randconfig-002    gcc-13.4.0
sparc                 randconfig-002-20260701    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-13.4.0
sparc64               randconfig-001-20260701    gcc-13.4.0
sparc64                        randconfig-002    gcc-13.4.0
sparc64               randconfig-002-20260701    gcc-13.4.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-13.4.0
um                    randconfig-001-20260701    gcc-13.4.0
um                             randconfig-002    gcc-13.4.0
um                    randconfig-002-20260701    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260701    clang-22
x86_64      buildonly-randconfig-001-20260702    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260701    clang-22
x86_64      buildonly-randconfig-002-20260702    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260701    clang-22
x86_64      buildonly-randconfig-003-20260702    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260701    clang-22
x86_64      buildonly-randconfig-004-20260702    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260701    clang-22
x86_64      buildonly-randconfig-005-20260702    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260701    clang-22
x86_64      buildonly-randconfig-006-20260702    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260701    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260701    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260701    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260701    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260701    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260701    clang-22
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260701    gcc-14
x86_64                randconfig-011-20260702    clang-22
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260701    gcc-14
x86_64                randconfig-012-20260702    clang-22
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260701    gcc-14
x86_64                randconfig-013-20260702    clang-22
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260701    gcc-14
x86_64                randconfig-014-20260702    clang-22
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260701    gcc-14
x86_64                randconfig-015-20260702    clang-22
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260701    gcc-14
x86_64                randconfig-016-20260702    clang-22
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260701    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260701    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260701    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260701    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260701    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260701    gcc-14
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
xtensa                         randconfig-001    gcc-13.4.0
xtensa                randconfig-001-20260701    gcc-13.4.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260701    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

