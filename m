Return-Path: <linux-gpio+bounces-32162-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCaaA08tnmmkTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32162-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 23:59:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577018DF64
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 23:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA390302CD21
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 22:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD7E34A785;
	Tue, 24 Feb 2026 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hB68U5wy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1386734D391
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973961; cv=none; b=G9dBE1nZiBhuy4Pu7LRbzoYhebcS1NRU57WNDjkpyw4P3hv7KcUmib7RobM+ch4MXon6Q+MXQ+Gn9hqccWlFUIIepWNFDMPOW+FsIyvUOqW2CfardEprsP+4aBpvLdXiX7Gg3JWismC+HpOXwNMfl9sFBGM/QFsQFLLcGfi5JMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973961; c=relaxed/simple;
	bh=TLY8R8u985GfWd/tFgQ4UjHeSS/rHS6jFrNm5G3ZZIs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXW0udrfvcqz5bcg7H0bXI45ff8Oabl9YtkbOkO85RIGTZXgw9x3t8Qf6NpvLJGmQtLIGn8fAd8BO1pjMV8fvfnPzVsr2tNTpQ5v5za3Lh91ohYcZ5pSy4GUEwmr3as0n7BjuwkldbtznAm19ITKtpv+kbya+FZNM4wFZJgR0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hB68U5wy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771973960; x=1803509960;
  h=date:from:to:cc:subject:message-id;
  bh=TLY8R8u985GfWd/tFgQ4UjHeSS/rHS6jFrNm5G3ZZIs=;
  b=hB68U5wy0zKq2JbBuGlCYylucuIElHyjrcPxOGNlMhu20jpPuIu5lj/I
   tH1h+hSw8LFymIXp+s+CKn7W7GfgKENECc6djFQdbpBk3XCsyN1ATJRwC
   SNePLjoDl7c4A3h3glYxbeYmysKRUkprO6PP4Zoer9c11LQPwOCyEKnNl
   x70qro52ATGi/IP3ZxmMZtb5YjfnrrGnObpuFNrnSU9+H/i8vvuySqgJg
   wEIAQmrsq4I5C1j8/+JQ8SLqZ8IK8MjXULa/3ljMMviApEROm7PwLXDRc
   olgNL4hGYPBG9pToT5ElFKyIcQcNOxbXdqtRiTXMvv8PrHM6UHtzhYvlv
   w==;
X-CSE-ConnectionGUID: xtcbA/vOSga5POghSKvWSA==
X-CSE-MsgGUID: /9hTBs/YQkCiuoiv+AMaCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76869558"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="76869558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 14:59:19 -0800
X-CSE-ConnectionGUID: +hFspxkWRQqAOG/QSxl3cQ==
X-CSE-MsgGUID: JvjqtxnZRIOz+dHaida7HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="220164700"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Feb 2026 14:59:18 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv1N5-000000002YP-2yLy;
	Tue, 24 Feb 2026 22:59:15 +0000
Date: Wed, 25 Feb 2026 06:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 ffe70e8ab8136822c40361f8abc2eb9335ec9396
Message-ID: <202602250657.ezE0INlo-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-32162-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 7577018DF64
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: ffe70e8ab8136822c40361f8abc2eb9335ec9396  Merge branch 'devel' into for-next

elapsed time: 744m

configs tested: 350
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
arc                              allyesconfig    gcc-15.2.0
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260224    gcc-14.3.0
arc                   randconfig-001-20260225    gcc-8.5.0
arc                   randconfig-002-20260224    gcc-14.3.0
arc                   randconfig-002-20260225    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     am200epdkit_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    clang-23
arm                           h3600_defconfig    gcc-15.2.0
arm                       omap2plus_defconfig    clang-23
arm                   randconfig-001-20260224    gcc-14.3.0
arm                   randconfig-001-20260225    gcc-8.5.0
arm                   randconfig-002-20260224    gcc-14.3.0
arm                   randconfig-002-20260225    gcc-8.5.0
arm                   randconfig-003-20260224    gcc-14.3.0
arm                   randconfig-003-20260225    gcc-8.5.0
arm                   randconfig-004-20260224    gcc-14.3.0
arm                   randconfig-004-20260225    gcc-8.5.0
arm                         socfpga_defconfig    gcc-15.2.0
arm                        spear6xx_defconfig    clang-23
arm                           spitz_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260224    gcc-14.3.0
arm64                 randconfig-002-20260224    gcc-14.3.0
arm64                 randconfig-003-20260224    gcc-14.3.0
arm64                 randconfig-004-20260224    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260224    gcc-14.3.0
csky                  randconfig-002-20260224    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260224    clang-16
hexagon               randconfig-001-20260224    clang-18
hexagon               randconfig-001-20260225    clang-23
hexagon               randconfig-002-20260224    clang-16
hexagon               randconfig-002-20260225    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260224    clang-20
i386        buildonly-randconfig-001-20260225    clang-20
i386        buildonly-randconfig-002-20260224    clang-20
i386        buildonly-randconfig-002-20260225    clang-20
i386        buildonly-randconfig-003-20260224    clang-20
i386        buildonly-randconfig-003-20260225    clang-20
i386        buildonly-randconfig-004-20260224    clang-20
i386        buildonly-randconfig-004-20260224    gcc-14
i386        buildonly-randconfig-004-20260225    clang-20
i386        buildonly-randconfig-005-20260224    clang-20
i386        buildonly-randconfig-005-20260225    clang-20
i386        buildonly-randconfig-006-20260224    clang-20
i386        buildonly-randconfig-006-20260225    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260224    clang-20
i386                  randconfig-001-20260224    gcc-14
i386                  randconfig-001-20260225    gcc-14
i386                  randconfig-002-20260224    clang-20
i386                  randconfig-002-20260224    gcc-14
i386                  randconfig-002-20260225    gcc-14
i386                  randconfig-003-20260224    clang-20
i386                  randconfig-003-20260224    gcc-14
i386                  randconfig-003-20260225    gcc-14
i386                  randconfig-004-20260224    gcc-14
i386                  randconfig-004-20260225    gcc-14
i386                  randconfig-005-20260224    clang-20
i386                  randconfig-005-20260224    gcc-14
i386                  randconfig-005-20260225    gcc-14
i386                  randconfig-006-20260224    clang-20
i386                  randconfig-006-20260224    gcc-14
i386                  randconfig-006-20260225    gcc-14
i386                  randconfig-007-20260224    gcc-14
i386                  randconfig-007-20260225    gcc-14
i386                  randconfig-011-20260224    gcc-14
i386                  randconfig-011-20260225    gcc-13
i386                  randconfig-012-20260224    gcc-14
i386                  randconfig-012-20260225    gcc-13
i386                  randconfig-013-20260224    gcc-14
i386                  randconfig-013-20260225    gcc-13
i386                  randconfig-014-20260224    gcc-14
i386                  randconfig-014-20260225    gcc-13
i386                  randconfig-015-20260224    gcc-14
i386                  randconfig-015-20260225    gcc-13
i386                  randconfig-016-20260224    gcc-14
i386                  randconfig-016-20260225    gcc-13
i386                  randconfig-017-20260224    gcc-14
i386                  randconfig-017-20260225    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260224    clang-16
loongarch             randconfig-001-20260224    clang-23
loongarch             randconfig-001-20260225    clang-23
loongarch             randconfig-002-20260224    clang-16
loongarch             randconfig-002-20260224    gcc-15.2.0
loongarch             randconfig-002-20260225    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    gcc-15.2.0
mips                 decstation_r4k_defconfig    gcc-15.2.0
mips                           ip27_defconfig    gcc-15.2.0
mips                       lemote2f_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-23
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260224    clang-16
nios2                 randconfig-001-20260224    gcc-8.5.0
nios2                 randconfig-001-20260225    clang-23
nios2                 randconfig-002-20260224    clang-16
nios2                 randconfig-002-20260224    gcc-11.5.0
nios2                 randconfig-002-20260225    clang-23
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
parisc                randconfig-001-20260224    clang-23
parisc                randconfig-001-20260225    clang-19
parisc                randconfig-002-20260224    clang-23
parisc                randconfig-002-20260225    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    gcc-15.2.0
powerpc                      cm5200_defconfig    gcc-15.2.0
powerpc                       ebony_defconfig    clang-23
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc                 mpc8315_rdb_defconfig    clang-23
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                      pasemi_defconfig    clang-23
powerpc               randconfig-001-20260224    clang-23
powerpc               randconfig-001-20260225    clang-19
powerpc               randconfig-002-20260224    clang-23
powerpc               randconfig-002-20260225    clang-19
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc                         wii_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260224    clang-23
powerpc64             randconfig-001-20260225    clang-19
powerpc64             randconfig-002-20260224    clang-23
powerpc64             randconfig-002-20260225    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260224    gcc-10.5.0
riscv                 randconfig-001-20260224    gcc-15.2.0
riscv                 randconfig-001-20260225    gcc-12.5.0
riscv                 randconfig-002-20260224    gcc-10.5.0
riscv                 randconfig-002-20260224    gcc-8.5.0
riscv                 randconfig-002-20260225    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260224    gcc-10.5.0
s390                  randconfig-001-20260224    gcc-13.4.0
s390                  randconfig-001-20260225    gcc-12.5.0
s390                  randconfig-002-20260224    gcc-10.5.0
s390                  randconfig-002-20260224    gcc-12.5.0
s390                  randconfig-002-20260225    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                         ecovec24_defconfig    clang-23
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260224    gcc-10.5.0
sh                    randconfig-001-20260225    gcc-12.5.0
sh                    randconfig-002-20260224    gcc-10.5.0
sh                    randconfig-002-20260224    gcc-12.5.0
sh                    randconfig-002-20260225    gcc-12.5.0
sh                      rts7751r2d1_defconfig    clang-23
sh                           se7619_defconfig    clang-23
sh                           se7705_defconfig    gcc-15.2.0
sh                  sh7785lcr_32bit_defconfig    clang-23
sh                            titan_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260224    gcc-12.5.0
sparc                 randconfig-001-20260224    gcc-15.2.0
sparc                 randconfig-001-20260225    gcc-11.5.0
sparc                 randconfig-002-20260224    gcc-11.5.0
sparc                 randconfig-002-20260224    gcc-12.5.0
sparc                 randconfig-002-20260225    gcc-11.5.0
sparc                       sparc32_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260224    clang-23
sparc64               randconfig-001-20260224    gcc-12.5.0
sparc64               randconfig-001-20260225    gcc-11.5.0
sparc64               randconfig-002-20260224    gcc-12.5.0
sparc64               randconfig-002-20260225    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260224    gcc-12.5.0
um                    randconfig-001-20260224    gcc-14
um                    randconfig-001-20260225    gcc-11.5.0
um                    randconfig-002-20260224    clang-23
um                    randconfig-002-20260224    gcc-12.5.0
um                    randconfig-002-20260225    gcc-11.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260224    gcc-14
x86_64      buildonly-randconfig-001-20260225    clang-20
x86_64      buildonly-randconfig-002-20260224    clang-20
x86_64      buildonly-randconfig-002-20260224    gcc-14
x86_64      buildonly-randconfig-002-20260225    clang-20
x86_64      buildonly-randconfig-003-20260224    gcc-14
x86_64      buildonly-randconfig-003-20260225    clang-20
x86_64      buildonly-randconfig-004-20260224    clang-20
x86_64      buildonly-randconfig-004-20260224    gcc-14
x86_64      buildonly-randconfig-004-20260225    clang-20
x86_64      buildonly-randconfig-005-20260224    clang-20
x86_64      buildonly-randconfig-005-20260224    gcc-14
x86_64      buildonly-randconfig-005-20260225    clang-20
x86_64      buildonly-randconfig-006-20260224    gcc-13
x86_64      buildonly-randconfig-006-20260224    gcc-14
x86_64      buildonly-randconfig-006-20260225    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260224    clang-20
x86_64                randconfig-001-20260224    gcc-14
x86_64                randconfig-001-20260225    gcc-14
x86_64                randconfig-002-20260224    gcc-14
x86_64                randconfig-002-20260225    gcc-14
x86_64                randconfig-003-20260224    gcc-14
x86_64                randconfig-003-20260225    gcc-14
x86_64                randconfig-004-20260224    gcc-14
x86_64                randconfig-004-20260225    gcc-14
x86_64                randconfig-005-20260224    clang-20
x86_64                randconfig-005-20260224    gcc-14
x86_64                randconfig-005-20260225    gcc-14
x86_64                randconfig-006-20260224    gcc-14
x86_64                randconfig-006-20260225    gcc-14
x86_64                randconfig-011-20260224    clang-20
x86_64                randconfig-011-20260225    gcc-14
x86_64                randconfig-012-20260224    clang-20
x86_64                randconfig-012-20260225    gcc-14
x86_64                randconfig-013-20260224    clang-20
x86_64                randconfig-013-20260225    gcc-14
x86_64                randconfig-014-20260224    clang-20
x86_64                randconfig-014-20260225    gcc-14
x86_64                randconfig-015-20260224    clang-20
x86_64                randconfig-015-20260225    gcc-14
x86_64                randconfig-016-20260224    clang-20
x86_64                randconfig-016-20260225    gcc-14
x86_64                randconfig-071-20260224    clang-20
x86_64                randconfig-071-20260225    clang-20
x86_64                randconfig-072-20260224    clang-20
x86_64                randconfig-072-20260225    clang-20
x86_64                randconfig-073-20260224    clang-20
x86_64                randconfig-073-20260225    clang-20
x86_64                randconfig-074-20260224    clang-20
x86_64                randconfig-074-20260225    clang-20
x86_64                randconfig-075-20260224    clang-20
x86_64                randconfig-075-20260225    clang-20
x86_64                randconfig-076-20260224    clang-20
x86_64                randconfig-076-20260225    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    clang-23
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260224    gcc-10.5.0
xtensa                randconfig-001-20260224    gcc-12.5.0
xtensa                randconfig-001-20260225    gcc-11.5.0
xtensa                randconfig-002-20260224    gcc-12.5.0
xtensa                randconfig-002-20260224    gcc-14.3.0
xtensa                randconfig-002-20260225    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

