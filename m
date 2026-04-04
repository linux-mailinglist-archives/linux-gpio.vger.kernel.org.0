Return-Path: <linux-gpio+bounces-34662-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCSxGwfk0GmIBgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34662-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 12:12:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA0439ABA3
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 12:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF4E63012C91
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 10:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7343A6EE8;
	Sat,  4 Apr 2026 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwLvsCoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005092F6904
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775297539; cv=none; b=qeK8PYqL39gjC5xp5FoFZDRs7d4IwAFXAZoMHV7MlQfGxqtii/LCYUyWjZ7bhu2CguPTTFZcy2IbZaHUhitk/6xkuYDwGaowmffpv6cDV3XRrsqFjtuP85VfGxtvvlTQleVFyrx35trbEUgC/N4mVkzRhHHMGSdSFOMcKSrIyYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775297539; c=relaxed/simple;
	bh=Cvp0G+bX6Oqdhbxx2UCKUhdGQwEUudoVufNbJWBpTdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XdJ3XPr4RKOLJPmZ9icDVlnmrjt8IYsOQ75OkErPkVdjaLODLSKo3qWtuzSM35XrsrC06iSEqEiksVyO6IcrfkXHryPug19DmJ+i467jghA2kFnqy3IPgLo7/yXOBqDwzNiQv9rhMj+2ooBJbtCSdO6EIcl5S5MBnWirYx0v36Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwLvsCoV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775297538; x=1806833538;
  h=date:from:to:cc:subject:message-id;
  bh=Cvp0G+bX6Oqdhbxx2UCKUhdGQwEUudoVufNbJWBpTdY=;
  b=dwLvsCoV1hvZP3YHqyajnW0cjz/49D0w5sxjEVU3oR4azUXcxUIHCBOF
   f+FxN92rFFFFs1zE4OaaaWT3spS+j3g/Tx4HFj3Vs8N3koziq7emh+Xv0
   4eu756OYwXG+/LNc7HMc5jtTL/sPoQ7CbBZNARowNPXSCXsBbrV7UzuG3
   3A2o4SaxEaeoXACUW/HvcLhCyuuFuiLCJxjXAoNpufoV/PZ5v0xVAUkYc
   NOKTa8G9/VlAyt9RrTXblTwtTnZmqdAOSZrIHr7g/VP0zpiYmgGVjF4SZ
   o8NBoyLieTJb8MQL516zHYDAMHRpim9S7GFuWSPIUhOsMPZsnRcEW4Pw4
   w==;
X-CSE-ConnectionGUID: Djs/l2TTTEyifnl4iv33Kg==
X-CSE-MsgGUID: qFK3VbqVTb2LablRCeWZYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76528772"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="76528772"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 03:12:18 -0700
X-CSE-ConnectionGUID: KHrj04nPQhWq2aDnWaOjlA==
X-CSE-MsgGUID: HAZFoYY5QMKI86dNVZ9PMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="232261197"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Apr 2026 03:12:16 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8xzB-000000000dL-3QAy;
	Sat, 04 Apr 2026 10:12:13 +0000
Date: Sat, 04 Apr 2026 18:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 b4464d8f313f903ba72db06042f3958a9a1e464a
Message-ID: <202604041828.qPU1cQ5b-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34662-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: DAA0439ABA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: b4464d8f313f903ba72db06042f3958a9a1e464a  power: sequencing: pcie-m2: add SERIAL_DEV_BUS dependency

elapsed time: 1262m

configs tested: 179
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260404    gcc-15.2.0
arc                   randconfig-002-20260404    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260404    gcc-15.2.0
arm                   randconfig-002-20260404    gcc-15.2.0
arm                   randconfig-003-20260404    gcc-15.2.0
arm                   randconfig-004-20260404    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-004-20260403    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-002-20260403    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-002-20260403    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-006-20260403    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260404    clang-20
i386                  randconfig-002-20260404    clang-20
i386                  randconfig-003-20260404    clang-20
i386                  randconfig-004-20260404    clang-20
i386                  randconfig-005-20260404    clang-20
i386                  randconfig-006-20260404    clang-20
i386                  randconfig-007-20260404    clang-20
i386                  randconfig-011-20260404    clang-20
i386                  randconfig-012-20260404    clang-20
i386                  randconfig-013-20260404    clang-20
i386                  randconfig-014-20260404    clang-20
i386                  randconfig-015-20260404    clang-20
i386                  randconfig-016-20260404    clang-20
i386                  randconfig-017-20260404    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-002-20260403    clang-23
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
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-002-20260403    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260404    clang-20
riscv                 randconfig-002-20260404    clang-20
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260404    clang-20
s390                  randconfig-002-20260404    clang-20
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260404    clang-20
sh                    randconfig-002-20260404    clang-20
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-002-20260403    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-002-20260403    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260403    clang-20
x86_64                randconfig-002-20260403    clang-20
x86_64                randconfig-003-20260403    clang-20
x86_64                randconfig-004-20260403    clang-20
x86_64                randconfig-005-20260403    clang-20
x86_64                randconfig-006-20260403    clang-20
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-071-20260404    gcc-14
x86_64                randconfig-072-20260404    gcc-14
x86_64                randconfig-073-20260404    gcc-14
x86_64                randconfig-074-20260404    gcc-14
x86_64                randconfig-075-20260404    gcc-14
x86_64                randconfig-076-20260404    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-002-20260403    clang-20
xtensa                    xip_kc705_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

