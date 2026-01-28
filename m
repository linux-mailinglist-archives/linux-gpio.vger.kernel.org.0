Return-Path: <linux-gpio+bounces-31256-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKv/Or+Eemnx7AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31256-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 22:50:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA73A93D3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 22:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DBA8301874E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 21:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DA731C57B;
	Wed, 28 Jan 2026 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVm+akGb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760A622D7B0
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637048; cv=none; b=hFWJFPMkY8uwYiaAGM+v3B+gEHc9/g/jSG96KPnh4INbtqQqis01hs+/jFQiupreacDXAn10JpW1Wcij0VYq96i6ab1LruXM2n82mOyj8wNJVVUeLg28BdL5WoTQGBxb1aTWG0STAmTD0SVooRv57fWyUd4Lc3+7wWU+rNMjhB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637048; c=relaxed/simple;
	bh=hCwARhP7yxWUempzY89agXN1TPl39lV6Gfc91Dv4u6Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AU2Jy0g8jTFV93GtEFMcC9HA93SSF4xlPMEhBEOnyoxIsxntKTIO0eCTX9YqnTSDkNE58p1wJhKzSsNPBHkN64LjNm+5dUnUafFB/MeKb1YffE9h6Ayxj5GKHTAArb52+Rl+UfkaDMvPFw/O7fZ2N8c9WuosOCbceOOWP2VEN3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVm+akGb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769637046; x=1801173046;
  h=date:from:to:cc:subject:message-id;
  bh=hCwARhP7yxWUempzY89agXN1TPl39lV6Gfc91Dv4u6Y=;
  b=QVm+akGbnQfru7zGcujVikjjzXbnXFs+N2j+VOIp5u69QE6ygdXVY4o3
   E2k/GXsjD9x9iGZjIIo3+VpmDC0BRQbXL34pmdgrlsATsJwzsXO/X5e2t
   xof3/BsGYtFisYxKcI6axkrtCgRk8e9GVmKFdqoBQgWzvU5Yw/HVeC2Ec
   QeAOl6zqqJMVxHWAasRAzrrEY8aYv1YazJJP8ka+fy/fmd/RWTmdbjDNK
   hUxbbB+Q2dVS34B5ixgNCmHeEdpUhsAi6Y3Q1Iaz5d/g61XVXg+PMNve1
   HTUX0ZOKm9vK0VcgvOJ6NE+ZDoqLSHAuUsCqjqwxKagrPZSQRYOoff3gx
   g==;
X-CSE-ConnectionGUID: PU6KRBGDT8iD/vSFw2/84g==
X-CSE-MsgGUID: tsxBwPdjSWaoj90AtSup2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70061238"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70061238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:50:45 -0800
X-CSE-ConnectionGUID: /Q1XAf8gQS6XjGB3b7lYIg==
X-CSE-MsgGUID: 5GK4L1Z6Snq7oy0hl1K3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208473223"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 13:50:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlDQv-00000000apA-309l;
	Wed, 28 Jan 2026 21:50:41 +0000
Date: Thu, 29 Jan 2026 05:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 aa7e37fd770bafaaf856ab77735296955b93e377
Message-ID: <202601290517.igStTtYt-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31256-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EA73A93D3
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: aa7e37fd770bafaaf856ab77735296955b93e377  gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR

elapsed time: 724m

configs tested: 268
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260128    gcc-8.5.0
arc                   randconfig-001-20260129    clang-18
arc                   randconfig-002-20260128    gcc-8.5.0
arc                   randconfig-002-20260129    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         at91_dt_defconfig    clang-22
arm                         bcm2835_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                        mvebu_v5_defconfig    clang-22
arm                        neponset_defconfig    gcc-15.2.0
arm                          pxa910_defconfig    gcc-15.2.0
arm                   randconfig-001-20260128    gcc-8.5.0
arm                   randconfig-001-20260129    clang-18
arm                   randconfig-002-20260128    gcc-8.5.0
arm                   randconfig-002-20260129    clang-18
arm                   randconfig-003-20260128    gcc-8.5.0
arm                   randconfig-003-20260129    clang-18
arm                   randconfig-004-20260128    gcc-8.5.0
arm                   randconfig-004-20260129    clang-18
arm                             rpc_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260128    gcc-14.3.0
arm64                 randconfig-001-20260129    gcc-11.5.0
arm64                 randconfig-002-20260128    gcc-14.3.0
arm64                 randconfig-002-20260129    gcc-11.5.0
arm64                 randconfig-003-20260128    gcc-14.3.0
arm64                 randconfig-003-20260129    gcc-11.5.0
arm64                 randconfig-004-20260128    gcc-14.3.0
arm64                 randconfig-004-20260129    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260128    gcc-14.3.0
csky                  randconfig-001-20260129    gcc-11.5.0
csky                  randconfig-002-20260128    gcc-14.3.0
csky                  randconfig-002-20260129    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260128    clang-22
hexagon               randconfig-001-20260129    clang-22
hexagon               randconfig-002-20260128    clang-22
hexagon               randconfig-002-20260129    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260128    clang-20
i386        buildonly-randconfig-001-20260129    clang-20
i386        buildonly-randconfig-002-20260128    clang-20
i386        buildonly-randconfig-002-20260129    clang-20
i386        buildonly-randconfig-003-20260128    clang-20
i386        buildonly-randconfig-003-20260129    clang-20
i386        buildonly-randconfig-004-20260128    clang-20
i386        buildonly-randconfig-004-20260129    clang-20
i386        buildonly-randconfig-005-20260128    clang-20
i386        buildonly-randconfig-005-20260129    clang-20
i386        buildonly-randconfig-006-20260128    clang-20
i386        buildonly-randconfig-006-20260129    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260128    gcc-14
i386                  randconfig-001-20260129    clang-20
i386                  randconfig-002-20260128    gcc-14
i386                  randconfig-002-20260129    clang-20
i386                  randconfig-003-20260128    gcc-14
i386                  randconfig-003-20260129    clang-20
i386                  randconfig-004-20260128    gcc-14
i386                  randconfig-004-20260129    clang-20
i386                  randconfig-005-20260128    gcc-14
i386                  randconfig-005-20260129    clang-20
i386                  randconfig-006-20260128    gcc-14
i386                  randconfig-006-20260129    clang-20
i386                  randconfig-007-20260128    gcc-14
i386                  randconfig-007-20260129    clang-20
i386                  randconfig-011-20260128    clang-20
i386                  randconfig-012-20260128    clang-20
i386                  randconfig-013-20260128    clang-20
i386                  randconfig-014-20260128    clang-20
i386                  randconfig-015-20260128    clang-20
i386                  randconfig-016-20260128    clang-20
i386                  randconfig-017-20260128    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260128    clang-22
loongarch             randconfig-001-20260129    clang-22
loongarch             randconfig-002-20260128    clang-22
loongarch             randconfig-002-20260129    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                          atari_defconfig    clang-22
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5407c3_defconfig    gcc-15.2.0
m68k                        stmark2_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260128    clang-22
nios2                 randconfig-001-20260129    clang-22
nios2                 randconfig-002-20260128    clang-22
nios2                 randconfig-002-20260129    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260129    gcc-8.5.0
parisc                randconfig-002-20260129    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     ep8248e_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc                      pasemi_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260129    gcc-8.5.0
powerpc               randconfig-002-20260129    gcc-8.5.0
powerpc64             randconfig-001-20260129    gcc-8.5.0
powerpc64             randconfig-002-20260129    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260128    gcc-13.4.0
riscv                 randconfig-001-20260129    gcc-15.2.0
riscv                 randconfig-002-20260128    gcc-13.4.0
riscv                 randconfig-002-20260129    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260128    gcc-13.4.0
s390                  randconfig-001-20260129    gcc-15.2.0
s390                  randconfig-002-20260128    gcc-13.4.0
s390                  randconfig-002-20260129    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260128    gcc-13.4.0
sh                    randconfig-001-20260129    gcc-15.2.0
sh                    randconfig-002-20260128    gcc-13.4.0
sh                    randconfig-002-20260129    gcc-15.2.0
sh                          rsk7201_defconfig    clang-22
sh                          rsk7201_defconfig    gcc-15.2.0
sh                           se7705_defconfig    clang-22
sh                           se7722_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260128    gcc-11.5.0
sparc                 randconfig-001-20260129    gcc-15.2.0
sparc                 randconfig-002-20260128    gcc-11.5.0
sparc                 randconfig-002-20260129    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260128    gcc-11.5.0
sparc64               randconfig-001-20260129    gcc-15.2.0
sparc64               randconfig-002-20260128    gcc-11.5.0
sparc64               randconfig-002-20260129    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260128    gcc-11.5.0
um                    randconfig-001-20260129    gcc-15.2.0
um                    randconfig-002-20260128    gcc-11.5.0
um                    randconfig-002-20260129    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260128    gcc-14
x86_64      buildonly-randconfig-001-20260129    gcc-13
x86_64      buildonly-randconfig-002-20260128    gcc-14
x86_64      buildonly-randconfig-002-20260129    gcc-13
x86_64      buildonly-randconfig-003-20260128    gcc-14
x86_64      buildonly-randconfig-003-20260129    gcc-13
x86_64      buildonly-randconfig-004-20260128    gcc-14
x86_64      buildonly-randconfig-004-20260129    gcc-13
x86_64      buildonly-randconfig-005-20260128    gcc-14
x86_64      buildonly-randconfig-005-20260129    gcc-13
x86_64      buildonly-randconfig-006-20260128    gcc-14
x86_64      buildonly-randconfig-006-20260129    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260129    clang-20
x86_64                randconfig-002-20260129    clang-20
x86_64                randconfig-003-20260129    clang-20
x86_64                randconfig-004-20260129    clang-20
x86_64                randconfig-005-20260129    clang-20
x86_64                randconfig-006-20260129    clang-20
x86_64                randconfig-011-20260128    clang-20
x86_64                randconfig-012-20260128    clang-20
x86_64                randconfig-013-20260128    clang-20
x86_64                randconfig-014-20260128    clang-20
x86_64                randconfig-015-20260128    clang-20
x86_64                randconfig-016-20260128    clang-20
x86_64                randconfig-071-20260128    clang-20
x86_64                randconfig-071-20260129    gcc-14
x86_64                randconfig-072-20260128    clang-20
x86_64                randconfig-072-20260129    gcc-14
x86_64                randconfig-073-20260128    clang-20
x86_64                randconfig-073-20260129    gcc-14
x86_64                randconfig-074-20260128    clang-20
x86_64                randconfig-074-20260129    gcc-14
x86_64                randconfig-075-20260128    clang-20
x86_64                randconfig-075-20260129    gcc-14
x86_64                randconfig-076-20260128    clang-20
x86_64                randconfig-076-20260129    gcc-14
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
xtensa                randconfig-001-20260128    gcc-11.5.0
xtensa                randconfig-001-20260129    gcc-15.2.0
xtensa                randconfig-002-20260128    gcc-11.5.0
xtensa                randconfig-002-20260129    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

