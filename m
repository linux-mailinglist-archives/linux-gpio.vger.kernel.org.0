Return-Path: <linux-gpio+bounces-30835-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF3nFKNIcGnXXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30835-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 04:31:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B97AA506BA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 04:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84C00685E32
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A9C1E0DD8;
	Wed, 21 Jan 2026 03:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2IORaUJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80AD286D5D
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768966299; cv=none; b=ZBYcJr1LdcOp/doPbpd/SlwwT+CF3DtU5tUJe5vkhzjZK+Vk/Gx+LOWzKaI/QrU2R2ujGVQTIeAUqk/m/9OmkutfPg7C8PBopjC+WLYVuuusF7nQN+zr3S/3AMQ5iS10OE5wEZD8lV9JeV8bgLllCC/2Y9m2ISCfzi2WjpqP2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768966299; c=relaxed/simple;
	bh=DJDf+sHV/XEQ5B5u021bfJG+rQMgdR3cJhIRDM0vRVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ViTQKGqj2vYDkHEyY+LuSjLNWI/XAiYJufVEQ6XyUj7JPuBjLtRVaIwwPQcWJImnyOtFlkjh9KHPHPH24BO/72ZHUEoN6dT94Hhp2wh57Az2t6v+m94Mg8N5fK9D9/NoYthrSr14xamfds7SMXaNcVJGPOMMAP+RcJP5ldg/Lns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2IORaUJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768966291; x=1800502291;
  h=date:from:to:cc:subject:message-id;
  bh=DJDf+sHV/XEQ5B5u021bfJG+rQMgdR3cJhIRDM0vRVk=;
  b=d2IORaUJ05JkMh8/SoV5ewOV/Waf+GDKAWgD48ot7PujaDQn9TyuEJaj
   26mMvoYKnD0eMtRe8OYdBEFJeTW648Xx6nUlWqHQZFA7pPOMhKuxniZdZ
   j6CYk0CMdwh8acazwPKCfQ5HaHnwHpDUKc9eESvXm3ufPrGNu3Z8ZVuC+
   gJxLbYEjYCUrcwwbS35AFTpmmUZxXZhcb3Ibj53rr+AYwh2Mk+6T/i9y+
   Basn1lbxJG6xUvLO/fmhPD3duk4KGWBESqJRnpqH3jChzJ4vf4oUd+qA2
   mcZzNfKZPnPBXEUSUIJ35CLus3vhllv2VDUN/jkPVwGXdkYl5YcL2HRJf
   A==;
X-CSE-ConnectionGUID: yhKayXSlSJGw9GOucOJGcQ==
X-CSE-MsgGUID: 2E2ruoQqQIaMEulom8fpOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70093996"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70093996"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 19:31:24 -0800
X-CSE-ConnectionGUID: W0JCvBGOTYe7jdEe+1rpSQ==
X-CSE-MsgGUID: 2iwNoyVNS/+6QEjAAq5Sbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210805507"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2026 19:31:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viOwC-00000000PvF-3K8P;
	Wed, 21 Jan 2026 03:31:20 +0000
Date: Wed, 21 Jan 2026 11:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 8a8c942cad4cd12f739a8bb60cac77fd173c4e07
Message-ID: <202601211102.nVelWuGF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30835-lists,linux-gpio=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: B97AA506BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 8a8c942cad4cd12f739a8bb60cac77fd173c4e07  gpio: cdev: Fix resource leaks on errors in gpiolib_cdev_register()

elapsed time: 1054m

configs tested: 316
configs skipped: 14

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
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                            hsdk_defconfig    clang-18
arc                   randconfig-001-20260120    clang-22
arc                   randconfig-001-20260121    clang-18
arc                   randconfig-002-20260120    clang-22
arc                   randconfig-002-20260121    clang-18
arc                    vdk_hs38_smp_defconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         assabet_defconfig    clang-22
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    clang-18
arm                         mv78xx0_defconfig    gcc-15.2.0
arm                        neponset_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    gcc-15.2.0
arm                   randconfig-001-20260120    clang-22
arm                   randconfig-001-20260121    clang-18
arm                   randconfig-002-20260120    clang-22
arm                   randconfig-002-20260121    clang-18
arm                   randconfig-003-20260120    clang-22
arm                   randconfig-003-20260121    clang-18
arm                   randconfig-004-20260120    clang-22
arm                   randconfig-004-20260121    clang-18
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           stm32_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260120    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-002-20260120    gcc-15.2.0
arm64                 randconfig-002-20260121    gcc-15.2.0
arm64                 randconfig-003-20260120    gcc-15.2.0
arm64                 randconfig-003-20260121    gcc-15.2.0
arm64                 randconfig-004-20260120    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260120    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-15.2.0
csky                  randconfig-002-20260120    gcc-15.2.0
csky                  randconfig-002-20260121    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260120    gcc-12.5.0
hexagon               randconfig-001-20260121    gcc-15.2.0
hexagon               randconfig-002-20260120    gcc-12.5.0
hexagon               randconfig-002-20260121    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260120    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-002-20260120    gcc-14
i386        buildonly-randconfig-002-20260121    clang-20
i386        buildonly-randconfig-003-20260120    gcc-14
i386        buildonly-randconfig-003-20260121    clang-20
i386        buildonly-randconfig-004-20260120    clang-20
i386        buildonly-randconfig-004-20260120    gcc-14
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-005-20260120    gcc-14
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-006-20260120    gcc-14
i386        buildonly-randconfig-006-20260121    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260120    clang-20
i386                  randconfig-001-20260121    clang-20
i386                  randconfig-002-20260120    clang-20
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-003-20260120    clang-20
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-004-20260120    clang-20
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-005-20260120    clang-20
i386                  randconfig-005-20260121    clang-20
i386                  randconfig-006-20260120    clang-20
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-007-20260120    clang-20
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-011-20260120    clang-20
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-012-20260120    clang-20
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-013-20260120    clang-20
i386                  randconfig-013-20260121    gcc-14
i386                  randconfig-014-20260120    clang-20
i386                  randconfig-014-20260121    gcc-14
i386                  randconfig-015-20260120    clang-20
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-016-20260120    clang-20
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-017-20260120    clang-20
i386                  randconfig-017-20260121    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    clang-18
loongarch                loongson64_defconfig    gcc-15.2.0
loongarch             randconfig-001-20260120    gcc-12.5.0
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-002-20260120    gcc-12.5.0
loongarch             randconfig-002-20260121    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         apollo_defconfig    clang-22
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
m68k                           sun3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    clang-18
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
mips                          rb532_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260120    gcc-12.5.0
nios2                 randconfig-001-20260121    gcc-15.2.0
nios2                 randconfig-002-20260120    gcc-12.5.0
nios2                 randconfig-002-20260121    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-002-20260121    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    clang-18
powerpc                       holly_defconfig    clang-22
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                     mpc512x_defconfig    clang-18
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260121    gcc-9.5.0
powerpc               randconfig-002-20260121    gcc-9.5.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    clang-18
powerpc                     tqm8560_defconfig    clang-22
powerpc64             randconfig-001-20260121    gcc-9.5.0
powerpc64             randconfig-002-20260121    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260120    gcc-13.4.0
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-002-20260120    gcc-13.4.0
riscv                 randconfig-002-20260121    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260120    gcc-13.4.0
s390                  randconfig-001-20260121    clang-16
s390                  randconfig-002-20260120    gcc-13.4.0
s390                  randconfig-002-20260121    clang-16
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                         apsh4a3a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                        edosk7760_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260120    gcc-13.4.0
sh                    randconfig-001-20260121    clang-16
sh                    randconfig-002-20260120    gcc-13.4.0
sh                    randconfig-002-20260121    clang-16
sh                          rsk7201_defconfig    gcc-15.2.0
sh                          rsk7264_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7705_defconfig    gcc-15.2.0
sh                           se7712_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                            alldefconfig    clang-22
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260120    gcc-8.5.0
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-002-20260120    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260120    gcc-8.5.0
sparc64               randconfig-001-20260121    gcc-8.5.0
sparc64               randconfig-002-20260120    gcc-8.5.0
sparc64               randconfig-002-20260121    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260120    gcc-8.5.0
um                    randconfig-001-20260121    gcc-8.5.0
um                    randconfig-002-20260120    gcc-8.5.0
um                    randconfig-002-20260121    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260120    gcc-14
x86_64      buildonly-randconfig-001-20260121    clang-20
x86_64      buildonly-randconfig-002-20260120    gcc-14
x86_64      buildonly-randconfig-002-20260121    clang-20
x86_64      buildonly-randconfig-003-20260120    gcc-14
x86_64      buildonly-randconfig-003-20260121    clang-20
x86_64      buildonly-randconfig-004-20260120    gcc-14
x86_64      buildonly-randconfig-004-20260121    clang-20
x86_64      buildonly-randconfig-005-20260120    gcc-14
x86_64      buildonly-randconfig-005-20260121    clang-20
x86_64      buildonly-randconfig-006-20260120    gcc-14
x86_64      buildonly-randconfig-006-20260121    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260120    gcc-14
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-002-20260120    gcc-14
x86_64                randconfig-002-20260121    clang-20
x86_64                randconfig-003-20260120    gcc-14
x86_64                randconfig-003-20260121    clang-20
x86_64                randconfig-004-20260120    gcc-14
x86_64                randconfig-004-20260121    clang-20
x86_64                randconfig-005-20260120    gcc-14
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-006-20260120    gcc-14
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-011-20260120    gcc-14
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-012-20260120    gcc-14
x86_64                randconfig-012-20260121    gcc-14
x86_64                randconfig-013-20260120    gcc-14
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-014-20260120    gcc-14
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-015-20260120    gcc-14
x86_64                randconfig-015-20260121    gcc-14
x86_64                randconfig-016-20260120    gcc-14
x86_64                randconfig-016-20260121    gcc-14
x86_64                randconfig-071-20260121    clang-20
x86_64                randconfig-072-20260121    clang-20
x86_64                randconfig-073-20260121    clang-20
x86_64                randconfig-074-20260121    clang-20
x86_64                randconfig-075-20260121    clang-20
x86_64                randconfig-076-20260121    clang-20
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
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260120    gcc-8.5.0
xtensa                randconfig-001-20260121    gcc-8.5.0
xtensa                randconfig-002-20260120    gcc-8.5.0
xtensa                randconfig-002-20260121    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

