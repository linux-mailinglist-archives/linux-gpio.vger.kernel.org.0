Return-Path: <linux-gpio+bounces-36792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MENC6rXBGovPwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:57:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7C53A408
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DB2130138BB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E453B2D04;
	Wed, 13 May 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Or/VKpTp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38623AA1BD
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702245; cv=none; b=pNzB/DL0XzWSmrbz6waiIwSBanK60O6Su9YdMGfXxC6QieWTJyFLEo3TT8+GWUZy2aDcv63jl3ORnfSJe2GJkM/x8QSFoV83NCZl1OBs6mE91G0Ay57fjEF9z+6lEkf5OhhAIQ3uzVeiiOv/B9ncrB8p6ta7+kNTDY2DOq7eALg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702245; c=relaxed/simple;
	bh=1FpJHdbIy/jQ9RGEUhAZUkhPIgdLsvk3FJU33ly//Q4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OPPDZsU9DvLA7WAIjYuCA6rkOKEaG1J5kdbgenT0Hu6GLJhadjl5AsWjQI5JVKQXLKjI+cXB43z6fF2V49vQCAaXMJxkt1q12+EeTUeY7aHZnuXGN8YK+K4FYi6ULWRpyC0Bdt/pYaJ206iTCRBW6JCYdez4ZDIslF7ghdmgMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Or/VKpTp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778702244; x=1810238244;
  h=date:from:to:cc:subject:message-id;
  bh=1FpJHdbIy/jQ9RGEUhAZUkhPIgdLsvk3FJU33ly//Q4=;
  b=Or/VKpTpZDs+68Kp2WUR9HkJIOrW3If5k5ltk3clMUzzBLTFgLkWhPNZ
   xioJdDQHUjwG9Q1vjdKpCzv1LUAFq7eEvFV+LE6WypJUHC6GM+H9mzLW0
   I4RkRmGLmOi4OUn3MJznXg4YunQk4ONisZ+GmcOLT3E5gbgnbAcSECcYf
   alzUQwUVDRJDGb2j9nM/NEgbPo7Pkt2JtGTVJNQo0un7cDb5p24pyJCI+
   /dkGMggly+wh+X53kWpduWUABNGebWNpRKmaMvvOP/C3GC9zpdNtQ6DPM
   hHOyyGKOp2KC62gZzsAwAIkhJoe6a7tIDHnDQ4bEWIUS3QdCygLUQRri+
   Q==;
X-CSE-ConnectionGUID: 4WygEjAYSe2X5wxinJrecQ==
X-CSE-MsgGUID: b4LGl9n9QdWKRdwLHQbdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78782509"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="78782509"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:57:23 -0700
X-CSE-ConnectionGUID: 1F8JXld2RLyAYVM/1Itb/Q==
X-CSE-MsgGUID: WH2DT9ROSX+U3DLcpUkiDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="268521170"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 May 2026 12:57:21 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNFhn-000000004zb-0PeI;
	Wed, 13 May 2026 19:57:19 +0000
Date: Thu, 14 May 2026 03:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 296bf5205ce3eae9ca7c7487459c9357b5116f1f
Message-ID: <202605140324.xNRLIuUf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 8FB7C53A408
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
	TAGGED_FROM(0.00)[bounces-36792-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 296bf5205ce3eae9ca7c7487459c9357b5116f1f  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 282
configs skipped: 6

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
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260513    gcc-14.3.0
arc                   randconfig-001-20260514    clang-23
arc                   randconfig-002-20260513    gcc-14.3.0
arc                   randconfig-002-20260514    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                        multi_v7_defconfig    gcc-15.2.0
arm                   randconfig-001-20260513    gcc-14.3.0
arm                   randconfig-001-20260514    clang-23
arm                   randconfig-002-20260513    gcc-14.3.0
arm                   randconfig-002-20260514    clang-23
arm                   randconfig-003-20260513    gcc-14.3.0
arm                   randconfig-003-20260514    clang-23
arm                   randconfig-004-20260513    gcc-14.3.0
arm                   randconfig-004-20260514    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260513    clang-23
arm64                 randconfig-001-20260513    gcc-12.5.0
arm64                 randconfig-001-20260514    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260513    clang-23
arm64                 randconfig-002-20260513    gcc-12.5.0
arm64                 randconfig-002-20260514    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260513    clang-23
arm64                 randconfig-003-20260513    gcc-12.5.0
arm64                 randconfig-003-20260514    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260513    clang-23
arm64                 randconfig-004-20260513    gcc-12.5.0
arm64                 randconfig-004-20260514    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260513    clang-23
csky                  randconfig-001-20260513    gcc-12.5.0
csky                  randconfig-001-20260514    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260513    clang-23
csky                  randconfig-002-20260513    gcc-12.5.0
csky                  randconfig-002-20260514    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260513    gcc-11.5.0
hexagon               randconfig-001-20260513    gcc-8.5.0
hexagon               randconfig-001-20260514    gcc-10.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260513    gcc-11.5.0
hexagon               randconfig-002-20260513    gcc-8.5.0
hexagon               randconfig-002-20260514    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260513    clang-20
i386        buildonly-randconfig-001-20260514    gcc-14
i386        buildonly-randconfig-002-20260513    clang-20
i386        buildonly-randconfig-002-20260514    gcc-14
i386        buildonly-randconfig-003-20260513    clang-20
i386        buildonly-randconfig-003-20260514    gcc-14
i386        buildonly-randconfig-004-20260513    clang-20
i386        buildonly-randconfig-004-20260514    gcc-14
i386        buildonly-randconfig-005-20260513    clang-20
i386        buildonly-randconfig-005-20260514    gcc-14
i386        buildonly-randconfig-006-20260513    clang-20
i386        buildonly-randconfig-006-20260514    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260513    clang-20
i386                  randconfig-001-20260514    clang-20
i386                  randconfig-002-20260513    clang-20
i386                  randconfig-002-20260514    clang-20
i386                  randconfig-003-20260513    clang-20
i386                  randconfig-003-20260514    clang-20
i386                  randconfig-004-20260513    clang-20
i386                  randconfig-004-20260514    clang-20
i386                  randconfig-005-20260513    clang-20
i386                  randconfig-005-20260514    clang-20
i386                  randconfig-006-20260513    clang-20
i386                  randconfig-006-20260514    clang-20
i386                  randconfig-007-20260513    clang-20
i386                  randconfig-007-20260514    clang-20
i386                  randconfig-011-20260513    clang-20
i386                  randconfig-012-20260513    clang-20
i386                  randconfig-013-20260513    clang-20
i386                  randconfig-014-20260513    clang-20
i386                  randconfig-015-20260513    clang-20
i386                  randconfig-016-20260513    clang-20
i386                  randconfig-017-20260513    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260513    gcc-11.5.0
loongarch             randconfig-001-20260513    gcc-8.5.0
loongarch             randconfig-001-20260514    gcc-10.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260513    gcc-11.5.0
loongarch             randconfig-002-20260513    gcc-8.5.0
loongarch             randconfig-002-20260514    gcc-10.5.0
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
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260513    gcc-11.5.0
nios2                 randconfig-001-20260513    gcc-8.5.0
nios2                 randconfig-001-20260514    gcc-10.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260513    gcc-11.5.0
nios2                 randconfig-002-20260513    gcc-8.5.0
nios2                 randconfig-002-20260514    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                   de0_nano_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260513    gcc-8.5.0
parisc                randconfig-002-20260513    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260513    gcc-8.5.0
powerpc               randconfig-002-20260513    gcc-8.5.0
powerpc64             randconfig-001-20260513    gcc-8.5.0
powerpc64             randconfig-002-20260513    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260513    gcc-15.2.0
riscv                 randconfig-001-20260514    gcc-14.3.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260513    gcc-15.2.0
riscv                 randconfig-002-20260514    gcc-14.3.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260513    gcc-15.2.0
s390                  randconfig-001-20260514    gcc-14.3.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260513    gcc-15.2.0
s390                  randconfig-002-20260514    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260513    gcc-15.2.0
sh                    randconfig-001-20260514    gcc-14.3.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260513    gcc-15.2.0
sh                    randconfig-002-20260514    gcc-14.3.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-11.5.0
sparc                 randconfig-001-20260513    gcc-11.5.0
sparc                 randconfig-001-20260514    gcc-15.2.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260513    gcc-11.5.0
sparc                 randconfig-002-20260514    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-11.5.0
sparc64               randconfig-001-20260513    gcc-11.5.0
sparc64               randconfig-001-20260514    gcc-15.2.0
sparc64                        randconfig-002    gcc-11.5.0
sparc64               randconfig-002-20260513    gcc-11.5.0
sparc64               randconfig-002-20260514    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-11.5.0
um                    randconfig-001-20260513    gcc-11.5.0
um                    randconfig-001-20260514    gcc-15.2.0
um                             randconfig-002    gcc-11.5.0
um                    randconfig-002-20260513    gcc-11.5.0
um                    randconfig-002-20260514    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260513    gcc-12
x86_64               buildonly-randconfig-002    gcc-12
x86_64      buildonly-randconfig-002-20260513    gcc-12
x86_64               buildonly-randconfig-003    gcc-12
x86_64      buildonly-randconfig-003-20260513    gcc-12
x86_64               buildonly-randconfig-004    gcc-12
x86_64      buildonly-randconfig-004-20260513    gcc-12
x86_64               buildonly-randconfig-005    gcc-12
x86_64      buildonly-randconfig-005-20260513    gcc-12
x86_64               buildonly-randconfig-006    gcc-12
x86_64      buildonly-randconfig-006-20260513    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260513    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260513    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260513    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260513    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260513    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260513    clang-20
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260513    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260513    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260513    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260513    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260513    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260513    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260513    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260513    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260513    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260513    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260513    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260513    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-11.5.0
xtensa                randconfig-001-20260513    gcc-11.5.0
xtensa                randconfig-001-20260514    gcc-15.2.0
xtensa                         randconfig-002    gcc-11.5.0
xtensa                randconfig-002-20260513    gcc-11.5.0
xtensa                randconfig-002-20260514    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

