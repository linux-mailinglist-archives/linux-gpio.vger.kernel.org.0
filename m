Return-Path: <linux-gpio+bounces-32275-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHdxILCRoWlZuQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32275-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 13:44:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D58971B74F1
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 13:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADF91318F571
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 12:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BFE3D6693;
	Fri, 27 Feb 2026 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfVtuSlm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E283B8D65
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195800; cv=none; b=sCvb4U5gfw7W8Aw/TvspuOJF7en0006ktjbAZsMghwC8YE/hmL6DLB4nfD0X6Y9EHpBzmOCECeddi6+P+H4g7qsV/CGdQZ2ATQofG++VZPWOlX3a6147fL8LGN9h4SmQBC1UfF9mk0V9f6xPC2vYNTeAQpvR7ZFiSB7UB88heds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195800; c=relaxed/simple;
	bh=SD5Wk4DSV78CUIgeKaml/21r5dw57c34Al9xwhGMbIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VcxQCx9eWSpMizirmJU6oml074bL89xz/9UaJ3OHA17YYrVSeS+kfATanwNp24yfaZsSC+6HwW9Rw3uRO2WfWLa+Q+soNVuxB+HKB6fSur+t+b3xAs+zXh779tsgnqrQgJKNrlfhx9DmQ15E23Wz1K1FBCK754lVImy7n38MrLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfVtuSlm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772195796; x=1803731796;
  h=date:from:to:cc:subject:message-id;
  bh=SD5Wk4DSV78CUIgeKaml/21r5dw57c34Al9xwhGMbIA=;
  b=AfVtuSlm8AI/m7U0lTabPNN/S8itQJ8AhhA486ujdgxqFq1IILAKZ31U
   PVIf1aOx32G6y1CZJ5yDTtAZw7skI+WP02klcxhe+CAeiseIuz3g6ZqZ5
   n11uyxltjnKbXI/Ym5mHjrYl+NxlS51JowlIII53jkoA0qp2VnT+fZyDN
   84A1hc+CbVjrDhr1pB7arMHBBt4JsY/CHEej5Is5+IIfsW5HRTNB2NTmo
   pfLTJMhaFSpfIAGciRy/EaHBct/g885mkby+48wMKV3M9jmsXqOJCNH+l
   i59h191kqyaCgIyeEVmS7PcHw27RmtV2aKFM6wG3lpXkrlnZAopXfJOXx
   Q==;
X-CSE-ConnectionGUID: 9lDQlfVRTpu6paSL8u6MgQ==
X-CSE-MsgGUID: nnj2uNrsR/G9NnAmMR5DeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84362876"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="84362876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 04:36:36 -0800
X-CSE-ConnectionGUID: AIRWbxnfSKWzzVqfi68r9g==
X-CSE-MsgGUID: hSKfwCRXRQKH9NQZuxCfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221034176"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2026 04:36:34 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvx4Z-00000000AZf-33hE;
	Fri, 27 Feb 2026 12:36:06 +0000
Date: Fri, 27 Feb 2026 20:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS WITH UNVERIFIED WARNING
 a901e8705f89f3616fad3bb6aeddba33be86b08a
Message-ID: <202602272058.N3kf0Apb-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32275-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: D58971B74F1
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: a901e8705f89f3616fad3bb6aeddba33be86b08a  dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties

Unverified Warning (likely false positive, kindly check if interested):

    drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing positive error code '1' to 'dev_err_probe'

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20260227
    `-- drivers-pinctrl-pinctrl-cy8c95x0.c-cy8c95x0_irq_setup()-warn:passing-positive-error-code-to-dev_err_probe

elapsed time: 723m

configs tested: 235
configs skipped: 2

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
arc                                 defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260227    gcc-8.5.0
arc                   randconfig-002-20260227    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-23
arm                   randconfig-001-20260227    gcc-8.5.0
arm                   randconfig-002-20260227    gcc-8.5.0
arm                   randconfig-003-20260227    gcc-8.5.0
arm                   randconfig-004-20260227    gcc-8.5.0
arm                           sama7_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260227    clang-23
arm64                 randconfig-002-20260227    clang-23
arm64                 randconfig-003-20260227    clang-23
arm64                 randconfig-004-20260227    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260227    clang-23
csky                  randconfig-002-20260227    clang-23
hexagon                          alldefconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260227    clang-23
hexagon               randconfig-002-20260227    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260227    clang-20
i386        buildonly-randconfig-002-20260227    clang-20
i386        buildonly-randconfig-003-20260227    clang-20
i386        buildonly-randconfig-004-20260227    clang-20
i386        buildonly-randconfig-005-20260227    clang-20
i386        buildonly-randconfig-006-20260227    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260227    clang-20
i386                  randconfig-002-20260227    clang-20
i386                  randconfig-003-20260227    clang-20
i386                  randconfig-004-20260227    clang-20
i386                  randconfig-005-20260227    clang-20
i386                  randconfig-006-20260227    clang-20
i386                  randconfig-007-20260227    clang-20
i386                  randconfig-011-20260227    gcc-14
i386                  randconfig-012-20260227    gcc-14
i386                  randconfig-013-20260227    gcc-14
i386                  randconfig-014-20260227    gcc-14
i386                  randconfig-015-20260227    gcc-14
i386                  randconfig-016-20260227    gcc-14
i386                  randconfig-017-20260227    gcc-14
loongarch                        alldefconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260227    clang-23
loongarch             randconfig-002-20260227    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                        m5272c3_defconfig    gcc-15.2.0
m68k                       m5275evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       bmips_be_defconfig    clang-23
mips                          rb532_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260227    clang-23
nios2                 randconfig-002-20260227    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                   de0_nano_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    clang-23
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260227    clang-17
parisc                randconfig-002-20260227    clang-17
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 canyonlands_defconfig    gcc-15.2.0
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                  iss476-smp_defconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260227    clang-17
powerpc               randconfig-002-20260227    clang-17
powerpc                     stx_gp3_defconfig    gcc-15.2.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260227    clang-17
powerpc64             randconfig-002-20260227    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260227    gcc-12.5.0
riscv                 randconfig-002-20260227    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260227    gcc-12.5.0
s390                  randconfig-002-20260227    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260227    gcc-12.5.0
sh                    randconfig-002-20260227    gcc-12.5.0
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           se7343_defconfig    clang-23
sh                           se7750_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    clang-23
sh                     sh7710voipgw_defconfig    clang-23
sh                   sh7724_generic_defconfig    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260227    clang-23
sparc                 randconfig-002-20260227    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260227    clang-23
sparc64               randconfig-002-20260227    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260227    clang-23
um                    randconfig-002-20260227    clang-23
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260227    gcc-14
x86_64      buildonly-randconfig-002-20260227    gcc-14
x86_64      buildonly-randconfig-003-20260227    gcc-14
x86_64      buildonly-randconfig-004-20260227    gcc-14
x86_64      buildonly-randconfig-005-20260227    gcc-14
x86_64      buildonly-randconfig-006-20260227    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260227    gcc-13
x86_64                randconfig-002-20260227    gcc-13
x86_64                randconfig-003-20260227    gcc-13
x86_64                randconfig-004-20260227    gcc-13
x86_64                randconfig-005-20260227    gcc-13
x86_64                randconfig-006-20260227    gcc-13
x86_64                randconfig-011-20260227    gcc-14
x86_64                randconfig-012-20260227    gcc-14
x86_64                randconfig-013-20260227    gcc-14
x86_64                randconfig-014-20260227    gcc-14
x86_64                randconfig-015-20260227    gcc-14
x86_64                randconfig-016-20260227    gcc-14
x86_64                randconfig-071-20260227    gcc-14
x86_64                randconfig-072-20260227    gcc-14
x86_64                randconfig-073-20260227    gcc-14
x86_64                randconfig-074-20260227    gcc-14
x86_64                randconfig-075-20260227    gcc-14
x86_64                randconfig-076-20260227    gcc-14
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260227    clang-23
xtensa                randconfig-002-20260227    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

