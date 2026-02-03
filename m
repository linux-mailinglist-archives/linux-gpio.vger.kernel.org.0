Return-Path: <linux-gpio+bounces-31407-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOAKJtoygml5QQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31407-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:39:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7733DCECF
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 156E6302497E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 17:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BAE32693E;
	Tue,  3 Feb 2026 17:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkpkFr0c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61E325734
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140375; cv=none; b=DoCmma6hINh2KPJQhdvHrYamtJ4tFR+gpV8WK/P8m0hP8XOOC/AioBk6G4k6uhO2n/HXpRj5G/yz6idqiT6/x9UKeSafDysdke3xJt+PecnN0StSVNiNRqIDw+/DB8nUgiENDxwIotNnl57TxleBcQ5/5c40L3A9dU5PZTgmhrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140375; c=relaxed/simple;
	bh=HhrXi6LT+4LBVGUeq4hAGUcBGT0XISjDI/FmRrfVFi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=osOCBvjxf9/gp6WH9Oyb//1jJJnG5BjrfrUlYG15JTq+U7ggUZ8VEUKLUprmcpFmN1mRo3wuEijSaQyZ+nr2wMXtmydGwppsHE6p1GwRhvA1FIDppRoK1NYgS7EpvU+ZxfniwxvPIW1hZUdUnooR6/7+2MHDZxgyitIFTOaExpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkpkFr0c; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770140373; x=1801676373;
  h=date:from:to:cc:subject:message-id;
  bh=HhrXi6LT+4LBVGUeq4hAGUcBGT0XISjDI/FmRrfVFi8=;
  b=IkpkFr0c0cRpMMjFeE2j8+qqcRm0lBtkoaHCN96Qn3gZZiR2DSMWrfG2
   Sl7mpwUgCtx+FPSJWlAoV9+ZeA4QavsLk5rGnFzKOAjKmnlPSE55WRrKJ
   IxG1CBncVVc2pANrHmHqNf7gKuwK1U4UeY5+l2wMBPXHBgTTpVeROC+r3
   cWHsKd5jRHqiAs0hpoiX+g3IMurTzSTmtQaiOr4IIwo3QdTzJ1Ukc+v1Z
   Xzv+hMMaPQ1OTWh3nR/iFgZ271nUd4yLABb700GYLmEBSJzVDjvD+WBLQ
   Wqxkp45ufe86do9EbbIeXW8iNamWY05B/AzfhZUB2iHTRBmzlHN9074PZ
   Q==;
X-CSE-ConnectionGUID: IoasNnGcTIunMjmf6fCApQ==
X-CSE-MsgGUID: FTE+dxMxTdWr6DeJlzXhFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73917316"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="73917316"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 09:39:32 -0800
X-CSE-ConnectionGUID: QRipyysCRVeBqm8esXboew==
X-CSE-MsgGUID: UDV/Z0vjSM+hrtbrnk8g+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209600558"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2026 09:39:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnKN7-00000000guu-0LAQ;
	Tue, 03 Feb 2026 17:39:29 +0000
Date: Wed, 04 Feb 2026 01:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 ca3299dc3d6d9791c7e4a9bb7474150e66a525fe
Message-ID: <202602040111.BDStm5YW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-31407-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E7733DCECF
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: ca3299dc3d6d9791c7e4a9bb7474150e66a525fe  pinctrl: mediatek: remove unused drv_offset field

elapsed time: 991m

configs tested: 253
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260203    gcc-12.5.0
arc                   randconfig-001-20260203    gcc-8.5.0
arc                   randconfig-002-20260203    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260203    gcc-12.5.0
arm                   randconfig-001-20260203    gcc-8.5.0
arm                   randconfig-002-20260203    clang-18
arm                   randconfig-002-20260203    gcc-12.5.0
arm                   randconfig-003-20260203    gcc-10.5.0
arm                   randconfig-003-20260203    gcc-12.5.0
arm                   randconfig-004-20260203    clang-16
arm                   randconfig-004-20260203    gcc-12.5.0
arm                        spear6xx_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260203    gcc-15.2.0
arm64                 randconfig-001-20260203    gcc-9.5.0
arm64                 randconfig-002-20260203    gcc-12.5.0
arm64                 randconfig-002-20260203    gcc-15.2.0
arm64                 randconfig-003-20260203    clang-22
arm64                 randconfig-003-20260203    gcc-15.2.0
arm64                 randconfig-004-20260203    clang-22
arm64                 randconfig-004-20260203    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260203    gcc-15.2.0
csky                  randconfig-002-20260203    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260203    clang-22
hexagon               randconfig-002-20260203    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260203    clang-20
i386        buildonly-randconfig-001-20260203    gcc-14
i386        buildonly-randconfig-002-20260203    clang-20
i386        buildonly-randconfig-002-20260203    gcc-13
i386        buildonly-randconfig-003-20260203    clang-20
i386        buildonly-randconfig-004-20260203    clang-20
i386        buildonly-randconfig-005-20260203    clang-20
i386        buildonly-randconfig-006-20260203    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260203    clang-20
i386                  randconfig-002-20260203    clang-20
i386                  randconfig-003-20260203    clang-20
i386                  randconfig-004-20260203    clang-20
i386                  randconfig-005-20260203    clang-20
i386                  randconfig-005-20260203    gcc-14
i386                  randconfig-006-20260203    clang-20
i386                  randconfig-007-20260203    clang-20
i386                  randconfig-007-20260203    gcc-14
i386                  randconfig-011-20260203    gcc-12
i386                  randconfig-011-20260203    gcc-14
i386                  randconfig-012-20260203    clang-20
i386                  randconfig-012-20260203    gcc-14
i386                  randconfig-013-20260203    clang-20
i386                  randconfig-013-20260203    gcc-14
i386                  randconfig-014-20260203    gcc-14
i386                  randconfig-015-20260203    clang-20
i386                  randconfig-015-20260203    gcc-14
i386                  randconfig-016-20260203    gcc-14
i386                  randconfig-017-20260203    clang-20
i386                  randconfig-017-20260203    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260203    clang-20
loongarch             randconfig-001-20260203    clang-22
loongarch             randconfig-002-20260203    clang-22
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
mips                        bcm63xx_defconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260203    clang-22
nios2                 randconfig-001-20260203    gcc-8.5.0
nios2                 randconfig-002-20260203    clang-22
nios2                 randconfig-002-20260203    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260203    gcc-12.5.0
parisc                randconfig-002-20260203    gcc-12.5.0
parisc                randconfig-002-20260203    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    gcc-15.2.0
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                   microwatt_defconfig    gcc-15.2.0
powerpc                     mpc512x_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260203    clang-22
powerpc               randconfig-001-20260203    gcc-12.5.0
powerpc               randconfig-002-20260203    gcc-10.5.0
powerpc               randconfig-002-20260203    gcc-12.5.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260203    clang-16
powerpc64             randconfig-001-20260203    gcc-12.5.0
powerpc64             randconfig-002-20260203    gcc-12.5.0
powerpc64             randconfig-002-20260203    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260203    gcc-8.5.0
riscv                 randconfig-002-20260203    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260203    gcc-8.5.0
s390                  randconfig-002-20260203    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                               j2_defconfig    gcc-15.2.0
sh                            migor_defconfig    gcc-15.2.0
sh                    randconfig-001-20260203    gcc-8.5.0
sh                    randconfig-002-20260203    gcc-8.5.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260203    gcc-13.4.0
sparc                 randconfig-001-20260203    gcc-8.5.0
sparc                 randconfig-002-20260203    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260203    clang-22
sparc64               randconfig-001-20260203    gcc-13.4.0
sparc64               randconfig-002-20260203    clang-22
sparc64               randconfig-002-20260203    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260203    clang-22
um                    randconfig-001-20260203    gcc-13.4.0
um                    randconfig-002-20260203    clang-20
um                    randconfig-002-20260203    gcc-13.4.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260203    clang-20
x86_64      buildonly-randconfig-002-20260203    clang-20
x86_64      buildonly-randconfig-003-20260203    clang-20
x86_64      buildonly-randconfig-004-20260203    clang-20
x86_64      buildonly-randconfig-004-20260203    gcc-14
x86_64      buildonly-randconfig-005-20260203    clang-20
x86_64      buildonly-randconfig-005-20260203    gcc-13
x86_64      buildonly-randconfig-006-20260203    clang-20
x86_64      buildonly-randconfig-006-20260203    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260203    clang-20
x86_64                randconfig-002-20260203    clang-20
x86_64                randconfig-002-20260203    gcc-14
x86_64                randconfig-003-20260203    clang-20
x86_64                randconfig-004-20260203    clang-20
x86_64                randconfig-004-20260203    gcc-14
x86_64                randconfig-005-20260203    clang-20
x86_64                randconfig-005-20260203    gcc-12
x86_64                randconfig-006-20260203    clang-20
x86_64                randconfig-006-20260203    gcc-14
x86_64                randconfig-011-20260203    gcc-14
x86_64                randconfig-012-20260203    gcc-14
x86_64                randconfig-013-20260203    gcc-14
x86_64                randconfig-014-20260203    gcc-14
x86_64                randconfig-015-20260203    gcc-14
x86_64                randconfig-016-20260203    gcc-14
x86_64                randconfig-071-20260203    gcc-14
x86_64                randconfig-072-20260203    gcc-14
x86_64                randconfig-073-20260203    gcc-14
x86_64                randconfig-074-20260203    gcc-14
x86_64                randconfig-075-20260203    gcc-14
x86_64                randconfig-076-20260203    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260203    gcc-13.4.0
xtensa                randconfig-001-20260203    gcc-14.3.0
xtensa                randconfig-002-20260203    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

