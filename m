Return-Path: <linux-gpio+bounces-32336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPHAC5Ehomm4zwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 23:58:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A03E91BED57
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 23:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 944C53083E1E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F359E3D905D;
	Fri, 27 Feb 2026 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpdkCfBl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE389372B51
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 22:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772233102; cv=none; b=kPGZUh7uwgu3BOpb2whJCCmyOrf+d5LJllVYXhH8p1QKWemGejXZ1NBV3rX6sde6fBYJACPySEBY77lFc1wVwHrICunrpHORyLkESIOsWhM1LCFWxayW4fjZgiUK8UVSoVZ6j7v3T73CQKFzFYiQFFNhegyasTDQa4SS00H1qWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772233102; c=relaxed/simple;
	bh=qGbtXjOJ4qUlERU2ZMYpEqjUtlCP/k8DU4G+suDsKEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MpTZA+zlT42S/HKPTlQPp7n2SVX6HM4tzZuX7SsEb7wOKy0OgPjHDRam7Kv/I//UHNGab1ZiN2dBfX9oga8jNMXC/cnxHaxDTI7v/bK3eqnZAcfnBb5Du5byTWn1IJBon2WOBtXvq02TyQjARzoG+OmmmoFGeiP5Eoi6lj0rbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpdkCfBl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772233100; x=1803769100;
  h=date:from:to:cc:subject:message-id;
  bh=qGbtXjOJ4qUlERU2ZMYpEqjUtlCP/k8DU4G+suDsKEo=;
  b=GpdkCfBlNaTiJ3pvkDM0ezJiZIaJlVXutjVIV7e+AIXv0/yll9LgIIo9
   JQd3twd4KN5pXx8G3DCNtroBe+BngQ4b1juivvvT2DCcVmg2bVT+OrNnx
   zfJJ+VPdIMsuGEZc5OLPgc8fwKeD820RWLJ4i3ykEx7jqOF1dDoNTfXK6
   WuvDApLToJT7QbnR5XoL2yQgndyO1V6/FJDn4kKAvISPUWNNUKTDVbc9t
   Z6C3xn879A6B92Oi7dVwlHT9uZelpGCucCfxJ/xNE5HZ7t1Wv/caAguuY
   23TvFZufBwYEKPlZc9x7+E+ANruiXaMJWIwxuXwfEZI3ghnrOd37LpANL
   w==;
X-CSE-ConnectionGUID: yqUOoNQqR3SEtu0oftYHeA==
X-CSE-MsgGUID: DJdgcUArRMSI+yf30aPZTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77190729"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="77190729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 14:58:20 -0800
X-CSE-ConnectionGUID: jYAOto1JSKu21TY2Tt/OZQ==
X-CSE-MsgGUID: lmLElWytSXyHwdzQza9iQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="216162987"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2026 14:58:18 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw6ml-00000000B8d-35Y4;
	Fri, 27 Feb 2026 22:58:15 +0000
Date: Sat, 28 Feb 2026 06:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/dev-init-rework] BUILD SUCCESS
 16fdabe143fce2cbf89139677728e17e21b46c28
Message-ID: <202602280652.cexBoEbY-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32336-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: A03E91BED57
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/dev-init-rework
branch HEAD: 16fdabe143fce2cbf89139677728e17e21b46c28  gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()

elapsed time: 804m

configs tested: 344
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-23
arc                   randconfig-001-20260227    gcc-8.5.0
arc                   randconfig-001-20260228    gcc-14.3.0
arc                   randconfig-002-20260227    gcc-8.5.0
arc                   randconfig-002-20260228    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         axm55xx_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    gcc-14
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-23
arm                        keystone_defconfig    gcc-15.2.0
arm                            mmp2_defconfig    gcc-15.2.0
arm                        multi_v5_defconfig    clang-23
arm                        mvebu_v5_defconfig    gcc-15.2.0
arm                   randconfig-001-20260227    gcc-8.5.0
arm                   randconfig-001-20260228    gcc-14.3.0
arm                   randconfig-002-20260227    gcc-8.5.0
arm                   randconfig-002-20260228    gcc-14.3.0
arm                   randconfig-003-20260227    gcc-8.5.0
arm                   randconfig-003-20260228    gcc-14.3.0
arm                   randconfig-004-20260227    gcc-8.5.0
arm                   randconfig-004-20260228    gcc-14.3.0
arm                           u8500_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    clang-23
arm64                            alldefconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260227    clang-23
arm64                 randconfig-001-20260228    clang-23
arm64                 randconfig-002-20260227    clang-23
arm64                 randconfig-002-20260228    clang-23
arm64                 randconfig-003-20260227    clang-23
arm64                 randconfig-003-20260228    clang-23
arm64                 randconfig-004-20260227    clang-23
arm64                 randconfig-004-20260228    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260227    clang-23
csky                  randconfig-001-20260228    clang-23
csky                  randconfig-002-20260227    clang-23
csky                  randconfig-002-20260228    clang-23
hexagon                          alldefconfig    gcc-14
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260227    clang-23
hexagon               randconfig-001-20260228    clang-23
hexagon               randconfig-002-20260227    clang-23
hexagon               randconfig-002-20260228    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260227    clang-20
i386        buildonly-randconfig-001-20260228    clang-20
i386        buildonly-randconfig-002-20260227    clang-20
i386        buildonly-randconfig-002-20260228    clang-20
i386        buildonly-randconfig-003-20260227    clang-20
i386        buildonly-randconfig-003-20260228    clang-20
i386        buildonly-randconfig-004-20260227    clang-20
i386        buildonly-randconfig-004-20260228    clang-20
i386        buildonly-randconfig-005-20260227    clang-20
i386        buildonly-randconfig-005-20260228    clang-20
i386        buildonly-randconfig-006-20260227    clang-20
i386        buildonly-randconfig-006-20260228    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260227    clang-20
i386                  randconfig-002-20260227    clang-20
i386                  randconfig-003-20260227    clang-20
i386                  randconfig-004-20260227    clang-20
i386                  randconfig-005-20260227    clang-20
i386                  randconfig-006-20260227    clang-20
i386                  randconfig-007-20260227    clang-20
i386                  randconfig-011-20260227    clang-20
i386                  randconfig-011-20260227    gcc-14
i386                  randconfig-011-20260228    gcc-14
i386                  randconfig-012-20260227    gcc-14
i386                  randconfig-012-20260228    gcc-14
i386                  randconfig-013-20260227    clang-20
i386                  randconfig-013-20260227    gcc-14
i386                  randconfig-013-20260228    gcc-14
i386                  randconfig-014-20260227    gcc-14
i386                  randconfig-014-20260228    gcc-14
i386                  randconfig-015-20260227    gcc-13
i386                  randconfig-015-20260227    gcc-14
i386                  randconfig-015-20260228    gcc-14
i386                  randconfig-016-20260227    clang-20
i386                  randconfig-016-20260227    gcc-14
i386                  randconfig-016-20260228    gcc-14
i386                  randconfig-017-20260227    gcc-14
i386                  randconfig-017-20260228    gcc-14
loongarch                        alldefconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260227    clang-23
loongarch             randconfig-001-20260228    clang-23
loongarch             randconfig-002-20260227    clang-23
loongarch             randconfig-002-20260228    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    gcc-14
m68k                        m5272c3_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
m68k                            q40_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       bmips_be_defconfig    gcc-15.2.0
mips                           ci20_defconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                     decstation_defconfig    gcc-15.2.0
mips                          eyeq5_defconfig    gcc-14
mips                           ip30_defconfig    gcc-15.2.0
nios2                         10m50_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260227    clang-23
nios2                 randconfig-001-20260228    clang-23
nios2                 randconfig-002-20260227    clang-23
nios2                 randconfig-002-20260228    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                   de0_nano_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260227    clang-17
parisc                randconfig-001-20260227    gcc-8.5.0
parisc                randconfig-001-20260228    gcc-8.5.0
parisc                randconfig-002-20260227    clang-17
parisc                randconfig-002-20260227    gcc-8.5.0
parisc                randconfig-002-20260228    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    clang-23
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc                   bluestone_defconfig    gcc-15.2.0
powerpc                        cell_defconfig    gcc-14
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                      ep88xc_defconfig    gcc-15.2.0
powerpc                        fsp2_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    gcc-15.2.0
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                     mpc5200_defconfig    clang-23
powerpc                     mpc83xx_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc                       ppc64_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260227    clang-17
powerpc               randconfig-001-20260227    gcc-11.5.0
powerpc               randconfig-001-20260228    gcc-8.5.0
powerpc               randconfig-002-20260227    clang-17
powerpc               randconfig-002-20260228    gcc-8.5.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc                      tqm8xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260227    clang-17
powerpc64             randconfig-001-20260227    gcc-10.5.0
powerpc64             randconfig-001-20260228    gcc-8.5.0
powerpc64             randconfig-002-20260227    clang-17
powerpc64             randconfig-002-20260227    gcc-14.3.0
powerpc64             randconfig-002-20260228    gcc-8.5.0
riscv                            alldefconfig    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260227    gcc-12.5.0
riscv                 randconfig-001-20260228    gcc-15.2.0
riscv                 randconfig-002-20260227    gcc-12.5.0
riscv                 randconfig-002-20260228    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260227    gcc-12.5.0
s390                  randconfig-001-20260228    gcc-15.2.0
s390                  randconfig-002-20260227    gcc-12.5.0
s390                  randconfig-002-20260228    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    gcc-15.2.0
sh                             espt_defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260227    gcc-12.5.0
sh                    randconfig-001-20260228    gcc-15.2.0
sh                    randconfig-002-20260227    gcc-12.5.0
sh                    randconfig-002-20260228    gcc-15.2.0
sh                          sdk7780_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7724_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    clang-23
sh                           sh2007_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                   sh7724_generic_defconfig    gcc-15.2.0
sh                              ul2_defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260227    clang-23
sparc                 randconfig-001-20260228    gcc-9.5.0
sparc                 randconfig-002-20260227    clang-23
sparc                 randconfig-002-20260228    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260227    clang-23
sparc64               randconfig-001-20260228    gcc-9.5.0
sparc64               randconfig-002-20260227    clang-23
sparc64               randconfig-002-20260228    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260227    clang-23
um                    randconfig-001-20260228    gcc-9.5.0
um                    randconfig-002-20260227    clang-23
um                    randconfig-002-20260228    gcc-9.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260227    gcc-14
x86_64      buildonly-randconfig-001-20260228    gcc-14
x86_64      buildonly-randconfig-002-20260227    gcc-14
x86_64      buildonly-randconfig-002-20260228    gcc-14
x86_64      buildonly-randconfig-003-20260227    gcc-14
x86_64      buildonly-randconfig-003-20260228    gcc-14
x86_64      buildonly-randconfig-004-20260227    gcc-14
x86_64      buildonly-randconfig-004-20260228    gcc-14
x86_64      buildonly-randconfig-005-20260227    gcc-14
x86_64      buildonly-randconfig-005-20260228    gcc-14
x86_64      buildonly-randconfig-006-20260227    gcc-14
x86_64      buildonly-randconfig-006-20260228    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260227    gcc-13
x86_64                randconfig-001-20260228    gcc-14
x86_64                randconfig-002-20260227    gcc-13
x86_64                randconfig-002-20260228    gcc-14
x86_64                randconfig-003-20260227    gcc-13
x86_64                randconfig-003-20260228    gcc-14
x86_64                randconfig-004-20260227    gcc-13
x86_64                randconfig-004-20260228    gcc-14
x86_64                randconfig-005-20260227    gcc-13
x86_64                randconfig-005-20260228    gcc-14
x86_64                randconfig-006-20260227    gcc-13
x86_64                randconfig-006-20260228    gcc-14
x86_64                randconfig-011-20260227    gcc-14
x86_64                randconfig-011-20260228    gcc-14
x86_64                randconfig-012-20260227    gcc-14
x86_64                randconfig-012-20260228    gcc-14
x86_64                randconfig-013-20260227    clang-20
x86_64                randconfig-013-20260227    gcc-14
x86_64                randconfig-013-20260228    gcc-14
x86_64                randconfig-014-20260227    clang-20
x86_64                randconfig-014-20260227    gcc-14
x86_64                randconfig-014-20260228    gcc-14
x86_64                randconfig-015-20260227    clang-20
x86_64                randconfig-015-20260227    gcc-14
x86_64                randconfig-015-20260228    gcc-14
x86_64                randconfig-016-20260227    gcc-14
x86_64                randconfig-016-20260228    gcc-14
x86_64                randconfig-071-20260227    gcc-14
x86_64                randconfig-071-20260228    gcc-14
x86_64                randconfig-072-20260227    gcc-14
x86_64                randconfig-072-20260228    gcc-14
x86_64                randconfig-073-20260227    gcc-14
x86_64                randconfig-073-20260228    gcc-14
x86_64                randconfig-074-20260227    gcc-14
x86_64                randconfig-074-20260228    gcc-14
x86_64                randconfig-075-20260227    gcc-14
x86_64                randconfig-075-20260228    gcc-14
x86_64                randconfig-076-20260227    gcc-14
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
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                  cadence_csp_defconfig    gcc-15.2.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                  nommu_kc705_defconfig    clang-23
xtensa                randconfig-001-20260227    clang-23
xtensa                randconfig-001-20260228    gcc-9.5.0
xtensa                randconfig-002-20260227    clang-23
xtensa                randconfig-002-20260228    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

