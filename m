Return-Path: <linux-gpio+bounces-33581-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCR4BoVjuGlOdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33581-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:09:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B862A00A9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93E44300E6B8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 20:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B793ED119;
	Mon, 16 Mar 2026 20:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jd/7Ggtt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B43DB633
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691771; cv=none; b=J1as75K4K1qqMrREKB3Lnj9+LIKfdawgvZhaIBlUIwVP9r0vkLUZFJhPvGFcujRBThVfPwFl7tLBN+Z4afujQjbh0cdI8E5C6V5u3H41KrnmIn/srPA07rya41aEHqrcBqY7NlLe3Ucu/5vh8IU/voaUXpAjMDQx2dCSNrInfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691771; c=relaxed/simple;
	bh=UnJjK1vLXsP9X6KIM+qsc8rTrc5fuCVpluQ5n4/LoLA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oavVTInaIFht+Ch4oJNm+DACOUB13if1N5Iq7koT90PnXUq4I8yNcxtBjppAwo009tf19hQETyLO9UWbt0dHJi6PSViCGF34Pys8kc0FQNJPkCt1cgAcpDidpNOnGHU5UPpqI2cOkKwC9RQ4BUlI3ZPK258SYAzlhNlPWldZS/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jd/7Ggtt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773691770; x=1805227770;
  h=date:from:to:cc:subject:message-id;
  bh=UnJjK1vLXsP9X6KIM+qsc8rTrc5fuCVpluQ5n4/LoLA=;
  b=jd/7Ggtthf9ORyobMvW3wgL+DkRbpcCKiABhkt/VZlDElohluyYo5nbZ
   nL69YoT0qYB3YHr/mBoBwVpQfY2ww1fWYJ+2ZonCCre3j05qUgpXHJRQE
   14pi7AUcCyr/ayNx8b+DgmnDS+nmksHYnoK5D3kM/SarN60d/PDsRO2PW
   aeZtoanWdTMYRbPu1+pZLFT98X16rhYPKCp8E6IcBuKJqyQSzpIIQ9xsZ
   vItXmS7H5uxJpqkOes2FWHYALw0bNXIs057wBC+N8Yp++f2H34Yzna3n1
   MnXiJceUKdzreeDMrPayKHZdff5NjSLNn2+r9X9YfZwCp9WC7g6Sz02p4
   Q==;
X-CSE-ConnectionGUID: DNbWV3BuRdS2DKMq+GVdqQ==
X-CSE-MsgGUID: e7AKF2tVS3m1RUogF+ZiZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78320526"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78320526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 13:09:29 -0700
X-CSE-ConnectionGUID: /DAh7lTqT06UmUNDsJFAZQ==
X-CSE-MsgGUID: j3/7+//8Rh6HnJ0gcishLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222237636"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 13:09:28 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2EFi-000000001EQ-03aJ;
	Mon, 16 Mar 2026 20:09:26 +0000
Date: Tue, 17 Mar 2026 04:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/no-y-uapi1-default] BUILD SUCCESS
 64fc6cc12d312b163f5ef635a58a3f313db2fc60
Message-ID: <202603170445.BxWsCQrx-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33581-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 36B862A00A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/no-y-uapi1-default
branch HEAD: 64fc6cc12d312b163f5ef635a58a3f313db2fc60  Do not enable the v1 uAPI by default

elapsed time: 1494m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260316    gcc-10.5.0
arc                   randconfig-002-20260316    gcc-9.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260316    clang-23
arm                   randconfig-002-20260316    clang-23
arm                   randconfig-003-20260316    clang-23
arm                   randconfig-004-20260316    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260316    gcc-11.5.0
arm64                 randconfig-002-20260316    clang-23
arm64                 randconfig-003-20260316    clang-23
arm64                 randconfig-004-20260316    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260316    gcc-15.2.0
csky                  randconfig-002-20260316    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260317    clang-23
hexagon               randconfig-002-20260317    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260316    clang-20
i386        buildonly-randconfig-002-20260316    gcc-14
i386        buildonly-randconfig-003-20260316    clang-20
i386        buildonly-randconfig-004-20260316    clang-20
i386        buildonly-randconfig-005-20260316    clang-20
i386        buildonly-randconfig-006-20260316    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260316    gcc-14
i386                  randconfig-002-20260316    clang-20
i386                  randconfig-003-20260316    gcc-14
i386                  randconfig-004-20260316    gcc-14
i386                  randconfig-005-20260316    clang-20
i386                  randconfig-006-20260316    gcc-12
i386                  randconfig-007-20260316    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch             randconfig-001-20260317    clang-23
loongarch             randconfig-002-20260317    clang-18
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260317    gcc-8.5.0
nios2                 randconfig-002-20260317    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260316    gcc-8.5.0
parisc                randconfig-002-20260316    gcc-12.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260316    clang-23
powerpc               randconfig-002-20260316    clang-23
powerpc64             randconfig-001-20260316    gcc-13.4.0
powerpc64             randconfig-002-20260316    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260316    gcc-15.2.0
riscv                 randconfig-002-20260316    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260316    clang-18
s390                  randconfig-002-20260316    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260316    gcc-15.2.0
sh                    randconfig-002-20260316    gcc-12.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260316    gcc-8.5.0
sparc                 randconfig-002-20260316    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260316    gcc-8.5.0
sparc64               randconfig-002-20260316    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260316    gcc-14
um                    randconfig-002-20260316    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260316    gcc-14
x86_64      buildonly-randconfig-002-20260316    clang-20
x86_64      buildonly-randconfig-003-20260316    clang-20
x86_64      buildonly-randconfig-004-20260316    gcc-14
x86_64      buildonly-randconfig-005-20260316    gcc-14
x86_64      buildonly-randconfig-006-20260316    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20260317    gcc-14
x86_64                randconfig-014-20260317    gcc-14
x86_64                randconfig-071-20260316    gcc-12
x86_64                randconfig-072-20260316    gcc-14
x86_64                randconfig-073-20260316    gcc-14
x86_64                randconfig-074-20260316    gcc-14
x86_64                randconfig-075-20260316    clang-20
x86_64                randconfig-076-20260316    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260316    gcc-15.2.0
xtensa                randconfig-002-20260316    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

