Return-Path: <linux-gpio+bounces-31774-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFM3D55klWkvQQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31774-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:05:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C591538CB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FD51304E7E7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23C13093BA;
	Wed, 18 Feb 2026 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDmciC/J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA66F30EF6C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771398282; cv=none; b=MVJ+z0wR2W00RGxCj6veXwzkWBwxJTP7wklKdBQ7CNOvdytIwUaeCoBPE7cPY+9cLu9vrrLfgTX4wJFmLr2BoeG5TZwoAB5HEnrCmnEVOoe4DOib8834JTGwgWROtPE9UdySqVvOG3VIYm91is7auLyvM1L/DPrG8NZkEcf4+Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771398282; c=relaxed/simple;
	bh=8QM0CiQqRXMFjQj2gmC6qp/ge2FjojXmt399+6qiyoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l5WFKLhupPnFW/l0etXdvO06aKho6ltqt08K50UGclkrottoRyGwXCorDWdgvm7wkTuonEXlBr6+5JteJ1pU3O4eHmpRzNhm/dUSoQY20tHs6K/g8w2q+CVv4dJ9ty5fDUtKd3L3sC0TeGq8KkS5xvSiFykD+fCO1i/h96RQwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDmciC/J; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771398281; x=1802934281;
  h=date:from:to:cc:subject:message-id;
  bh=8QM0CiQqRXMFjQj2gmC6qp/ge2FjojXmt399+6qiyoA=;
  b=kDmciC/JBdC2TsItl6Qz/M+pWPjrFukhWcKm+D88VembEFTcXc1jXPET
   fiLIdX0Ycf04LjxrN5kIAxfDGDaEBI/DsclwW3Jy7oOa016NNiMqvdou7
   Zy2pRpil29p8ov/6cmFDBgFnnTcTAxr4MPYibZgx1E6bnKkmPAtihjjKo
   9GHJCPFF54f4nixQdrEF+FOD4PEc13FTfdrm+td0tWX7b6fvR8sJfZlPh
   72nzBQYQCj4VeiJaLBQCi2SaL06wOhEmpBTNBNhAiKPECvaxTdGYEHOTV
   RItNANJWKl84PDeFrbVvX7/iuuH7pfb9FYS9PAAHBXWLFsAAiiiO4yAMg
   g==;
X-CSE-ConnectionGUID: u8qAs9IFSoqIqpxLWLffMw==
X-CSE-MsgGUID: OnLDNhTIRM+7Ytd713YskQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83919138"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83919138"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 23:04:41 -0800
X-CSE-ConnectionGUID: ZEgs85q4SEybeZLrkYOE4Q==
X-CSE-MsgGUID: zE2bqHjUQVKD7+NzhaXU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="244707758"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 23:04:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsbbw-0000000128e-2CvD;
	Wed, 18 Feb 2026 07:04:36 +0000
Date: Wed, 18 Feb 2026 15:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 6af6be278e3ba2ffb6af5b796c89dfb3f5d9063e
Message-ID: <202602181516.pZOQJRZF-lkp@intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-31774-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: D5C591538CB
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 6af6be278e3ba2ffb6af5b796c89dfb3f5d9063e  gpio: cdev: Avoid NULL dereference in linehandle_create()

elapsed time: 1207m

configs tested: 353
configs skipped: 5

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
arc                          axs101_defconfig    gcc-15.2.0
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-23
arc                   randconfig-001-20260217    gcc-11.5.0
arc                   randconfig-001-20260217    gcc-8.5.0
arc                   randconfig-001-20260218    clang-23
arc                   randconfig-002-20260217    gcc-11.5.0
arc                   randconfig-002-20260217    gcc-9.5.0
arc                   randconfig-002-20260218    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         bcm2835_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                      footbridge_defconfig    clang-18
arm                            hisi_defconfig    gcc-15.2.0
arm                      jornada720_defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-18
arm                         lpc18xx_defconfig    gcc-15.2.0
arm                        multi_v5_defconfig    gcc-15.2.0
arm                        mvebu_v5_defconfig    clang-23
arm                        mvebu_v5_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-23
arm                             pxa_defconfig    gcc-15.2.0
arm                   randconfig-001-20260217    gcc-11.5.0
arm                   randconfig-001-20260217    gcc-14.3.0
arm                   randconfig-001-20260218    clang-23
arm                   randconfig-002-20260217    gcc-11.5.0
arm                   randconfig-002-20260218    clang-23
arm                   randconfig-003-20260217    gcc-11.5.0
arm                   randconfig-003-20260217    gcc-8.5.0
arm                   randconfig-003-20260218    clang-23
arm                   randconfig-004-20260217    gcc-11.5.0
arm                   randconfig-004-20260217    gcc-13.4.0
arm                   randconfig-004-20260218    clang-23
arm                        realview_defconfig    gcc-15.2.0
arm                         socfpga_defconfig    clang-23
arm                          sp7021_defconfig    gcc-15.2.0
arm                        spear6xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm                           u8500_defconfig    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260217    clang-23
arm64                 randconfig-001-20260218    clang-23
arm64                 randconfig-002-20260217    clang-23
arm64                 randconfig-002-20260218    clang-23
arm64                 randconfig-003-20260217    clang-23
arm64                 randconfig-003-20260218    clang-23
arm64                 randconfig-004-20260217    clang-23
arm64                 randconfig-004-20260218    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260217    clang-23
csky                  randconfig-001-20260218    clang-23
csky                  randconfig-002-20260217    clang-23
csky                  randconfig-002-20260218    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260217    clang-23
hexagon               randconfig-001-20260218    clang-16
hexagon               randconfig-002-20260217    clang-23
hexagon               randconfig-002-20260218    clang-16
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260217    clang-20
i386        buildonly-randconfig-001-20260218    clang-20
i386        buildonly-randconfig-002-20260217    clang-20
i386        buildonly-randconfig-002-20260218    clang-20
i386        buildonly-randconfig-003-20260217    clang-20
i386        buildonly-randconfig-003-20260218    clang-20
i386        buildonly-randconfig-004-20260217    clang-20
i386        buildonly-randconfig-004-20260218    clang-20
i386        buildonly-randconfig-005-20260217    clang-20
i386        buildonly-randconfig-005-20260218    clang-20
i386        buildonly-randconfig-006-20260217    clang-20
i386        buildonly-randconfig-006-20260218    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260217    gcc-14
i386                  randconfig-001-20260218    clang-20
i386                  randconfig-002-20260217    gcc-14
i386                  randconfig-002-20260218    clang-20
i386                  randconfig-003-20260217    clang-20
i386                  randconfig-003-20260217    gcc-14
i386                  randconfig-003-20260218    clang-20
i386                  randconfig-004-20260217    gcc-14
i386                  randconfig-004-20260218    clang-20
i386                  randconfig-005-20260217    gcc-14
i386                  randconfig-005-20260218    clang-20
i386                  randconfig-006-20260217    gcc-14
i386                  randconfig-006-20260218    clang-20
i386                  randconfig-007-20260217    clang-20
i386                  randconfig-007-20260217    gcc-14
i386                  randconfig-007-20260218    clang-20
i386                  randconfig-011-20260217    clang-20
i386                  randconfig-011-20260218    gcc-14
i386                  randconfig-012-20260217    clang-20
i386                  randconfig-012-20260218    gcc-14
i386                  randconfig-013-20260217    clang-20
i386                  randconfig-013-20260218    gcc-14
i386                  randconfig-014-20260217    clang-20
i386                  randconfig-014-20260218    gcc-14
i386                  randconfig-015-20260217    clang-20
i386                  randconfig-015-20260218    gcc-14
i386                  randconfig-016-20260217    clang-20
i386                  randconfig-016-20260218    gcc-14
i386                  randconfig-017-20260217    clang-20
i386                  randconfig-017-20260218    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260217    clang-23
loongarch             randconfig-001-20260218    clang-16
loongarch             randconfig-002-20260217    clang-23
loongarch             randconfig-002-20260218    clang-16
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                 decstation_r4k_defconfig    clang-23
mips                          eyeq5_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           ip22_defconfig    clang-18
mips                           ip22_defconfig    gcc-15.2.0
nios2                         3c120_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260217    clang-23
nios2                 randconfig-001-20260218    clang-16
nios2                 randconfig-002-20260217    clang-23
nios2                 randconfig-002-20260218    clang-16
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
parisc                generic-32bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260217    clang-19
parisc                randconfig-001-20260218    gcc-8.5.0
parisc                randconfig-002-20260217    clang-19
parisc                randconfig-002-20260218    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    clang-18
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      chrp32_defconfig    clang-18
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                      ep88xc_defconfig    clang-23
powerpc                     kmeter1_defconfig    clang-23
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                      mgcoge_defconfig    gcc-15.2.0
powerpc                 mpc8313_rdb_defconfig    clang-18
powerpc                    mvme5100_defconfig    gcc-15.2.0
powerpc                      pasemi_defconfig    clang-23
powerpc                     ppa8548_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260217    clang-19
powerpc               randconfig-001-20260218    gcc-8.5.0
powerpc               randconfig-002-20260217    clang-19
powerpc               randconfig-002-20260218    gcc-8.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc                     stx_gp3_defconfig    clang-23
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc                         wii_defconfig    clang-23
powerpc                 xes_mpc85xx_defconfig    clang-23
powerpc64             randconfig-001-20260217    clang-19
powerpc64             randconfig-001-20260218    gcc-8.5.0
powerpc64             randconfig-002-20260217    clang-19
powerpc64             randconfig-002-20260218    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260217    gcc-10.5.0
riscv                 randconfig-001-20260218    clang-23
riscv                 randconfig-002-20260217    gcc-10.5.0
riscv                 randconfig-002-20260217    gcc-14.3.0
riscv                 randconfig-002-20260218    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260217    clang-23
s390                  randconfig-001-20260217    gcc-10.5.0
s390                  randconfig-001-20260218    clang-23
s390                  randconfig-002-20260217    clang-23
s390                  randconfig-002-20260217    gcc-10.5.0
s390                  randconfig-002-20260218    clang-23
s390                       zfcpdump_defconfig    gcc-15.2.0
sh                               alldefconfig    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          landisk_defconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                          polaris_defconfig    gcc-15.2.0
sh                    randconfig-001-20260217    gcc-10.5.0
sh                    randconfig-001-20260217    gcc-15.2.0
sh                    randconfig-001-20260218    clang-23
sh                    randconfig-002-20260217    gcc-10.5.0
sh                    randconfig-002-20260218    clang-23
sh                        sh7763rdp_defconfig    clang-23
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                          urquell_defconfig    clang-18
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260217    gcc-12.5.0
sparc                 randconfig-001-20260218    gcc-10.5.0
sparc                 randconfig-002-20260217    gcc-12.5.0
sparc                 randconfig-002-20260218    gcc-10.5.0
sparc64                          alldefconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260217    gcc-12.5.0
sparc64               randconfig-001-20260218    gcc-10.5.0
sparc64               randconfig-002-20260217    gcc-12.5.0
sparc64               randconfig-002-20260218    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-15.2.0
um                    randconfig-001-20260217    gcc-12.5.0
um                    randconfig-001-20260218    gcc-10.5.0
um                    randconfig-002-20260217    gcc-12.5.0
um                    randconfig-002-20260218    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260217    gcc-14
x86_64      buildonly-randconfig-001-20260218    gcc-14
x86_64      buildonly-randconfig-002-20260217    gcc-14
x86_64      buildonly-randconfig-002-20260218    gcc-14
x86_64      buildonly-randconfig-003-20260217    gcc-14
x86_64      buildonly-randconfig-003-20260218    gcc-14
x86_64      buildonly-randconfig-004-20260217    gcc-14
x86_64      buildonly-randconfig-004-20260218    gcc-14
x86_64      buildonly-randconfig-005-20260217    gcc-14
x86_64      buildonly-randconfig-005-20260218    gcc-14
x86_64      buildonly-randconfig-006-20260217    gcc-14
x86_64      buildonly-randconfig-006-20260218    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260217    clang-20
x86_64                randconfig-001-20260218    gcc-14
x86_64                randconfig-002-20260217    clang-20
x86_64                randconfig-002-20260218    gcc-14
x86_64                randconfig-003-20260217    clang-20
x86_64                randconfig-003-20260218    gcc-14
x86_64                randconfig-004-20260217    clang-20
x86_64                randconfig-004-20260218    gcc-14
x86_64                randconfig-005-20260217    clang-20
x86_64                randconfig-005-20260218    gcc-14
x86_64                randconfig-006-20260217    clang-20
x86_64                randconfig-006-20260218    gcc-14
x86_64                randconfig-011-20260217    gcc-14
x86_64                randconfig-011-20260218    gcc-13
x86_64                randconfig-012-20260217    gcc-14
x86_64                randconfig-012-20260218    gcc-13
x86_64                randconfig-013-20260217    gcc-14
x86_64                randconfig-013-20260218    gcc-13
x86_64                randconfig-014-20260217    gcc-14
x86_64                randconfig-014-20260218    gcc-13
x86_64                randconfig-015-20260217    gcc-14
x86_64                randconfig-015-20260218    gcc-13
x86_64                randconfig-016-20260217    gcc-14
x86_64                randconfig-016-20260218    gcc-13
x86_64                randconfig-071-20260217    clang-20
x86_64                randconfig-071-20260217    gcc-14
x86_64                randconfig-071-20260218    clang-20
x86_64                randconfig-072-20260217    clang-20
x86_64                randconfig-072-20260217    gcc-14
x86_64                randconfig-072-20260218    clang-20
x86_64                randconfig-073-20260217    clang-20
x86_64                randconfig-073-20260217    gcc-14
x86_64                randconfig-073-20260218    clang-20
x86_64                randconfig-074-20260217    gcc-14
x86_64                randconfig-074-20260218    clang-20
x86_64                randconfig-075-20260217    clang-20
x86_64                randconfig-075-20260217    gcc-14
x86_64                randconfig-075-20260218    clang-20
x86_64                randconfig-076-20260217    clang-20
x86_64                randconfig-076-20260217    gcc-14
x86_64                randconfig-076-20260218    clang-20
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
xtensa                randconfig-001-20260217    gcc-12.5.0
xtensa                randconfig-001-20260218    gcc-10.5.0
xtensa                randconfig-002-20260217    gcc-12.5.0
xtensa                randconfig-002-20260218    gcc-10.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

