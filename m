Return-Path: <linux-gpio+bounces-36253-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJlDBMuy+mltRwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36253-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:17:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D64D5D8C
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 05:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 820F1301951D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 03:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196B02DCF52;
	Wed,  6 May 2026 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cF73sOYJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5382C326D
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037444; cv=none; b=NKuYYze2JvQVe70odh53uB4btbN9doHImLHP+ufFfxP2z88RTNowctg078e6VrgWHPechcriVIq/l944TtRm4QFOjIK+tvoSApBRM7uK3K2JSW0hqZHpsUsVjdN0nQYELIdsmHrq13nSoRCrltK0IRn7WwjGM6YDmvwpxIxpruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037444; c=relaxed/simple;
	bh=Uc45QwszqnKFmNgJ6B7JzAUc8exeUNtg2aEXobwpHSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BAN9NC4PKQW7WsjoUYp5Ju7hjHxbxII397B9mUrCU6XvAt7PRCK5R1+Kdni9JPnrRWoOJzktHqsi89OFpaxmsysg+KxlmUZ5Fxd6W6eOyFydq4rRbFILOlxOjVeqXpDLxKi3cTDmLFj6KKBnQ8mbsj0DmEbFiq1aLDL+DphnkfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cF73sOYJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778037443; x=1809573443;
  h=date:from:to:cc:subject:message-id;
  bh=Uc45QwszqnKFmNgJ6B7JzAUc8exeUNtg2aEXobwpHSE=;
  b=cF73sOYJAOJkLhrty4EMorbbeJh9CFoldMIPuVRY2IgbMm3sDVU1dS6g
   PjGLWhXLGiusDMJUStLcsCTRwQSfSXavBMzD9EdcGyG3d5VEGiTb14Twg
   Fv7gDK5HKzBqEgPDrhszeMRFHL9mBTQnuG0+etkAb16AR75OP+SIZ+3Il
   w1UyfZuGTa/fHhRMzKqA3TSZPcA7il8le3jQ3aBq1MqhyR5JWQfDRFV3+
   W1p9BhzpNlx1PUUUAd5y2hoQUMkRsBMDJb6G5JJIACLzvwECIj4EGbHLs
   RvYhPytyiCTFQ8phUPj2v50ikSKlEcvxDXtRLYzvyMVRfBTozW+yXTeEY
   w==;
X-CSE-ConnectionGUID: Va/9SLhzRtS3Al9ByPyPAg==
X-CSE-MsgGUID: qtEOud2vROCFyergT7bL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78827988"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78827988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 20:17:22 -0700
X-CSE-ConnectionGUID: XvS2T+AeRx6NDXOd+uXyOw==
X-CSE-MsgGUID: i0EJwxhISPS09hDRAJL/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="266338331"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 May 2026 20:17:21 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKSlC-000000000fZ-0Xa1;
	Wed, 06 May 2026 03:17:18 +0000
Date: Wed, 06 May 2026 11:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 eccd2fde7dbc398a6aba9120c01247beeca55aec
Message-ID: <202605061155.WWgR5SL1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6B7D64D5D8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36253-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: eccd2fde7dbc398a6aba9120c01247beeca55aec  Merge branch 'devel' into for-next

elapsed time: 821m

configs tested: 262
configs skipped: 20

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
arc                   randconfig-001-20260506    gcc-12.5.0
arc                   randconfig-002-20260506    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260506    gcc-12.5.0
arm                   randconfig-002-20260506    gcc-12.5.0
arm                   randconfig-003-20260506    gcc-12.5.0
arm                   randconfig-004-20260506    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                 randconfig-001-20260506    gcc-15.2.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260505    gcc-14.3.0
arm64                 randconfig-002-20260506    gcc-15.2.0
arm64                          randconfig-003    gcc-14.3.0
arm64                 randconfig-003-20260505    gcc-14.3.0
arm64                 randconfig-003-20260506    gcc-15.2.0
arm64                          randconfig-004    gcc-14.3.0
arm64                 randconfig-004-20260505    gcc-14.3.0
arm64                 randconfig-004-20260506    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-14.3.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                  randconfig-001-20260506    gcc-15.2.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260505    gcc-14.3.0
csky                  randconfig-002-20260506    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260505    clang-23
hexagon               randconfig-001-20260506    clang-23
hexagon               randconfig-002-20260505    clang-23
hexagon               randconfig-002-20260506    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260505    gcc-14
i386        buildonly-randconfig-001-20260506    clang-20
i386        buildonly-randconfig-002-20260505    gcc-14
i386        buildonly-randconfig-002-20260506    clang-20
i386        buildonly-randconfig-003-20260505    gcc-14
i386        buildonly-randconfig-003-20260506    clang-20
i386        buildonly-randconfig-004-20260505    gcc-14
i386        buildonly-randconfig-004-20260506    clang-20
i386        buildonly-randconfig-005-20260505    gcc-14
i386        buildonly-randconfig-005-20260506    clang-20
i386        buildonly-randconfig-006-20260505    gcc-14
i386        buildonly-randconfig-006-20260506    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260505    clang-20
i386                  randconfig-001-20260506    gcc-14
i386                  randconfig-002-20260505    clang-20
i386                  randconfig-002-20260506    gcc-14
i386                  randconfig-003-20260505    clang-20
i386                  randconfig-003-20260506    gcc-14
i386                  randconfig-004-20260505    clang-20
i386                  randconfig-004-20260506    gcc-14
i386                  randconfig-005-20260505    clang-20
i386                  randconfig-005-20260506    gcc-14
i386                  randconfig-006-20260505    clang-20
i386                  randconfig-006-20260506    gcc-14
i386                  randconfig-007-20260505    clang-20
i386                  randconfig-007-20260506    gcc-14
i386                  randconfig-011-20260506    clang-20
i386                  randconfig-012-20260506    clang-20
i386                  randconfig-013-20260506    clang-20
i386                  randconfig-014-20260506    clang-20
i386                  randconfig-015-20260506    clang-20
i386                  randconfig-016-20260506    clang-20
i386                  randconfig-017-20260506    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260505    clang-23
loongarch             randconfig-001-20260506    clang-23
loongarch             randconfig-002-20260505    clang-23
loongarch             randconfig-002-20260506    clang-23
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
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260505    clang-23
nios2                 randconfig-001-20260506    clang-23
nios2                 randconfig-001-20260506    gcc-8.5.0
nios2                 randconfig-002-20260505    clang-23
nios2                 randconfig-002-20260506    clang-23
nios2                 randconfig-002-20260506    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc         de0_nano_multicore_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                randconfig-001-20260506    gcc-13.4.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc                randconfig-002-20260506    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc               randconfig-001-20260506    gcc-13.4.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc               randconfig-002-20260506    gcc-13.4.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64             randconfig-001-20260506    gcc-13.4.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
powerpc64             randconfig-002-20260506    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260506    gcc-8.5.0
riscv                 randconfig-002-20260506    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260506    gcc-8.5.0
s390                  randconfig-002-20260506    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260506    gcc-8.5.0
sh                    randconfig-002-20260506    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-15.2.0
sparc                 randconfig-001-20260505    gcc-15.2.0
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260505    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-15.2.0
sparc64               randconfig-001-20260505    gcc-15.2.0
sparc64                        randconfig-002    gcc-15.2.0
sparc64               randconfig-002-20260505    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-15.2.0
um                    randconfig-001-20260505    gcc-15.2.0
um                             randconfig-002    gcc-15.2.0
um                    randconfig-002-20260505    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    gcc-14
x86_64      buildonly-randconfig-003-20260505    gcc-14
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-005-20260505    gcc-14
x86_64      buildonly-randconfig-005-20260506    clang-20
x86_64      buildonly-randconfig-005-20260506    gcc-14
x86_64      buildonly-randconfig-006-20260505    gcc-14
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260505    clang-20
x86_64                randconfig-001-20260506    clang-20
x86_64                randconfig-002-20260505    clang-20
x86_64                randconfig-002-20260506    clang-20
x86_64                randconfig-003-20260505    clang-20
x86_64                randconfig-003-20260506    clang-20
x86_64                randconfig-004-20260505    clang-20
x86_64                randconfig-004-20260506    clang-20
x86_64                randconfig-005-20260505    clang-20
x86_64                randconfig-005-20260506    clang-20
x86_64                randconfig-006-20260505    clang-20
x86_64                randconfig-006-20260506    clang-20
x86_64                randconfig-011-20260506    clang-20
x86_64                randconfig-012-20260506    clang-20
x86_64                randconfig-013-20260506    clang-20
x86_64                randconfig-014-20260506    clang-20
x86_64                randconfig-015-20260506    clang-20
x86_64                randconfig-015-20260506    gcc-12
x86_64                randconfig-016-20260506    clang-20
x86_64                randconfig-016-20260506    gcc-12
x86_64                randconfig-071-20260505    clang-20
x86_64                randconfig-071-20260506    clang-20
x86_64                randconfig-072-20260505    clang-20
x86_64                randconfig-072-20260506    clang-20
x86_64                randconfig-073-20260505    clang-20
x86_64                randconfig-073-20260506    clang-20
x86_64                randconfig-074-20260505    clang-20
x86_64                randconfig-074-20260506    clang-20
x86_64                randconfig-075-20260505    clang-20
x86_64                randconfig-075-20260506    clang-20
x86_64                randconfig-076-20260505    clang-20
x86_64                randconfig-076-20260506    clang-20
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
xtensa                         randconfig-001    gcc-15.2.0
xtensa                randconfig-001-20260505    gcc-15.2.0
xtensa                         randconfig-002    gcc-15.2.0
xtensa                randconfig-002-20260505    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

