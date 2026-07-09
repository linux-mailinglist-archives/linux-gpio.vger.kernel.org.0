Return-Path: <linux-gpio+bounces-39695-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IyvcDeo/T2p3cwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39695-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:30:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3272D283
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 08:30:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=nQ3kYl2c;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39695-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39695-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E867330053C0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 06:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742C43C415E;
	Thu,  9 Jul 2026 06:29:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA79383985
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 06:29:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578596; cv=none; b=aV3IeUFwtsJDEnlVyw0exHfw3L2nb3EO91MGNGeWcI8nbm39Lb3SIbMiIb/iEHZilVR4vwpKQE/q4IlZ9kakh0T5S4AsS3HaCamv++jPu9/6F1W12vJK/w2QRpGxjqG34ll+H13XYKIWF+rlaukAqLJ/mpGTWMtp79lppj9XQCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578596; c=relaxed/simple;
	bh=hL2UwWZp3+2kRz2zzVlyXptjzSV2BQmpmwl942JFcwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XT9XXAstDyEBKhZlgA50KCZ4OFVGNHneBrHeUfa/NjPtI3uC2XceYL/q73O/AaJPsSUOEK0kZTaP1zxpUrCW6ichedNrLM3uKeBigcn1pDzswvnM0QxRg0TC7OF0ayk3SDQks7bEiwfV9eqmFvix0J0XKpktzMscgANvUghLJ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQ3kYl2c; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783578594; x=1815114594;
  h=date:from:to:cc:subject:message-id;
  bh=hL2UwWZp3+2kRz2zzVlyXptjzSV2BQmpmwl942JFcwg=;
  b=nQ3kYl2cdX76UCdcIFBZVVdiexCX3xQX6pa5s60dJH4t4k2AAiEPtBqd
   CwtZ1ztUUkwlNHkAulqYwGoyxv/RR8XhbuKQUDaffU1JcYmfiZ6FeWJmv
   1pH1mGZfApsQa/jFgdm8gWO/OS5asibOq9YYVN5ehjBBcmYuOrM5OjIA8
   1WUD6B7k5pvnx4Qcqpj+UU0u7iR+k/JnazG5v594gDyDybdVqXX8MJwSa
   cGL4Oof89cJM0lYx01h9K8/BTVG4s4UjerAFcspAPsYcL5XAiq8HnyyiJ
   3j+8z3iXbCXmA6hRGLZPM4DTdkS+UvpDt/wItaQ08cOPUhlsz8lZnlPRX
   w==;
X-CSE-ConnectionGUID: gmrp+ovLROy08OhrVoZU8Q==
X-CSE-MsgGUID: aYnDcuA6SdmBMBM5+VNc0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101797404"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101797404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 23:29:53 -0700
X-CSE-ConnectionGUID: yL75nc5gQ+GTMN1FpAXMCg==
X-CSE-MsgGUID: vPvA743lS/S2TzPJQPM78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252745941"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2026 23:29:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whiGZ-00000000HLZ-29g4;
	Thu, 09 Jul 2026 06:29:47 +0000
Date: Thu, 09 Jul 2026 14:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom/for-next] BUILD SUCCESS
 77fbc756d9cbe53a9496cb2c53ae209d37d5af2d
Message-ID: <202607091426.qdDLy9Dn-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39695-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:from_mime,intel.com:dkim,intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13B3272D283

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: 77fbc756d9cbe53a9496cb2c53ae209d37d5af2d  Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"

elapsed time: 1101m

configs tested: 188
configs skipped: 6

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
arc                        nsim_700_defconfig    gcc-16.1.0
arc                   randconfig-001-20260709    gcc-8.5.0
arc                   randconfig-002-20260709    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                         nhk8815_defconfig    clang-23
arm                   randconfig-001-20260709    gcc-8.5.0
arm                   randconfig-002-20260709    gcc-8.5.0
arm                   randconfig-003-20260709    gcc-8.5.0
arm                   randconfig-004-20260709    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260709    gcc-16.1.0
arm64                 randconfig-002-20260709    gcc-16.1.0
arm64                 randconfig-003-20260709    gcc-16.1.0
arm64                 randconfig-004-20260709    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260709    gcc-16.1.0
csky                  randconfig-002-20260709    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260709    clang-18
hexagon               randconfig-002-20260709    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260709    gcc-14
i386        buildonly-randconfig-002-20260709    gcc-14
i386        buildonly-randconfig-003-20260709    gcc-14
i386        buildonly-randconfig-004-20260709    gcc-14
i386        buildonly-randconfig-005-20260709    gcc-14
i386        buildonly-randconfig-006-20260709    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260709    gcc-14
i386                  randconfig-002-20260709    gcc-14
i386                  randconfig-003-20260709    gcc-14
i386                  randconfig-004-20260709    gcc-14
i386                  randconfig-005-20260709    gcc-14
i386                  randconfig-006-20260709    gcc-14
i386                  randconfig-007-20260709    gcc-14
i386                  randconfig-011-20260709    gcc-14
i386                  randconfig-012-20260709    gcc-14
i386                  randconfig-013-20260709    gcc-14
i386                  randconfig-014-20260709    gcc-14
i386                  randconfig-015-20260709    gcc-14
i386                  randconfig-016-20260709    gcc-14
i386                  randconfig-017-20260709    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260709    clang-18
loongarch             randconfig-002-20260709    clang-18
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
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260709    clang-18
nios2                 randconfig-002-20260709    clang-18
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260709    clang-23
parisc                randconfig-002-20260709    clang-23
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                   microwatt_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260709    clang-23
powerpc               randconfig-002-20260709    clang-23
powerpc                     tqm8555_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260709    clang-23
powerpc64             randconfig-002-20260709    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260709    clang-22
riscv                 randconfig-002-20260709    clang-22
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260709    clang-22
s390                  randconfig-002-20260709    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260709    clang-22
sh                    randconfig-002-20260709    clang-22
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260709    gcc-8.5.0
sparc                 randconfig-002-20260709    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260709    gcc-8.5.0
sparc64               randconfig-002-20260709    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260709    gcc-8.5.0
um                    randconfig-002-20260709    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260709    clang-22
x86_64      buildonly-randconfig-002-20260709    clang-22
x86_64      buildonly-randconfig-003-20260709    clang-22
x86_64      buildonly-randconfig-004-20260709    clang-22
x86_64      buildonly-randconfig-005-20260709    clang-22
x86_64      buildonly-randconfig-006-20260709    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260709    gcc-14
x86_64                randconfig-002-20260709    gcc-14
x86_64                randconfig-003-20260709    gcc-14
x86_64                randconfig-004-20260709    gcc-14
x86_64                randconfig-005-20260709    gcc-14
x86_64                randconfig-006-20260709    gcc-14
x86_64                randconfig-011-20260709    gcc-14
x86_64                randconfig-012-20260709    gcc-14
x86_64                randconfig-013-20260709    gcc-14
x86_64                randconfig-014-20260709    gcc-14
x86_64                randconfig-015-20260709    gcc-14
x86_64                randconfig-016-20260709    gcc-14
x86_64                randconfig-071-20260709    clang-22
x86_64                randconfig-072-20260709    clang-22
x86_64                randconfig-073-20260709    clang-22
x86_64                randconfig-074-20260709    clang-22
x86_64                randconfig-075-20260709    clang-22
x86_64                randconfig-076-20260709    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260709    gcc-8.5.0
xtensa                randconfig-002-20260709    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

