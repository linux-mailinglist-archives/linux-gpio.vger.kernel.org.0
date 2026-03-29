Return-Path: <linux-gpio+bounces-34366-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 73b7Br0IyWl2tgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34366-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 13:10:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E339351BD9
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 13:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D81683006826
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 11:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22C5344D9B;
	Sun, 29 Mar 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdpGECGP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A124933F595
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782647; cv=none; b=RVZoO1PHff5kA7d4VEzJnFc2lEzQzsMD6Pb23EceBC/Qg83RBufSpIDW+M5jeZEj0fFmQ2efJeG/f1Kq9pE5n9e3LDYWwtHZgs4oLI7dHPOYX9J+MFY9jl0w3BleQwIOjv/s2W0Gbs0EBfzp5KvOLN12TXqjVbjNQtNmmP2xg2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782647; c=relaxed/simple;
	bh=VIiBO8KPtYxRKngpjQYkBEgL/XRGqEF44cb/FD6Kw+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=spQWtPj6XMHWZwzjJDKmny3TBMRZHtr05DAKHMzP2el6Y+OkW1ex3hh1BrBMQm+LReRxprsf0jvsgkcoKDIooMlJfxht6a8wxtb9uG+Ut8myGVqLxBC9jH/W9U99s7XjpYcN+kHuGOiqtNAQ0lXP/7ipdE/fjXWDDKQiipPhH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdpGECGP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774782646; x=1806318646;
  h=date:from:to:cc:subject:message-id;
  bh=VIiBO8KPtYxRKngpjQYkBEgL/XRGqEF44cb/FD6Kw+Q=;
  b=CdpGECGPUhc7whf4QI1XIN94iUWh04OWw4hVWBl7r/VYHEJD/se68DPc
   ZadxRAfJtNIEG6oYW50IoAZLCO2BP9m6Zek1VVgAqPTqBkcsH+WDXZrdT
   DIv12cinkHMCnHM4FdzRNfiQ8t7ot2rNl1w5WCogoz8YgF47A+vsyNGbD
   Lyi/lotSFlh/oQed6V4ep9tyS4nO4bO3vIx+7BPDrJ6rs3TSaTffdUt88
   BnB8/gZ4Nsa+iIm5pWiVKdc34FWU4sZDh0S6E0KCzS9jZO8/UV8R8DaNz
   O40JKLKeTL28C2LFhvrg2oR7rex2a+UQj2UkWxEoIgnvKf0pTnCl4bsmp
   w==;
X-CSE-ConnectionGUID: FiiFgKZ1QDuDrVvxyT1icw==
X-CSE-MsgGUID: jVLVHlVJQ5eVVEETjDurkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93179797"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="93179797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:10:45 -0700
X-CSE-ConnectionGUID: KZuxnM36QsyZ9AjMSO0j6w==
X-CSE-MsgGUID: /jY6GCYgSTOhrSTVf1kuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="229848133"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Mar 2026 04:10:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6o2T-00000000CJB-1gOt;
	Sun, 29 Mar 2026 11:10:41 +0000
Date: Sun, 29 Mar 2026 19:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 a91cbf52c115e52392729a855ddb9d85da0517df
Message-ID: <202603291936.zCQm9KUY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34366-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E339351BD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: a91cbf52c115e52392729a855ddb9d85da0517df  Merge tag 'renesas-pinctrl-for-v7.1-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 746m

configs tested: 169
configs skipped: 2

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
arc                   randconfig-001-20260329    gcc-8.5.0
arc                   randconfig-002-20260329    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20260329    gcc-8.5.0
arm                   randconfig-002-20260329    gcc-8.5.0
arm                   randconfig-003-20260329    gcc-8.5.0
arm                   randconfig-004-20260329    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260329    gcc-12.5.0
arm64                 randconfig-002-20260329    gcc-12.5.0
arm64                 randconfig-003-20260329    gcc-12.5.0
arm64                 randconfig-004-20260329    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260329    gcc-12.5.0
csky                  randconfig-002-20260329    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260329    gcc-11.5.0
hexagon               randconfig-002-20260329    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260329    clang-20
i386        buildonly-randconfig-002-20260329    clang-20
i386        buildonly-randconfig-003-20260329    clang-20
i386        buildonly-randconfig-004-20260329    clang-20
i386        buildonly-randconfig-005-20260329    clang-20
i386        buildonly-randconfig-006-20260329    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260329    clang-20
i386                  randconfig-002-20260329    clang-20
i386                  randconfig-003-20260329    clang-20
i386                  randconfig-004-20260329    clang-20
i386                  randconfig-005-20260329    clang-20
i386                  randconfig-006-20260329    clang-20
i386                  randconfig-007-20260329    clang-20
i386                  randconfig-011-20260329    clang-20
i386                  randconfig-012-20260329    clang-20
i386                  randconfig-013-20260329    clang-20
i386                  randconfig-014-20260329    clang-20
i386                  randconfig-015-20260329    clang-20
i386                  randconfig-016-20260329    clang-20
i386                  randconfig-017-20260329    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260329    gcc-11.5.0
loongarch             randconfig-002-20260329    gcc-11.5.0
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
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260329    gcc-11.5.0
nios2                 randconfig-002-20260329    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260329    gcc-8.5.0
parisc                randconfig-002-20260329    gcc-11.5.0
parisc                randconfig-002-20260329    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260329    clang-17
powerpc               randconfig-001-20260329    gcc-8.5.0
powerpc               randconfig-002-20260329    gcc-8.5.0
powerpc64             randconfig-001-20260329    gcc-8.5.0
powerpc64             randconfig-002-20260329    clang-23
powerpc64             randconfig-002-20260329    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260329    clang-23
riscv                 randconfig-002-20260329    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260329    clang-23
s390                  randconfig-002-20260329    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                         ap325rxa_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260329    clang-23
sh                    randconfig-002-20260329    clang-23
sh                        sh7763rdp_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260329    gcc-14
x86_64      buildonly-randconfig-002-20260329    gcc-14
x86_64      buildonly-randconfig-003-20260329    gcc-14
x86_64      buildonly-randconfig-004-20260329    gcc-14
x86_64      buildonly-randconfig-005-20260329    gcc-14
x86_64      buildonly-randconfig-006-20260329    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260329    gcc-14
x86_64                randconfig-002-20260329    gcc-14
x86_64                randconfig-003-20260329    gcc-14
x86_64                randconfig-004-20260329    gcc-14
x86_64                randconfig-005-20260329    gcc-14
x86_64                randconfig-006-20260329    gcc-14
x86_64                randconfig-011-20260329    gcc-14
x86_64                randconfig-012-20260329    gcc-14
x86_64                randconfig-013-20260329    gcc-14
x86_64                randconfig-014-20260329    gcc-14
x86_64                randconfig-015-20260329    gcc-14
x86_64                randconfig-016-20260329    gcc-14
x86_64                randconfig-071-20260329    clang-20
x86_64                randconfig-072-20260329    clang-20
x86_64                randconfig-073-20260329    clang-20
x86_64                randconfig-074-20260329    clang-20
x86_64                randconfig-075-20260329    clang-20
x86_64                randconfig-076-20260329    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

