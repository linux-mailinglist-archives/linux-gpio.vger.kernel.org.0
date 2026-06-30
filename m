Return-Path: <linux-gpio+bounces-39174-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Whf/FZ58Q2roZAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39174-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 10:21:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D926E19D3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 10:21:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FYw1XRh9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39174-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39174-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C918E3017271
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 08:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF6938236D;
	Tue, 30 Jun 2026 08:21:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39593344D80
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 08:21:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807707; cv=none; b=J1InpBcJLmbXZqR7IWYFoMAZsLVZaeUEqLc2A5Zh7xZKYYrKTD3PBeqqjYj7tcehXmXbay4qub0YOSBtrzMSQuYSEZVGXqe3FTj5VoeE3SYYc23ggDzP0/0PcSDAksITHqP30gvnCx2UkDuAUSyXXQhRxCwTHsjLkVFvXjQjylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807707; c=relaxed/simple;
	bh=WOllUVT/0OT+fmV9kJmOp7Ys9QTpCYCBBYxHqqDOxS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N7zsvUK2qBUv4dcchWL6l9SWWzjNnL/mpdC2U4zAI9ODW+93leiiltqWzOCEvAOc+jisYhbvN29svJrihC440VlYJERCc1Y7tutE69clC4vy1IRBqWPq5c2UKUHkCYPzueZyBDF3OluwMnk+0B2bUaTAB1c+UzypOcnQgGizzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYw1XRh9; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782807706; x=1814343706;
  h=date:from:to:cc:subject:message-id;
  bh=WOllUVT/0OT+fmV9kJmOp7Ys9QTpCYCBBYxHqqDOxS0=;
  b=FYw1XRh9/HlNqtfJi9MZjBcJ0tYJzirzjKNJCwJb/FQuw5Bdxi4BtFM2
   fibtkRvdSL4Oc6HfrCAiXmaZXnnHPRtXgkLGai6wEmqHhiSjnWAzY9K6s
   L3wLbViAyKBEsHlEtv0uGyDQ/GfE5J4DjK5zgZeGuSs/pO7KsBK7j2wUN
   ibCCRP3h4CRo0PXpyfZ0ZH+tTfAlqXTQo1vBaOcQmXhCfvTQW4oT/CZ5X
   OQs/3GTIXKWsE8ijrdh3/3JBC/Z40CnWSRwGlKp4CvEY8vclZFcSM8i1Y
   MyNelHfufFHNL7PO4lpdRCsMJ7dTBz+1FFmmQlMOHoVNmXGaGSR8wyj4j
   Q==;
X-CSE-ConnectionGUID: uRGXG0LZTdSSlwhGAnwnoA==
X-CSE-MsgGUID: RktJcISSQOSNH5qOB/d5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82626096"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="82626096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:21:46 -0700
X-CSE-ConnectionGUID: 1TEsKlh7Sa6XMrOsZfa0og==
X-CSE-MsgGUID: Qu/OnkpBREyVAxQloizd4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248834690"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2026 01:21:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weTim-00000000887-2cr0;
	Tue, 30 Jun 2026 08:21:35 +0000
Date: Tue, 30 Jun 2026 16:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 45bd4e25f81f3afb550f04376a54f4c5e1d5ab11
Message-ID: <202606301618.BvXiYjl6-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-39174-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4D926E19D3

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 45bd4e25f81f3afb550f04376a54f4c5e1d5ab11  gpio: amd-fch: switch to guard() notation

elapsed time: 732m

configs tested: 204
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260630    clang-23
arc                   randconfig-002-20260630    clang-23
arc                    vdk_hs38_smp_defconfig    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260630    clang-23
arm                   randconfig-002-20260630    clang-23
arm                   randconfig-003-20260630    clang-23
arm                   randconfig-004-20260630    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260630    clang-23
arm64                 randconfig-002-20260630    clang-23
arm64                 randconfig-003-20260630    clang-23
arm64                 randconfig-004-20260630    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260630    clang-23
csky                  randconfig-002-20260630    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260630    clang-18
hexagon               randconfig-002-20260630    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260630    clang-22
i386        buildonly-randconfig-002-20260630    clang-22
i386        buildonly-randconfig-003-20260630    clang-22
i386        buildonly-randconfig-004-20260630    clang-22
i386        buildonly-randconfig-005-20260630    clang-22
i386        buildonly-randconfig-006-20260630    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260630    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260630    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260630    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260630    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260630    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260630    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260630    clang-22
i386                  randconfig-011-20260630    gcc-12
i386                  randconfig-012-20260630    gcc-12
i386                  randconfig-013-20260630    gcc-12
i386                  randconfig-014-20260630    gcc-12
i386                  randconfig-015-20260630    gcc-12
i386                  randconfig-016-20260630    gcc-12
i386                  randconfig-017-20260630    gcc-12
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260630    clang-18
loongarch             randconfig-002-20260630    clang-18
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
mips                      malta_kvm_defconfig    gcc-16.1.0
mips                        qi_lb60_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260630    clang-18
nios2                 randconfig-002-20260630    clang-18
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-22
parisc                randconfig-001-20260630    clang-22
parisc                         randconfig-002    clang-22
parisc                randconfig-002-20260630    clang-22
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-22
powerpc               randconfig-001-20260630    clang-22
powerpc                        randconfig-002    clang-22
powerpc               randconfig-002-20260630    clang-22
powerpc                        warp_defconfig    gcc-16.1.0
powerpc64                      randconfig-001    clang-22
powerpc64             randconfig-001-20260630    clang-22
powerpc64                      randconfig-002    clang-22
powerpc64             randconfig-002-20260630    clang-22
riscv                            alldefconfig    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260630    gcc-9.5.0
riscv                 randconfig-002-20260630    gcc-9.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260630    gcc-9.5.0
s390                  randconfig-002-20260630    gcc-9.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260630    gcc-9.5.0
sh                    randconfig-002-20260630    gcc-9.5.0
sh                          rsk7201_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260630    clang-17
sparc                 randconfig-002-20260630    clang-17
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260630    clang-17
sparc64               randconfig-002-20260630    clang-17
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260630    clang-17
um                    randconfig-002-20260630    clang-17
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260630    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260630    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260630    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260630    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260630    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260630    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260630    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260630    gcc-14
x86_64                         randconfig-003    gcc-14
x86_64                randconfig-003-20260630    gcc-14
x86_64                         randconfig-004    gcc-14
x86_64                randconfig-004-20260630    gcc-14
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260630    gcc-14
x86_64                         randconfig-006    gcc-14
x86_64                randconfig-006-20260630    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260630    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260630    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260630    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260630    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260630    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260630    gcc-14
x86_64                randconfig-071-20260630    clang-22
x86_64                randconfig-072-20260630    clang-22
x86_64                randconfig-073-20260630    clang-22
x86_64                randconfig-074-20260630    clang-22
x86_64                randconfig-075-20260630    clang-22
x86_64                randconfig-076-20260630    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260630    clang-17
xtensa                randconfig-002-20260630    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

