Return-Path: <linux-gpio+bounces-36092-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHTDCHMD+WlK4QIAu9opvQ
	(envelope-from <linux-gpio+bounces-36092-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:37:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D94C395B
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E68C5301A500
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 20:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0648B30FF31;
	Mon,  4 May 2026 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjOfO2W3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0642D877D
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927021; cv=none; b=akp9LCTpeg3sWUGBjQ5B31pIkFpAtcLCxSebMcCdmmQ09EcWQ+QxXMudBNRtnV9lXCmKJ4N6fVEGcpNV9/B7AHg/mxHXi/exEbL6+4mUcrEtbcbgVz1RyQR+Eg2NzHiCmQhpEIi6P+SLZqxDajYbDmnn2/l4VcUFTeZ++LpTVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927021; c=relaxed/simple;
	bh=wiO9n3yAKBcX/iy4C1PpQBqHkMSEk+3vmf9N6o0pFv8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aawfngUn/uAfGmNV4bPoKDmDxjKQ+yZdkVwfXnNDF5BLzJWyJxeSRfkif+SAld8Ysz+02wsU/52xbuHiEuDR91oQlx6Luv/Suc8YwvJCfqCLywB/L4R6X0gSFbk+uShHwXeX+kAdIWd58WLH0CdU1oCky9tltFIl9CROOgFj2kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjOfO2W3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777927019; x=1809463019;
  h=date:from:to:cc:subject:message-id;
  bh=wiO9n3yAKBcX/iy4C1PpQBqHkMSEk+3vmf9N6o0pFv8=;
  b=HjOfO2W3n1R4vb6okzp6kRh6Hwvg3W9nQNlE32xIS3U/P5e/XOpQQNiQ
   xSp0ZZMrb2uh38NZgQYf4hb9D0hfCo50ivGjmSgE42bSWA7xnAfRgd3be
   Z/DIrzBpgHTHyqgvCdF9nmwwqxxOZgUOvJBgUcZUCROwuiDagaQksB/5P
   dW+jgc//0AIQs8pWbvNSsgr0DcGvwfpY/JyVTBQjc4omcmP55JvyS6nT6
   7OKmBKryvTd0NU/I7lB2QtU56MWs+r//t51ZJ7x85IbysRz3/8/8e9um6
   MrPAdAhsXQK6CNnhBc1Mvm+vh1wfcvIV/BfrVLJEIox1myJoNePmiXogr
   g==;
X-CSE-ConnectionGUID: SIPgX9voSjCe/VVIlqdzuQ==
X-CSE-MsgGUID: MDTDgwQUQXm8XtAePFg/xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78814898"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78814898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 13:36:59 -0700
X-CSE-ConnectionGUID: ZiYkuPVeQmS+m7kap6WIjQ==
X-CSE-MsgGUID: F0uJmKpCRzijqIedT51ucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="235488505"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 May 2026 13:36:57 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK025-00000000403-1nb8;
	Mon, 04 May 2026 20:36:51 +0000
Date: Tue, 05 May 2026 04:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 bfdc854ba63bc815cf710701f889544a9d27df83
Message-ID: <202605050451.YER7fQbR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 862D94C395B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36092-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: bfdc854ba63bc815cf710701f889544a9d27df83  gpiolib: move legacy interface into linux/gpio/legacy.h

elapsed time: 728m

configs tested: 289
configs skipped: 42

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
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260504    gcc-13.4.0
arc                   randconfig-001-20260504    gcc-8.5.0
arc                   randconfig-001-20260505    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260504    gcc-13.4.0
arc                   randconfig-002-20260504    gcc-8.5.0
arc                   randconfig-002-20260505    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260504    gcc-13.4.0
arm                   randconfig-001-20260504    gcc-8.5.0
arm                   randconfig-001-20260505    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260504    gcc-13.4.0
arm                   randconfig-002-20260504    gcc-8.5.0
arm                   randconfig-002-20260505    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260504    gcc-13.4.0
arm                   randconfig-003-20260504    gcc-8.5.0
arm                   randconfig-003-20260505    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260504    gcc-13.4.0
arm                   randconfig-004-20260504    gcc-8.5.0
arm                   randconfig-004-20260505    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260504    gcc-15.2.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                 randconfig-002-20260504    gcc-15.2.0
arm64                 randconfig-003-20260504    gcc-15.2.0
arm64                 randconfig-004-20260504    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260504    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                  randconfig-002-20260504    gcc-15.2.0
csky                  randconfig-002-20260505    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260504    clang-23
hexagon               randconfig-001-20260505    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260504    clang-23
hexagon               randconfig-002-20260505    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260504    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260504    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260504    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260504    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260504    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260504    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260504    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260504    clang-20
i386                  randconfig-002-20260504    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260504    clang-20
i386                  randconfig-003-20260504    gcc-14
i386                  randconfig-004-20260504    clang-20
i386                  randconfig-004-20260504    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260504    clang-20
i386                  randconfig-005-20260504    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260504    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260504    clang-20
i386                  randconfig-011-20260504    clang-20
i386                  randconfig-011-20260505    clang-20
i386                  randconfig-012-20260504    clang-20
i386                  randconfig-012-20260505    clang-20
i386                  randconfig-013-20260504    clang-20
i386                  randconfig-013-20260505    clang-20
i386                  randconfig-014-20260504    clang-20
i386                  randconfig-014-20260505    clang-20
i386                  randconfig-015-20260504    clang-20
i386                  randconfig-015-20260505    clang-20
i386                  randconfig-016-20260504    clang-20
i386                  randconfig-016-20260505    clang-20
i386                  randconfig-017-20260504    clang-20
i386                  randconfig-017-20260505    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260504    clang-23
loongarch             randconfig-001-20260505    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260504    clang-23
loongarch             randconfig-002-20260505    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           rs90_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260504    clang-23
nios2                 randconfig-001-20260504    gcc-11.5.0
nios2                 randconfig-001-20260505    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260504    clang-23
nios2                 randconfig-002-20260504    gcc-11.5.0
nios2                 randconfig-002-20260505    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260504    gcc-13.4.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260504    gcc-13.4.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      pmac32_defconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260504    gcc-13.4.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260504    gcc-13.4.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260504    gcc-13.4.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260504    gcc-13.4.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260504    gcc-8.5.0
riscv                 randconfig-002-20260504    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260504    gcc-8.5.0
s390                  randconfig-002-20260504    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260504    gcc-8.5.0
sh                    randconfig-002-20260504    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260504    gcc-8.5.0
sparc                 randconfig-002-20260504    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260504    gcc-8.5.0
sparc64               randconfig-002-20260504    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260504    gcc-8.5.0
um                    randconfig-002-20260504    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260504    gcc-12
x86_64               buildonly-randconfig-002    gcc-12
x86_64      buildonly-randconfig-002-20260504    gcc-12
x86_64               buildonly-randconfig-003    gcc-12
x86_64      buildonly-randconfig-003-20260504    gcc-12
x86_64               buildonly-randconfig-004    gcc-12
x86_64      buildonly-randconfig-004-20260504    gcc-12
x86_64               buildonly-randconfig-005    gcc-12
x86_64      buildonly-randconfig-005-20260504    gcc-12
x86_64               buildonly-randconfig-006    gcc-12
x86_64      buildonly-randconfig-006-20260504    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260504    clang-20
x86_64                randconfig-001-20260504    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260504    clang-20
x86_64                randconfig-002-20260504    gcc-14
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260504    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260504    clang-20
x86_64                randconfig-004-20260504    gcc-14
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260504    clang-20
x86_64                randconfig-005-20260504    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260504    clang-20
x86_64                randconfig-006-20260504    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260504    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260504    gcc-14
x86_64                         randconfig-013    clang-20
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260504    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260504    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260504    clang-20
x86_64                randconfig-015-20260504    gcc-14
x86_64                         randconfig-016    clang-20
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260504    clang-20
x86_64                randconfig-016-20260504    gcc-14
x86_64                randconfig-071-20260504    clang-20
x86_64                randconfig-072-20260504    clang-20
x86_64                randconfig-073-20260504    clang-20
x86_64                randconfig-074-20260504    clang-20
x86_64                randconfig-075-20260504    clang-20
x86_64                randconfig-076-20260504    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-11.5.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260504    gcc-8.5.0
xtensa                randconfig-002-20260504    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

