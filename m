Return-Path: <linux-gpio+bounces-39336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oK0iNctzRWoZAgsAu9opvQ
	(envelope-from <linux-gpio+bounces-39336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 22:08:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7F06F14B3
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 22:08:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=OVbnLUWq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39336-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39336-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8615305543D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 19:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E95438E8B1;
	Wed,  1 Jul 2026 19:56:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86314B959
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 19:56:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935781; cv=none; b=qccC67SmXrxD76caa4KUw2UdKm6GevmghkbRKDeS0k4WkxZA+BRZVCCRX6atIsOhqgQA5EZCbvYDnEzvM/PyImMLR17ZoKFchZYzoAS/WDRVArKYYnK/yJez0cQafPQaammEU8ktdRydApp0XthzoO2AcPqx05O6WMGi8llZjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935781; c=relaxed/simple;
	bh=1DPndQqHYnee5j8MBKMwZJHy98vjh75MxWQd5utYrxk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GVfm/WOOlkWbQZfE+oYZlquubkhnuMhh0MYi9L+TiGakyHm7jDgNE/mW3yXeadhDY0DPjdBsHiQDy6jLP3xxzS2vr+bl5wzvbi6EBKy7GT9rp728NQUHLi1eOFstAe9fFR6O9oeaz/ReGqoVzmKRMwhbl3coFVr/I8/iEjLcagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVbnLUWq; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782935779; x=1814471779;
  h=date:from:to:cc:subject:message-id;
  bh=1DPndQqHYnee5j8MBKMwZJHy98vjh75MxWQd5utYrxk=;
  b=OVbnLUWqWKfwMLo16F3eymjcVAVIw2wSIrzJTIos4pREmi9x88i4grDR
   NqJ1nHKIlLUd1PXzGj21kTCk8MKMp9pfwGfrayz2FxGstrJNoW40oPhlE
   ZCd9XAdI8ka8XlaPISPcqBQO7tkxJVdZ1cRI3jMqBriQBsRKXZVQWUgnc
   FNlsk/JbSOiPM2FUkGZi/UKl+pZGASVMFM2JiqGz4/Mq3RGamzaINEt64
   BmWtHVdFrhiZ3O21gG9VIhiofrfXsUAJzn8NQ7/vheOg9iED6K+3Mn+97
   2/tsBgIKlUUg4SSDXoSIsN8h+ZhHU8ZCfdw5za9uYGeA7IepHv1+BVdAg
   w==;
X-CSE-ConnectionGUID: u/MjfNISQmq8i/gv/V01ew==
X-CSE-MsgGUID: 6giIv+ZvQF2kbqCJlqvUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82795383"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82795383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 12:56:19 -0700
X-CSE-ConnectionGUID: pxSk6IitSkCusgSFi/xNeQ==
X-CSE-MsgGUID: V2shmJ0CRHmc0kKyXC0teg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="256993065"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2026 12:56:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf12c-000000009Zn-41Mx;
	Wed, 01 Jul 2026 19:56:14 +0000
Date: Thu, 02 Jul 2026 03:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom/for-current] BUILD SUCCESS
 437a8d2aa1aa442c4a176fdf4700a9b3bb0c8794
Message-ID: <202607020358.OTHo9sSf-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-39336-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B7F06F14B3

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-current
branch HEAD: 437a8d2aa1aa442c4a176fdf4700a9b3bb0c8794  pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151

elapsed time: 721m

configs tested: 371
configs skipped: 2

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
arc                   randconfig-001-20260702    gcc-8.5.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260701    gcc-12.5.0
arc                   randconfig-002-20260701    gcc-16.1.0
arc                   randconfig-002-20260702    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260701    gcc-12.5.0
arm                   randconfig-001-20260701    gcc-16.1.0
arm                   randconfig-001-20260702    gcc-8.5.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260701    gcc-12.5.0
arm                   randconfig-002-20260701    gcc-16.1.0
arm                   randconfig-002-20260702    gcc-8.5.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260701    gcc-12.5.0
arm                   randconfig-003-20260701    gcc-16.1.0
arm                   randconfig-003-20260702    gcc-8.5.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260701    gcc-12.5.0
arm                   randconfig-004-20260701    gcc-16.1.0
arm                   randconfig-004-20260702    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-12.5.0
arm64                 randconfig-001-20260701    gcc-12.5.0
arm64                 randconfig-001-20260702    gcc-15.2.0
arm64                          randconfig-002    gcc-12.5.0
arm64                 randconfig-002-20260701    gcc-12.5.0
arm64                 randconfig-002-20260702    gcc-15.2.0
arm64                          randconfig-003    gcc-12.5.0
arm64                 randconfig-003-20260701    gcc-12.5.0
arm64                 randconfig-003-20260702    gcc-15.2.0
arm64                          randconfig-004    gcc-12.5.0
arm64                 randconfig-004-20260701    gcc-12.5.0
arm64                 randconfig-004-20260702    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-12.5.0
csky                  randconfig-001-20260701    gcc-12.5.0
csky                  randconfig-001-20260702    gcc-15.2.0
csky                           randconfig-002    gcc-12.5.0
csky                  randconfig-002-20260701    gcc-12.5.0
csky                  randconfig-002-20260702    gcc-15.2.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260701    clang-23
hexagon               randconfig-001-20260701    gcc-11.5.0
hexagon               randconfig-001-20260702    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260701    clang-23
hexagon               randconfig-002-20260701    gcc-11.5.0
hexagon               randconfig-002-20260702    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260701    clang-22
i386        buildonly-randconfig-001-20260702    clang-22
i386        buildonly-randconfig-002-20260701    clang-22
i386        buildonly-randconfig-002-20260702    clang-22
i386        buildonly-randconfig-003-20260701    clang-22
i386        buildonly-randconfig-003-20260702    clang-22
i386        buildonly-randconfig-004-20260701    clang-22
i386        buildonly-randconfig-004-20260702    clang-22
i386        buildonly-randconfig-005-20260701    clang-22
i386        buildonly-randconfig-005-20260702    clang-22
i386        buildonly-randconfig-006-20260701    clang-22
i386        buildonly-randconfig-006-20260702    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260701    clang-22
i386                  randconfig-001-20260702    gcc-14
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260701    clang-22
i386                  randconfig-002-20260702    gcc-14
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260701    clang-22
i386                  randconfig-003-20260702    gcc-14
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260701    clang-22
i386                  randconfig-004-20260702    gcc-14
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260701    clang-22
i386                  randconfig-005-20260702    gcc-14
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260701    clang-22
i386                  randconfig-006-20260702    gcc-14
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260701    clang-22
i386                  randconfig-007-20260702    gcc-14
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260701    gcc-14
i386                  randconfig-011-20260702    clang-22
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260701    gcc-14
i386                  randconfig-012-20260702    clang-22
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260701    gcc-14
i386                  randconfig-013-20260702    clang-22
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260701    gcc-14
i386                  randconfig-014-20260702    clang-22
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260701    gcc-14
i386                  randconfig-015-20260702    clang-22
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260701    gcc-14
i386                  randconfig-016-20260702    clang-22
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260701    gcc-14
i386                  randconfig-017-20260702    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260701    clang-23
loongarch             randconfig-001-20260701    gcc-11.5.0
loongarch             randconfig-001-20260702    clang-23
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260701    clang-23
loongarch             randconfig-002-20260701    gcc-11.5.0
loongarch             randconfig-002-20260702    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                       m5329evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        omega2p_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260701    clang-23
nios2                 randconfig-001-20260701    gcc-11.5.0
nios2                 randconfig-001-20260702    clang-23
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260701    clang-23
nios2                 randconfig-002-20260701    gcc-11.5.0
nios2                 randconfig-002-20260702    clang-23
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
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260701    clang-17
parisc                randconfig-001-20260702    clang-17
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260701    clang-17
parisc                randconfig-002-20260702    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     mpc512x_defconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260701    clang-17
powerpc               randconfig-001-20260702    clang-17
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260701    clang-17
powerpc               randconfig-002-20260702    clang-17
powerpc                     redwood_defconfig    clang-23
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260701    clang-17
powerpc64             randconfig-001-20260702    clang-17
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260701    clang-17
powerpc64             randconfig-002-20260702    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260701    clang-23
riscv                 randconfig-001-20260702    gcc-12.5.0
riscv                 randconfig-002-20260701    clang-23
riscv                 randconfig-002-20260702    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260701    clang-23
s390                  randconfig-001-20260702    gcc-12.5.0
s390                  randconfig-002-20260701    clang-23
s390                  randconfig-002-20260702    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260701    clang-23
sh                    randconfig-001-20260702    gcc-12.5.0
sh                    randconfig-002-20260701    clang-23
sh                    randconfig-002-20260702    gcc-12.5.0
sh                           se7206_defconfig    gcc-16.1.0
sh                           se7750_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-13.4.0
sparc                 randconfig-001-20260701    gcc-13.4.0
sparc                 randconfig-001-20260702    gcc-16.1.0
sparc                          randconfig-002    gcc-13.4.0
sparc                 randconfig-002-20260701    gcc-13.4.0
sparc                 randconfig-002-20260702    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-13.4.0
sparc64               randconfig-001-20260701    gcc-13.4.0
sparc64               randconfig-001-20260702    gcc-16.1.0
sparc64                        randconfig-002    gcc-13.4.0
sparc64               randconfig-002-20260701    gcc-13.4.0
sparc64               randconfig-002-20260702    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-13.4.0
um                    randconfig-001-20260701    gcc-13.4.0
um                    randconfig-001-20260702    gcc-16.1.0
um                             randconfig-002    gcc-13.4.0
um                    randconfig-002-20260701    gcc-13.4.0
um                    randconfig-002-20260702    gcc-16.1.0
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
x86_64                randconfig-001-20260701    gcc-14
x86_64                randconfig-001-20260702    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260701    clang-22
x86_64                randconfig-002-20260701    gcc-14
x86_64                randconfig-002-20260702    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260701    clang-22
x86_64                randconfig-003-20260701    gcc-14
x86_64                randconfig-003-20260702    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260701    clang-22
x86_64                randconfig-004-20260701    gcc-14
x86_64                randconfig-004-20260702    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260701    clang-22
x86_64                randconfig-005-20260701    gcc-14
x86_64                randconfig-005-20260702    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260701    clang-22
x86_64                randconfig-006-20260701    gcc-14
x86_64                randconfig-006-20260702    clang-22
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
x86_64                randconfig-071-20260702    clang-22
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260701    gcc-14
x86_64                randconfig-072-20260702    clang-22
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260701    gcc-14
x86_64                randconfig-073-20260702    clang-22
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260701    gcc-14
x86_64                randconfig-074-20260702    clang-22
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260701    gcc-14
x86_64                randconfig-075-20260702    clang-22
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260701    gcc-14
x86_64                randconfig-076-20260702    clang-22
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
xtensa                randconfig-001-20260702    gcc-16.1.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260701    gcc-13.4.0
xtensa                randconfig-002-20260702    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

