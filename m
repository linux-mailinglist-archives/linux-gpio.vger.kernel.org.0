Return-Path: <linux-gpio+bounces-36373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKtsFHOZ/Gk6RwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 15:53:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C49284E9AA0
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 15:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 494623086550
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 13:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119273FB7CD;
	Thu,  7 May 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKoJyqTW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0BC3F65E0
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161799; cv=none; b=eRMdqwJ24Mwqv94fgxYgfyOZLAbfYnuD6sBRg7K6ZmOlFVEv2Ena+PJ/m07bEBAwmHYmuULeBIiQs+BAK+t3qX2+9fQlAtfD+LieaInoLNPf3TpDMQ8qCrLmaaYvy5CpQiq8qXSI18L92IR7EGUwE0tw/vrAfyRmk6AJ6ujZdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161799; c=relaxed/simple;
	bh=vE34aa8irBWGItLvceE08MShCY5W/tJiiLdf7e89uiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=su5ttN5x8JJHm7fB0SwO6u49o7jCHh1GJkFPFMvGf1EI/6JstZ+ihExPKK+wObaeRJi4qsFYIE7goLlNEX/6DsCJrfsseg2KZzG4g4GJ9078niAB0oMaw2/IiLmMWb60bV61+xytZMW2Nu6bTBM0EFFCVWJKNTtbIuDO5mlNHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKoJyqTW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778161798; x=1809697798;
  h=date:from:to:cc:subject:message-id;
  bh=vE34aa8irBWGItLvceE08MShCY5W/tJiiLdf7e89uiM=;
  b=gKoJyqTWNnpjwKisVKCDTN/8i4Te1HQoqAtS/6lcr0VnlGsroaVNK/zu
   YK2hLvk4xHSSMDhjZ4QV4ktFEZXtJvjxoq2YACyNrbwzpgXmPB6FFADfE
   xI3i78Wqc1BQVxvfjjT949elYdiVUC7IjN45pLGU9LIgVtPVX1kp5r3xu
   R6+umq0ruwhFb3KluG84bxF/Gl0QpP2tKNkfLqY3g5SrwuN5uQ+WcSSV0
   n0lcVa4At8AViKUJ5rHjSp7cZPvICkWSPB3UZ/CKLVG5N3yaZmofw56jq
   sCz/9MPpiVQomsS0lQKs7r2DmYl+3d/NR1zxQdK1fIIx+AcMHUJ2SgFSA
   g==;
X-CSE-ConnectionGUID: 4OHt9ebnSaWQ1rBEcBJKrg==
X-CSE-MsgGUID: sKi1z0TbTvKd/ftM7pWQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82981030"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82981030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:49:56 -0700
X-CSE-ConnectionGUID: CemxDXy1R8epRnSn7+5Rkg==
X-CSE-MsgGUID: M8mLCXumT4Cf36HA1p6yBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236575325"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2026 06:49:54 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKz6t-0000000006r-3sr3;
	Thu, 07 May 2026 13:49:51 +0000
Date: Thu, 07 May 2026 21:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-qcom-configs] BUILD SUCCESS
 c8aa5cf994bdd664d4b5efa4c952ce5ff864e351
Message-ID: <202605072143.KTb9OHss-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: C49284E9AA0
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
	TAGGED_FROM(0.00)[bounces-36373-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-qcom-configs
branch HEAD: c8aa5cf994bdd664d4b5efa4c952ce5ff864e351  pinctrl: qcom: Make important drivers default (2)

elapsed time: 727m

configs tested: 211
configs skipped: 233

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260507    gcc-14.3.0
arc                   randconfig-001-20260507    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260507    gcc-14.3.0
arc                   randconfig-002-20260507    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260507    gcc-14.3.0
arm                   randconfig-001-20260507    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260507    gcc-14.3.0
arm                   randconfig-002-20260507    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260507    gcc-14.3.0
arm                   randconfig-003-20260507    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260507    gcc-14.3.0
arm                   randconfig-004-20260507    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-15.2.0
arm64                 randconfig-001-20260507    gcc-15.2.0
arm64                          randconfig-002    gcc-15.2.0
arm64                 randconfig-002-20260507    gcc-15.2.0
arm64                          randconfig-003    gcc-15.2.0
arm64                 randconfig-003-20260507    gcc-15.2.0
arm64                          randconfig-004    gcc-15.2.0
arm64                 randconfig-004-20260507    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-15.2.0
csky                  randconfig-001-20260507    gcc-15.2.0
csky                           randconfig-002    gcc-15.2.0
csky                  randconfig-002-20260507    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260507    clang-23
hexagon               randconfig-002-20260507    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260507    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260507    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260507    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260507    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260507    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260507    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260507    gcc-14
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260507    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260507    gcc-14
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260507    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260507    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260507    gcc-14
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260507    gcc-14
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260507    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260507    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260507    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260507    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260507    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260507    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260507    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260507    clang-23
loongarch             randconfig-002-20260507    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260507    clang-23
nios2                 randconfig-002-20260507    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260507    gcc-8.5.0
parisc                randconfig-002-20260507    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                       eiger_defconfig    clang-23
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc               randconfig-001-20260507    gcc-8.5.0
powerpc               randconfig-002-20260507    gcc-8.5.0
powerpc                     redwood_defconfig    clang-23
powerpc64             randconfig-001-20260507    gcc-8.5.0
powerpc64             randconfig-002-20260507    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                         ap325rxa_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260507    gcc-12.5.0
sparc                 randconfig-002-20260507    gcc-12.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260507    gcc-12.5.0
sparc64               randconfig-002-20260507    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260507    gcc-12.5.0
um                    randconfig-002-20260507    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260507    clang-20
x86_64      buildonly-randconfig-002-20260507    clang-20
x86_64      buildonly-randconfig-003-20260507    clang-20
x86_64      buildonly-randconfig-004-20260507    clang-20
x86_64      buildonly-randconfig-005-20260507    clang-20
x86_64      buildonly-randconfig-006-20260507    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260507    gcc-14
x86_64                randconfig-002-20260507    gcc-14
x86_64                randconfig-003-20260507    gcc-14
x86_64                randconfig-004-20260507    gcc-14
x86_64                randconfig-005-20260507    gcc-14
x86_64                randconfig-006-20260507    gcc-14
x86_64                randconfig-011-20260507    gcc-14
x86_64                randconfig-012-20260507    gcc-14
x86_64                randconfig-013-20260507    gcc-14
x86_64                randconfig-014-20260507    gcc-14
x86_64                randconfig-015-20260507    gcc-14
x86_64                randconfig-016-20260507    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260507    clang-20
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260507    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260507    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260507    clang-20
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260507    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260507    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                randconfig-001-20260507    gcc-12.5.0
xtensa                randconfig-002-20260507    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

