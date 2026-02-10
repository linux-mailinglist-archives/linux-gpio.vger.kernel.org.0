Return-Path: <linux-gpio+bounces-31537-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACtTLPWQimkQMAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31537-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 02:59:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB91161A4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 02:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 635443011845
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 01:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D33E287268;
	Tue, 10 Feb 2026 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgIB/cqQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E82868B5
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 01:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688754; cv=none; b=QOQkcU/QMwuhLMWd2BbxwKf16dI2EiReORdcFmrovnt04O0NCHjLE9H2CU21VEbheWJjpUZmjta+71lehK4U/M/OKaDqFhJHkV8TKU+J4pSTKgKM+LnhWi2LcxuMuaqqOf51uwQ7/yuQ3TENjHyiodmaHLfTO393k6Yxjj0Zrvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688754; c=relaxed/simple;
	bh=NkFty+1/bwJaB1DNmKyXdUk6J6DXZC+bX5jmoWFt+N0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HWiDFVOoLxA83FJEAwH4JtPJ952xEBbdkKXstFf2ToS2PXjpKM4wbNunBx1+0CMqp8o8M+H9bkGx7QRJOFqfUYl/FZv3/Anh9+IODBYpfm5cmLXPO1zr9uBuGOZSarRRnvmAjL/7dmNEaqcxd3iwyxSbTlveUc3CoPfrn7On/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgIB/cqQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770688752; x=1802224752;
  h=date:from:to:cc:subject:message-id;
  bh=NkFty+1/bwJaB1DNmKyXdUk6J6DXZC+bX5jmoWFt+N0=;
  b=hgIB/cqQ/s/Itu8rIrwFgrbWSgwtoryOEqqL5m2Gskddv88Fa5ParA2p
   O8Smm7PfLN+HnPNt/6yirMtjeJ93N5ttxTnqDFGKiy88bjxWf39Ux41FV
   CYTncISZc5oglrUR+7v+1szUnyDYnzdUNtuGZWv0r7OCy55RiGdOGJPzU
   CQ/cJdOFZfEmZe+CGiM3fzdoEiqRiVqMATVTkuTQ12vxz1jB6wAqsbhEP
   G7YpGffmkU6mFHwQKkCVtYguuAp5HpvoHWuvyIlsHyjRojWs7+qb6Nfj2
   pTYYTNFei3kJFFkgzX140YNHqO1PZI+WlR/+NIzbYW132vFsex/jFEhvg
   A==;
X-CSE-ConnectionGUID: /kHUh1ALQnqSsGf5nsGGQQ==
X-CSE-MsgGUID: 8QG+sPfVRpWITLnTCGLWtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71531261"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71531261"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:59:12 -0800
X-CSE-ConnectionGUID: 6foU/NiHSqSnkd+DG4S7iA==
X-CSE-MsgGUID: NhUYhUBETfW/wAgic5067Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210865517"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Feb 2026 17:59:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpd1w-00000000oVk-0n1g;
	Tue, 10 Feb 2026 01:59:08 +0000
Date: Tue, 10 Feb 2026 09:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 ecfcae7885f105b29898ff71d3cb70abd56ef96e
Message-ID: <202602100910.fcgD4xmk-lkp@intel.com>
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
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-31537-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3EB91161A4
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: ecfcae7885f105b29898ff71d3cb70abd56ef96e  power: sequencing: qcom-wcn: fix error path for VDDIO handling

elapsed time: 975m

configs tested: 346
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    clang-16
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260209    gcc-10.5.0
arc                   randconfig-001-20260210    clang-20
arc                   randconfig-002-20260209    gcc-10.5.0
arc                   randconfig-002-20260210    clang-20
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     am200epdkit_defconfig    clang-16
arm                        clps711x_defconfig    gcc-15.2.0
arm                     davinci_all_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      footbridge_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20260209    gcc-10.5.0
arm                   randconfig-001-20260209    gcc-15.2.0
arm                   randconfig-001-20260210    clang-20
arm                   randconfig-002-20260209    gcc-10.5.0
arm                   randconfig-002-20260209    gcc-12.5.0
arm                   randconfig-002-20260210    clang-20
arm                   randconfig-003-20260209    gcc-10.5.0
arm                   randconfig-003-20260209    gcc-8.5.0
arm                   randconfig-003-20260210    clang-20
arm                   randconfig-004-20260209    gcc-10.5.0
arm                   randconfig-004-20260209    gcc-14.3.0
arm                   randconfig-004-20260210    clang-20
arm                           sama5_defconfig    clang-18
arm                           sama7_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260209    gcc-15.2.0
arm64                 randconfig-001-20260210    clang-22
arm64                 randconfig-002-20260209    gcc-15.2.0
arm64                 randconfig-002-20260210    clang-22
arm64                 randconfig-003-20260209    gcc-15.2.0
arm64                 randconfig-003-20260210    clang-22
arm64                 randconfig-004-20260209    gcc-15.2.0
arm64                 randconfig-004-20260210    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260209    gcc-15.2.0
csky                  randconfig-001-20260210    clang-22
csky                  randconfig-002-20260209    gcc-15.2.0
csky                  randconfig-002-20260210    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260209    clang-22
hexagon               randconfig-001-20260210    clang-22
hexagon               randconfig-002-20260209    clang-22
hexagon               randconfig-002-20260210    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260209    gcc-13
i386        buildonly-randconfig-001-20260209    gcc-14
i386        buildonly-randconfig-001-20260210    clang-20
i386        buildonly-randconfig-002-20260209    clang-20
i386        buildonly-randconfig-002-20260209    gcc-13
i386        buildonly-randconfig-002-20260210    clang-20
i386        buildonly-randconfig-003-20260209    gcc-13
i386        buildonly-randconfig-003-20260209    gcc-14
i386        buildonly-randconfig-003-20260210    clang-20
i386        buildonly-randconfig-004-20260209    clang-20
i386        buildonly-randconfig-004-20260209    gcc-13
i386        buildonly-randconfig-004-20260210    clang-20
i386        buildonly-randconfig-005-20260209    clang-20
i386        buildonly-randconfig-005-20260209    gcc-13
i386        buildonly-randconfig-005-20260210    clang-20
i386        buildonly-randconfig-006-20260209    gcc-13
i386        buildonly-randconfig-006-20260210    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260209    clang-20
i386                  randconfig-001-20260210    gcc-14
i386                  randconfig-002-20260209    clang-20
i386                  randconfig-002-20260209    gcc-14
i386                  randconfig-002-20260210    gcc-14
i386                  randconfig-003-20260209    clang-20
i386                  randconfig-003-20260210    gcc-14
i386                  randconfig-004-20260209    clang-20
i386                  randconfig-004-20260210    gcc-14
i386                  randconfig-005-20260209    clang-20
i386                  randconfig-005-20260210    gcc-14
i386                  randconfig-006-20260209    clang-20
i386                  randconfig-006-20260210    gcc-14
i386                  randconfig-007-20260209    clang-20
i386                  randconfig-007-20260210    gcc-14
i386                  randconfig-011-20260209    gcc-14
i386                  randconfig-011-20260210    gcc-14
i386                  randconfig-012-20260209    gcc-14
i386                  randconfig-012-20260210    gcc-14
i386                  randconfig-013-20260209    gcc-14
i386                  randconfig-013-20260210    gcc-14
i386                  randconfig-014-20260209    gcc-14
i386                  randconfig-014-20260210    gcc-14
i386                  randconfig-015-20260209    gcc-14
i386                  randconfig-015-20260210    gcc-14
i386                  randconfig-016-20260209    gcc-14
i386                  randconfig-016-20260210    gcc-14
i386                  randconfig-017-20260209    gcc-14
i386                  randconfig-017-20260210    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260209    clang-22
loongarch             randconfig-001-20260210    clang-22
loongarch             randconfig-002-20260209    clang-22
loongarch             randconfig-002-20260210    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    clang-18
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                           ip27_defconfig    clang-18
mips                       lemote2f_defconfig    clang-16
mips                          malta_defconfig    gcc-15.2.0
mips                        qi_lb60_defconfig    clang-18
mips                          rb532_defconfig    clang-18
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260209    clang-22
nios2                 randconfig-001-20260210    clang-22
nios2                 randconfig-002-20260209    clang-22
nios2                 randconfig-002-20260210    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260209    gcc-12.5.0
parisc                randconfig-001-20260210    clang-19
parisc                randconfig-002-20260209    gcc-12.5.0
parisc                randconfig-002-20260209    gcc-8.5.0
parisc                randconfig-002-20260210    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                     ksi8560_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260209    gcc-10.5.0
powerpc               randconfig-001-20260209    gcc-12.5.0
powerpc               randconfig-001-20260210    clang-19
powerpc               randconfig-002-20260209    clang-22
powerpc               randconfig-002-20260209    gcc-12.5.0
powerpc               randconfig-002-20260210    clang-19
powerpc                    socrates_defconfig    clang-18
powerpc                     stx_gp3_defconfig    clang-18
powerpc                     tqm8555_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260209    clang-22
powerpc64             randconfig-001-20260209    gcc-12.5.0
powerpc64             randconfig-001-20260210    clang-19
powerpc64             randconfig-002-20260209    clang-22
powerpc64             randconfig-002-20260209    gcc-12.5.0
powerpc64             randconfig-002-20260210    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260209    gcc-12.5.0
riscv                 randconfig-001-20260210    gcc-11.5.0
riscv                 randconfig-002-20260209    gcc-12.5.0
riscv                 randconfig-002-20260210    gcc-11.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260209    gcc-12.5.0
s390                  randconfig-001-20260210    gcc-11.5.0
s390                  randconfig-002-20260209    gcc-12.5.0
s390                  randconfig-002-20260210    gcc-11.5.0
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                          polaris_defconfig    gcc-15.2.0
sh                    randconfig-001-20260209    gcc-12.5.0
sh                    randconfig-001-20260210    gcc-11.5.0
sh                    randconfig-002-20260209    gcc-12.5.0
sh                    randconfig-002-20260210    gcc-11.5.0
sh                          rsk7203_defconfig    gcc-15.2.0
sh                          sdk7780_defconfig    gcc-15.2.0
sh                          sdk7786_defconfig    clang-16
sh                           se7343_defconfig    clang-18
sh                           se7750_defconfig    clang-16
sh                             sh03_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260209    gcc-11.5.0
sparc                 randconfig-001-20260209    gcc-8.5.0
sparc                 randconfig-001-20260210    gcc-14.3.0
sparc                 randconfig-002-20260209    gcc-11.5.0
sparc                 randconfig-002-20260210    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260209    clang-22
sparc64               randconfig-001-20260209    gcc-11.5.0
sparc64               randconfig-001-20260210    gcc-14.3.0
sparc64               randconfig-002-20260209    clang-22
sparc64               randconfig-002-20260209    gcc-11.5.0
sparc64               randconfig-002-20260210    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260209    gcc-11.5.0
um                    randconfig-001-20260209    gcc-14
um                    randconfig-001-20260210    gcc-14.3.0
um                    randconfig-002-20260209    clang-18
um                    randconfig-002-20260209    gcc-11.5.0
um                    randconfig-002-20260210    gcc-14.3.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260209    clang-20
x86_64      buildonly-randconfig-001-20260209    gcc-14
x86_64      buildonly-randconfig-001-20260210    gcc-14
x86_64      buildonly-randconfig-002-20260209    clang-20
x86_64      buildonly-randconfig-002-20260209    gcc-14
x86_64      buildonly-randconfig-002-20260210    gcc-14
x86_64      buildonly-randconfig-003-20260209    clang-20
x86_64      buildonly-randconfig-003-20260210    gcc-14
x86_64      buildonly-randconfig-004-20260209    clang-20
x86_64      buildonly-randconfig-004-20260210    gcc-14
x86_64      buildonly-randconfig-005-20260209    clang-20
x86_64      buildonly-randconfig-005-20260209    gcc-14
x86_64      buildonly-randconfig-005-20260210    gcc-14
x86_64      buildonly-randconfig-006-20260209    clang-20
x86_64      buildonly-randconfig-006-20260210    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260209    gcc-12
x86_64                randconfig-001-20260209    gcc-14
x86_64                randconfig-001-20260210    gcc-14
x86_64                randconfig-002-20260209    gcc-14
x86_64                randconfig-002-20260210    gcc-14
x86_64                randconfig-003-20260209    gcc-14
x86_64                randconfig-003-20260210    gcc-14
x86_64                randconfig-004-20260209    gcc-12
x86_64                randconfig-004-20260209    gcc-14
x86_64                randconfig-004-20260210    gcc-14
x86_64                randconfig-005-20260209    clang-20
x86_64                randconfig-005-20260209    gcc-14
x86_64                randconfig-005-20260210    gcc-14
x86_64                randconfig-006-20260209    gcc-14
x86_64                randconfig-006-20260210    gcc-14
x86_64                randconfig-011-20260209    clang-20
x86_64                randconfig-011-20260210    clang-20
x86_64                randconfig-012-20260209    clang-20
x86_64                randconfig-012-20260210    clang-20
x86_64                randconfig-013-20260209    clang-20
x86_64                randconfig-013-20260209    gcc-13
x86_64                randconfig-013-20260209    gcc-14
x86_64                randconfig-013-20260210    clang-20
x86_64                randconfig-014-20260209    clang-20
x86_64                randconfig-014-20260210    clang-20
x86_64                randconfig-015-20260209    clang-20
x86_64                randconfig-015-20260209    gcc-14
x86_64                randconfig-015-20260210    clang-20
x86_64                randconfig-016-20260209    clang-20
x86_64                randconfig-016-20260209    gcc-14
x86_64                randconfig-016-20260210    clang-20
x86_64                randconfig-071-20260209    gcc-14
x86_64                randconfig-071-20260210    clang-20
x86_64                randconfig-072-20260209    gcc-14
x86_64                randconfig-072-20260210    clang-20
x86_64                randconfig-073-20260209    gcc-14
x86_64                randconfig-073-20260210    clang-20
x86_64                randconfig-074-20260209    gcc-14
x86_64                randconfig-074-20260210    clang-20
x86_64                randconfig-075-20260209    gcc-14
x86_64                randconfig-075-20260210    clang-20
x86_64                randconfig-076-20260209    gcc-14
x86_64                randconfig-076-20260210    clang-20
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
xtensa                  cadence_csp_defconfig    clang-16
xtensa                randconfig-001-20260209    gcc-11.5.0
xtensa                randconfig-001-20260209    gcc-8.5.0
xtensa                randconfig-001-20260210    gcc-14.3.0
xtensa                randconfig-002-20260209    gcc-11.5.0
xtensa                randconfig-002-20260209    gcc-8.5.0
xtensa                randconfig-002-20260210    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

