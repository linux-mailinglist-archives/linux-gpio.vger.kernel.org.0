Return-Path: <linux-gpio+bounces-31827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIlsM79JlmngdQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:22:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A6F15AE74
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC84F306F796
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 23:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AEB33AD9A;
	Wed, 18 Feb 2026 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W11olWNQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3633AD90
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771456877; cv=none; b=uPq3shWLQoK/d3xP3rVxW6/3yMEUW+ga3cjjAbi95qbSvZwUoY0gsrrAg4sDx/HzpCEh4NCzrLcevK4ZJInY1OCUF8g46r6KA2qC/pON89RIFpJbZV7eNoNi5NfJ05V8VGocEVF/2M1NT83tJN4j0vGbzbXAgdtLBy80Lze+8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771456877; c=relaxed/simple;
	bh=uu6aLte4Lk51k8gtqai7q3L/arx2SH54QK+pU74cwSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fDefdsy7DwaJKxCj5tJXfQjhMTbZM/41nMPurs2LPPQzU1/jCdrLJX4nXbxmD7tbBH+F0E2whGaDaImU30XCF4LtvEffzwrj1gi8qzi57rcJn6Ks64EoTnWdTD0vlssIJ6uju5SwkeM/BDVDASfoXOjK0YA/+Q7XOoSXRcuO9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W11olWNQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771456874; x=1802992874;
  h=date:from:to:cc:subject:message-id;
  bh=uu6aLte4Lk51k8gtqai7q3L/arx2SH54QK+pU74cwSY=;
  b=W11olWNQHAjw9ApSzaP4p7DsGcn2Ztb+9382eWH8u0ntiH8KSDDKXNkG
   PUZ3I/+vZ6rVIxaf9sIZcuv4Q73AaiVrklrzBA6TpU8lswfYXlyX1WM6/
   77MNtsNr9wfKNwf2XLLkMxy7KdDceqmEmmURYtxyYYabQY3L5Scyr57xk
   +C9RfYPRifDPVaoGlDjQU15nL6d3YSwvvbWJFzaX6g+900wLlBsQIqemk
   McafkgUYkQ5pLpNo9b5btkKFiJ+xUfOOu2+77+bZ663QYfvd1k7zyFcRz
   exjUzvPqX2yHqyUbTE/A23C33h1U2Z+2poQOHRs0k8WNw/ThQSxQNTd9Q
   w==;
X-CSE-ConnectionGUID: P27mlfuMTpSbPIf11GvccQ==
X-CSE-MsgGUID: EADkdKINSIuBucEXNB0SqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83261515"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="83261515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 15:21:12 -0800
X-CSE-ConnectionGUID: wNoJPW39RemGbHLzujrcZQ==
X-CSE-MsgGUID: BXNPGE0PTua+hk6bJKmBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212642922"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 15:21:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsqr0-000000012o8-2UkB;
	Wed, 18 Feb 2026 23:21:10 +0000
Date: Thu, 19 Feb 2026 07:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 fbd03587ba732c612b8a569d1cf5bed72bd3a27c
Message-ID: <202602190728.Es2GFcc6-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-31827-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 35A6F15AE74
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: fbd03587ba732c612b8a569d1cf5bed72bd3a27c  gpio: amd-fch: ionly return allowed values from amd_fch_gpio_get()

elapsed time: 796m

configs tested: 352
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-23
arc                   randconfig-001-20260218    clang-23
arc                   randconfig-001-20260218    gcc-9.5.0
arc                   randconfig-001-20260219    clang-23
arc                   randconfig-002-20260218    clang-23
arc                   randconfig-002-20260218    gcc-8.5.0
arc                   randconfig-002-20260219    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                            hisi_defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-23
arm                            mps2_defconfig    clang-23
arm                        multi_v5_defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    gcc-15.2.0
arm                        mvebu_v5_defconfig    clang-23
arm                        neponset_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-23
arm                             pxa_defconfig    gcc-15.2.0
arm                            qcom_defconfig    gcc-15.2.0
arm                   randconfig-001-20260218    clang-23
arm                   randconfig-001-20260219    clang-23
arm                   randconfig-002-20260218    clang-23
arm                   randconfig-002-20260219    clang-23
arm                   randconfig-003-20260218    clang-23
arm                   randconfig-003-20260219    clang-23
arm                   randconfig-004-20260218    clang-23
arm                   randconfig-004-20260218    gcc-10.5.0
arm                   randconfig-004-20260219    clang-23
arm                         socfpga_defconfig    clang-23
arm                           spitz_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260218    clang-23
arm64                 randconfig-001-20260219    gcc-8.5.0
arm64                 randconfig-002-20260218    clang-23
arm64                 randconfig-002-20260219    gcc-8.5.0
arm64                 randconfig-003-20260218    clang-23
arm64                 randconfig-003-20260219    gcc-8.5.0
arm64                 randconfig-004-20260218    clang-23
arm64                 randconfig-004-20260219    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260218    clang-23
csky                  randconfig-001-20260219    gcc-8.5.0
csky                  randconfig-002-20260218    clang-23
csky                  randconfig-002-20260219    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260218    clang-16
hexagon               randconfig-001-20260219    clang-17
hexagon               randconfig-002-20260218    clang-16
hexagon               randconfig-002-20260219    clang-17
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260218    clang-20
i386        buildonly-randconfig-001-20260219    gcc-14
i386        buildonly-randconfig-002-20260218    clang-20
i386        buildonly-randconfig-002-20260219    gcc-14
i386        buildonly-randconfig-003-20260218    clang-20
i386        buildonly-randconfig-003-20260219    gcc-14
i386        buildonly-randconfig-004-20260218    clang-20
i386        buildonly-randconfig-004-20260218    gcc-13
i386        buildonly-randconfig-004-20260219    gcc-14
i386        buildonly-randconfig-005-20260218    clang-20
i386        buildonly-randconfig-005-20260219    gcc-14
i386        buildonly-randconfig-006-20260218    clang-20
i386        buildonly-randconfig-006-20260219    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260218    clang-20
i386                  randconfig-001-20260219    gcc-14
i386                  randconfig-002-20260218    clang-20
i386                  randconfig-002-20260218    gcc-14
i386                  randconfig-002-20260219    gcc-14
i386                  randconfig-003-20260218    clang-20
i386                  randconfig-003-20260218    gcc-14
i386                  randconfig-003-20260219    gcc-14
i386                  randconfig-004-20260218    clang-20
i386                  randconfig-004-20260218    gcc-13
i386                  randconfig-004-20260219    gcc-14
i386                  randconfig-005-20260218    clang-20
i386                  randconfig-005-20260219    gcc-14
i386                  randconfig-006-20260218    clang-20
i386                  randconfig-006-20260219    gcc-14
i386                  randconfig-007-20260218    clang-20
i386                  randconfig-007-20260218    gcc-14
i386                  randconfig-007-20260219    gcc-14
i386                  randconfig-011-20260218    gcc-12
i386                  randconfig-011-20260218    gcc-14
i386                  randconfig-011-20260219    clang-20
i386                  randconfig-012-20260218    gcc-14
i386                  randconfig-012-20260219    clang-20
i386                  randconfig-013-20260218    clang-20
i386                  randconfig-013-20260218    gcc-14
i386                  randconfig-013-20260219    clang-20
i386                  randconfig-014-20260218    gcc-14
i386                  randconfig-014-20260219    clang-20
i386                  randconfig-015-20260218    gcc-14
i386                  randconfig-015-20260219    clang-20
i386                  randconfig-016-20260218    clang-20
i386                  randconfig-016-20260218    gcc-14
i386                  randconfig-016-20260219    clang-20
i386                  randconfig-017-20260218    gcc-14
i386                  randconfig-017-20260219    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260218    clang-16
loongarch             randconfig-001-20260218    clang-23
loongarch             randconfig-001-20260219    clang-17
loongarch             randconfig-002-20260218    clang-16
loongarch             randconfig-002-20260218    clang-23
loongarch             randconfig-002-20260219    clang-17
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath25_defconfig    clang-23
mips                         cobalt_defconfig    clang-23
mips                 decstation_r4k_defconfig    clang-23
mips                malta_qemu_32r6_defconfig    clang-23
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-23
mips                          rm200_defconfig    clang-23
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260218    clang-16
nios2                 randconfig-001-20260218    gcc-11.5.0
nios2                 randconfig-001-20260219    clang-17
nios2                 randconfig-002-20260218    clang-16
nios2                 randconfig-002-20260218    gcc-8.5.0
nios2                 randconfig-002-20260219    clang-17
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc         de0_nano_multicore_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260218    gcc-8.5.0
parisc                randconfig-001-20260219    clang-23
parisc                randconfig-002-20260218    gcc-8.5.0
parisc                randconfig-002-20260218    gcc-9.5.0
parisc                randconfig-002-20260219    clang-23
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                    amigaone_defconfig    clang-23
powerpc                      chrp32_defconfig    clang-23
powerpc                      cm5200_defconfig    clang-23
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                      ep88xc_defconfig    clang-23
powerpc                        fsp2_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    gcc-15.2.0
powerpc                      katmai_defconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    clang-23
powerpc                   lite5200b_defconfig    gcc-15.2.0
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc                      pcm030_defconfig    clang-23
powerpc                     ppa8548_defconfig    gcc-15.2.0
powerpc                      ppc44x_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260218    clang-23
powerpc               randconfig-001-20260218    gcc-8.5.0
powerpc               randconfig-001-20260219    clang-23
powerpc               randconfig-002-20260218    gcc-8.5.0
powerpc               randconfig-002-20260219    clang-23
powerpc                     tqm8555_defconfig    clang-23
powerpc                        warp_defconfig    clang-23
powerpc64             randconfig-001-20260218    gcc-8.5.0
powerpc64             randconfig-001-20260219    clang-23
powerpc64             randconfig-002-20260218    clang-23
powerpc64             randconfig-002-20260218    gcc-8.5.0
powerpc64             randconfig-002-20260219    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260218    clang-23
riscv                 randconfig-001-20260219    clang-17
riscv                 randconfig-002-20260218    clang-23
riscv                 randconfig-002-20260219    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260218    clang-23
s390                  randconfig-001-20260219    clang-17
s390                  randconfig-002-20260218    clang-23
s390                  randconfig-002-20260219    clang-17
s390                       zfcpdump_defconfig    gcc-15.2.0
sh                               alldefconfig    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          landisk_defconfig    gcc-15.2.0
sh                          polaris_defconfig    gcc-15.2.0
sh                          r7785rp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260218    clang-23
sh                    randconfig-001-20260219    clang-17
sh                    randconfig-002-20260218    clang-23
sh                    randconfig-002-20260219    clang-17
sh                          rsk7269_defconfig    gcc-15.2.0
sh                           se7619_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260218    gcc-10.5.0
sparc                 randconfig-001-20260218    gcc-14.3.0
sparc                 randconfig-001-20260219    gcc-8.5.0
sparc                 randconfig-002-20260218    gcc-10.5.0
sparc                 randconfig-002-20260218    gcc-8.5.0
sparc                 randconfig-002-20260219    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260218    gcc-10.5.0
sparc64               randconfig-001-20260218    gcc-11.5.0
sparc64               randconfig-001-20260219    gcc-8.5.0
sparc64               randconfig-002-20260218    gcc-10.5.0
sparc64               randconfig-002-20260218    gcc-12.5.0
sparc64               randconfig-002-20260219    gcc-8.5.0
um                               alldefconfig    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260218    clang-23
um                    randconfig-001-20260218    gcc-10.5.0
um                    randconfig-001-20260219    gcc-8.5.0
um                    randconfig-002-20260218    gcc-10.5.0
um                    randconfig-002-20260218    gcc-14
um                    randconfig-002-20260219    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260218    gcc-14
x86_64      buildonly-randconfig-001-20260219    gcc-14
x86_64      buildonly-randconfig-002-20260218    clang-20
x86_64      buildonly-randconfig-002-20260218    gcc-14
x86_64      buildonly-randconfig-002-20260219    gcc-14
x86_64      buildonly-randconfig-003-20260218    clang-20
x86_64      buildonly-randconfig-003-20260218    gcc-14
x86_64      buildonly-randconfig-003-20260219    gcc-14
x86_64      buildonly-randconfig-004-20260218    gcc-14
x86_64      buildonly-randconfig-004-20260219    gcc-14
x86_64      buildonly-randconfig-005-20260218    gcc-14
x86_64      buildonly-randconfig-005-20260219    gcc-14
x86_64      buildonly-randconfig-006-20260218    clang-20
x86_64      buildonly-randconfig-006-20260218    gcc-14
x86_64      buildonly-randconfig-006-20260219    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260218    clang-20
x86_64                randconfig-001-20260218    gcc-14
x86_64                randconfig-001-20260219    clang-20
x86_64                randconfig-002-20260218    clang-20
x86_64                randconfig-002-20260218    gcc-14
x86_64                randconfig-002-20260219    clang-20
x86_64                randconfig-003-20260218    gcc-14
x86_64                randconfig-003-20260219    clang-20
x86_64                randconfig-004-20260218    clang-20
x86_64                randconfig-004-20260218    gcc-14
x86_64                randconfig-004-20260219    clang-20
x86_64                randconfig-005-20260218    gcc-14
x86_64                randconfig-005-20260219    clang-20
x86_64                randconfig-006-20260218    clang-20
x86_64                randconfig-006-20260218    gcc-14
x86_64                randconfig-006-20260219    clang-20
x86_64                randconfig-011-20260218    clang-20
x86_64                randconfig-011-20260218    gcc-13
x86_64                randconfig-011-20260219    gcc-14
x86_64                randconfig-012-20260218    gcc-13
x86_64                randconfig-012-20260219    gcc-14
x86_64                randconfig-013-20260218    gcc-13
x86_64                randconfig-013-20260218    gcc-14
x86_64                randconfig-013-20260219    gcc-14
x86_64                randconfig-014-20260218    clang-20
x86_64                randconfig-014-20260218    gcc-13
x86_64                randconfig-014-20260219    gcc-14
x86_64                randconfig-015-20260218    gcc-13
x86_64                randconfig-015-20260219    gcc-14
x86_64                randconfig-016-20260218    gcc-13
x86_64                randconfig-016-20260218    gcc-14
x86_64                randconfig-016-20260219    gcc-14
x86_64                randconfig-071-20260218    clang-20
x86_64                randconfig-071-20260219    gcc-14
x86_64                randconfig-072-20260218    clang-20
x86_64                randconfig-072-20260219    gcc-14
x86_64                randconfig-073-20260218    clang-20
x86_64                randconfig-073-20260219    gcc-14
x86_64                randconfig-074-20260218    clang-20
x86_64                randconfig-074-20260219    gcc-14
x86_64                randconfig-075-20260218    clang-20
x86_64                randconfig-075-20260219    gcc-14
x86_64                randconfig-076-20260218    clang-20
x86_64                randconfig-076-20260218    gcc-14
x86_64                randconfig-076-20260219    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                       common_defconfig    gcc-15.2.0
xtensa                generic_kc705_defconfig    clang-23
xtensa                randconfig-001-20260218    gcc-10.5.0
xtensa                randconfig-001-20260218    gcc-9.5.0
xtensa                randconfig-001-20260219    gcc-8.5.0
xtensa                randconfig-002-20260218    gcc-10.5.0
xtensa                randconfig-002-20260219    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

