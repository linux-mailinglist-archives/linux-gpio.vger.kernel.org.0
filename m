Return-Path: <linux-gpio+bounces-32340-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGHvJemaomlI4QQAu9opvQ
	(envelope-from <linux-gpio+bounces-32340-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 08:36:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B84191C11BE
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 08:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2939E3079C68
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 07:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D359C36E497;
	Sat, 28 Feb 2026 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HizRpHIg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23136E496
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263821; cv=none; b=khStt+LJlOEvTFKlpEgarJhjPrGP2QXOS9h3sWZTOigmEzQO/Oie79Xl1MoUAyXJJN4T3WA/Jazd+vNIX9QhhzlTWw6K0humK06UHi6oqd21TAs0TeL8pe0oqTGDM/BYQc0XsllgAuZRVeTOKPdAFuiBoUSgnqX2eGNvAZOIKM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263821; c=relaxed/simple;
	bh=yrFGQJ94YRpTviRvj98Zto7zojOxygmcZdvS0oZUyOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EDKNovuvLg9XZLdEMAcuXEyvOTU1zyet7sFSDbPjk4MYfH6RzPWFGKphdygStFRuzBgKuYJpsM67Gm0RhJoEbhf6jxWQ/KdBIWx4ymtf6FxAnUPIFJN+eo/IQGA/tAKlnIJBJ0hDGXQt4CFG5T8mRcE4FWyW3yY7WjBvqgjZ33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HizRpHIg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772263818; x=1803799818;
  h=date:from:to:cc:subject:message-id;
  bh=yrFGQJ94YRpTviRvj98Zto7zojOxygmcZdvS0oZUyOg=;
  b=HizRpHIgGSHquM2pSztiJ/VOfKF8paSxQOkIFT5a0V74oVMLGuyeisah
   Gy+mgZrr/K5S+XZSogA1JIVYpt4YDEnrJXT9EjgFNvzyFvgHRKjoC6IYI
   vWewY7RkKIdD5OevAkLvewLVSO806JOVmQY1C7LioY8rjIMvVIA5V/p6v
   N3s83n5tMjexfRT2MqHp/4znmmZnGbisPqU+dIe/ZbSoUnsoEFMp0P3Qv
   WnNCJ5bXwFxlJ+j1Uizc3mqkTq9j6SUJBq3OJ7QZfzQsSdzzIlMtOgkk3
   KCQX6CjcSy/7pEndyo1NOcfP5PQt3V8YLm8wHnjIc8pZNDTFmSrUljBob
   w==;
X-CSE-ConnectionGUID: A93K/fz6TuOKQbkjyTzo0w==
X-CSE-MsgGUID: XjL6Hi42SceP/7nh93II9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73388105"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73388105"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 23:30:18 -0800
X-CSE-ConnectionGUID: 0SavQy6cSH+MOwFMyNrECQ==
X-CSE-MsgGUID: 41h31kJ2SfS1kDo6sFjxwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="244382443"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2026 23:30:17 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwEll-00000000BMh-2VkB;
	Sat, 28 Feb 2026 07:29:57 +0000
Date: Sat, 28 Feb 2026 15:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 71be9e450b72e05393c11873923fcde95e8004d8
Message-ID: <202602281510.fx3ym4Wt-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-32340-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B84191C11BE
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 71be9e450b72e05393c11873923fcde95e8004d8  Merge branch 'devel' into for-next

elapsed time: 758m

configs tested: 286
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
arc                          axs101_defconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-23
arc                        nsimosci_defconfig    clang-23
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260228    gcc-14.3.0
arc                   randconfig-002-20260228    gcc-14.3.0
arc                   randconfig-002-20260228    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       imx_v6_v7_defconfig    gcc-15.2.0
arm                      integrator_defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                            mps2_defconfig    clang-23
arm                        multi_v5_defconfig    clang-23
arm                        mvebu_v5_defconfig    clang-23
arm                             mxs_defconfig    clang-23
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20260228    clang-16
arm                   randconfig-001-20260228    gcc-14.3.0
arm                   randconfig-002-20260228    clang-23
arm                   randconfig-002-20260228    gcc-14.3.0
arm                   randconfig-003-20260228    clang-23
arm                   randconfig-003-20260228    gcc-14.3.0
arm                   randconfig-004-20260228    gcc-11.5.0
arm                   randconfig-004-20260228    gcc-14.3.0
arm                           sama5_defconfig    gcc-15.2.0
arm                           stm32_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    clang-23
arm64                            alldefconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260228    clang-23
arm64                 randconfig-002-20260228    clang-23
arm64                 randconfig-002-20260228    gcc-8.5.0
arm64                 randconfig-003-20260228    clang-23
arm64                 randconfig-004-20260228    clang-23
arm64                 randconfig-004-20260228    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260228    clang-23
csky                  randconfig-001-20260228    gcc-15.2.0
csky                  randconfig-002-20260228    clang-23
csky                  randconfig-002-20260228    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260228    clang-23
hexagon               randconfig-002-20260228    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260228    clang-20
i386        buildonly-randconfig-002-20260228    clang-20
i386        buildonly-randconfig-003-20260228    clang-20
i386        buildonly-randconfig-004-20260228    clang-20
i386        buildonly-randconfig-005-20260228    clang-20
i386        buildonly-randconfig-006-20260228    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260228    gcc-13
i386                  randconfig-001-20260228    gcc-14
i386                  randconfig-002-20260228    gcc-14
i386                  randconfig-003-20260228    gcc-14
i386                  randconfig-004-20260228    clang-20
i386                  randconfig-004-20260228    gcc-14
i386                  randconfig-005-20260228    clang-20
i386                  randconfig-005-20260228    gcc-14
i386                  randconfig-006-20260228    clang-20
i386                  randconfig-006-20260228    gcc-14
i386                  randconfig-007-20260228    gcc-14
i386                  randconfig-011-20260228    gcc-14
i386                  randconfig-012-20260228    gcc-14
i386                  randconfig-013-20260228    gcc-14
i386                  randconfig-014-20260228    gcc-14
i386                  randconfig-015-20260228    gcc-14
i386                  randconfig-016-20260228    gcc-14
i386                  randconfig-017-20260228    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260228    clang-23
loongarch             randconfig-002-20260228    clang-23
loongarch             randconfig-002-20260228    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          amiga_defconfig    clang-23
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                        m5272c3_defconfig    gcc-15.2.0
m68k                            q40_defconfig    clang-23
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                     decstation_defconfig    gcc-15.2.0
mips                      loongson1_defconfig    gcc-15.2.0
mips                          malta_defconfig    gcc-15.2.0
mips                          rm200_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260228    clang-23
nios2                 randconfig-001-20260228    gcc-11.5.0
nios2                 randconfig-002-20260228    clang-23
nios2                 randconfig-002-20260228    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260228    gcc-8.5.0
parisc                randconfig-001-20260228    gcc-9.5.0
parisc                randconfig-002-20260228    gcc-8.5.0
parisc                randconfig-002-20260228    gcc-9.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    clang-23
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    clang-23
powerpc                     mpc5200_defconfig    clang-23
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc                  mpc866_ads_defconfig    clang-23
powerpc                     powernv_defconfig    clang-23
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260228    clang-23
powerpc               randconfig-001-20260228    gcc-8.5.0
powerpc               randconfig-002-20260228    gcc-8.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc                     sequoia_defconfig    clang-23
powerpc                     skiroot_defconfig    clang-23
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc                      tqm8xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260228    gcc-12.5.0
powerpc64             randconfig-001-20260228    gcc-8.5.0
powerpc64             randconfig-002-20260228    gcc-10.5.0
powerpc64             randconfig-002-20260228    gcc-8.5.0
riscv                            alldefconfig    clang-23
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260228    gcc-11.5.0
riscv                 randconfig-001-20260228    gcc-15.2.0
riscv                 randconfig-002-20260228    gcc-15.2.0
riscv                 randconfig-002-20260228    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260228    gcc-15.2.0
s390                  randconfig-001-20260228    gcc-8.5.0
s390                  randconfig-002-20260228    gcc-15.2.0
s390                  randconfig-002-20260228    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                         apsh4a3a_defconfig    clang-23
sh                                  defconfig    gcc-14
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260228    gcc-15.2.0
sh                    randconfig-002-20260228    gcc-15.2.0
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sh                           se7722_defconfig    gcc-15.2.0
sh                           se7750_defconfig    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260228    gcc-9.5.0
sparc                 randconfig-002-20260228    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260228    gcc-9.5.0
sparc64               randconfig-002-20260228    gcc-9.5.0
um                               alldefconfig    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260228    gcc-9.5.0
um                    randconfig-002-20260228    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260228    gcc-14
x86_64      buildonly-randconfig-002-20260228    gcc-14
x86_64      buildonly-randconfig-003-20260228    clang-20
x86_64      buildonly-randconfig-003-20260228    gcc-14
x86_64      buildonly-randconfig-004-20260228    clang-20
x86_64      buildonly-randconfig-004-20260228    gcc-14
x86_64      buildonly-randconfig-005-20260228    gcc-14
x86_64      buildonly-randconfig-006-20260228    clang-20
x86_64      buildonly-randconfig-006-20260228    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260228    clang-20
x86_64                randconfig-001-20260228    gcc-14
x86_64                randconfig-002-20260228    gcc-14
x86_64                randconfig-003-20260228    clang-20
x86_64                randconfig-003-20260228    gcc-14
x86_64                randconfig-004-20260228    gcc-14
x86_64                randconfig-005-20260228    gcc-14
x86_64                randconfig-006-20260228    gcc-14
x86_64                randconfig-011-20260228    gcc-14
x86_64                randconfig-012-20260228    gcc-14
x86_64                randconfig-013-20260228    gcc-14
x86_64                randconfig-014-20260228    gcc-14
x86_64                randconfig-015-20260228    gcc-14
x86_64                randconfig-016-20260228    gcc-14
x86_64                randconfig-071-20260228    clang-20
x86_64                randconfig-071-20260228    gcc-14
x86_64                randconfig-072-20260228    gcc-14
x86_64                randconfig-073-20260228    gcc-14
x86_64                randconfig-074-20260228    gcc-14
x86_64                randconfig-075-20260228    clang-20
x86_64                randconfig-075-20260228    gcc-14
x86_64                randconfig-076-20260228    clang-20
x86_64                randconfig-076-20260228    gcc-14
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
xtensa                  nommu_kc705_defconfig    clang-23
xtensa                randconfig-001-20260228    gcc-9.5.0
xtensa                randconfig-002-20260228    gcc-9.5.0
xtensa                    smp_lx200_defconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

