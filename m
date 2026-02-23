Return-Path: <linux-gpio+bounces-32090-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBvUAkPdnGl/LwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32090-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 00:05:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3F17EC70
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 00:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C426E3100DCD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 23:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857C037D120;
	Mon, 23 Feb 2026 23:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvfwefO5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0301330B22
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 23:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887830; cv=none; b=Bd2VW7IrGKUsNJfX2vJD/o23Bi7sIiSJ4Pd5U9DiKhDpsB2YMvGBznszel4QScmZGZciZBJFjCC0ldnyo7KVs4LccRLDi9FGMObppkdD+j0hY/duyHLIX2XRmmIr4Vc6QoJuHYPajytOJu39HXajtz+FMhamf3G302/4IztxxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887830; c=relaxed/simple;
	bh=ESb2LKN6+6gjGQ71Vc1rkQ6XxV44UX+e6GLqA0aI8S4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MQH38NFykbUk2iRQJezhoIlO1tukbPZE9334GsPWYb7UTwureY72o6o1sN5LaZF8D+W0Jir3G15wDmzRw0ScKyIiZaPre6QokWloGGdYoN7p2simd9WFVReocg4OXd34CY7x/cKqqXNAzyGFCtFQ1zRhgFePar8t4zVCbHOPyCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvfwefO5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771887828; x=1803423828;
  h=date:from:to:cc:subject:message-id;
  bh=ESb2LKN6+6gjGQ71Vc1rkQ6XxV44UX+e6GLqA0aI8S4=;
  b=JvfwefO5tKkIlxKrCaiPrceSBq7GCeEsWZwdC8RvvehnKX3+zN0P4ZI8
   O3UezFqUOJqLAezORc5qPbO1Vt1YvI5FwvltbeSv9XJVi8htqLYfbSqx3
   Bkkw2Ix5GzVeVuLteGqD3yBMCxVzWj2VSfnOpcvyXyPBdBk/b8ZMJ4m8p
   d6TXlSdDzChGbpAw9U2t6tduIKjoE22yRucNPKSMnyyQ4JrleDk52oqWS
   if+7BDr7trxzi+V/q8Qbl+OfaLZpqK7BPfOfL2iPCrW+Ja0CBzemcmzEv
   ApZrI76VjOf/q9O22/1KeZmctHcTGJ4fU+khM+pUQ0N//RgMhzE0gYc4b
   A==;
X-CSE-ConnectionGUID: p3ZFto+gTAO0tzoQOIq/qQ==
X-CSE-MsgGUID: 4GFppTKMSGaAmUtfasHTKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72600579"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72600579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:03:48 -0800
X-CSE-ConnectionGUID: pZpFum6GQIS8UTQEcDCfIA==
X-CSE-MsgGUID: xP7WHgbjSbycwsXO9+dTMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="243771353"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2026 15:03:46 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuexr-000000000sf-3WsX;
	Mon, 23 Feb 2026 23:03:43 +0000
Date: Tue, 24 Feb 2026 07:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 ec2cceadfae72304ca19650f9cac4b2a97b8a2fc
Message-ID: <202602240702.D07hPQkz-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-32090-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 7AC3F17EC70
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: ec2cceadfae72304ca19650f9cac4b2a97b8a2fc  gpiolib: normalize the return value of gc->get() on behalf of buggy drivers

elapsed time: 721m

configs tested: 219
configs skipped: 3

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
arc                              allyesconfig    gcc-15.2.0
arc                          axs101_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260223    gcc-8.5.0
arc                   randconfig-001-20260224    gcc-14.3.0
arc                   randconfig-002-20260223    gcc-8.5.0
arc                   randconfig-002-20260223    gcc-9.5.0
arc                   randconfig-002-20260224    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         assabet_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    gcc-15.2.0
arm                   randconfig-001-20260223    gcc-10.5.0
arm                   randconfig-001-20260223    gcc-8.5.0
arm                   randconfig-001-20260224    gcc-14.3.0
arm                   randconfig-002-20260223    clang-23
arm                   randconfig-002-20260223    gcc-8.5.0
arm                   randconfig-002-20260224    gcc-14.3.0
arm                   randconfig-003-20260223    gcc-13.4.0
arm                   randconfig-003-20260223    gcc-8.5.0
arm                   randconfig-003-20260224    gcc-14.3.0
arm                   randconfig-004-20260223    gcc-11.5.0
arm                   randconfig-004-20260223    gcc-8.5.0
arm                   randconfig-004-20260224    gcc-14.3.0
arm                           spitz_defconfig    gcc-15.2.0
arm                           tegra_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260223    gcc-14.3.0
arm64                 randconfig-002-20260223    clang-17
arm64                 randconfig-003-20260223    clang-17
arm64                 randconfig-004-20260223    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260223    gcc-9.5.0
csky                  randconfig-002-20260223    gcc-11.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260223    clang-23
hexagon               randconfig-001-20260224    clang-16
hexagon               randconfig-002-20260223    clang-23
hexagon               randconfig-002-20260224    clang-16
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260223    gcc-14
i386        buildonly-randconfig-002-20260223    gcc-14
i386        buildonly-randconfig-003-20260223    gcc-14
i386        buildonly-randconfig-004-20260223    gcc-14
i386        buildonly-randconfig-005-20260223    gcc-14
i386        buildonly-randconfig-006-20260223    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260223    gcc-14
i386                  randconfig-002-20260223    clang-20
i386                  randconfig-002-20260223    gcc-14
i386                  randconfig-003-20260223    clang-20
i386                  randconfig-003-20260223    gcc-14
i386                  randconfig-004-20260223    gcc-14
i386                  randconfig-005-20260223    gcc-14
i386                  randconfig-006-20260223    gcc-14
i386                  randconfig-007-20260223    gcc-14
i386                  randconfig-011-20260223    clang-20
i386                  randconfig-012-20260223    clang-20
i386                  randconfig-013-20260223    clang-20
i386                  randconfig-014-20260223    clang-20
i386                  randconfig-015-20260223    clang-20
i386                  randconfig-016-20260223    clang-20
i386                  randconfig-017-20260223    clang-20
loongarch                        alldefconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260223    clang-23
loongarch             randconfig-001-20260223    gcc-15.2.0
loongarch             randconfig-001-20260224    clang-16
loongarch             randconfig-002-20260223    clang-23
loongarch             randconfig-002-20260223    gcc-15.2.0
loongarch             randconfig-002-20260224    clang-16
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip32_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260223    clang-23
nios2                 randconfig-001-20260223    gcc-11.5.0
nios2                 randconfig-001-20260224    clang-16
nios2                 randconfig-002-20260223    clang-23
nios2                 randconfig-002-20260223    gcc-11.5.0
nios2                 randconfig-002-20260224    clang-16
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
parisc                randconfig-001-20260223    gcc-8.5.0
parisc                randconfig-002-20260223    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      cm5200_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260223    gcc-8.5.0
powerpc               randconfig-002-20260223    gcc-8.5.0
powerpc64             randconfig-001-20260223    gcc-8.5.0
powerpc64             randconfig-002-20260223    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.2.0
sh                               j2_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    gcc-15.2.0
sh                             sh03_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260223    clang-23
sparc                 randconfig-002-20260223    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260223    clang-23
sparc64               randconfig-002-20260223    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260223    clang-23
um                    randconfig-002-20260223    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260223    gcc-14
x86_64      buildonly-randconfig-001-20260224    gcc-14
x86_64      buildonly-randconfig-002-20260223    gcc-14
x86_64      buildonly-randconfig-002-20260224    gcc-14
x86_64      buildonly-randconfig-003-20260223    gcc-14
x86_64      buildonly-randconfig-003-20260224    gcc-14
x86_64      buildonly-randconfig-004-20260223    gcc-14
x86_64      buildonly-randconfig-004-20260224    gcc-14
x86_64      buildonly-randconfig-005-20260223    gcc-14
x86_64      buildonly-randconfig-005-20260224    gcc-14
x86_64      buildonly-randconfig-006-20260223    gcc-14
x86_64      buildonly-randconfig-006-20260224    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20260223    gcc-14
x86_64                randconfig-072-20260223    gcc-14
x86_64                randconfig-073-20260223    gcc-14
x86_64                randconfig-074-20260223    clang-20
x86_64                randconfig-075-20260223    clang-20
x86_64                randconfig-076-20260223    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260223    clang-23
xtensa                randconfig-002-20260223    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

