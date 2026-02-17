Return-Path: <linux-gpio+bounces-31733-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNxPKzIMlGnT/QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31733-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 07:35:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E6B148FC5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 07:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93BFC301474B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 06:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FD0262FF8;
	Tue, 17 Feb 2026 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqDaFY0S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918323A98E
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310125; cv=none; b=OPVaPfdMcNzL0bGP8ciwiHf3UcAMlc/pvv4r6qpX4npW+ljZZg4HpMlcjoUVOLHFDELgMbdfzBRpCC+ZB1xGzCoHjI7aBn/J4ouquYU6BJRgsIdUBIHYiXvJ0I7OyK9b/J2WGrtm/LpCY8SC4AbzHsZn25E89g8ri4dp49U6+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310125; c=relaxed/simple;
	bh=AbG8VFKDNyqqJp+7Ee2xaK5aKG8sluufugr+/QpKC98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tOIy4XrJY05aFq6wu8hl+CtonumR7zxA7ALkYpVkFnmJgvSqVcqIPPg4rcwRtcDMFXma73/ClEbSU8f3a72dhFITQx4Y+qarQujqk8zM+RxAuDdRgRBX3wl2rx34taTtH19aVlvY4DtO8e5vQunErg1MoRSQP7luSxXd63Are3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqDaFY0S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771310123; x=1802846123;
  h=date:from:to:cc:subject:message-id;
  bh=AbG8VFKDNyqqJp+7Ee2xaK5aKG8sluufugr+/QpKC98=;
  b=FqDaFY0SE697yzzgeRDCPYwiYvY8LYpbtE0s0t6MxhfiEIJfJ5kRGeCG
   B/CGxrY8V0c1bFuwxID4VErH1pFofuMi3WiTNaXMY/GinNSrqgb2rDXx6
   QY89YXC3SYwzhUOBUX1X2WmzJBWMjhasIynM2ZT0enZLR0XLqM6c9B/e0
   EPxRgrekNMrMcvfePN2Ch0DdLQE1iYqSwqgNhMP8qTuWWGpcmauEyAavJ
   xLSc/S8aCIQAuvkE+GTbrqDRXuQpVMneucFYKXjIwE1b11FxJs1Ho0AyS
   7gLUS53maCwCVC1flB68DYCMpx+F9NJbLBlw6J++zJ86Wv1itiPeqN765
   w==;
X-CSE-ConnectionGUID: a2Xdg+xcRyKjSIMzrtJw8w==
X-CSE-MsgGUID: IrcTTRgKTza7eIX6nET1nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="97836714"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="97836714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:35:22 -0800
X-CSE-ConnectionGUID: Em+TldMuQ5+avwlIrl6rgg==
X-CSE-MsgGUID: 5vI7IG+QT6WslV6G65n80A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218330642"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2026 22:35:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsEg2-000000010hE-3B0t;
	Tue, 17 Feb 2026 06:35:18 +0000
Date: Tue, 17 Feb 2026 14:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/speling-fix] BUILD SUCCESS
 8d722ce17cbb9575ffca74eb87f9fba107175186
Message-ID: <202602171423.tjSQRfFa-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-31733-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09E6B148FC5
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/speling-fix
branch HEAD: 8d722ce17cbb9575ffca74eb87f9fba107175186  pinctrl: Fix spelling problem

elapsed time: 1212m

configs tested: 384
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
arc                          axs101_defconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260216    gcc-12.5.0
arc                   randconfig-001-20260217    gcc-11.5.0
arc                   randconfig-002-20260216    gcc-12.5.0
arc                   randconfig-002-20260217    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-23
arm                         at91_dt_defconfig    gcc-15.2.0
arm                         bcm2835_defconfig    gcc-15.2.0
arm                        clps711x_defconfig    clang-23
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                           h3600_defconfig    gcc-14
arm                       imx_v6_v7_defconfig    clang-23
arm                      integrator_defconfig    clang-23
arm                        keystone_defconfig    gcc-14
arm                            mmp2_defconfig    gcc-15.2.0
arm                          moxart_defconfig    gcc-15.2.0
arm                            mps2_defconfig    clang-23
arm                        multi_v7_defconfig    clang-23
arm                          pxa168_defconfig    clang-23
arm                          pxa168_defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260216    gcc-12.5.0
arm                   randconfig-001-20260217    gcc-11.5.0
arm                   randconfig-002-20260216    gcc-12.5.0
arm                   randconfig-002-20260217    gcc-11.5.0
arm                   randconfig-003-20260216    gcc-12.5.0
arm                   randconfig-003-20260217    gcc-11.5.0
arm                   randconfig-004-20260216    gcc-12.5.0
arm                   randconfig-004-20260217    gcc-11.5.0
arm                         s3c6400_defconfig    clang-23
arm                           sama5_defconfig    gcc-15.2.0
arm                        spear6xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm                           u8500_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260216    clang-17
arm64                 randconfig-001-20260216    gcc-8.5.0
arm64                 randconfig-001-20260217    clang-23
arm64                 randconfig-002-20260216    clang-17
arm64                 randconfig-002-20260217    clang-23
arm64                 randconfig-003-20260216    clang-17
arm64                 randconfig-003-20260216    clang-23
arm64                 randconfig-003-20260217    clang-23
arm64                 randconfig-004-20260216    clang-17
arm64                 randconfig-004-20260216    clang-23
arm64                 randconfig-004-20260217    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260216    clang-17
csky                  randconfig-001-20260216    gcc-13.4.0
csky                  randconfig-001-20260217    clang-23
csky                  randconfig-002-20260216    clang-17
csky                  randconfig-002-20260216    gcc-13.4.0
csky                  randconfig-002-20260217    clang-23
hexagon                          alldefconfig    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260216    clang-20
hexagon               randconfig-001-20260216    clang-23
hexagon               randconfig-001-20260217    clang-23
hexagon               randconfig-002-20260216    clang-20
hexagon               randconfig-002-20260217    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260216    clang-20
i386        buildonly-randconfig-001-20260217    clang-20
i386        buildonly-randconfig-002-20260216    clang-20
i386        buildonly-randconfig-002-20260216    gcc-14
i386        buildonly-randconfig-002-20260217    clang-20
i386        buildonly-randconfig-003-20260216    clang-20
i386        buildonly-randconfig-003-20260217    clang-20
i386        buildonly-randconfig-004-20260216    clang-20
i386        buildonly-randconfig-004-20260216    gcc-14
i386        buildonly-randconfig-004-20260217    clang-20
i386        buildonly-randconfig-005-20260216    clang-20
i386        buildonly-randconfig-005-20260216    gcc-14
i386        buildonly-randconfig-005-20260217    clang-20
i386        buildonly-randconfig-006-20260216    clang-20
i386        buildonly-randconfig-006-20260217    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260216    clang-20
i386                  randconfig-001-20260217    gcc-14
i386                  randconfig-002-20260216    clang-20
i386                  randconfig-002-20260217    gcc-14
i386                  randconfig-003-20260216    clang-20
i386                  randconfig-003-20260217    gcc-14
i386                  randconfig-004-20260216    clang-20
i386                  randconfig-004-20260217    gcc-14
i386                  randconfig-005-20260216    clang-20
i386                  randconfig-005-20260217    gcc-14
i386                  randconfig-006-20260216    clang-20
i386                  randconfig-006-20260217    gcc-14
i386                  randconfig-007-20260216    clang-20
i386                  randconfig-007-20260217    gcc-14
i386                  randconfig-011-20260216    clang-20
i386                  randconfig-011-20260217    clang-20
i386                  randconfig-012-20260216    clang-20
i386                  randconfig-012-20260217    clang-20
i386                  randconfig-013-20260216    clang-20
i386                  randconfig-013-20260216    gcc-14
i386                  randconfig-013-20260217    clang-20
i386                  randconfig-014-20260216    clang-20
i386                  randconfig-014-20260217    clang-20
i386                  randconfig-015-20260216    clang-20
i386                  randconfig-015-20260216    gcc-14
i386                  randconfig-015-20260217    clang-20
i386                  randconfig-016-20260216    clang-20
i386                  randconfig-016-20260216    gcc-14
i386                  randconfig-016-20260217    clang-20
i386                  randconfig-017-20260216    clang-20
i386                  randconfig-017-20260216    gcc-14
i386                  randconfig-017-20260217    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    gcc-15.2.0
loongarch             randconfig-001-20260216    clang-20
loongarch             randconfig-001-20260216    gcc-14.3.0
loongarch             randconfig-001-20260217    clang-23
loongarch             randconfig-002-20260216    clang-18
loongarch             randconfig-002-20260216    clang-20
loongarch             randconfig-002-20260217    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         amcore_defconfig    clang-23
m68k                          amiga_defconfig    clang-23
m68k                         apollo_defconfig    clang-23
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                       m5275evb_defconfig    clang-23
m68k                        m5307c3_defconfig    clang-23
m68k                        mvme147_defconfig    clang-23
m68k                        mvme16x_defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-14
mips                           ci20_defconfig    clang-23
mips                 decstation_r4k_defconfig    clang-23
mips                          eyeq6_defconfig    clang-23
mips                           gcw0_defconfig    clang-23
mips                           ip28_defconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-15.2.0
mips                      maltaaprp_defconfig    clang-23
mips                        qi_lb60_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260216    clang-20
nios2                 randconfig-001-20260216    gcc-11.5.0
nios2                 randconfig-001-20260217    clang-23
nios2                 randconfig-002-20260216    clang-20
nios2                 randconfig-002-20260216    gcc-9.5.0
nios2                 randconfig-002-20260217    clang-23
openrisc                         alldefconfig    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260216    clang-23
parisc                randconfig-001-20260217    clang-19
parisc                randconfig-002-20260216    clang-23
parisc                randconfig-002-20260217    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                 canyonlands_defconfig    clang-23
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                       ebony_defconfig    gcc-15.2.0
powerpc                      ep88xc_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc                   lite5200b_defconfig    gcc-15.2.0
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                    mvme5100_defconfig    gcc-15.2.0
powerpc                      pasemi_defconfig    clang-23
powerpc                      ppc6xx_defconfig    clang-23
powerpc               randconfig-001-20260216    clang-23
powerpc               randconfig-001-20260217    clang-19
powerpc               randconfig-002-20260216    clang-23
powerpc               randconfig-002-20260217    clang-19
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc                    socrates_defconfig    clang-23
powerpc                     stx_gp3_defconfig    clang-23
powerpc                     taishan_defconfig    clang-23
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc                     tqm8555_defconfig    clang-23
powerpc                         wii_defconfig    clang-23
powerpc                 xes_mpc85xx_defconfig    clang-23
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260216    clang-23
powerpc64             randconfig-001-20260217    clang-19
powerpc64             randconfig-002-20260216    clang-23
powerpc64             randconfig-002-20260217    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_k210_defconfig    clang-23
riscv                    nommu_k210_defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-14
riscv                 randconfig-001-20260216    clang-23
riscv                 randconfig-001-20260217    gcc-10.5.0
riscv                 randconfig-002-20260216    clang-23
riscv                 randconfig-002-20260217    gcc-10.5.0
s390                             alldefconfig    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260216    clang-23
s390                  randconfig-001-20260217    gcc-10.5.0
s390                  randconfig-002-20260216    clang-23
s390                  randconfig-002-20260217    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.2.0
sh                            hp6xx_defconfig    gcc-14
sh                    randconfig-001-20260216    clang-23
sh                    randconfig-001-20260217    gcc-10.5.0
sh                    randconfig-002-20260216    clang-23
sh                    randconfig-002-20260217    gcc-10.5.0
sh                          rsk7264_defconfig    gcc-14
sh                           se7705_defconfig    clang-23
sh                           se7722_defconfig    gcc-15.2.0
sh                           se7724_defconfig    clang-23
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7763rdp_defconfig    clang-23
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260216    gcc-9.5.0
sparc                 randconfig-001-20260217    gcc-12.5.0
sparc                 randconfig-002-20260216    gcc-9.5.0
sparc                 randconfig-002-20260217    gcc-12.5.0
sparc                       sparc64_defconfig    clang-23
sparc64                          alldefconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260216    gcc-9.5.0
sparc64               randconfig-001-20260217    gcc-12.5.0
sparc64               randconfig-002-20260216    gcc-9.5.0
sparc64               randconfig-002-20260217    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260216    gcc-9.5.0
um                    randconfig-001-20260217    gcc-12.5.0
um                    randconfig-002-20260216    gcc-9.5.0
um                    randconfig-002-20260217    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260216    clang-20
x86_64      buildonly-randconfig-001-20260216    gcc-13
x86_64      buildonly-randconfig-001-20260217    gcc-14
x86_64      buildonly-randconfig-002-20260216    gcc-13
x86_64      buildonly-randconfig-002-20260216    gcc-14
x86_64      buildonly-randconfig-002-20260217    gcc-14
x86_64      buildonly-randconfig-003-20260216    gcc-13
x86_64      buildonly-randconfig-003-20260217    gcc-14
x86_64      buildonly-randconfig-004-20260216    gcc-13
x86_64      buildonly-randconfig-004-20260217    gcc-14
x86_64      buildonly-randconfig-005-20260216    gcc-13
x86_64      buildonly-randconfig-005-20260216    gcc-14
x86_64      buildonly-randconfig-005-20260217    gcc-14
x86_64      buildonly-randconfig-006-20260216    clang-20
x86_64      buildonly-randconfig-006-20260216    gcc-13
x86_64      buildonly-randconfig-006-20260217    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260216    clang-20
x86_64                randconfig-001-20260217    clang-20
x86_64                randconfig-002-20260216    clang-20
x86_64                randconfig-002-20260217    clang-20
x86_64                randconfig-003-20260216    clang-20
x86_64                randconfig-003-20260217    clang-20
x86_64                randconfig-004-20260216    clang-20
x86_64                randconfig-004-20260217    clang-20
x86_64                randconfig-005-20260216    clang-20
x86_64                randconfig-005-20260217    clang-20
x86_64                randconfig-006-20260216    clang-20
x86_64                randconfig-006-20260217    clang-20
x86_64                randconfig-011-20260216    clang-20
x86_64                randconfig-011-20260217    gcc-14
x86_64                randconfig-012-20260216    clang-20
x86_64                randconfig-012-20260217    gcc-14
x86_64                randconfig-013-20260216    clang-20
x86_64                randconfig-013-20260217    gcc-14
x86_64                randconfig-014-20260216    clang-20
x86_64                randconfig-014-20260217    gcc-14
x86_64                randconfig-015-20260216    clang-20
x86_64                randconfig-015-20260217    gcc-14
x86_64                randconfig-016-20260216    clang-20
x86_64                randconfig-016-20260217    gcc-14
x86_64                randconfig-071-20260216    clang-20
x86_64                randconfig-071-20260217    gcc-14
x86_64                randconfig-072-20260216    clang-20
x86_64                randconfig-072-20260217    gcc-14
x86_64                randconfig-073-20260216    clang-20
x86_64                randconfig-073-20260217    gcc-14
x86_64                randconfig-074-20260216    clang-20
x86_64                randconfig-074-20260217    gcc-14
x86_64                randconfig-075-20260216    clang-20
x86_64                randconfig-075-20260217    gcc-14
x86_64                randconfig-076-20260216    clang-20
x86_64                randconfig-076-20260217    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                       common_defconfig    clang-23
xtensa                randconfig-001-20260216    gcc-9.5.0
xtensa                randconfig-001-20260217    gcc-12.5.0
xtensa                randconfig-002-20260216    gcc-9.5.0
xtensa                randconfig-002-20260217    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

