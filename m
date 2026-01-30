Return-Path: <linux-gpio+bounces-31323-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGR6CQU+fGkxLgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31323-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 06:13:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627DB73B7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 06:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 077C1300E3B1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 05:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B70F33A9DE;
	Fri, 30 Jan 2026 05:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ct90WZmN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2E531355C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 05:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769749895; cv=none; b=HmUs3GBSJV/buHhan19cj5s/mzwbpmPebXD8CnTk9/ZS4J0bFoFSTYsu0JtH2NKgC9J+ahsgWo2b8ttwpDQgx/cxcjpke5bTkleuUIFCtfD/RVHNTlGqaEgFYkIN8XpQq6EHJ03s7hHmloEsWX/z8wNS+KiarS+aj4jaM1MUMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769749895; c=relaxed/simple;
	bh=CNERBqHXMN7HrPyZMiTmlhL0A7IkPNdRc+ga/mDXfe8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aAwQZpnJHtHAJGWuMNoTjRNeiF64uyAR7HdO0g5HyMN4C8RN4a23ngUGbTG933DVmBSBBg5xYns8aMDrJ1rOA+IIIaP5jPZjjQwzoxyxevV6DkEcyk09+6lw88pc2bSc8vnu2oJrrxpQbJzmqWeRbfEcb5NOXBRiZlFakVxcVjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ct90WZmN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769749893; x=1801285893;
  h=date:from:to:cc:subject:message-id;
  bh=CNERBqHXMN7HrPyZMiTmlhL0A7IkPNdRc+ga/mDXfe8=;
  b=ct90WZmNzTkNDRjwaTgXCkZ4V8lsnFQ2lpeJx3isZoeiX5QIyHnGEi8K
   g84L10U4xHUYkjDnvbaaglTWnDi22j92qnasuZMLfJi951ZlLUA0nz0Hd
   EarXGQnCW/nNLJxdQV22af7EhmRrY7FeXqQwYn25a1WE0zRfQjKr/f9r+
   YeXwnkGn5voo4PToumlzbrUolOKBx8sN+QkvChTJSMRnLNn7b7kNfw61d
   BTmjjdBfF8dS14dOetxPO3dDIERuQc87jB/J6QqmFcCWWfwzybFjb/Oxx
   zFWQ3Vy2I/n3ApyY973bR+XHebLkS5D3br3RH/5/aO9BuDCiR39eP2I39
   w==;
X-CSE-ConnectionGUID: eTJiWnY0QTiSBn9/VBIYLA==
X-CSE-MsgGUID: UBB2lzrtTy2zo/Wlk2MB6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70016954"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="70016954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 21:11:33 -0800
X-CSE-ConnectionGUID: Ky4qKXVmRb+JpQaIA+OSgg==
X-CSE-MsgGUID: h2McAUPySM+SvInkN+d5YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239489193"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2026 21:11:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlgn2-00000000cCW-1ZbA;
	Fri, 30 Jan 2026 05:11:28 +0000
Date: Fri, 30 Jan 2026 13:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 af9b4a56f0000fb11057e204ddfb05d72ba4dba0
Message-ID: <202601301354.7Qeq7xEB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-31323-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6627DB73B7
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: af9b4a56f0000fb11057e204ddfb05d72ba4dba0  gpio: tegra186: Add support for Tegra264

elapsed time: 1232m

configs tested: 318
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
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260129    clang-18
arc                   randconfig-001-20260130    clang-17
arc                   randconfig-002-20260129    clang-18
arc                   randconfig-002-20260130    clang-17
arc                        vdk_hs38_defconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    clang-22
arm                         at91_dt_defconfig    clang-22
arm                          collie_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-22
arm                          moxart_defconfig    clang-22
arm                        mvebu_v5_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260129    clang-18
arm                   randconfig-001-20260130    clang-17
arm                   randconfig-002-20260129    clang-18
arm                   randconfig-002-20260130    clang-17
arm                   randconfig-003-20260129    clang-18
arm                   randconfig-003-20260130    clang-17
arm                   randconfig-004-20260129    clang-18
arm                   randconfig-004-20260130    clang-17
arm                           stm32_defconfig    clang-22
arm                           sunxi_defconfig    clang-22
arm                           u8500_defconfig    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260129    gcc-11.5.0
arm64                 randconfig-001-20260130    gcc-8.5.0
arm64                 randconfig-002-20260129    gcc-11.5.0
arm64                 randconfig-002-20260130    gcc-8.5.0
arm64                 randconfig-003-20260129    gcc-11.5.0
arm64                 randconfig-003-20260130    gcc-8.5.0
arm64                 randconfig-004-20260129    gcc-11.5.0
arm64                 randconfig-004-20260130    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260129    gcc-11.5.0
csky                  randconfig-001-20260130    gcc-8.5.0
csky                  randconfig-002-20260129    gcc-11.5.0
csky                  randconfig-002-20260130    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260129    clang-22
hexagon               randconfig-001-20260130    gcc-11.5.0
hexagon               randconfig-002-20260129    clang-22
hexagon               randconfig-002-20260130    gcc-11.5.0
i386                             alldefconfig    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260129    clang-20
i386        buildonly-randconfig-001-20260130    clang-20
i386        buildonly-randconfig-002-20260129    clang-20
i386        buildonly-randconfig-002-20260130    clang-20
i386        buildonly-randconfig-003-20260129    clang-20
i386        buildonly-randconfig-003-20260130    clang-20
i386        buildonly-randconfig-004-20260129    clang-20
i386        buildonly-randconfig-004-20260130    clang-20
i386        buildonly-randconfig-005-20260129    clang-20
i386        buildonly-randconfig-005-20260130    clang-20
i386        buildonly-randconfig-006-20260129    clang-20
i386        buildonly-randconfig-006-20260130    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260129    clang-20
i386                  randconfig-001-20260130    gcc-14
i386                  randconfig-002-20260129    clang-20
i386                  randconfig-002-20260130    gcc-14
i386                  randconfig-003-20260129    clang-20
i386                  randconfig-003-20260130    gcc-14
i386                  randconfig-004-20260129    clang-20
i386                  randconfig-004-20260130    gcc-14
i386                  randconfig-005-20260129    clang-20
i386                  randconfig-005-20260130    gcc-14
i386                  randconfig-006-20260129    clang-20
i386                  randconfig-006-20260130    gcc-14
i386                  randconfig-007-20260129    clang-20
i386                  randconfig-007-20260130    gcc-14
i386                  randconfig-011-20260129    clang-20
i386                  randconfig-011-20260130    clang-20
i386                  randconfig-012-20260129    clang-20
i386                  randconfig-012-20260130    clang-20
i386                  randconfig-013-20260129    clang-20
i386                  randconfig-013-20260130    clang-20
i386                  randconfig-014-20260129    clang-20
i386                  randconfig-014-20260130    clang-20
i386                  randconfig-015-20260129    clang-20
i386                  randconfig-015-20260130    clang-20
i386                  randconfig-016-20260129    clang-20
i386                  randconfig-016-20260130    clang-20
i386                  randconfig-017-20260129    clang-20
i386                  randconfig-017-20260130    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260129    clang-22
loongarch             randconfig-001-20260130    gcc-11.5.0
loongarch             randconfig-002-20260129    clang-22
loongarch             randconfig-002-20260130    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          amiga_defconfig    gcc-15.2.0
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    clang-22
m68k                           virt_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                           jazz_defconfig    clang-22
mips                           jazz_defconfig    gcc-15.2.0
mips                     loongson2k_defconfig    gcc-15.2.0
mips                        omega2p_defconfig    clang-22
mips                       rbtx49xx_defconfig    gcc-15.2.0
nios2                         3c120_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260129    clang-22
nios2                 randconfig-001-20260130    gcc-11.5.0
nios2                 randconfig-002-20260129    clang-22
nios2                 randconfig-002-20260130    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                    or1ksim_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260129    gcc-8.5.0
parisc                randconfig-001-20260130    gcc-8.5.0
parisc                randconfig-002-20260129    gcc-8.5.0
parisc                randconfig-002-20260130    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     ep8248e_defconfig    clang-22
powerpc                     ksi8560_defconfig    clang-22
powerpc                      mgcoge_defconfig    gcc-15.2.0
powerpc                       ppc64_defconfig    clang-22
powerpc                     rainier_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260129    gcc-8.5.0
powerpc               randconfig-001-20260130    gcc-8.5.0
powerpc               randconfig-002-20260129    gcc-8.5.0
powerpc               randconfig-002-20260130    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc                     tqm8541_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20260129    gcc-8.5.0
powerpc64             randconfig-001-20260130    gcc-8.5.0
powerpc64             randconfig-002-20260129    gcc-8.5.0
powerpc64             randconfig-002-20260130    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260129    gcc-15.2.0
riscv                 randconfig-001-20260130    clang-22
riscv                 randconfig-002-20260129    clang-22
riscv                 randconfig-002-20260129    gcc-15.2.0
riscv                 randconfig-002-20260130    clang-22
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260129    clang-22
s390                  randconfig-001-20260129    gcc-15.2.0
s390                  randconfig-001-20260130    clang-22
s390                  randconfig-002-20260129    gcc-15.2.0
s390                  randconfig-002-20260130    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260129    gcc-11.5.0
sh                    randconfig-001-20260129    gcc-15.2.0
sh                    randconfig-001-20260130    clang-22
sh                    randconfig-002-20260129    gcc-12.5.0
sh                    randconfig-002-20260129    gcc-15.2.0
sh                    randconfig-002-20260130    clang-22
sh                          rsk7201_defconfig    clang-22
sh                          rsk7269_defconfig    clang-22
sh                           se7705_defconfig    clang-22
sh                           se7722_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260129    gcc-15.2.0
sparc                 randconfig-001-20260130    clang-22
sparc                 randconfig-002-20260129    gcc-15.2.0
sparc                 randconfig-002-20260130    clang-22
sparc                       sparc32_defconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260129    gcc-15.2.0
sparc64               randconfig-001-20260130    clang-22
sparc64               randconfig-002-20260129    gcc-15.2.0
sparc64               randconfig-002-20260130    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260129    gcc-15.2.0
um                    randconfig-001-20260130    clang-22
um                    randconfig-002-20260129    gcc-15.2.0
um                    randconfig-002-20260130    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260129    gcc-13
x86_64      buildonly-randconfig-001-20260130    clang-20
x86_64      buildonly-randconfig-002-20260129    gcc-13
x86_64      buildonly-randconfig-002-20260130    clang-20
x86_64      buildonly-randconfig-003-20260129    gcc-13
x86_64      buildonly-randconfig-003-20260130    clang-20
x86_64      buildonly-randconfig-004-20260129    gcc-13
x86_64      buildonly-randconfig-004-20260130    clang-20
x86_64      buildonly-randconfig-005-20260129    gcc-13
x86_64      buildonly-randconfig-005-20260130    clang-20
x86_64      buildonly-randconfig-006-20260129    gcc-13
x86_64      buildonly-randconfig-006-20260130    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260129    clang-20
x86_64                randconfig-001-20260130    clang-20
x86_64                randconfig-002-20260129    clang-20
x86_64                randconfig-002-20260130    clang-20
x86_64                randconfig-003-20260129    clang-20
x86_64                randconfig-003-20260130    clang-20
x86_64                randconfig-004-20260129    clang-20
x86_64                randconfig-004-20260130    clang-20
x86_64                randconfig-005-20260129    clang-20
x86_64                randconfig-005-20260130    clang-20
x86_64                randconfig-006-20260129    clang-20
x86_64                randconfig-006-20260130    clang-20
x86_64                randconfig-011-20260129    clang-20
x86_64                randconfig-011-20260130    clang-20
x86_64                randconfig-012-20260129    clang-20
x86_64                randconfig-012-20260130    clang-20
x86_64                randconfig-013-20260129    clang-20
x86_64                randconfig-013-20260130    clang-20
x86_64                randconfig-014-20260129    clang-20
x86_64                randconfig-014-20260130    clang-20
x86_64                randconfig-015-20260129    clang-20
x86_64                randconfig-015-20260130    clang-20
x86_64                randconfig-016-20260129    clang-20
x86_64                randconfig-016-20260130    clang-20
x86_64                randconfig-071-20260129    gcc-14
x86_64                randconfig-071-20260130    clang-20
x86_64                randconfig-072-20260129    gcc-14
x86_64                randconfig-072-20260130    clang-20
x86_64                randconfig-073-20260129    gcc-14
x86_64                randconfig-073-20260130    clang-20
x86_64                randconfig-074-20260129    gcc-14
x86_64                randconfig-074-20260130    clang-20
x86_64                randconfig-075-20260129    gcc-14
x86_64                randconfig-075-20260130    clang-20
x86_64                randconfig-076-20260129    gcc-14
x86_64                randconfig-076-20260130    clang-20
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
xtensa                  cadence_csp_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260129    gcc-15.2.0
xtensa                randconfig-001-20260130    clang-22
xtensa                randconfig-002-20260129    gcc-15.2.0
xtensa                randconfig-002-20260130    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

